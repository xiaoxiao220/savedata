--2024-2025-1Oracle���ݿ� ��ĩ����A��
/*��һ�⵽�ڶ�����ѧϰͨ����
�������⵽������д����ѧ��+����+�༶.sql���ļ���
�ļ�����Ϊ:ѧ��+����+�༶.sql
һ��Ҫд���Լ���������ѧ�ţ��༶��ֻ��Ҫ�ύ���.sql�ļ�����Ҫ�ύѹ������
�ύ��󣬽�ʦ�˼���Ƿ��ύ�ɹ�����ǩ��ȷ��*/
--��������ɺɺ  ѧ�ţ�2022102247  �༶�����222
--������
1��
create undo tablespace UNDOTBS2
datafile 'D:\oracledata\undotbs02.dbf' size 100m
autoextend on next 50m maxsize unlimited
extent management local autoallocate;
2��
create view stv
as
select xsb.ѧ��,רҵ,�γ̺�,�ɼ�
from xsb,cjb
where xsb.ѧ��=cjb.ѧ��
--������
1��
select * 
from xsb
where ���� like '��_%'
2��
select * from xsb
where ����ʱ�� <all
(select ����ʱ��
from xsb
where רҵ='�����')
3��
select *
from xsb
where ��ע is not null
--������
1��
create or REPLACE function pcfun(in_sex in char)
return number
as
out_num NUMBER;
begin
if in_sex='��' then
select count(*) into out_num from xsb where �Ա�='��';
else
select count(*) into out_num from xsb where �Ա�='Ů';
end if;
return(out_num);
end pcfun;

declare
boynum NUMBER;
begin
boynum:=pcfun('��');
dbms_output.put_line(to_char(boynum));
end;
2��
create or REPLACE procedure pcnum
(in_sex in char,
out_num out number)
as
begin
if in_sex='��' then
select count(*) into out_num from xsb where �Ա�='��';
else
select count(*) into out_num from xsb where �Ա�='Ů';
end if;
end;

declare
boynum NUMBER;
begin
pcnum('��', boynum);
dbms_output.put_line(to_char(boynum));
end;
3��
create or REPLACE trigger itrig
instead of insert
on stv
declare
xm char(6):='���';
xb char(4):='��';
cssj date:='1997-07-28';
kch CHAR(3):='101';
begin
insert into xsb(ѧ��,����,�Ա�,����ʱ��,רҵ) values(:new.ѧ��,xm,xb,cssj,:new.רҵ);
insert into cjb(ѧ��,�γ̺�,�ɼ�) values(:new.ѧ��,kch,:new.�ɼ�);
end;

insert into stv values('151116','�����','101',85);