#!/bin/bash

# metrononme.sh by blastbeat
# works on my Debian...

invalid_arg() {
    echo "Usage: metronome beats-per-minute" >&2
    exit 1
}

[[ ! "$1" =~ ^[[:digit:]]+$ ]] && invalid_arg

bpm=$(bc <<-EOF
scale = 2
60/$1
EOF
)

while true; 
do
    aplay -q beat.wav &
    sleep "$bpm";
done
