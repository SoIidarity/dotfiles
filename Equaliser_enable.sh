#!/bin/bash

#Device name variable
devicename="ladspa_output.mbeq_1197.mbeq"

#change the default sink
pacmd "set-default-sink "$devicename""

#move all inputs to the new sink
for app in $(pacmd list-sink-inputs | sed -n -e 's/index:[[:space:]]\([[:digit:]]\)/\1/p');
do
   pacmd "move-sink-input $app "$devicename""
done
