--2024-2025-1Oracle���ݿ� ��ĩ����A��
/*��һ�⵽�ڶ�����ѧϰͨ����
�������⵽������д����ѧ��+����+�༶.sql���ļ���
�ļ�����Ϊ:ѧ��+����+�༶.sql
һ��Ҫд���Լ���������ѧ�ţ��༶��ֻ��Ҫ�ύ���.sql�ļ�����Ҫ�ύѹ������
�ύ��󣬽�ʦ�˼���Ƿ��ύ�ɹ�����ǩ��ȷ��*/
--����������Խ  ѧ�ţ�2022102278  �༶�����222
--������
1��
create undo tablespace undotbs2
datafile 'd:\oracledata\undotbs02.dbf' 
size 100m
autoextend on
next 100m maxsize unlimited
extent management local autoallocate;

2��

CREATE OR REPLACE VIEW stv
AS
SELECT a.ѧ��,a.רҵ,b.�γ̺�,c.�ɼ�
FROM a.sxb,b.kcb,c.cjb
where a.ѧ��=c.ѧ�� and b.�γ̺�=c.�γ̺� 
WITH CHECK OPTION;
--������
1��
select * from xsb
where ���� like '��_ %';
2��
select * from xsb
where ����ʱ��<all( select ����ʱ�� from xsb where רҵ= '�����');
3��
select * from xsb where ��ע is not null;
--������
1��
create or replace function pcfun
(xbna in char)
return number is ren number;--�е�����
begin
select count(*) into ren from xsb
where �Ա�=xbna;
return ren;--����������ͳ�Ƶ�ren���沢���
end
select ren('��')as "����" from xsb;

2��
create or replace procedure pcfun
(xbna in char,xbnv in char,ren out number,ren2 out number)
as
begin
select count(*) into ren from xsb
where �Ա�=xbna;
dbms_output.put_line(ren);--����������ͳ�Ƶ�ren���沢���
select count(*) into ren2 from xsb
where �Ա�=xbnv;--��Ů������ͳ��
end;
declare ren123 number;
begin
pcfun('��','Ů',ren123);
end;
3��
create or replace trigger itrig
after insert
on stv
declare infor char(30);
begin
    if inserting then
        insert into xsb ("ѧ��","����","�Ա�","��������","רҵ") values (��151116��,����ס�,���С�,��1997-07-28��,���������);
        insert into cjb () values (��151116��,��101��,85);
end;
