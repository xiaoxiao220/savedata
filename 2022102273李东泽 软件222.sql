--2024-2025-1Oracle���ݿ� ��ĩ����A��
/*��һ�⵽�ڶ�����ѧϰͨ����
�������⵽������д����ѧ��+����+�༶.sql���ļ���
�ļ�����Ϊ:ѧ��+����+�༶.sql
һ��Ҫд���Լ���������ѧ�ţ��༶��ֻ��Ҫ�ύ���.sql�ļ�����Ҫ�ύѹ������
�ύ��󣬽�ʦ�˼���Ƿ��ύ�ɹ�����ǩ��ȷ��*/
--���������  ѧ�ţ�2022102273  �༶�����222
--������
1��
create undo tablespace UNDOTBS2
datafile'D:\oracledata\undotbs02.dbf' size 100m
autoextend on next 50m maxsize unlimited
extent management local autoallocate;
2��
create or replace view stv
as
select xsb.ѧ��,רҵ,cjb.�γ̺�,�ɼ�
from xsb ,cjb,kcb
where xsb.ѧ��=cjb.ѧ�� and cjb.�γ̺�=kcb.�γ̺�;
--������
1��
select * from xsb
where ���� like '��_ %';
2��
select * from xsb
where ����ʱ�� < all(select ����ʱ�� from xsb
where רҵ='�����');
3��
select * from xsb
where ��ע is not null;
--������
1��
create or replace function pcfun(xb in char)
return number;
as
outnum number;
begin
if xb='��' then
select count(�Ա�) into outnum
from xsb
where �Ա�='��';
else xb='Ů' then
select count(�Ա�) into outnum
from xsb
where �Ա�='Ů';
else if;
return outnum;
end;


declare mannum number;
begin
    mannum :=pcfun('��');
    dbms_output.put_line('��ͬѧ����'||to_char(pcfun));
end;

2��

create or replace procedure pcnum (xb in char)
as
outnum number;
begin
if xb='��' then
select count(�Ա�) into outnum
from xsb 
where �Ա�='��';
else xb='Ů' then
select count(�Ա�) into outnum
from xsb 
where �Ա�='Ů';
else if;
DBMS_OUTPUT.PUT_LINE(outnum);
end;
 
 
 declare mannum2 number;
begin
pcnum('��',mannum2);
end;

3��

create or replace trigger itrig
instead of insert on stv
for each row
declare 
xh char(6):='151116';
xm char(10):='���';
xb char(2):='��';
cssj data:='1997-07-28';
zy char(12):='�����';
kch char(6):='101';
cj number:=85;
begin
insert into xsb (ѧ��,����,�Ա�,����ʱ��,רҵ) values(xh,xm,xb,cssj,zy);
insert into cjb(ѧ�ţ��γ̺�,�ɼ�)
values(xh, kch ,cj)
end;



alter session set nls_date_format='YYYY-MM_DD';
insert into xsb values('151116','���','��','1997-07-28','�����');


insert into cjb values('151116','101',85);

