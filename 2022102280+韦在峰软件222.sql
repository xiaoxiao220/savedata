--2024-2025-1Oracle���ݿ� ��ĩ����A��
/*��һ�⵽�ڶ�����ѧϰͨ����
�������⵽������д����ѧ��+����+�༶.sql���ļ���
�ļ�����Ϊ:ѧ��+����+�༶.sql
һ��Ҫд���Լ���������ѧ�ţ��༶��ֻ��Ҫ�ύ���.sql�ļ�����Ҫ�ύѹ������
�ύ��󣬽�ʦ�˼���Ƿ��ύ�ɹ�����ǩ��ȷ��*/
--������  ѧ�ţ�  �༶��
--������
1��
create undo tablespace undotbs2
datafile 'C:\oracledata\undotbs02.dbf' size 100m
autoextend on
next 50m maxsize unlimited
extent management local autoallocate;
2��
CREATE VIEW stu
AS
SELECT XSB.ѧ��, רҵ���γ̺ţ��ɼ�
FROM XSB, CJB
WHERE XSB.ѧ��=CJB.ѧ�ţ�
--������
1��
select * from xsb where ���� like '��_ ';
2��
select * from xsb
where ����ʱ��< all
( select ����ʱ��  
from xsb where רҵ= '�����');
3��
select * from xsb
where ��ע is not null;
--������
1��
CREATE OR REPLACE FUNCTION pcfun RETURN NUMBER
AS
    male_count NUMBER;
BEGIN
    SELECT COUNT(*) INTO male_count
    FROM xsb
    WHERE �Ա� = '��';
    
    RETURN male_count;
END pcfun;

DECLARE
    v_male_count NUMBER;
BEGIN
    v_male_count := pcfun();
    DBMS_OUTPUT.PUT_LINE('��ͬѧ��������: ' || v_male_count);
END;





2��
create or replace procedure pcnum
(in_sex in char,out_num out number)
as
begin
if in_sex='��' then
select count(�Ա�)  into out_num
from xsb
where �Ա�='��';
else
select  count(�Ա�)  into out_num
from xsb
where �Ա�='Ů';
end if;
end;

declare
nan_num number;
begin
pcnum('��',nan_num);
Dbms_output.put_line('��ѧ��������'||to_char(nan_num));
end;



3��
CREATE OR REPLACE TRIGGER itrig
INSTEAD OF INSERT ON stu
FOR EACH ROW
declare 
xb char(2) :='��';
xi char(10) :='���'
cssj date :='1997-07-28';
xf number :=3.5;
BEGIN
    INSERT INTO xsb (ѧ��, ����, �Ա�, ��������, רҵ)
    VALUES (:NEW.ѧ��, :NEW.����, xi,xb,cssj,:NEW.רҵ);
    INSERT INTO cjb (ѧ��, �γ̺�, �ɼ�)
    VALUES (:NEW.ѧ��, :NEW.�γ̺�, :NEW.�ɼ�);
END;
INSERT INTO stu VALUES(151116, �����,101, 85);