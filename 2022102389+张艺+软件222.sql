
--����������  ѧ�ţ�2022102389  �༶�����222
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
select xsb.ѧ��,רҵ,cjb.�γ̺�,�ɼ�
from xsb,cjb, kcb
where xsb.ѧ��=cjb.ѧ�� and kcb.�γ̺�=cjb.�γ̺�;

--������
1��
select * from xsb
where ���� like '��_%';
2��
select * from xsb
where ����ʱ��< all
( select ����ʱ��  from xsb where רҵ= '�����');
3��
select * from xsb
where ��ע is not null;
--������

1��
create or replace function pcfun(in_sex in char)
return number
as 
out_num NUMBER;
begin 
if in_sex='��' then
select count(�Ա�) into out_num
from xsb 
where ����='��';
else
select count(�Ա�) into out_num
from xsb 
where ����='Ů';
end if;
return (out_num);
end pcfun;

declare 
boy_num number;
BEGIN 
boy_num:=pcfun('��');
dbms_output.put_line(to_char(boy_num));
end;

2��
create or replace procedure pcfun(sex in char,num out number)
as 
begin 
if sex='��' then
select count(�Ա�) into num
from xsb 
where ����='��';
else
select count(�Ա�) into num
from xsb 
where ����='Ů';
end if;
end pcfun;

declare 
boy_num number;
BEGIN 
pcfun('��','boy_num')
dbms_output.put_line(boy_num);
end;

3��
create or replace trigger itrig
instead of insert
on stv
for each row
begin
    insert into xsb(ѧ��,����,�Ա�,����ʱ��) values('151116','���','��','1997-07-28');
    insert into cjb(ѧ��,�γ̺�,�ɼ�) values('151116','101',85);
end;
