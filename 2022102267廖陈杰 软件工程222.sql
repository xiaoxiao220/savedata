--2024-2025-1Oracle数据库 期末考试A卷
/*第一题到第二题在学习通考试
将第三题到第五题写到‘学号+姓名+班级.sql'文件中
文件保存为:学号+姓名+班级.sql
一定要写好自己的姓名，学号，班级，只需要提交这个.sql文件，不要提交压缩包，
提交完后，教师端检查是否提交成功，并签字确认*/
--姓名：廖陈杰  学号：2022102267  班级：软件222
--第三题
1、
CREATE UNDO TABLESPACE UNDOTBS2  
DATAFILE 'D:\oracledata\undotbs02.dbf'  
SIZE 100M  
AUTOEXTEND ON  
NEXT 50M  
MAXSIZE UNLIMITED
extent management local autoallocate;
2、
create view stv as
select xsb.学号,专业,课程号,成绩
from xsb,cjb

--第四题
1、
select * from xsb
where 姓名 like '王_ %';
2、
select * from xsb
where 出生时间< all(
select 出生时间  from xsb
where 专业= '计算机'
);
3、
select * from xsb
where 备注 not in null;
--第五题
1、
--创建函数
CREATE OR REPLACE FUNCTION pcfun 
(
  INSEX IN VARCHAR2 
) RETURN NUMBER AS 
count_sex number;
BEGIN
  if insex='男' then
  select count(性别) into count_sex from xsb
  where 性别='男';
  else
  select count(性别) into count_sex from xsb
  where 性别='女';
  end if;
  return count_sex;
END pcfun;

--调用pcfun函数
declare man number;
begin
man:=pcfun('男');
dbms_output.put_line('男学生人数：'||to_char(man));
end;

2、
--创建存储过程
CREATE or REPLACE PROCEDURE pcnum
(insex in CHAR)
as count_sex number;
begin
if insex='男' then
  select count(性别) into count_sex from xsb
  where 性别='男';
  dbms_output.put_line('男学生人数：'||to_char(count_sex));
  else
  select count(性别) into count_sex from xsb
  where 性别='女';
  dbms_output.put_line('女学生人数：'||to_char(count_sex));
  end if;
  end;

--调用存储过程
 exec pcnum(insex=>'男');
 
3、
--创建触发器

create or replace trigger itrig
instead of  insert
on stv for each row
declare 
xh CHAR(6):='151116';
xm CHAR(10):='徐鹤';
xb char(2):='男';
cssj date:='1997-07-28';
zy CHAR(12):='计算机';
kch char(3):='101';
cj NUMBER(2,0):=85;
begin

    insert into xsb(学号,姓名,性别,出生时间,专业) values(xh,xm,xb,cssj,zy);
    insert into cjb(学号,课程号,成绩) values(xh,kch,cj);
end;

insert into stv values('151116','徐鹤','男','1997-07-28','计算机');