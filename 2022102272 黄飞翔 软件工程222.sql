--2024-2025-1Oracle���ݿ� ��ĩ����A��
/*��һ�⵽�ڶ�����ѧϰͨ����
�������⵽������д����ѧ��+����+�༶.sql���ļ���
�ļ�����Ϊ:ѧ��+����+�༶.sql
һ��Ҫд���Լ���������ѧ�ţ��༶��ֻ��Ҫ�ύ���.sql�ļ�����Ҫ�ύѹ������
�ύ��󣬽�ʦ�˼���Ƿ��ύ�ɹ�����ǩ��ȷ��*/
--�������Ʒ��衤  ѧ�ţ�2022102272  �༶���������222
--������
1��create undo tablespace undotbs2
datafile 'D:\oracledata\undotbs02.dbf' size 100m
autoextend on
next 50m maxsize unlimited
extent management local autoallocate;
2��create or replace stv
as
select xsb.ѧ��,רҵ,xsb.�γ̺�,�ɼ�
from xsb,cjb,kcb
where xsb.ѧ��=cjb.ѧ�� and kcb.�γ̺�=cjb.�γ̺�;
--������
1��select *
from xsb
where ���� like'��_ %';
2��
select * from xsb
where ����ʱ��< all( select ����ʱ��  from xsb
                    where רҵ= '�����'
        );
3��select * from xsb
where ��ע is not null;
--������
1��create or replace function pcfun(in_sex in char)
return number
as
out_num number;
begin
if in_sex='��' then
select count(�Ա�)  into out_num
from xsb
where �Ա�='��';
else
select  count(�Ա�)  into out_num
from xsb
where �Ա�='Ů';
end if;
return(out_num);
end pcfun;

declare
nan_num number;
begin
nan_num:=pcfun('��');
Dbms_output.put_line('��ѧ��������'||to_char(nan_num));
end;
2��
create or replace procedure pcnum
(in_sex in char,out_num out number)
as
begin
if in_sex='��' then
select count(�Ա�)  into out_num
from xsb
where �Ա�='��';
else
select  count(�Ա�)  into out_num
from xsb
where �Ա�='Ů';
end if;
end;

declare
nan_num number;
begin
pcnum('��',nan_num);
Dbms_output.put_line('��ѧ��������'||to_char(nan_num));
end;
3��create or replace trigger itrig
instead of  insert
on stv
for each row
declare 
xb char(2) :='��';
xi char(10) :='���'
cssj date :='1997-07-28';
begin
    insert into xsb(ѧ��,����,�Ա�,����ʱ��,רҵ) values(:new.ѧ��,xi,xb,cssj,:new.רҵ);
    insert into cjb(ѧ��,�γ̺�,�ɼ�) values(:new.ѧ��,:new.�γ̺�,:new.�ɼ�);
end;
insert into stv values('151116','�����','101',85);