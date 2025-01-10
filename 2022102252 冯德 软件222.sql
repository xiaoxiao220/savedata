--三.
--1.
create undo tablespace undotbs2
datafile 'D:\oracledata\undotbs02.dbf' size 100m
autoextend on next 50m maxsize unlimited
extent management local autoallocate;
--2.
create view stv
as 
select xsb.学号,专业,课程号,成绩
from xsb,cjb
where xsb.学号=cjb.学号;
--四.
--1.
select * from xsb
where 姓名 like '王_ %';
--2.
select * from xsb 
where 出生时间<all(select 出生时间 from xsb where 专业='计算机');
--3.
select * from xsb
where 备注 is not null;
--五.
--1.
create or replace function pcfun
(insex in char)
return number
as
xbnum number;
begin
if insex='男' then
select count(性别) into xbnum from xsb
where 性别='男';
else
select count(性别) into xbnum from xsb
where 性别='女';
end if;
return xbnum;
end;
declare
num number;
begin
num:=pcfun('男');
dbms_output.put_line(num);
end;
--2.
create or replace procedure pcnum
(insex in char,pnum out number)
as
begin
if insex='男' then
select count(性别) into pnum from xsb
where 性别='男';
else
select count(性别) into pnum from xsb
where 性别='女';
end if;
end;
declare
num number;
begin
pcnum('男',num);
dbms_output.put_line(num);
end;
--3.
alter session set nls_date_format='yyyy-mm-dd';
create or replace trigger itrig
instead of insert on stv for each row
declare
xh char(6):='151116';
xm char(10):='徐鹤';
xb char(2):='男';
cssj date:='1997-07-28';
zy char(10):='计算机';
kch char(3):='101';
cj number:=85;
begin
insert into xsb(学号,姓名,性别,出生时间,专业) 
values(xh,xm,xb,cssj,zy);
insert into cjb(学号,课程号,成绩) 
values(xh,kch,cj);
end;
insert into stv values('151116','计算机','101',85);























