--2024-2025-1Oracle数据库 期末考试A卷
/*第一题到第二题在学习通考试
将第三题到第五题写到‘学号+姓名+班级.sql’文件中
文件保存为:学号+姓名+班级.sql
一定要写好自己的姓名，学号，班级，只需要提交这个.sql文件，不要提交压缩包，
提交完后，教师端检查是否提交成功，并签字确认*/
--姓名：姜富贵  学号：2022102286  班级：软件222(405)
--第三题
1、create uodo tablespace UNDOTBS2
   datafile 'D:\oracledata\undotbs02.dbf' size 100m
   autoextend on next 50m maxsize unlimited
   extent management local autoallocate;
2、create or replace view stv
   as
   select xsb.学号,专业,cjb.课程号,成绩
   from xsb,cjb
   where xsb.学号=cjb.学号;
--第四题
1、select * from xsb
  where 姓名 like '王_%';
2、select * from xsb
  where 出生时间<all(
    select 出生时间 from xsb
    where 专业='计算机');
3、select * from xsb
   where 备注 is not null;
--第五题
1、
--创建函数
create or replace function pcfun(sexnum in char)
  return number
as
  outnum number;
begin
  if sexnum='男' then
  select count(性别) into outnum
  from xsb
  where 性别='男';
  else
  select count(性别) into outnum
  from xsb
  where 性别='女';
  end if;
  return(outnum);
end pcfun;
--调用函数
declare 
  boynum number;
begin
  boynum:=pcfun('男');
  dbms_output.put_line(to_char(boynum));
end;
2、
--创建存储过程
create or replace procedure pcnum(sexnum in char,outnum out char)
as
begin
  if sexnum='男' then
  select count(性别) into outnum
  from xsb
  where 性别='男';
  else
  select count(性别) into outnum
  from xsb
  where 性别='女';
  end if;
end;
--调用存储过程
declare
  boynum number;
begin
  pcnum('男',boynum);
  dbms_output.put_line(boynum);
end;
3、
--创建触发器
create or replace trigger itrig
instead of insert on stv
   for each row
declare
   xm char(8);
   xb char(2);
   cssj date;
begin
  xm:='许鹤';
  xb:='男';
  cssj:='1997-07-28';
  insert into xsb(学号,姓名,性别,出生时间,专业)
           values(:new.学号,xm,xb,cssj,:new.专业);
  insert into cjb values(:new.学号,:new.课程号,:new.成绩);
end;

--插入数据
alter session set nls_date_format='YYYY-MM-DD';
insert into xsb(学号,姓名,性别,出生时间,专业)
       values('151116','许鹤','男','1997-07-28','计算机');
insert into cjb values('151116','101',85);