# mysqlondocker
a basic mysql server on docker. the primary audience is people who want a simple, lightweight mysql server on their systems for testing or learning. if you set it up on Docker, you can keep your OS installation "clean"

### description of all files below ###

### names
docker image name: merasqlimage # see compose-merasql.yaml 
docker volume name: dbstore # see scriptzero.sh and compose-merasql.yaml
docker container name: mcont # see compose-merasql.yaml 

### scriptzero.sh ###
Start here. use this script to start everything. it will 
- clean up previous docker stuff if it exists
- get the repo from git, 
- build the docker image named merasqlimage from scratch
- bring up the docker image in a container named mcont

### Dockerfile ###
- copies the mysqld.cnf to fix the bind address so the docker mysql is accessible from outside
- creates the user
- creates the database to be used by the application
much of this is hardcoded today, and in the next versions this part can use docker secrets. I have not been able to figure all out yet but will put it here when I do. For now, just change the text in this file to setup your credentials and the initial schema that you want to work with.

### start_in_container.sh ###
the stuff that the container runs when it starts
- start mysql server
- run the mysqlsetup.sql file as root to set things up

### mysqlsetup.sql ### 
the actual mysql commands. these are used by the first start_in_container.sh script to set things up for the first time on mysql

### mysqld.cnf ###
all it does for now is change the bind-address so that mysql binds to all available interfaces.
in future, it should change to a command line so that the entire file need not be uploaded as is and only the bind-address is changed. 
there is a command called mysqladmin (https://dev.mysql.com/doc/refman/8.0/en/mysqladmin.html) which i could look into to upgrade this part.


### for my own reference: some basic commands and reference items below this line ###
## verify bind-address
```
mysql> show variables like '%bind%';
+---------------------+-----------+
| Variable_name       | Value     |
+---------------------+-----------+
| bind_address        | 0.0.0.0   |
| mysqlx_bind_address | 127.0.0.1 |
+---------------------+-----------+
```
