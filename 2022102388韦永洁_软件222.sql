--2024-2025-1Oracle数据库 期末考试A卷
/*第一题到第二题在学习通考试
将第三题到第五题写到‘学号+姓名+班级.sql’文件中
文件保存为:学号+姓名+班级.sql
一定要写好自己的姓名，学号，班级，只需要提交这个.sql文件，不要提交压缩包，
提交完后，教师端检查是否提交成功，并签字确认*/
--姓名：韦永洁  学号：2022102388  班级：软件222
--第三题
1、
Create undo tablespace undotbs2
Datafile'D:\oracledata\undotbs02.dbf' size 100M
autoextend on next 50M maxsize unlimited
extent management local autoallocate;

2、
create view stv
as
select xsb.学号,专业,课程名,成绩
from xsb,cjb
where xsb.学号=cjb.学号;

--第四题
1、
select *
from xsb
where 姓名 like '王_';

2、
select *
from xsb
where 出生时间<all（
select *
from xsb
where 专业='计算机';
);

3、
select *
from xsb
where 备注 is not null;

--第五题
1、
create or replace function pcfun(in_sex in char) 
   return number
as
   out_num number;
begin
   if in_sex='男' then
       select count(性别) into out_num
       from xsb
       where 性别='男';
else
select count(性别) into out_num
from xsb
where 性别='女';
end if;
return(out_num);
end count_num;

declare
  boy_num number;
begin
  count_number('男',boy_num);
  dbms_output.put_line(boy_num);
end;

2、
create or replace procedure pcnum   
(sex in char,num out number)
as
begin
if sex='男' then
select count(性别) into num
from xsb
where 性别='男';
else
select count(性别) into num
from xsb
where 性别='女';
end if;
end;

declare
  boy_num number;
begin
  count_number('男',boy_num);
  dbms_output.put_line(boy_num);
end;

3、
create trigger insteadtrig
   Instead of insert on stu for each row
declare
xm char(8);
xb char(2);
cssj data;
begin
xm:='徐鹤';
xb:='男';
cssj:='1997-07-28';
insert into xsb(学号,姓名,性别,出生时间,专业)
   values(:new.学号,xm,xb,cssj,:new.专业);
insert into cjb values(:new.学号,:new.课程号,:new.成绩);
end;

Insert into stv values('151116','101',85)；