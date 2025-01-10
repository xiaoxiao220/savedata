--2024-2025-1Oracle数据库 期末考试A卷
/*第一题到第二题在学习通考试
将第三题到第五题写到‘学号+姓名+班级.sql’文件中
文件保存为:学号+姓名+班级.sql
一定要写好自己的姓名，学号，班级，只需要提交这个.sql文件，不要提交压缩包，
提交完后，教师端检查是否提交成功，并签字确认*/
--姓名：梁富厚  学号：2022102259  班级：软件222
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
select 学号,专业,课程号,成绩
from xsb;

--第四题
1、
select * from xsb
where 姓名 like '王_ %';
2、
select * from xsb
where 出生时间<all(
select 出生时间 from xsb 
where 专业='计算机';
);
3、
select * from xsb
where 备注 is not null;
--第五题
1、
create or replace function pcfun 
(
  insex in VARCHAR2 
) return number as
countsex number;
begin
  if insex='男' then
  select count(性别) into countsex from xsb
  where 性别='男';
  else
  select count(性别) into countsex from xsb
  where 性别='女';
  end if;
  return countsex;
end;

declare countsex number;
begin
countsex := pcfun('男');
dbms_output.put_line(countsex);
end;
2、
create procedure pcnum
(insex in VARCHAR2,countsex out number)
as
begin
if insex='男' then
  select count(性别) into countsex from xsb
  where 性别='男';
  else
  select count(性别) into countsex from xsb
  where 性别='女';
  end if;
  dbms_output.put_line(countsex);
end;

declare cn number;
begin
pcnum('男',cn);
end;
3、
create or replace trigger itrig
instead of on stv
for each row 
begin

end;

insert into xsb(学号,姓名,性别,出生时间，专业) values(‘151116’,’ 徐 鹤 ’,’ 男 ’,’1997-07-28’,’ 计算机 ’);

insert into cjb (学号,课程号,成绩) values(‘151116’,’101’,85;











