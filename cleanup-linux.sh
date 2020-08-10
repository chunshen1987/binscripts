#!/bin/bash


sudo apt-get autoclean
sudo apt-get clean
sudo apt-get autoremove

# Removes old revisions of snaps
# CLOSE ALL SNAPS BEFORE RUNNING THIS
set -eu

LANG=en_US.UTF-8 snap list --all | awk '/disabled/{print $1, $3}' |
    while read snapname revision; do
        sudo snap remove "$snapname" --revision="$revision"
    done

# clear system journal logs
sudo journalctl --vacuum-time=3d


