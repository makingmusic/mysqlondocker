# mysqlondocker
a basic mysql server on docker

# notes, i.e. random commands that i need to run
# i still need to compile this entire repo in to a self-sufficient set of files
# ideally, one command and the entire thing is setup. not there, yet.

docker compose -f compose-merasql.yaml up
docker exec -it mcont bash

# mysql bind-address settings that are needed on the container so it is bound to all IP addresses, instead of the unix socket alone.
file location: /etc/mysql/mysql.conf.d
change line to:
bind-address            = 0.0.0.0
