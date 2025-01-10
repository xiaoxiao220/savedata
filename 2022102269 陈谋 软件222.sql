--2024-2025-1Oracle数据库 期末考试A卷
/*第一题到第二题在学习通考试
将第三题到第五题写到‘学号+姓名+班级.sql’文件中
文件保存为:学号+姓名+班级.sql
一定要写好自己的姓名，学号，班级，只需要提交这个.sql文件，不要提交压缩包，
提交完后，教师端检查是否提交成功，并签字确认*/
--姓名：陈谋 学号：2022102269  班级：软件222
--第三题
1、
create undo tablespace undotbs2
datafile 'D:\oracledata\undotbs02.dbf' 
size 100m
autoextend on
next 50m maxsize unlimited
extent management local autoallocate;
2、
create view stv
as
select xsb.学号,专业,课程号,成绩
from xsb,cjb
where XSB."学号"=CJB."学号" 
----第四题
1、
select *
from xsb
where 姓名 like '王_ %'
2、
select *
from xsb
where 出生时间<all(
select 出生时间
from xsb
where 专业='计算机'
)
3、
select *
from xsb
where "备注" is not null
--第五题
1、
CREATE OR REPLACE FUNCTION pcfun 
(
  INSEX IN VARCHAR2 
) RETURN NUMBER AS 
sex1 number;
BEGIN
  if insex='男' then
  select count(性别) into sex1 from xsb
  where 性别='男';
  else
  select count(性别) into sex1 from xsb
  where 性别='女';
  end if
  return sex1;
END pcfun;

DECLARE
  pum number;
BEGIN
  pum:=co_cum('男')；
dbms_output_ptu_line(to_char(pum));
END;
2、
CREATE OR REPLACE procedure pcnum 
(insex in char,sex22 out number)
AS
BEGIN
select count(性别) into sex2
from xsb
where 性别='男'；
select count(性别) into sex2
from xsb
where 性别='女'；
  return ;
END pcnum;

declare 
sext number;
begin
dbms_output.put_line(sext);
end;
3、
create or replace trigger itrig
instead of  insert
on stv
for each row
declare 
xb char(2) :='男';
cssj date :='1997-07-28';
xm cahr(10):='徐鹤';
begin
    insert into xsb(学号,姓名,性别,出生时间,专业) values(:new.学号,xm,xb,cssj,:new.专业);
    insert into cjb(学号,课程号,成绩) values(:new.学号,:new.课程号,:new.成绩);
end;

insert into stv values('151116','计算机','’101',85);