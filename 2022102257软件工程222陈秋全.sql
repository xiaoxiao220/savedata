--2024-2025-1Oracle���ݿ� ��ĩ����A��
/*��һ�⵽�ڶ�����ѧϰͨ����
�������⵽������д����ѧ��+����+�༶.sql���ļ���
�ļ�����Ϊ:ѧ��+����+�༶.sql
һ��Ҫд���Լ���������ѧ�ţ��༶��ֻ��Ҫ�ύ���.sql�ļ�����Ҫ�ύѹ������
�ύ��󣬽�ʦ�˼���Ƿ��ύ�ɹ�����ǩ��ȷ��*/
--����:����ȫ  ѧ�ţ�2022102257  �༶���������222
--������
1��create undo tablespace undotbs2

datafile 'D:\oracledata\undotbs02.dbf' size 100m

autoextend on

next 100m maxsize unlimited

extent management local autoallocate;


2��CREATE OR REPLACE VIEW stv
AS
SELECT a.sno, a.sname, a.ssex, a.speciality, b.cno, b.grade
FROM student a, score b
WHERE a.sno=b.sno AND a.speciality='�����'
WITH CHECK OPTION;

--������
1��select * from xsb

where ���� like '��_ %';


2��select * from xsb

where ����ʱ��< all( select ����ʱ��  from xsb

                    where רҵ= '�����'

        );
3��select * from xsb

where ��ע is not null;
--������
1��CREATE OR REPLACE FUNCTION COUNTNUM 
( INSEX IN VARCHAR2 ) RETURN NUMBER AS 
countsex number;
BEGIN
  if insex='��' then
  select count(�Ա�) into countsex from xsb
  where �Ա�='��';
  else
  select count(�Ա�) into countsex from xsb
  where �Ա�='Ů';
  end if;
  return countsex;
END COUNTNUM;

2��CREATE OR REPLACE PROCEDURE pcnum (
    p_male_count OUT NUMBER,
    p_female_count OUT NUMBER
) AS
BEGIN
    SELECT COUNT(*) INTO p_male_count FROM xsb WHERE gender = '��';
    SELECT COUNT(*) INTO p_female_count FROM xsb WHERE gender = 'Ů';
END pcnum;
DECLARE
    male_count NUMBER;
    female_count NUMBER;
BEGIN
    pcnum(male_count, female_count);
    DBMS_OUTPUT.PUT_LINE('��ͬѧ����: '|| male_count);
END;
3��CREATE TRIGGER InsteadTrig
INSTEAD OF INSERT ON stu_view FOR EACH ROW
DECLARE
xm char(8);
xb char(2);
cssj date;
BEGIN
xm:='���';
xb:= '��';
cssj:= '1997-07-28';
INSERT INTO XSB(ѧ��,����,�Ա�,����ʱ��,רҵ)
VALUES(NEW.ѧ��,xm, xb, cssj, :NEW.רҵ);
INSERT INTO CJB VALUES(:NEW.ѧ��,:NEW.�γ̺�,:NEW.�ɼ�);
END;
