--2024-2025-1Oracle���ݿ� ��ĩ����A��
/*��һ�⵽�ڶ�����ѧϰͨ����
�������⵽������д����ѧ��+����+�༶.sql���ļ���
�ļ�����Ϊ:ѧ��+����+�༶.sql
һ��Ҫд���Լ���������ѧ�ţ��༶��ֻ��Ҫ�ύ���.sql�ļ�����Ҫ�ύѹ������
�ύ��󣬽�ʦ�˼���Ƿ��ύ�ɹ�����ǩ��ȷ��*/
--������������  ѧ�ţ�2022102259  �༶�����222
--������
1��
create undo tablespace UNDOTBS2
datafile 'D:\oracledata\undotbs02.dbf' size 100m
autoextend on
next 50m maxsize unlimited
extent management local autoallocate;

2��
create view stv
as
select ѧ��,רҵ,�γ̺�,�ɼ�
from xsb;

--������
1��
select * from xsb
where ���� like '��_ %';
2��
select * from xsb
where ����ʱ��<all(
select ����ʱ�� from xsb 
where רҵ='�����';
);
3��
select * from xsb
where ��ע is not null;
--������
1��
create or replace function pcfun 
(
  insex in VARCHAR2 
) return number as
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
end;

declare countsex number;
begin
countsex := pcfun('��');
dbms_output.put_line(countsex);
end;
2��
create procedure pcnum
(insex in VARCHAR2,countsex out number)
as
begin
if insex='��' then
  select count(�Ա�) into countsex from xsb
  where �Ա�='��';
  else
  select count(�Ա�) into countsex from xsb
  where �Ա�='Ů';
  end if;
  dbms_output.put_line(countsex);
end;

declare cn number;
begin
pcnum('��',cn);
end;
3��
create or replace trigger itrig
instead of on stv
for each row 
begin

end;

insert into xsb(ѧ��,����,�Ա�,����ʱ�䣬רҵ) values(��151116��,�� �� �� ��,�� �� ��,��1997-07-28��,�� ����� ��);

insert into cjb (ѧ��,�γ̺�,�ɼ�) values(��151116��,��101��,85;











