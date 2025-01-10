--2024-2025-1Oracle数据库 期末考试A卷
/*第一题到第二题在学习通考试
将第三题到第五题写到‘学号+姓名+班级.sql’文件中
文件保存为:学号+姓名+班级.sql
一定要写好自己的姓名，学号，班级，只需要提交这个.sql文件，不要提交压缩包，
提交完后，教师端检查是否提交成功，并签字确认*/
--姓名：黎珊珊  学号：2022102247  班级：软件222
--第三题
1、
create undo tablespace UNDOTBS2
datafile 'D:\oracledata\undotbs02.dbf' size 100m
autoextend on next 50m maxsize unlimited
extent management local autoallocate;
2、
create view stv
as
select xsb.学号,专业,课程号,成绩
from xsb,cjb
where xsb.学号=cjb.学号
--第四题
1、
select * 
from xsb
where 姓名 like '王_%'
2、
select * from xsb
where 出生时间 <all
(select 出生时间
from xsb
where 专业='计算机')
3、
select *
from xsb
where 备注 is not null
--第五题
1、
create or REPLACE function pcfun(in_sex in char)
return number
as
out_num NUMBER;
begin
if in_sex='男' then
select count(*) into out_num from xsb where 性别='男';
else
select count(*) into out_num from xsb where 性别='女';
end if;
return(out_num);
end pcfun;

declare
boynum NUMBER;
begin
boynum:=pcfun('男');
dbms_output.put_line(to_char(boynum));
end;
2、
create or REPLACE procedure pcnum
(in_sex in char,
out_num out number)
as
begin
if in_sex='男' then
select count(*) into out_num from xsb where 性别='男';
else
select count(*) into out_num from xsb where 性别='女';
end if;
end;

declare
boynum NUMBER;
begin
pcnum('男', boynum);
dbms_output.put_line(to_char(boynum));
end;
3、
create or REPLACE trigger itrig
instead of insert
on stv
declare
xm char(6):='徐鹤';
xb char(4):='男';
cssj date:='1997-07-28';
kch CHAR(3):='101';
begin
insert into xsb(学号,姓名,性别,出生时间,专业) values(:new.学号,xm,xb,cssj,:new.专业);
insert into cjb(学号,课程号,成绩) values(:new.学号,kch,:new.成绩);
end;

insert into stv values('151116','计算机','101',85);