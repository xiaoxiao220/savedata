--2024-2025-1Oracle���ݿ� ��ĩ����A��
/*��һ�⵽�ڶ�����ѧϰͨ����
�������⵽������д����ѧ��+����+�༶.sql���ļ���
�ļ�����Ϊ:ѧ��+����+�༶.sql
һ��Ҫд���Լ���������ѧ�ţ��༶��ֻ��Ҫ�ύ���.sql�ļ�����Ҫ�ύѹ������
�ύ��󣬽�ʦ�˼���Ƿ��ύ�ɹ�����ǩ��ȷ��*/
--������������  ѧ�ţ�2022102286  �༶�����222(405)
--������
1��create uodo tablespace UNDOTBS2
   datafile 'D:\oracledata\undotbs02.dbf' size 100m
   autoextend on next 50m maxsize unlimited
   extent management local autoallocate;
2��create or replace view stv
   as
   select xsb.ѧ��,רҵ,cjb.�γ̺�,�ɼ�
   from xsb,cjb
   where xsb.ѧ��=cjb.ѧ��;
--������
1��select * from xsb
  where ���� like '��_%';
2��select * from xsb
  where ����ʱ��<all(
    select ����ʱ�� from xsb
    where רҵ='�����');
3��select * from xsb
   where ��ע is not null;
--������
1��
--��������
create or replace function pcfun(sexnum in char)
  return number
as
  outnum number;
begin
  if sexnum='��' then
  select count(�Ա�) into outnum
  from xsb
  where �Ա�='��';
  else
  select count(�Ա�) into outnum
  from xsb
  where �Ա�='Ů';
  end if;
  return(outnum);
end pcfun;
--���ú���
declare 
  boynum number;
begin
  boynum:=pcfun('��');
  dbms_output.put_line(to_char(boynum));
end;
2��
--�����洢����
create or replace procedure pcnum(sexnum in char,outnum out char)
as
begin
  if sexnum='��' then
  select count(�Ա�) into outnum
  from xsb
  where �Ա�='��';
  else
  select count(�Ա�) into outnum
  from xsb
  where �Ա�='Ů';
  end if;
end;
--���ô洢����
declare
  boynum number;
begin
  pcnum('��',boynum);
  dbms_output.put_line(boynum);
end;
3��
--����������
create or replace trigger itrig
instead of insert on stv
   for each row
declare
   xm char(8);
   xb char(2);
   cssj date;
begin
  xm:='���';
  xb:='��';
  cssj:='1997-07-28';
  insert into xsb(ѧ��,����,�Ա�,����ʱ��,רҵ)
           values(:new.ѧ��,xm,xb,cssj,:new.רҵ);
  insert into cjb values(:new.ѧ��,:new.�γ̺�,:new.�ɼ�);
end;

--��������
alter session set nls_date_format='YYYY-MM-DD';
insert into xsb(ѧ��,����,�Ա�,����ʱ��,רҵ)
       values('151116','���','��','1997-07-28','�����');
insert into cjb values('151116','101',85);