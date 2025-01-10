--2024-2025-1Oracle数据库 期末考试A卷
/*第一题到第二题在学习通考试
将第三题到第五题写到‘学号+姓名+班级.sql’文件中
文件保存为:学号+姓名+班级.sql
一定要写好自己的姓名，学号，班级，只需要提交这个.sql文件，不要提交压缩包，
提交完后，教师端检查是否提交成功，并签字确认*/
--姓名：王昕磊  学号：2022102287  班级：软件222
--第三题
1、
CREATE UNDO TABLESPACE UNDOTBS2
    DATAFILE 'D:\oracledata\UNDOTBS2.dbf' SIZE 100M
    AUTOEXTEND ON NEXT 50M MAXSIZE UNLIMITED
    EXTENT MANAGEMENT LOCAL AUTOALLOCATE;

2、
CREATE OR REPLACE VIEW stv
    AS
    SELECT c.学号, 专业, 课程号, 成绩 FROM XSB x
        FULL OUTER JOIN CJB c ON x.学号 = c.学号;
--第四题
1、
SELECT * FROM XSB
    WHERE 姓名 LIKE '王_%' AND LENGTH(姓名) = 2 * 4;

2、
SELECT * FROM XSB
    WHERE 出生时间 < (
        SELECT MIN(出生时间) FROM XSB
            WHERE 专业 = '计算机'
    );
--SELECT * FROM XSB WHERE 出生时间 < ALL(
--    SELECT 出生时间 FROM XSB
--        WHERE 专业 = '计算机'
--);

3、
SELECT * FROM XSB WHERE 备注 IS NOT NULL;
--第五题
1、
CREATE OR REPLACE FUNCTION pcfun (sex IN CHAR)
    RETURN NUMBER
AS
    ret NUMBER;
BEGIN
    IF sex = '男' THEN
        SELECT COUNT(性别) INTO ret
            FROM XSB WHERE 性别='男';
    ELSE
        SELECT COUNT(性别) INTO ret
            FROM XSB WHERE 性别='女';
    END IF;
    RETURN(ret);
END pcfun;

DECLARE
    boys NUMBER;
BEGIN
    boys := pcfun('男');
    DBMS_OUTPUT.PUT_LINE('男同学的人数为' || TO_CHAR(boys));
END;

2、
CREATE OR REPLACE PROCEDURE pcnum
    (sex IN CHAR, counts OUT NUMBER)
AS
BEGIN
    IF sex = '男' THEN
        SELECT COUNT(性别) INTO counts
            FROM XSB WHERE 性别 = '男';
    ELSE
        SELECT COUNT(性别) INTO counts
            FROM XSB WHERE 性别 = '女';
    END IF;
END;

DECLARE
    boys NUMBER;
BEGIN
    pcnum('男', boys);
    DBMS_OUTPUT.PUT_LINE('男同学的人数为' || TO_CHAR(boys));
END;

3、
CREATE OR REPLACE TRIGGER itrig
    INSTEAD OF INSERT ON stv FOR EACH ROW
DECLARE
    xh XSB.学号%TYPE;
BEGIN
    xh := '151116';
    INSERT INTO XSB (学号, 姓名, 性别, 出生时间, 专业)
        VALUES (xh, '徐鹤', '男', '1997-07-28', '计算机');
    INSERT INTO CJB VALUES (xh, '101', 85);
END;