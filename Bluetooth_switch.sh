#!/bin/bash

#Device name variable
devicename="bluez_sink.88_C6_26_AA_C5_44"

#change the default sink
pacmd "set-default-sink "$devicename""

#move all inputs to the new sink
for app in $(pacmd list-sink-inputs | sed -n -e 's/index:[[:space:]]\([[:digit:]]\)/\1/p');
do
   pacmd "move-sink-input $app "$devicename""
done
source Equaliser_enable.sh