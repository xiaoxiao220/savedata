--2024-2025-1Oracle���ݿ� ��ĩ����A��
/*��һ�⵽�ڶ�����ѧϰͨ����
�������⵽������д����ѧ��+����+�༶.sql���ļ���
�ļ�����Ϊ:ѧ��+����+�༶.sql
һ��Ҫд���Լ���������ѧ�ţ��༶��ֻ��Ҫ�ύ���.sql�ļ�����Ҫ�ύѹ������
�ύ��󣬽�ʦ�˼���Ƿ��ύ�ɹ�����ǩ��ȷ��*/
--�����������  ѧ�ţ�2022102381  �༶�����222
--������
1��
create undo tablespace UNDOTBS2
datafile 'D:\oracledata\undotbs02.dbf' 
size 100m
autoextend on next 100m maxsize unlimited
extent management local autoallocate;
2��
CREATE VIEW stv
AS
SELECT XSB.ѧ��,רҵ,�γ̺�,�ɼ�
FROM XSB,CJB
WHERE XS.ѧ��=CJB.ѧ��

--������
1��
select * from xsb
where ���� like '��_';
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
CREATE OR REPLACE FUNCTION pcnum
(
  INSEX IN VARCHAR2 
) RETURN NUMBER AS 
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
END pcnum;
2��
CREATE OR REPLACE pcnum count_num (in_sex IN char)
RETURN number
AS
avger number;
BEGIN
IF in_sex='��'THEN
SELECT COUNT(�Ա�)INTO out_num
FROM XSB
WHERE �Ա�='��';
ELSE
SELECT COUNT(�Ա�)INTO out_num
FROM XSB
WHERE �Ա�='Ů';
END IF;
RETURN(out_num);
END count_num;
3��
CREATE TRIGGER InsteadTrig
INSTEAD OF INSERT ON stu_view FOR EACH ROW
DECLARE
xm char(8);
xb char(2);
cssj data;
BEGIN
xm:='���';
xb:='��';
cssj:='1997-07-28';
INsERT INTO XSB(ѧ��,����,�Ա�,����ʱ��,רҵ)
VALUES(:NEW.ѧ��,xm,xb,cssj,:NEW.רҵ);
INSERT INTO CJB VALUES(:NEW.ѧ��,:NEW.�γ̺�,:NEW.�ɼ�);
END;