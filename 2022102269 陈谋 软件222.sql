--2024-2025-1Oracle���ݿ� ��ĩ����A��
/*��һ�⵽�ڶ�����ѧϰͨ����
�������⵽������д����ѧ��+����+�༶.sql���ļ���
�ļ�����Ϊ:ѧ��+����+�༶.sql
һ��Ҫд���Լ���������ѧ�ţ��༶��ֻ��Ҫ�ύ���.sql�ļ�����Ҫ�ύѹ������
�ύ��󣬽�ʦ�˼���Ƿ��ύ�ɹ�����ǩ��ȷ��*/
--��������ı ѧ�ţ�2022102269  �༶�����222
--������
1��
create undo tablespace undotbs2
datafile 'D:\oracledata\undotbs02.dbf' 
size 100m
autoextend on
next 50m maxsize unlimited
extent management local autoallocate;
2��
create view stv
as
select xsb.ѧ��,רҵ,�γ̺�,�ɼ�
from xsb,cjb
where XSB."ѧ��"=CJB."ѧ��" 
----������
1��
select *
from xsb
where ���� like '��_ %'
2��
select *
from xsb
where ����ʱ��<all(
select ����ʱ��
from xsb
where רҵ='�����'
)
3��
select *
from xsb
where "��ע" is not null
--������
1��
CREATE OR REPLACE FUNCTION pcfun 
(
  INSEX IN VARCHAR2 
) RETURN NUMBER AS 
sex1 number;
BEGIN
  if insex='��' then
  select count(�Ա�) into sex1 from xsb
  where �Ա�='��';
  else
  select count(�Ա�) into sex1 from xsb
  where �Ա�='Ů';
  end if
  return sex1;
END pcfun;

DECLARE
  pum number;
BEGIN
  pum:=co_cum('��')��
dbms_output_ptu_line(to_char(pum));
END;
2��
CREATE OR REPLACE procedure pcnum 
(insex in char,sex22 out number)
AS
BEGIN
select count(�Ա�) into sex2
from xsb
where �Ա�='��'��
select count(�Ա�) into sex2
from xsb
where �Ա�='Ů'��
  return ;
END pcnum;

declare 
sext number;
begin
dbms_output.put_line(sext);
end;
3��
create or replace trigger itrig
instead of  insert
on stv
for each row
declare 
xb char(2) :='��';
cssj date :='1997-07-28';
xm cahr(10):='���';
begin
    insert into xsb(ѧ��,����,�Ա�,����ʱ��,רҵ) values(:new.ѧ��,xm,xb,cssj,:new.רҵ);
    insert into cjb(ѧ��,�γ̺�,�ɼ�) values(:new.ѧ��,:new.�γ̺�,:new.�ɼ�);
end;

insert into stv values('151116','�����','��101',85);