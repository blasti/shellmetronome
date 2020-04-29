#!/bin/bash

# metrononme.sh by blastbeat
# works on my Debian...

if [[ ! "$1" =~ ^[[:digit:]]+$ ]]; then
    echo "Usage: metronome.sh beats-per-minute" >&2
    exit 1
fi

while true
do
    aplay -q beat.wav &
    sleep "$(bc <<< "scale=2; 60/$1")"
done
