--2024-2025-1Oracle���ݿ� ��ĩ����A��
/*��һ�⵽�ڶ�����ѧϰͨ����
�������⵽������д����ѧ��+����+�༶.sql���ļ���
�ļ�����Ϊ:ѧ��+����+�༶.sql
һ��Ҫд���Լ���������ѧ�ţ��༶��ֻ��Ҫ�ύ���.sql�ļ�����Ҫ�ύѹ������
�ύ��󣬽�ʦ�˼���Ƿ��ύ�ɹ�����ǩ��ȷ��*/
--��������ͥ��  ѧ�ţ�2022102282  �༶���������222
--������
1��
create undo tablespace undotbs2
datafile 'D:\oracledata\undotbs02.dbf' size 100m
autoextend on
next 50m maxsize unlimited
extent management local autoallocate;

2��
create view stv
as
select xsb.ѧ��,רҵ,kcb.�γ̺�,�ɼ� from xsb,cjb,kcb 
where xsb.ѧ��=cjb.ѧ�� and kcb.�γ̺�=cjb.�γ̺�; 

--������
1��
select * from xsb
where ���� like '��_ %';

2��
select * from xsb
where ����ʱ��< all( select ����ʱ��  from xsb
                    where רҵ= '�����'
        );
        
3��
select * from xsb
where ��ע is not null;

--������
1��
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
  male_count := pcfun('��');
  DBMS_OUTPUT.PUT_LINE('��ͬѧ����: '|| male_count);
END;

2��
CREATE OR REPLACE PROCEDURE pcnum (
    p_male_count OUT NUMBER,
    p_female_count OUT NUMBER
) AS
BEGIN
    SELECT COUNT(*) INTO p_male_count
    FROM xsb
    WHERE xb = '��';
    SELECT COUNT(*) INTO p_female_count
    FROM xsb
    WHERE xb = 'Ů';
END;

DECLARE
    v_male_count NUMBER;
    v_female_count NUMBER;
BEGIN
    pcnum(v_male_count, v_female_count);
    DBMS_OUTPUT.PUT_LINE('��ͬѧ����: '|| v_male_count);
END;

3��
CREATE TRIGGER InsteadTrig
INSTEAD OF INSERT ON stu_view FOR EACH ROW
DECLARE
xm char(8);
xb char(2);
cssj date;
BEGIN
xm:=����ס�;
xb:= ���С�;
cssj:= ��1997-07-28��;
INSERT INTO XSB(ѧ��,����,�Ա�,����ʱ��,רҵ)
VALUES(NEW.ѧ��,xm, xb, cssj, :NEW.רҵ);
INSERT INTO CJB VALUES(:NEW.ѧ��,:NEW.�γ̺�,:NEW.�ɼ�);
END;


