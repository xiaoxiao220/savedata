--2024-2025-1Oracle数据库 期末考试A卷
/*第一题到第二题在学习通考试
将第三题到第五题写到‘学号+姓名+班级.sql’文件中
文件保存为:学号+姓名+班级.sql
一定要写好自己的姓名，学号，班级，只需要提交这个.sql文件，不要提交压缩包，
提交完后，教师端检查是否提交成功，并签字确认*/
--姓名：黎庭亮  学号：2022102282  班级：软件工程222
--第三题
1、
create undo tablespace undotbs2
datafile 'D:\oracledata\undotbs02.dbf' size 100m
autoextend on
next 50m maxsize unlimited
extent management local autoallocate;

2、
create view stv
as
select xsb.学号,专业,kcb.课程号,成绩 from xsb,cjb,kcb 
where xsb.学号=cjb.学号 and kcb.课程号=cjb.课程号; 

--第四题
1、
select * from xsb
where 姓名 like '王_ %';

2、
select * from xsb
where 出生时间< all( select 出生时间  from xsb
                    where 专业= '计算机'
        );
        
3、
select * from xsb
where 备注 is not null;

--第五题
1、
CREATE OR REPLACE FUNCTION pcfun(p_gender VARCHAR2) 
RETURN NUMBER 
AS
v_count NUMBER;
BEGIN
  SELECT COUNT(*) INTO v_count
  FROM xsb
  WHERE xb = p_gender;
  RETURN v_count;
END;

DECLARE
  male_count NUMBER;
BEGIN
  male_count := pcfun('男');
  DBMS_OUTPUT.PUT_LINE('男同学人数: '|| male_count);
END;

2、
CREATE OR REPLACE PROCEDURE pcnum (
    p_male_count OUT NUMBER,
    p_female_count OUT NUMBER
) AS
BEGIN
    SELECT COUNT(*) INTO p_male_count
    FROM xsb
    WHERE xb = '男';
    SELECT COUNT(*) INTO p_female_count
    FROM xsb
    WHERE xb = '女';
END;

DECLARE
    v_male_count NUMBER;
    v_female_count NUMBER;
BEGIN
    pcnum(v_male_count, v_female_count);
    DBMS_OUTPUT.PUT_LINE('男同学人数: '|| v_male_count);
END;

3、
CREATE TRIGGER InsteadTrig
INSTEAD OF INSERT ON stu_view FOR EACH ROW
DECLARE
xm char(8);
xb char(2);
cssj date;
BEGIN
xm:=’徐鹤’;
xb:= ‘男’;
cssj:= ‘1997-07-28’;
INSERT INTO XSB(学号,姓名,性别,出生时间,专业)
VALUES(NEW.学号,xm, xb, cssj, :NEW.专业);
INSERT INTO CJB VALUES(:NEW.学号,:NEW.课程号,:NEW.成绩);
END;


