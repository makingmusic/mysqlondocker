#!/usr/bin/bash

echo "starting the mysql server"
systemctl status mysql
systemctl start mysql
echo "setting up the sql server"
mysql -u root < mysqlsetup.sql
echo "making sure the server starts"
systemctl start mysql
systemctl status mysql
echo "now tailing dev null till the end of time"
tail -f /dev/null
