�����⡢1
create undo tablespace undotbs2
datafile 'D:\oracledata\undotbs02.dbf' size 100m
autoextend on
next 100m maxsize unlimited
extent management local autoallocate;

�����⡢2
Create or replace view stv
as
select xsb.ѧ��,רҵ,�γ���,�ɼ� from xsb,cjb,kcb
where xsb.ѧ��=cjb.ѧ�� and kcb.�γ̺�=cjb.�γ̺�;
   

�����⡢1
select * from xsb
where ���� like '��_ %';

�����⡢2
select * from xsb
where ����ʱ��< all( select ����ʱ��  
from xsb
where רҵ= '�����'
);

�����⡢3
select * from xsb
where ��ע is not null;

�����⡢1
CREATE OR REPLACE FUNCTION CREATE OR REPLACE FUNCTION pcfun
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
END pcfun;

�����⡢2
create or replace procedure pcnum
as
begin
if insex='��' then
  select count(�Ա�) into countsex from xsb
  where �Ա�='��';
  else
  select count(�Ա�) into countsex from xsb
  where �Ա�='Ů';
  end if;
  return countsex;
END pcunm;

--���ô洢����
declare  number;
begin
pcnum('��');
end;

�����⡢3
create trigger stv
after insert
on xsb
declare 
a char(30):='create trigger finished!';
begin
dbms_output.put_line(a);
end;
insert into xsb(ѧ��,����,�Ա�,����ʱ��,רҵ,��ѧ��,��ע) 
values ('151116','���','��','1997-07-28','�����',90,);
insert into cjb(ѧ��,�γ̺�,�ɼ�)
values ('151116','101',85);

