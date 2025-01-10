--2024-2025-1Oracle数据库 期末考试A卷
/*第一题到第二题在学习通考试
将第三题到第五题写到‘学号+姓名+班级.sql’文件中
文件保存为:学号+姓名+班级.sql
一定要写好自己的姓名，学号，班级，只需要提交这个.sql文件，不要提交压缩包，
提交完后，教师端检查是否提交成功，并签字确认*/
--姓名：韦万黎  学号：2022102263  班级：软件222
--第三题
1、create undo tablespace UNDOTBS2
datafile 'D:\oracledata\undotbs02.dbf' size 100MB
autoextend on
next 100MB maxsize unlimited
extent management local autoallocate;

2、
create or replace view stu
as 
select 学号,专业,课程号,成绩
from xsb,cjb,kcb;
--第四题
1、
select * from xsb
where 姓名 like '王_ %';

2、
select * from xsb
where 出生时间< all( select 出生时间  from xsb where 专业= '计算机');
3、
select * from xsb
where 备注 is not null;


--第五题
1、
create or replace FUNCTION pcfun 
(
  insex in varchar2
)  as
count
begin
  if insex='男' then
  select count(性别) into countsex from xsb
  where 性别='男';
   else
  select count(性别) into countsex from xsb
  where 性别='女';
  end if;
  end;
  declare
  nsex number
  begin
  pfun ('男','nsex');
  dbms_output.put_line(to_char(nsex));
  end;
 
2、
create or replace procedure pcnum
(
 insex in varchar2 out_num out number
) return number as
out_num number;
begin
  if insex='男' then
  select count(性别) into out_num from xsb
  where 性别='男';
   else
  select count(性别) into out_num from xsb
  where 性别='女';
  end if;
    declare
  nsex number
  begin
  pcnum ('男','nsex');
  dbms_output.put_line(to_char(nsex));
  end;



3、
create or replace view xsb_view
as
select xsb.学号,姓名,课程名,成绩 from xsb,cjb,kcb
where xsb.学号=cjb.学号 and kcb.课程号=cjb.课程号;
create or replace trigger itrig
instead of  insert
on xsb_view
for each row
declare 
xh char(6):='151116'
xm char (2):='徐鹤'
xb char(2) :='男';
cssj date :='1997-07-28';
kch char(3) :='101';
cj number :=85;
begin
    insert into xsb(学号,姓名,性别,出生时间) values(:new.学号,:new.姓名,xb,cssj);
    insert into kcb(课程号,学分,课程名) values(kch,xf,:new.课程名);
    insert into cjb(学号,课程号,成绩) values(:new.学号,kch,:new.成绩);
end;
insert into xsb values('151116','徐鹤','男','1997-07-28','计算机');
insert into cjb values('151116','101','85');