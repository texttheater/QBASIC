# Some variables need to be set for each program XYZ individually:

# RECDELAY_XYZ
# How long the program takes to start and become the active window.
# If the recorded GIF contains the terminal from which the program was started,
# increase this.
# If the recorded GIF is missing the beginning of the run of the program,
# decrease this.

# DURATION_XYZ
# How many seconds to record.
# If the recorded GIF is incomplete at the end, increase this.

# LCLIP_XYZ
# Index of the last frame to be dropped from the beginning of the recorded
# GIF.
# E.g., 0 to drop 1 frame, 4 to drop 3 frames.
# Find the number of frames to drop by making tmp/XYZ.gif and opening it
# with something like gifview to examine frames individually.

# RCLIP_XYZ
# Number of the first frame to be dropped from the end of the recorded GIF.
# E.g., 57 to drop everything from frame 57 and onwards.
# See note about LCLIP_XYZ above.

RECDELAY_LEMMINGE=1
DURATION_LEMMINGE=30
LCLIP_LEMMINGE=0
RCLIP_LEMMINGE=55

# This works assuming that run_qb64.sh is on your PATH, otherwise you can also
# delete everything from the first $ and fill in the concrete path.
QB64DIR=$$(dirname $$(readlink -m $$(which run_qb64.sh)))
