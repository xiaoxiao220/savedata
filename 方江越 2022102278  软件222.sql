--2024-2025-1Oracle数据库 期末考试A卷
/*第一题到第二题在学习通考试
将第三题到第五题写到‘学号+姓名+班级.sql’文件中
文件保存为:学号+姓名+班级.sql
一定要写好自己的姓名，学号，班级，只需要提交这个.sql文件，不要提交压缩包，
提交完后，教师端检查是否提交成功，并签字确认*/
--姓名：方江越  学号：2022102278  班级：软件222
--第三题
1、
create undo tablespace undotbs2
datafile 'd:\oracledata\undotbs02.dbf' 
size 100m
autoextend on
next 100m maxsize unlimited
extent management local autoallocate;

2、

CREATE OR REPLACE VIEW stv
AS
SELECT a.学号,a.专业,b.课程号,c.成绩
FROM a.sxb,b.kcb,c.cjb
where a.学号=c.学号 and b.课程号=c.课程号 
WITH CHECK OPTION;
--第四题
1、
select * from xsb
where 姓名 like '王_ %';
2、
select * from xsb
where 出生时间<all( select 出生时间 from xsb where 专业= '计算机');
3、
select * from xsb where 备注 is not null;
--第五题
1、
create or replace function pcfun
(xbna in char)
return number is ren number;--男的数量
begin
select count(*) into ren from xsb
where 性别=xbna;
return ren;--将男性人数统计到ren里面并输出
end
select ren('男')as "男人" from xsb;

2、
create or replace procedure pcfun
(xbna in char,xbnv in char,ren out number,ren2 out number)
as
begin
select count(*) into ren from xsb
where 性别=xbna;
dbms_output.put_line(ren);--将男性人数统计到ren里面并输出
select count(*) into ren2 from xsb
where 性别=xbnv;--将女性人数统计
end;
declare ren123 number;
begin
pcfun('男','女',ren123);
end;
3、
create or replace trigger itrig
after insert
on stv
declare infor char(30);
begin
    if inserting then
        insert into xsb ("学号","姓名","性别","出生日期","专业") values (‘151116’,’徐鹤’,’男’,’1997-07-28’,’计算机’);
        insert into cjb () values (‘151116’,’101’,85);
end;
