#!/bin/bash

# "huafan-01 huafan-0E3E42"
# "huafan-02 huafan-E1C3EC"

devs=(
"sonoff-01 sonoff_E8A063"
"sonoff-02 sonoff-E880DE"
"sonoff-03 sonoff_E89100"
"sonoff-04 sonoff_E7C180"
"sonoff-06 sonoff_E72C26"
"sonoff-07 sonoff_E741A5"
"sonoff-08 sonoff_20AC0C"
)

for dev in "${devs[@]}"; do
    read -r -a words <<< "$dev"

    cmd1="mosquitto_pub -t cmnd/${words[0]}/OtaUrl -m http://192.168.2.80:8080/static/OTA/sonoff-UK.bin"
    echo $cmd1
    $cmd1
    cmd2="mosquitto_pub -t cmnd/${words[0]}/Upgrade -m 1"
    echo $cmd2
    $cmd2 
    sleep 30
    cmd3="mosquitto_pub -t cmnd/${words[1]}/Topic -m ${words[0]}"
    echo $cmd3
    $cmd3
done
