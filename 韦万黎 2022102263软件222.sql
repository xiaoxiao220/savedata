--2024-2025-1Oracle���ݿ� ��ĩ����A��
/*��һ�⵽�ڶ�����ѧϰͨ����
�������⵽������д����ѧ��+����+�༶.sql���ļ���
�ļ�����Ϊ:ѧ��+����+�༶.sql
һ��Ҫд���Լ���������ѧ�ţ��༶��ֻ��Ҫ�ύ���.sql�ļ�����Ҫ�ύѹ������
�ύ��󣬽�ʦ�˼���Ƿ��ύ�ɹ�����ǩ��ȷ��*/
--������Τ����  ѧ�ţ�2022102263  �༶�����222
--������
1��create undo tablespace UNDOTBS2
datafile 'D:\oracledata\undotbs02.dbf' size 100MB
autoextend on
next 100MB maxsize unlimited
extent management local autoallocate;

2��
create or replace view stu
as 
select ѧ��,רҵ,�γ̺�,�ɼ�
from xsb,cjb,kcb;
--������
1��
select * from xsb
where ���� like '��_ %';

2��
select * from xsb
where ����ʱ��< all( select ����ʱ��  from xsb where רҵ= '�����');
3��
select * from xsb
where ��ע is not null;


--������
1��
create or replace FUNCTION pcfun 
(
  insex in varchar2
)  as
count
begin
  if insex='��' then
  select count(�Ա�) into countsex from xsb
  where �Ա�='��';
   else
  select count(�Ա�) into countsex from xsb
  where �Ա�='Ů';
  end if;
  end;
  declare
  nsex number
  begin
  pfun ('��','nsex');
  dbms_output.put_line(to_char(nsex));
  end;
 
2��
create or replace procedure pcnum
(
 insex in varchar2 out_num out number
) return number as
out_num number;
begin
  if insex='��' then
  select count(�Ա�) into out_num from xsb
  where �Ա�='��';
   else
  select count(�Ա�) into out_num from xsb
  where �Ա�='Ů';
  end if;
    declare
  nsex number
  begin
  pcnum ('��','nsex');
  dbms_output.put_line(to_char(nsex));
  end;



3��
create or replace view xsb_view
as
select xsb.ѧ��,����,�γ���,�ɼ� from xsb,cjb,kcb
where xsb.ѧ��=cjb.ѧ�� and kcb.�γ̺�=cjb.�γ̺�;
create or replace trigger itrig
instead of  insert
on xsb_view
for each row
declare 
xh char(6):='151116'
xm char (2):='���'
xb char(2) :='��';
cssj date :='1997-07-28';
kch char(3) :='101';
cj number :=85;
begin
    insert into xsb(ѧ��,����,�Ա�,����ʱ��) values(:new.ѧ��,:new.����,xb,cssj);
    insert into kcb(�γ̺�,ѧ��,�γ���) values(kch,xf,:new.�γ���);
    insert into cjb(ѧ��,�γ̺�,�ɼ�) values(:new.ѧ��,kch,:new.�ɼ�);
end;
insert into xsb values('151116','���','��','1997-07-28','�����');
insert into cjb values('151116','101','85');