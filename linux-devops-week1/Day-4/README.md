# Day 4 – Networking and Automation Basics

***This script performs automated network health checks by verifying internet connectivity using ping and validating HTTP response from a target server using curl. It can be scheduled via cron to act as a basic uptime monitoring tool***

## Concepts
- IP address and ports
- DNS resolution
- Connectivity testing
- Automation ( using Cron daemon time-based job scheduler)


## Commands Used
ip, ping, curl, ss, nslookup

## Bash Script
- Checks if internet connectivity is available using ping
- Sends an HTTP request using curl and verify status of website
- Verifies if the target website is reachable
- Prints success or failure status
- Automate the process or script using Cron daemon
