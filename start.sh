#!/usr/bin/bash

echo "napping for two seconds"
sleep 2
echo "starting the mysql server"
systemctl start mysql
systemctl start mysql
echo "ready to go"
echo "now tailing dev null till the end of time"
tail -f /dev/null
