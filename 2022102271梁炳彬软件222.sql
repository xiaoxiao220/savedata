��
1.
create undo tablespace undotbs2
datafile 'D:\oracledata\undotbs02.dbf' size 100m
autoextend on
next 50m maxsize unlimited
extent management local autoallocate;

2.
create view stv
as
select ѧ��,רҵ,�γ̺�,�ɼ�
where XSB.ѧ��=CJB.ѧ��
and CJB.�γ̺�=KCB.�γ̺�;


��
1.
select *
from xsb
where ���� like'��%_ ';
2.
select * from xsb
where ����ʱ��<all(
select ����ʱ�� from xsb
where רҵ='�����');
3.
select *
from xsb
where ��ע is not null;



��
1.
create function pcfun(in_sex in char)
return number
as
out_num number;
begin
if in_sex=���С�then
select count(�Ա�)into out_num
from xsb
where �Ա�=���С�;
else
select count (�Ա�)into out_num
from xsb
where �Ա�=��Ů��;
end if;
return (out_num);
end pcfun;

declare gnum number;
begin
gnum:=pcfun('��');
dbms_output.put_line('��ͬѧ������'(gnum));
end;

2.
create procedure pcnum
(sex in char,num out number)
as
begin
if sex=���С�then
select count(�Ա�)into num
from xsb
where �Ա�=���С�;
else
select count(�Ա�)into num
from xsb
where �Ա�=��Ů��;
end if;
end;

exec pcnum;

3.
create trigger itrig
instead of insert on xsb
for each row
declare
xm char(8);
xb char(2);
cssj date;
begin
xm:='���';
xb:='��';
cssj:=��1997-07-28��;
insert into xsb(ѧ��,����,�Ա�,����ʱ��,רҵ)
values(:new.ѧ��,xm,xb,cssj,:new.רҵ)��
insert into cjb values(:new.ѧ��,:new.�γ̺�,:new.�ɼ�);
end;

insert into xsb
values('151116','���','��','1997-07-28','�����')��

insert into cjb(ѧ��,�γ̺�,�ɼ�)
values('151116','101',85);

