--2024-2025-1Oracle���ݿ� ��ĩ����A��
/*��һ�⵽�ڶ�����ѧϰͨ����
�������⵽������д����ѧ��+����+�༶.sql���ļ���
�ļ�����Ϊ:ѧ��+����+�༶.sql
һ��Ҫд���Լ���������ѧ�ţ��༶��ֻ��Ҫ�ύ���.sql�ļ�����Ҫ�ύѹ������
�ύ��󣬽�ʦ�˼���Ƿ��ύ�ɹ�����ǩ��ȷ��*/
--������Τ����  ѧ�ţ�2022102388  �༶�����222
--������
1��
Create undo tablespace undotbs2
Datafile'D:\oracledata\undotbs02.dbf' size 100M
autoextend on next 50M maxsize unlimited
extent management local autoallocate;

2��
create view stv
as
select xsb.ѧ��,רҵ,�γ���,�ɼ�
from xsb,cjb
where xsb.ѧ��=cjb.ѧ��;

--������
1��
select *
from xsb
where ���� like '��_';

2��
select *
from xsb
where ����ʱ��<all��
select *
from xsb
where רҵ='�����';
);

3��
select *
from xsb
where ��ע is not null;

--������
1��
create or replace function pcfun(in_sex in char) 
   return number
as
   out_num number;
begin
   if in_sex='��' then
       select count(�Ա�) into out_num
       from xsb
       where �Ա�='��';
else
select count(�Ա�) into out_num
from xsb
where �Ա�='Ů';
end if;
return(out_num);
end count_num;

declare
  boy_num number;
begin
  count_number('��',boy_num);
  dbms_output.put_line(boy_num);
end;

2��
create or replace procedure pcnum   
(sex in char,num out number)
as
begin
if sex='��' then
select count(�Ա�) into num
from xsb
where �Ա�='��';
else
select count(�Ա�) into num
from xsb
where �Ա�='Ů';
end if;
end;

declare
  boy_num number;
begin
  count_number('��',boy_num);
  dbms_output.put_line(boy_num);
end;

3��
create trigger insteadtrig
   Instead of insert on stu for each row
declare
xm char(8);
xb char(2);
cssj data;
begin
xm:='���';
xb:='��';
cssj:='1997-07-28';
insert into xsb(ѧ��,����,�Ա�,����ʱ��,רҵ)
   values(:new.ѧ��,xm,xb,cssj,:new.רҵ);
insert into cjb values(:new.ѧ��,:new.�γ̺�,:new.�ɼ�);
end;

Insert into stv values('151116','101',85)��