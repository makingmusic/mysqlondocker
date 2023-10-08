FROM ubuntu:22.04

RUN apt-get -y  update
RUN apt-get -y install mysql-server systemctl

RUN mkdir /mysql
WORKDIR /mysql
COPY start_in_container.sh /mysql
COPY mysqlsetup.sql /mysql
RUN mv /etc/mysql/mysql.conf.d/mysqld.cnf /etc/mysql/mysql.conf.d/mysqld.cnf.backup
COPY mysqld.cnf /etc/mysql/mysql.conf.d/
#RUN systemctl stop mysql
#RUN systemctl start mysql
#RUN mysql -u root < mysqlsetup.sql


EXPOSE 3306
