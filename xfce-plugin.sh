#!/bin/bash
mem=$(free | awk '/Mem/{printf("mem: %.2f%"), $3/$2*100}')
date=$(date +"%H:%M, %d %b")
sens=$(sensors | awk '/Core 0/{printf("%.2f, "), $3} /Core 1/{printf("%.2f"), $3}')
echo "<txt><span font='10' weight='Bold'>| $date | $mem | $sens</span></txt>"
