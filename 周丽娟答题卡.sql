--2024-2025-1Oracle数据库 期末考试A卷
/*第一题到第二题在学习通考试
将第三题到第五题写到‘学号+姓名+班级.sql’文件中
文件保存为:学号+姓名+班级.sql
一定要写好自己的姓名，学号，班级，只需要提交这个.sql文件，不要提交压缩包，
提交完后，教师端检查是否提交成功，并签字确认*/
--姓名：周丽娟  学号：2022102238  班级：软件工程222
--第三题
1、create tablespace UNDOTBS2
datafile 'D:\oracledata\undotbs02.dbf' size 100m
autoextend on next 50m maxsize unlimited
extent management local
autoallocate;

2、create or replace view stv
as
select xsb.学号,姓名,课程名,成绩 from xsb,cjb,kcb
where xsb.学号=cjb.学号 and kcb.课程号=cjb.课程号;
--第四题
1、select * from xsb where 姓名 like '王_ %';

2、select * from xsb where 出生时间<all(select 出生时间 from xsb where 专业='计算机');
3、select * from xsb where 备注 is not null;
--第五题
1、
create function pcfun
(xb in char,pcfun out number) RETURN NUMBER
as BEGIN
return pcfun;
end;
declare
pcfun number;

dbms_out.put.put_line();
end;


2、create or replace procedure pcnum
(xb in char,countxb out number)
begin
select 性别 into xb from xsb
where 性别='男';
dbms_output.put_line(count(xb));
end;
declare xb xsb.性别%type;
begin
pcnum(xb);
dbms_output.put_line(nanxb);
end;

3、alter session set nls_date_format='YYYY-MM-DD';

create or replace trigger itrig
instead of insert on stv
for each row
declare 
xb char(2):='男';
cssj date:='1997-07-28';
kch char(3):='101';
zy char(30):='计算机';
cj char(2):='85';
begin
    insert into xsb(学号,姓名,性别,出生时间,专业) values(:new.学号,:new.姓名,xb,cssj,zy);
    insert into cjb(学号,课程号,成绩) values(:new.学号,kch,:new.成绩);
end;
insert into stv values('151116','徐鹤','男','1997-07-28','计算机','101','85');