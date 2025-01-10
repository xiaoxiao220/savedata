三
1.
create undo tablespace undotbs2
datafile 'D:\oracledata\undotbs02.dbf' size 100m
autoextend on
next 50m maxsize unlimited
extent management local autoallocate;

2.
create view stv
as
select 学号,专业,课程号,成绩
where XSB.学号=CJB.学号
and CJB.课程号=KCB.课程号;


四
1.
select *
from xsb
where 姓名 like'王%_ ';
2.
select * from xsb
where 出生时间<all(
select 出生时间 from xsb
where 专业='计算机');
3.
select *
from xsb
where 备注 is not null;



五
1.
create function pcfun(in_sex in char)
return number
as
out_num number;
begin
if in_sex=’男’then
select count(性别)into out_num
from xsb
where 性别=’男’;
else
select count (性别)into out_num
from xsb
where 性别=’女’;
end if;
return (out_num);
end pcfun;

declare gnum number;
begin
gnum:=pcfun('男');
dbms_output.put_line('男同学人数：'(gnum));
end;

2.
create procedure pcnum
(sex in char,num out number)
as
begin
if sex=’男’then
select count(性别)into num
from xsb
where 性别=’男’;
else
select count(性别)into num
from xsb
where 性别=’女’;
end if;
end;

exec pcnum;

3.
create trigger itrig
instead of insert on xsb
for each row
declare
xm char(8);
xb char(2);
cssj date;
begin
xm:='徐鹤';
xb:='男';
cssj:=’1997-07-28’;
insert into xsb(学号,姓名,性别,出生时间,专业)
values(:new.学号,xm,xb,cssj,:new.专业)；
insert into cjb values(:new.学号,:new.课程号,:new.成绩);
end;

insert into xsb
values('151116','徐鹤','男','1997-07-28','计算机')；

insert into cjb(学号,课程号,成绩)
values('151116','101',85);

