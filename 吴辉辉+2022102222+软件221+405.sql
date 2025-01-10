--2024-2025-1Oracle数据库 期末考试A卷
/*第一题到第二题在学习通考试
将第三题到第五题写到‘学号+姓名+班级.sql’文件中
文件保存为:学号+姓名+班级.sql
一定要写好自己的姓名，学号，班级，只需要提交这个.sql文件，不要提交压缩包，
提交完后，教师端检查是否提交成功，并签字确认*/
--姓名：吴辉辉  学号：2022102222  班级：软件221
--第三题
1 create undo tablespace undotbs2
datafile 'D:\oracledata\undotbs02.dbf' size 100m
autoextend on next 50m maxsize unlimited
extend management local autoallocate;
2 create view stv
as
select xsb.学号,专业,课程号,成绩
from xsb,kcb,cjb
where xsb.学号=cjb.学号 and kcb.课程号=cjb.课程号;
--第四题
1 select * from xsb where 姓名 like '王_%';
2 select * from xsb where 出生时间 < all (select * from xsb where 专业 = '计算机' );
3、select * from xsb where 备注 in is not null;
--第五题
1、create function pcfun(in_sex in char)
  return number
  as
  out_num number;
  begin
  if sex='男' then
  select COUNT(性别) into pcfun 
  from xsb
  where 性别='男';
  else
  select COUNT(性别) into pcfun
  from xsb
  where 性别='女';
  end if;
  return (out_num);
  end;
  
  decare
  boy_num number;
  begin 
  boy_num := pcfun('男');
  dbms_output.put_line(to_char(boy_num));
  end;
2、create procedure pcnum(sex in char , num out number)
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
boy_num := pcnum('男',boy_num);
dbms_output.put_line(boy_num);
end;

3、create trigger itrig
instead of insert 
on stu
 for each row
declare
xm char(8):='徐鹤'
xb char(2):='男'
cssj date:='1997-07-28';
begin
insert into xsb(学号,姓名,性别,出生时间,专业)
vaules(:new学号,xm,xb,cssj,:new专业);
insert into cjb values(:new学号,:new课程号,:new成绩);
end;

insert into stu values('15116','计算机','101',85);
 
