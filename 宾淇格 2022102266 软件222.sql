--2024-2025-1Oracle���ݿ� ��ĩ����A��
/*��һ�⵽�ڶ�����ѧϰͨ����
�������⵽������д����ѧ��+����+�༶.sql���ļ���
�ļ�����Ϊ:ѧ��+����+�༶.sql
һ��Ҫд���Լ���������ѧ�ţ��༶��ֻ��Ҫ�ύ���.sql�ļ�����Ҫ�ύѹ������
�ύ��󣬽�ʦ�˼���Ƿ��ύ�ɹ�����ǩ��ȷ��*/
--��������俸�  ѧ�ţ�2022102266  �༶�����222
--������
1��
create undo tablespace undotbs2
datafile 'D:\oracledata\undotbs02.dbf' size 100m
autoextend on
next 50m maxsize unlimited
extent management local autoallocate;

2��
create or replace view stv
as
select ѧ��,רҵ,�γ̺�,�ɼ�
from xsb,cjb,kcb;
--������
1��
select *
from xsb
where ���� like'��_%';
2��
select * 
from xsb
where ����ʱ��<all(select ����ʱ�� from xsb where רҵ='�����');
3��
select * 
from xsb
where ��ע is not null;
--������
1��
create or replace function pcfun
(
  insex in vachar2 
)return number as 
countsex number;
begin
  if insex='��' then
  select count(�Ա�) into countsex from xsb
  where �Ա�='��';
  else
  select count(�Ա�) into countsex from xsb
  where �Ա�='Ů';
  end if;
  return countsex;
end pcfun;
declare 
nansex:=pcfun('��'����
begin
dbms_output.put_line(to_char(nansex));
end;
2��
create or replace 
(
  insex in char, out_num out number
)
as 
begin
 if insex='��' then
  select count(�Ա�) into out_num from xsb
  where �Ա�='��';
  else
  select count(�Ա�) into out_num from xsb
  where �Ա�='Ů';
  end if;
  end;
  declare 
nansex number;
 begin
 pcnum('��','nansex');
dbms_output.put_line(to_char(nansex));
end;
3��
create or replace trigger itrig
 instead of insert
on stv
for each row
declare
xm char(2) :='���';
xb char(2):'��';
cssj date:='1997-07-28';
kcm char:='101';
begin
    insert into xsb(ѧ��,����,�Ա�,����ʱ��,רҵ) values(:new.ѧ��,����,xb,cssj,new.רҵ);
    insert into cjb(ѧ��,�γ̺�,�ɼ�) values(:new.ѧ��,kch,:new.�ɼ�);
end;
insert into stv values('151116','�����','101',85);
