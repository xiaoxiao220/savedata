--2024-2025-1Oracle数据库 期末考试A卷
/*第一题到第二题在学习通考试
将第三题到第五题写到‘学号+姓名+班级.sql’文件中
文件保存为:学号+姓名+班级.sql
一定要写好自己的姓名，学号，班级，只需要提交这个.sql文件，不要提交压缩包，
提交完后，教师端检查是否提交成功，并签字确认*/
--姓名：蓝国珍  学号：2022102250  班级：软件222
--第三题
1、
create Undo  TABLESPACE UNDOTBS2
DATAFILE  'D:\oracledata\undotbs02.dbf'
size 100m
autoextend on
 next  100m maxsize unlimited
EXTENT MANAGEMENT LOCAL autoallocate ;
2、create view stv 
as 
    select 学号,专业,课程号,成绩
from XSB,CJB
where xsb.学号=CJB.学号
with check option ;
--第四题
1、SELECT *
FROM XSB
WHERE 姓名 LIKE'王_%'
2、select *
from XSB
    where 出生时间>all
          (
              select 出生时间
              from XSB
              where 专业='计算机'
              );
3、select *
from XSB
where 备注 is not null ;
--第五题
1、create or replace function pcfun
(insex in char)
return number
as out_pcfun number;
begin
    if insex='男' then
        select count('性别')
              into out_pcfun
        from XSB
            where 性别='男';
        else
        select count('性别')
            into out_pcfun
        from XSB
            where 性别='女';
end if;
return out_pcfun;
end pcfun;
2、
create or replace procedure  pcnum
(insex in char,num out number)
3、