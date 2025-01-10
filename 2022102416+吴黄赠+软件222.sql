--姓名：吴黄赠  学号：2022102416  班级：软件222
--第三题
1、create undo tablespace UNDOTBS2
   datafile 'D:\oracledata' size 100m
   autoextend on next 50m maxsize unlimited
   extent management local autoallocate;
   
2、create view stv
   as
   select xsb.学号,专业,kcb.课程号,成绩
   from xsb,kcb,cjb
   where xsb.学号=cjb.学号 and kcb.课程号=cjb.课程号;
--第四题
1、select * from xsb where 姓名 like '王_ %';
2、select * from xsb where 出生时间< all(
select 出生时间 from xsb where 专业='计算机');
3、select * from xsb where 备注 is not null;
--第五题
1、create or replace function pcfun
   (insex in char)
   return number
   as
   sexnum number;
   begin
   if insex='男' then
   select count(性别) into sexnum from xsb where 性别='男';
   end if;
   if insex='女' then
   select count(性别) into sexnum from xsb where 性别='女';
   end if;
   return sexnum;
   end;
   
   declare sexcou number;
   begin
   sexcou:=pcfun(insex=>'男');
   dbms_output.put_line(sexcou);
   end;
2、create or replace procedure pcnum
   (insex in char,outnum out number)
   as
   sexnum number;
   begin
   if insex='男' then
   select count(性别) into sexnum from xsb where 性别='男';
   end if;
   if insex='女' then
   select count(性别) into sexnum from xsb where 性别='女';
   end if;
   dbms_output.put_line(outnum);
   end;
   
   declare sexcou number;
   begin
   pcnum('男',sexcou);
   end;
3、alter session set nls_date_format='YYYY-MM-DD';
 
   create or replace trigger itrig 
   instead of insert on stv
   for each row
   declare
   xm char(10);
   xb char(5);
   cssj date;
   zy char(10);
   begin
   xm:='徐鹤';
   xb:='男';
   cssj:='1997-07-28';
   insert into xsb (学号,姓名,性别,出生时间,专业) 
              values(:new.学号,'徐鹤','男','1997-07-28',:new.专业);
   insert into cjb (学号,课程号,成绩) 
              values(:new.学号,:new.课程号,:new.成绩);
   end;
   
   insert into stv(学号,专业,课程号, 成绩) 
              values('151116','计算机','101','85');