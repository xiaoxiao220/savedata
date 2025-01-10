第三题、1
create undo tablespace undotbs2
datafile 'D:\oracledata\undotbs02.dbf' size 100m
autoextend on
next 100m maxsize unlimited
extent management local autoallocate;

第三题、2
Create or replace view stv
as
select xsb.学号,专业,课程名,成绩 from xsb,cjb,kcb
where xsb.学号=cjb.学号 and kcb.课程号=cjb.课程号;
   

第四题、1
select * from xsb
where 姓名 like '王_ %';

第四题、2
select * from xsb
where 出生时间< all( select 出生时间  
from xsb
where 专业= '计算机'
);

第四题、3
select * from xsb
where 备注 is not null;

第五题、1
CREATE OR REPLACE FUNCTION CREATE OR REPLACE FUNCTION pcfun
(
  INSEX IN VARCHAR2 
) RETURN NUMBER AS 
countsex number;
BEGIN
  if insex='男' then
  select count(性别) into countsex from xsb
  where 性别='男';
  else
  select count(性别) into countsex from xsb
  where 性别='女';
  end if;
  return countsex;
END pcfun;

第五题、2
create or replace procedure pcnum
as
begin
if insex='男' then
  select count(性别) into countsex from xsb
  where 性别='男';
  else
  select count(性别) into countsex from xsb
  where 性别='女';
  end if;
  return countsex;
END pcunm;

--调用存储过程
declare  number;
begin
pcnum('男');
end;

第五题、3
create trigger stv
after insert
on xsb
declare 
a char(30):='create trigger finished!';
begin
dbms_output.put_line(a);
end;
insert into xsb(学号,姓名,性别,出生时间,专业,总学分,备注) 
values ('151116','徐鹤','男','1997-07-28','计算机',90,);
insert into cjb(学号,课程号,成绩)
values ('151116','101',85);

