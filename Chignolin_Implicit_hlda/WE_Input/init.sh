#!/bin/bash
#
# init.sh
#
# Initialize the WESTPA simulation, creating initial states (istates) and the
# main WESTPA data file, west.h5. 
#
# If you run this script after starting the simulation, the data you generated
# will be erased!
#

source env.sh

# Make sure that WESTPA is not already running.  Running two instances of 
# WESTPA on a single node/machine can cause problems.
# This code will kill any WESTPA process that is currently running.
#pkill -9 -f w_run

# Make sure that seg_logs (log files for each westpa segment), traj_segs (data
# from each trajectory segment), and istates (initial states for starting new
# trajectories) directories exist and are empty. 
rm -rf traj_segs seg_logs istates west.h5 
mkdir   seg_logs traj_segs istates

# Define the arguments for the basis states (used for generating initial 
# states; in this case we only have one), and target states (used for
# knowing when to recycle trajectories).
BSTATE_ARGS="--bstate-file $WEST_SIM_ROOT/bstates/bstates.txt"
TSTATE_ARGS="--tstate-file $WEST_SIM_ROOT/tstate.file"

# Initialize the simulation, creating the main WESTPA data file (west.h5)
# The "$@" lets us take any arguments that were passed to init.sh at the
# command line and pass them along to w_init.
w_init $BSTATE_ARGS $TSTATE_ARGS --segs-per-state 4 \
  --work-manager=threads "$@"
