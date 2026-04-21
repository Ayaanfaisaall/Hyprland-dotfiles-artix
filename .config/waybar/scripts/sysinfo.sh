#!/bin/bash

# 1. SSD Used Percentage
ssd=$(df / | awk 'NR==2 {print $5}' | tr -d '%')

# 2. RAM Used in GB
ram=$(free -m | awk '/^Mem:/ {printf "%.0f", $3/1024}')

# 3. CPU Threads
cpu=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{printf "%.0f", 100 - $1}')

# Sirf plain text output
echo "${ssd}.0.${ram}.0.${cpu}"
