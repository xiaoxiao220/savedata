--��.
--1.
create undo tablespace undotbs2
datafile 'D:\oracledata\undotbs02.dbf' size 100m
autoextend on next 50m maxsize unlimited
extent management local autoallocate;
--2.
create view stv
as 
select xsb.ѧ��,רҵ,�γ̺�,�ɼ�
from xsb,cjb
where xsb.ѧ��=cjb.ѧ��;
--��.
--1.
select * from xsb
where ���� like '��_ %';
--2.
select * from xsb 
where ����ʱ��<all(select ����ʱ�� from xsb where רҵ='�����');
--3.
select * from xsb
where ��ע is not null;
--��.
--1.
create or replace function pcfun
(insex in char)
return number
as
xbnum number;
begin
if insex='��' then
select count(�Ա�) into xbnum from xsb
where �Ա�='��';
else
select count(�Ա�) into xbnum from xsb
where �Ա�='Ů';
end if;
return xbnum;
end;
declare
num number;
begin
num:=pcfun('��');
dbms_output.put_line(num);
end;
--2.
create or replace procedure pcnum
(insex in char,pnum out number)
as
begin
if insex='��' then
select count(�Ա�) into pnum from xsb
where �Ա�='��';
else
select count(�Ա�) into pnum from xsb
where �Ա�='Ů';
end if;
end;
declare
num number;
begin
pcnum('��',num);
dbms_output.put_line(num);
end;
--3.
alter session set nls_date_format='yyyy-mm-dd';
create or replace trigger itrig
instead of insert on stv for each row
declare
xh char(6):='151116';
xm char(10):='���';
xb char(2):='��';
cssj date:='1997-07-28';
zy char(10):='�����';
kch char(3):='101';
cj number:=85;
begin
insert into xsb(ѧ��,����,�Ա�,����ʱ��,רҵ) 
values(xh,xm,xb,cssj,zy);
insert into cjb(ѧ��,�γ̺�,�ɼ�) 
values(xh,kch,cj);
end;
insert into stv values('151116','�����','101',85);























