--2024-2025-1Oracle���ݿ� ��ĩ����A��
/*��һ�⵽�ڶ�����ѧϰͨ����
�������⵽������д����ѧ��+����+�༶.sql'�ļ���
�ļ�����Ϊ:ѧ��+����+�༶.sql
һ��Ҫд���Լ���������ѧ�ţ��༶��ֻ��Ҫ�ύ���.sql�ļ�����Ҫ�ύѹ������
�ύ��󣬽�ʦ�˼���Ƿ��ύ�ɹ�����ǩ��ȷ��*/
--�������γ½�  ѧ�ţ�2022102267  �༶�����222
--������
1��
CREATE UNDO TABLESPACE UNDOTBS2  
DATAFILE 'D:\oracledata\undotbs02.dbf'  
SIZE 100M  
AUTOEXTEND ON  
NEXT 50M  
MAXSIZE UNLIMITED
extent management local autoallocate;
2��
create view stv as
select xsb.ѧ��,רҵ,�γ̺�,�ɼ�
from xsb,cjb

--������
1��
select * from xsb
where ���� like '��_ %';
2��
select * from xsb
where ����ʱ��< all(
select ����ʱ��  from xsb
where רҵ= '�����'
);
3��
select * from xsb
where ��ע not in null;
--������
1��
--��������
CREATE OR REPLACE FUNCTION pcfun 
(
  INSEX IN VARCHAR2 
) RETURN NUMBER AS 
count_sex number;
BEGIN
  if insex='��' then
  select count(�Ա�) into count_sex from xsb
  where �Ա�='��';
  else
  select count(�Ա�) into count_sex from xsb
  where �Ա�='Ů';
  end if;
  return count_sex;
END pcfun;

--����pcfun����
declare man number;
begin
man:=pcfun('��');
dbms_output.put_line('��ѧ��������'||to_char(man));
end;

2��
--�����洢����
CREATE or REPLACE PROCEDURE pcnum
(insex in CHAR)
as count_sex number;
begin
if insex='��' then
  select count(�Ա�) into count_sex from xsb
  where �Ա�='��';
  dbms_output.put_line('��ѧ��������'||to_char(count_sex));
  else
  select count(�Ա�) into count_sex from xsb
  where �Ա�='Ů';
  dbms_output.put_line('Ůѧ��������'||to_char(count_sex));
  end if;
  end;

--���ô洢����
 exec pcnum(insex=>'��');
 
3��
--����������

create or replace trigger itrig
instead of  insert
on stv for each row
declare 
xh CHAR(6):='151116';
xm CHAR(10):='���';
xb char(2):='��';
cssj date:='1997-07-28';
zy CHAR(12):='�����';
kch char(3):='101';
cj NUMBER(2,0):=85;
begin

    insert into xsb(ѧ��,����,�Ա�,����ʱ��,רҵ) values(xh,xm,xb,cssj,zy);
    insert into cjb(ѧ��,�γ̺�,�ɼ�) values(xh,kch,cj);
end;

insert into stv values('151116','���','��','1997-07-28','�����');