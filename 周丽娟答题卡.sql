--2024-2025-1Oracle���ݿ� ��ĩ����A��
/*��һ�⵽�ڶ�����ѧϰͨ����
�������⵽������д����ѧ��+����+�༶.sql���ļ���
�ļ�����Ϊ:ѧ��+����+�༶.sql
һ��Ҫд���Լ���������ѧ�ţ��༶��ֻ��Ҫ�ύ���.sql�ļ�����Ҫ�ύѹ������
�ύ��󣬽�ʦ�˼���Ƿ��ύ�ɹ�����ǩ��ȷ��*/
--������������  ѧ�ţ�2022102238  �༶���������222
--������
1��create tablespace UNDOTBS2
datafile 'D:\oracledata\undotbs02.dbf' size 100m
autoextend on next 50m maxsize unlimited
extent management local
autoallocate;

2��create or replace view stv
as
select xsb.ѧ��,����,�γ���,�ɼ� from xsb,cjb,kcb
where xsb.ѧ��=cjb.ѧ�� and kcb.�γ̺�=cjb.�γ̺�;
--������
1��select * from xsb where ���� like '��_ %';

2��select * from xsb where ����ʱ��<all(select ����ʱ�� from xsb where רҵ='�����');
3��select * from xsb where ��ע is not null;
--������
1��
create function pcfun
(xb in char,pcfun out number) RETURN NUMBER
as BEGIN
return pcfun;
end;
declare
pcfun number;

dbms_out.put.put_line();
end;


2��create or replace procedure pcnum
(xb in char,countxb out number)
begin
select �Ա� into xb from xsb
where �Ա�='��';
dbms_output.put_line(count(xb));
end;
declare xb xsb.�Ա�%type;
begin
pcnum(xb);
dbms_output.put_line(nanxb);
end;

3��alter session set nls_date_format='YYYY-MM-DD';

create or replace trigger itrig
instead of insert on stv
for each row
declare 
xb char(2):='��';
cssj date:='1997-07-28';
kch char(3):='101';
zy char(30):='�����';
cj char(2):='85';
begin
    insert into xsb(ѧ��,����,�Ա�,����ʱ��,רҵ) values(:new.ѧ��,:new.����,xb,cssj,zy);
    insert into cjb(ѧ��,�γ̺�,�ɼ�) values(:new.ѧ��,kch,:new.�ɼ�);
end;
insert into stv values('151116','���','��','1997-07-28','�����','101','85');