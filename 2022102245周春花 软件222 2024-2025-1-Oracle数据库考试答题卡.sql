--2024-2025-1Oracle���ݿ� ��ĩ����A��
/*��һ�⵽�ڶ�����ѧϰͨ����
�������⵽������д����ѧ��+����+�༶.sql���ļ���
�ļ�����Ϊ:ѧ��+����+�༶.sql
һ��Ҫд���Լ���������ѧ�ţ��༶��ֻ��Ҫ�ύ���.sql�ļ�����Ҫ�ύѹ������
�ύ��󣬽�ʦ�˼���Ƿ��ύ�ɹ�����ǩ��ȷ��*/
--�������ܴ���  ѧ�ţ�2022102245  �༶�����222
--������
--1��
create undo tablespace undotbs2
datafile 'D:\oracledata\undotbs02.dbf' size 100m
autoextend on
next 100m maxsize unlimited
extent management local autoallocate;
--2��
create or replace stv
as
select ѧ��,רҵ,�γ̺�,�ɼ�
from xsb,cjb
where xsb.ѧ��=cjb.ѧ��;

--������
--1��
select * 
from xsb
where ���� like '��_';
--2��
select * 
from xsb
where ����ʱ��<all(
select ����ʱ��
from xsb
where רҵ='�����');
--3��
select * 
from xsb
where ��ע is not null;
--������
--1��
create or replace function pcfun��
in_sex in xsb.�Ա�% TYPE,
��
return number;
as
countsex number;
begin
if insex='��' then
select count(�Ա�) into countsex
from xsb
where �Ա�='��';
else 
select count(�Ա�) into countsex
from xsb
where �Ա�='Ů';
end if;
RETURN countsex;
end;
declare countrs number;
begin
countrs:=pcfun('��');
dbms_output.put_line('��ͬѧ������'||to_char(countrs));
end;

--2��
create or replace PROCEDURE pcnum(
in_sex in xsb.�Ա�%type,
countsex out number
)
as
begin
if insex='��' then
select count(�Ա�) into countsex
from xsb
where �Ա�='��';
else 
select count(�Ա�) into countsex
from xsb
where �Ա�='Ů';
end if;
end;

declare countrs number;
begin
pcnum:=('��',countrs);
dbms_output.put_line(pcnum);
end;
--3��
create or replace trigger itrig
    instead of insert on stv for each row
declare
    xm char(8);
    xb char(2);
    cssj date;
begin
        xm:='���';
        xb:='��';
        cssj:='1997-07-28';
    insert into XSB(ѧ��,����,�Ա�,����ʱ��,רҵ) values(:new.ѧ��,xm,xb,cssj,:new.רҵ);
    insert into cjb(ѧ��,�γ̺�,�ɼ�) VALUES(:new.ѧ��,:new.�γ̺�,:new.�ɼ�);
end;
insert into stv values('151116','�����','101',85);
COMMIT;