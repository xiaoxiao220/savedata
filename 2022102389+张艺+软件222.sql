
--姓名：张艺  学号：2022102389  班级：软件222
--第三题
1、
create undo tablespace UNDOTBS2
datafile 'D:\oracledata\undotbs02.dbf' size 100m
autoextend on
next 50m maxsize unlimited
extent management local autoallocate;
2、
create view stv
as
select xsb.学号,专业,cjb.课程号,成绩
from xsb,cjb, kcb
where xsb.学号=cjb.学号 and kcb.课程号=cjb.课程号;

--第四题
1、
select * from xsb
where 姓名 like '王_%';
2、
select * from xsb
where 出生时间< all
( select 出生时间  from xsb where 专业= '计算机');
3、
select * from xsb
where 备注 is not null;
--第五题

1、
create or replace function pcfun(in_sex in char)
return number
as 
out_num NUMBER;
begin 
if in_sex='男' then
select count(性别) into out_num
from xsb 
where 姓名='男';
else
select count(性别) into out_num
from xsb 
where 姓名='女';
end if;
return (out_num);
end pcfun;

declare 
boy_num number;
BEGIN 
boy_num:=pcfun('男');
dbms_output.put_line(to_char(boy_num));
end;

2、
create or replace procedure pcfun(sex in char,num out number)
as 
begin 
if sex='男' then
select count(性别) into num
from xsb 
where 姓名='男';
else
select count(性别) into num
from xsb 
where 姓名='女';
end if;
end pcfun;

declare 
boy_num number;
BEGIN 
pcfun('男','boy_num')
dbms_output.put_line(boy_num);
end;

3、
create or replace trigger itrig
instead of insert
on stv
for each row
begin
    insert into xsb(学号,姓名,性别,出生时间) values('151116','徐鹤','男','1997-07-28');
    insert into cjb(学号,课程号,成绩) values('151116','101',85);
end;
