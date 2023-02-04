-- 30 OCAK PAZARTESİ 2023

/*
Çoklu açıklamadır
Bu bir açıklama satırıdır
*/

-- tek satır açıklamadır

-- create database: database olustur
CREATE DATABASE FSAE01;

-- drop database: database siler
DROP DATABASE FSAE01;

-- use: çalışmak istediğimiz database seçilir
USE FSAE01;

-- create table: tablo oluşturuz
create table student
(
id varchar(4),
name varchar(30),
age int
);

-- drop table: tablo sileriz
drop table student;

insert into student values('1001', 'Ali Veli', 49);
insert into student(id, name, age) values('1002', 'Ali Veli', 50);
insert into student(id, name) values('1003', 'Zeynep Yılmaz');

-- select: verileri listeleriz
select * 
from student;

