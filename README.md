QBASIC
======

This repository contains the source of some silly QBasic programs (mainly
text-based animations) that I wrote when I was 12 or so.

Some of them have been adapated to run at a reasonable speed on my Intel i7
machine when compiled with QB64 under Linux. The programs use empty FOR loops
for timing a lot, there did not seem to be another way...

Finally, this repository also contains scripts to compile and run the programs
and record this as animated GIFs. This is documented in the following.

Programs adapted so far
-----------------------

* LEMMINGE.BAS

Requirements
------------

* a modern Linux distribution such as Ubuntu 13.10
* [QB64](http://www.qb64.net/) -- the run\_qb64.sh of the installation needs to
  be on your PATH.
* [Byzanz](http://askubuntu.com/a/123515/152895)
* gifsicle (available as a package in Ubuntu)

Usage
-----

Here's how to make a GIF, using LEMMINGE.BAS as an example:

1. edit config.mk, adapting variables as needed - don't worry about
   LCLIP\_LEMMINGE and RCLIP\_LEMMINGE just yet
2. run make bin/LEMMINGE
3. run ./bin/LEMMINGE and see if it works
4. if necessary, go back to step 1
5. run make tmp/LEMMINGE.gif
6. open tmp/LEMMINGE.gif with e.g. gifview to see how many frames need to be
   removed from the beginning and end
7. open config.mk and adjust the LCLIP\_LEMMINGE and RCLIP\_LEMMINGE
   accordingly
8. run make gif/LEMMINGE.gif
