--2024-2025-1Oracle数据库 期末考试A卷
/*第一题到第二题在学习通考试
将第三题到第五题写到‘学号+姓名+班级.sql’文件中
文件保存为:学号+姓名+班级.sql
一定要写好自己的姓名，学号，班级，只需要提交这个.sql文件，不要提交压缩包，
提交完后，教师端检查是否提交成功，并签字确认*/
--姓名：熊淮烨  学号：2022102277  班级：软件222
--第三题
1、create Undo tablespeace undotbs2
datefile 'D:\oracledate\undotbs02.dbf'size 100m
autoextend on
next 50m maxsize unlimited
extent management local autoallocate;
2、create or replace view stv
as
select xsb.学号,专业,课程,成绩 from xsb,cjb,kcb
where xsb.学号=cjb.学号 and kcb.课程号=cjb.课程号;
--第四题
1 select * from xsb
where 姓名 like '王_ %';
2、select*from xsb
where 出生时间<all(select 出生时间 from xsb where 专业='计算机’）;
3、select *from xsb
where 备注 is not null;
--第五题
1、create or replace funtion pcfun
(insex in varchar)return number as
countsex number;
begin
  if insex='男'then
  select count('性别') into countsex from xsb
  where 性别='男';
  else
  select count (性别) into countsex from xsb
  where 性别='女';
  end if;
  return countsex;
end pcfun;
declare gnum number('男');
dbms_output.put_line('男学生人数:'||to char(gnum));
end;
2、CREATE OR REPLACE FUNCTION COUNTNUM 
( INSEX IN VARCHAR2 ) RETURN NUMBER AS 
countsex number;
BEGIN
  if insex='男' then
  select count(性别) into countsex from xsb
  where 性别='男';
  else
  select count(性别) into countsex from xsb
  where 性别='女';
  declare gnum number;
begin
gnum:=countnum('男');
dbms_output.put_line('男学生人数：'||to_char(gnum));
end;
3、instead of-insert
on xsb_veiw
for each row
declare
学号 char(6):=";
姓名 char(6):=";
性别 char(2):=";
出生时间 date:=";
专业 char(6):=";
课程号 char(6):=";
成绩 number：=";
begin
