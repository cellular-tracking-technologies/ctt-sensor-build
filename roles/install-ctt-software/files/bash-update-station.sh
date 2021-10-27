#!/bin/bash
# https://unix.stackexchange.com/questions/48505/how-to-make-sure-only-one-instance-of-a-bash-script-runs
LOCKDIR='/tmp/bash-update-station'
function cleanup {
    if rmdir $LOCKDIR; then
        echo "Finished upload process"
    else
        echo "Failed to remove lock directory '$LOCKDIR'"
        exit 1
    fi
}

if mkdir $LOCKDIR; then
    #Ensure that if we "grabbed a lock", we release it
    #Works for SIGTERM and SIGINT(Ctrl-C)
    trap "cleanup" EXIT

    sudo /home/pi/ctt/station-utils/station-updater.py

    # Processing starts here
else
    echo "Could not create lock directory '$LOCKDIR'"
    exit 1
fi
