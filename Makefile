SHELL=bash

include config.mk

bin/% : src/%.BAS
	mkdir -p bin
	# qb64 can only be run from its own directory. The workaround script it
	# provides does not support command-line arguments. *sigh*
	# Binaries are always put into the same directory. *sigh*
	# We use the qb64 directory as a scratch area for prepending the soure
	# with the prelude for clipping:
	wd=$$(pwd); cd $(QB64DIR); cat $$wd/PRELUDE.BAS $$wd/$< > $*.BAS; ./qb64 -c $*.BAS; mv $* $$wd/bin

tmp/%.gif : bin/%
	mkdir -p tmp
	# Run program and detect the coordinates of its window, record this
	# area of the screen using Byzanz.
	./$< & (sleep $(RECDELAY_$*) ; coords=$$(xwininfo -id $$(xprop -root | awk '/_NET_ACTIVE_WINDOW\(WINDOW\)/{print $$NF}') | ./scripts/wininfo2byzanzopts) ; echo Window coordinates: $$coords ; byzanz-record $$coords -d $(DURATION_$*) $@)

gif/%.gif : tmp/%.gif
	mkdir -p gif
	# Use gifsicle to clip the recording. GIF uses residual frames for
	# compression, we need to "unoptimize" these out into full frames
	# before editing. Compress ("optimize") again at the end.
	cat $< | gifsicle --unoptimize --delete "#$(RCLIP_$*)-" | gifsicle --delete "#0-$(LCLIP_$*)" --optimize > $@

clean :
	rm -rf bin gif tmp
