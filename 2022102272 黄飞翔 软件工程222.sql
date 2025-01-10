--2024-2025-1Oracle数据库 期末考试A卷
/*第一题到第二题在学习通考试
将第三题到第五题写到‘学号+姓名+班级.sql’文件中
文件保存为:学号+姓名+班级.sql
一定要写好自己的姓名，学号，班级，只需要提交这个.sql文件，不要提交压缩包，
提交完后，教师端检查是否提交成功，并签字确认*/
--姓名：黄飞翔·  学号：2022102272  班级：软件工程222
--第三题
1、create undo tablespace undotbs2
datafile 'D:\oracledata\undotbs02.dbf' size 100m
autoextend on
next 50m maxsize unlimited
extent management local autoallocate;
2、create or replace stv
as
select xsb.学号,专业,xsb.课程号,成绩
from xsb,cjb,kcb
where xsb.学号=cjb.学号 and kcb.课程号=cjb.课程号;
--第四题
1、select *
from xsb
where 姓名 like'王_ %';
2、
select * from xsb
where 出生时间< all( select 出生时间  from xsb
                    where 专业= '计算机'
        );
3、select * from xsb
where 备注 is not null;
--第五题
1、create or replace function pcfun(in_sex in char)
return number
as
out_num number;
begin
if in_sex='男' then
select count(性别)  into out_num
from xsb
where 性别='男';
else
select  count(性别)  into out_num
from xsb
where 性别='女';
end if;
return(out_num);
end pcfun;

declare
nan_num number;
begin
nan_num:=pcfun('男');
Dbms_output.put_line('男学生人数：'||to_char(nan_num));
end;
2、
create or replace procedure pcnum
(in_sex in char,out_num out number)
as
begin
if in_sex='男' then
select count(性别)  into out_num
from xsb
where 性别='男';
else
select  count(性别)  into out_num
from xsb
where 性别='女';
end if;
end;

declare
nan_num number;
begin
pcnum('男',nan_num);
Dbms_output.put_line('男学生人数：'||to_char(nan_num));
end;
3、create or replace trigger itrig
instead of  insert
on stv
for each row
declare 
xb char(2) :='男';
xi char(10) :='徐鹤'
cssj date :='1997-07-28';
begin
    insert into xsb(学号,姓名,性别,出生时间,专业) values(:new.学号,xi,xb,cssj,:new.专业);
    insert into cjb(学号,课程号,成绩) values(:new.学号,:new.课程号,:new.成绩);
end;
insert into stv values('151116','计算机','101',85);