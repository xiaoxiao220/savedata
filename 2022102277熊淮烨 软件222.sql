--2024-2025-1Oracle���ݿ� ��ĩ����A��
/*��һ�⵽�ڶ�����ѧϰͨ����
�������⵽������д����ѧ��+����+�༶.sql���ļ���
�ļ�����Ϊ:ѧ��+����+�༶.sql
һ��Ҫд���Լ���������ѧ�ţ��༶��ֻ��Ҫ�ύ���.sql�ļ�����Ҫ�ύѹ������
�ύ��󣬽�ʦ�˼���Ƿ��ύ�ɹ�����ǩ��ȷ��*/
--�������ܻ���  ѧ�ţ�2022102277  �༶�����222
--������
1��create Undo tablespeace undotbs2
datefile 'D:\oracledate\undotbs02.dbf'size 100m
autoextend on
next 50m maxsize unlimited
extent management local autoallocate;
2��create or replace view stv
as
select xsb.ѧ��,רҵ,�γ�,�ɼ� from xsb,cjb,kcb
where xsb.ѧ��=cjb.ѧ�� and kcb.�γ̺�=cjb.�γ̺�;
--������
1 select * from xsb
where ���� like '��_ %';
2��select*from xsb
where ����ʱ��<all(select ����ʱ�� from xsb where רҵ='���������;
3��select *from xsb
where ��ע is not null;
--������
1��create or replace funtion pcfun
(insex in varchar)return number as
countsex number;
begin
  if insex='��'then
  select count('�Ա�') into countsex from xsb
  where �Ա�='��';
  else
  select count (�Ա�) into countsex from xsb
  where �Ա�='Ů';
  end if;
  return countsex;
end pcfun;
declare gnum number('��');
dbms_output.put_line('��ѧ������:'||to char(gnum));
end;
2��CREATE OR REPLACE FUNCTION COUNTNUM 
( INSEX IN VARCHAR2 ) RETURN NUMBER AS 
countsex number;
BEGIN
  if insex='��' then
  select count(�Ա�) into countsex from xsb
  where �Ա�='��';
  else
  select count(�Ա�) into countsex from xsb
  where �Ա�='Ů';
  declare gnum number;
begin
gnum:=countnum('��');
dbms_output.put_line('��ѧ��������'||to_char(gnum));
end;
3��instead of-insert
on xsb_veiw
for each row
declare
ѧ�� char(6):=";
���� char(6):=";
�Ա� char(2):=";
����ʱ�� date:=";
רҵ char(6):=";
�γ̺� char(6):=";
�ɼ� number��=";
begin
