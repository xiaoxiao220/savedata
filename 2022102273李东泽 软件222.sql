--2024-2025-1Oracle数据库 期末考试A卷
/*第一题到第二题在学习通考试
将第三题到第五题写到‘学号+姓名+班级.sql’文件中
文件保存为:学号+姓名+班级.sql
一定要写好自己的姓名，学号，班级，只需要提交这个.sql文件，不要提交压缩包，
提交完后，教师端检查是否提交成功，并签字确认*/
--姓名：李东泽  学号：2022102273  班级：软件222
--第三题
1、
create undo tablespace UNDOTBS2
datafile'D:\oracledata\undotbs02.dbf' size 100m
autoextend on next 50m maxsize unlimited
extent management local autoallocate;
2、
create or replace view stv
as
select xsb.学号,专业,cjb.课程号,成绩
from xsb ,cjb,kcb
where xsb.学号=cjb.学号 and cjb.课程号=kcb.课程号;
--第四题
1、
select * from xsb
where 姓名 like '王_ %';
2、
select * from xsb
where 出生时间 < all(select 出生时间 from xsb
where 专业='计算机');
3、
select * from xsb
where 备注 is not null;
--第五题
1、
create or replace function pcfun(xb in char)
return number;
as
outnum number;
begin
if xb='男' then
select count(性别) into outnum
from xsb
where 性别='男';
else xb='女' then
select count(性别) into outnum
from xsb
where 性别='女';
else if;
return outnum;
end;


declare mannum number;
begin
    mannum :=pcfun('男');
    dbms_output.put_line('男同学人数'||to_char(pcfun));
end;

2、

create or replace procedure pcnum (xb in char)
as
outnum number;
begin
if xb='男' then
select count(性别) into outnum
from xsb 
where 性别='男';
else xb='女' then
select count(性别) into outnum
from xsb 
where 性别='女';
else if;
DBMS_OUTPUT.PUT_LINE(outnum);
end;
 
 
 declare mannum2 number;
begin
pcnum('男',mannum2);
end;

3、

create or replace trigger itrig
instead of insert on stv
for each row
declare 
xh char(6):='151116';
xm char(10):='徐鹤';
xb char(2):='男';
cssj data:='1997-07-28';
zy char(12):='计算机';
kch char(6):='101';
cj number:=85;
begin
insert into xsb (学号,姓名,性别,出生时间,专业) values(xh,xm,xb,cssj,zy);
insert into cjb(学号，课程号,成绩)
values(xh, kch ,cj)
end;



alter session set nls_date_format='YYYY-MM_DD';
insert into xsb values('151116','徐鹤','男','1997-07-28','计算机');


insert into cjb values('151116','101',85);

