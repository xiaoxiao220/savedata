--2024-2025-1Oracle数据库 期末考试A卷
/*第一题到第二题在学习通考试
将第三题到第五题写到‘学号+姓名+班级.sql’文件中
文件保存为:学号+姓名+班级.sql
一定要写好自己的姓名，学号，班级，只需要提交这个.sql文件，不要提交压缩包，
提交完后，教师端检查是否提交成功，并签字确认*/
--姓名:陈秋全  学号：2022102257  班级：软件工程222
--第三题
1、create undo tablespace undotbs2

datafile 'D:\oracledata\undotbs02.dbf' size 100m

autoextend on

next 100m maxsize unlimited

extent management local autoallocate;


2、CREATE OR REPLACE VIEW stv
AS
SELECT a.sno, a.sname, a.ssex, a.speciality, b.cno, b.grade
FROM student a, score b
WHERE a.sno=b.sno AND a.speciality='计算机'
WITH CHECK OPTION;

--第四题
1、select * from xsb

where 姓名 like '王_ %';


2、select * from xsb

where 出生时间< all( select 出生时间  from xsb

                    where 专业= '计算机'

        );
3、select * from xsb

where 备注 is not null;
--第五题
1、CREATE OR REPLACE FUNCTION COUNTNUM 
( INSEX IN VARCHAR2 ) RETURN NUMBER AS 
countsex number;
BEGIN
  if insex='男' then
  select count(性别) into countsex from xsb
  where 性别='男';
  else
  select count(性别) into countsex from xsb
  where 性别='女';
  end if;
  return countsex;
END COUNTNUM;

2、CREATE OR REPLACE PROCEDURE pcnum (
    p_male_count OUT NUMBER,
    p_female_count OUT NUMBER
) AS
BEGIN
    SELECT COUNT(*) INTO p_male_count FROM xsb WHERE gender = '男';
    SELECT COUNT(*) INTO p_female_count FROM xsb WHERE gender = '女';
END pcnum;
DECLARE
    male_count NUMBER;
    female_count NUMBER;
BEGIN
    pcnum(male_count, female_count);
    DBMS_OUTPUT.PUT_LINE('男同学人数: '|| male_count);
END;
3、CREATE TRIGGER InsteadTrig
INSTEAD OF INSERT ON stu_view FOR EACH ROW
DECLARE
xm char(8);
xb char(2);
cssj date;
BEGIN
xm:='徐鹤';
xb:= '男';
cssj:= '1997-07-28';
INSERT INTO XSB(学号,姓名,性别,出生时间,专业)
VALUES(NEW.学号,xm, xb, cssj, :NEW.专业);
INSERT INTO CJB VALUES(:NEW.学号,:NEW.课程号,:NEW.成绩);
END;
