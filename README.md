### mysqlondocker
a basic mysql server on docker. this doc is the steps required for the setup

### starter.sh ###
here i should write the automation for setting up the container, Dockerfile
- make sure you have the following files checked out:
  - compose-merasql.yaml
  - mysqld.conf
docker pull ubuntu
docker volume create mydbstorage (todo - make sure name matches with the one in compose-yaml file)
docker compose -f compose-merasql.yaml up

_**now go to the docker container and run some setup commands there**_
docker exec -it mcont bashscript (this should probably be replaced by a file that will contain all the commands needed. )

=== container script (setup.sh) ===
-- install mysql
apt install mysql-server curl vim wget systemctl 
docker cp mysqld.cnf start.sh from github -> container
mysql_secure_installation (setup password for root)
=== end container script ===

=== host script ===
now run this docker commit #save the committed image
docker tag #tag that image with some name
docker compose -f compose-merasql.yaml down
create start_mysql to start mysql container
create stop_mysql to stop mysql container 
=== end host script ===



# mysql specific matters
systemctl status mysql

# mysql bind-address settings that are needed on the container so it is bound to all IP addresses, instead of the unix socket alone.
file location: /etc/mysql/mysql.conf.d
change line to:
bind-address            = 0.0.0.0

## verify bind-address
mysql> show variables like '%bind%';
+---------------------+-----------+
| Variable_name       | Value     |
+---------------------+-----------+
| bind_address        | 0.0.0.0   |
| mysqlx_bind_address | 127.0.0.1 |
+---------------------+-----------+

# basic mysql schema setup
## database schema
create database persons;
use persons;
create table persons (name varchar(255), age int);
CREATE USER 'username'@'%' IDENTIFIED by 'password';

