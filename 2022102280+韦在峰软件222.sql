--2024-2025-1Oracle数据库 期末考试A卷
/*第一题到第二题在学习通考试
将第三题到第五题写到‘学号+姓名+班级.sql’文件中
文件保存为:学号+姓名+班级.sql
一定要写好自己的姓名，学号，班级，只需要提交这个.sql文件，不要提交压缩包，
提交完后，教师端检查是否提交成功，并签字确认*/
--姓名：  学号：  班级：
--第三题
1、
create undo tablespace undotbs2
datafile 'C:\oracledata\undotbs02.dbf' size 100m
autoextend on
next 50m maxsize unlimited
extent management local autoallocate;
2、
CREATE VIEW stu
AS
SELECT XSB.学号, 专业，课程号，成绩
FROM XSB, CJB
WHERE XSB.学号=CJB.学号；
--第四题
1、
select * from xsb where 姓名 like '王_ ';
2、
select * from xsb
where 出生时间< all
( select 出生时间  
from xsb where 专业= '计算机');
3、
select * from xsb
where 备注 is not null;
--第五题
1、
CREATE OR REPLACE FUNCTION pcfun RETURN NUMBER
AS
    male_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO male_count
    FROM xsb
    WHERE 性别 = '男';
    
    RETURN male_count;
END pcfun;

DECLARE
    v_male_count NUMBER;
BEGIN
    v_male_count := pcfun();
    DBMS_OUTPUT.PUT_LINE('男同学的人数是: ' || v_male_count);
END;





2、
create or replace procedure pcnum
(in_sex in char,out_num out number)
as
begin
if in_sex='男' then
select count(性别)  into out_num
from xsb
where 性别='男';
else
select  count(性别)  into out_num
from xsb
where 性别='女';
end if;
end;

declare
nan_num number;
begin
pcnum('男',nan_num);
Dbms_output.put_line('男学生人数：'||to_char(nan_num));
end;



3、
CREATE OR REPLACE TRIGGER itrig
INSTEAD OF INSERT ON stu
FOR EACH ROW
declare 
xb char(2) :='男';
xi char(10) :='徐鹤'
cssj date :='1997-07-28';
xf number :=3.5;
BEGIN
    INSERT INTO xsb (学号, 姓名, 性别, 出生日期, 专业)
    VALUES (:NEW.学号, :NEW.姓名, xi,xb,cssj,:NEW.专业);
    INSERT INTO cjb (学号, 课程号, 成绩)
    VALUES (:NEW.学号, :NEW.课程号, :NEW.成绩);
END;
INSERT INTO stu VALUES(151116, 计算机,101, 85);