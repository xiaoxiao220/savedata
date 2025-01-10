--三、1
create tablespace undotbs2
 datafile 'D:\oracledata\undotbs02.dbf'  
 size 100M
 autoextend on next 50M maxsize unlimited
 extent management local
 segment space management auto;
--三、2
create view stv 
as
select xsb.学号,专业,课程号,成绩 from xsb,cjb
where xsb.学号=cjb.学号;
--四、1
select * from xsb
where 姓名 like '王%';
--四、2
select * from xsb
where 出生时间< all( select 出生时间  from xsb
                    where 专业= '计算机');
--四、3
select * from xsb
where 备注 is not null;

--五、1
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
end;

declare
 boy_num number;
begin
 boy_num:=pcfun('男');
 dbms_output.put_line(boy_num);
end;
--五、2
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
 sex_num number;
begin 
 pcnum('男',sex_num);
 dbms_output.put_line(sex_num);
end;

declare 
 sex_num number;
begin 
 pcnum('女',sex_num);
 dbms_output.put_line(sex_num);
end;
--五、3
create or replace trigger itrig
 instead of insert on stv for each row
begin
 insert into xsb (学号,姓名,性别,出生时间,专业) 
 values('151116','徐鹏','男',to_date('YYYY-MM-DD','1997-07-28'),'计算机');
 insert into cjb (学号,课程号,成绩)
 values('151116','101',85);
end;

