create user 'merasql'@'%' identified by 'merasql';

create database persons;
use persons;
create table persons (name varchar(255), age int);


grant ALL PRIVILEGES ON persons.* to 'merasql'@'%' ;
flush privileges;

