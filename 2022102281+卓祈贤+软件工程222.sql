--2024-2025-1Oracle���ݿ� ��ĩ����A��
/*��һ�⵽�ڶ�����ѧϰͨ����
�������⵽������д����ѧ��+����+�༶.sql���ļ���
�ļ�����Ϊ:ѧ��+����+�༶.sql
һ��Ҫд���Լ���������ѧ�ţ��༶��ֻ��Ҫ�ύ���.sql�ļ�����Ҫ�ύѹ������
�ύ��󣬽�ʦ�˼���Ƿ��ύ�ɹ�����ǩ��ȷ��*/
--������׿����  ѧ�ţ�2022102281  �༶���������222
--������
1��
create undo tablespace UNDOTBS2
datafile 'D:\oracledata\undotbs02' size 100m
autoextend on next 50m maxsize unlimited extent management local autoallocate ;
2��
create or replace view stv
as select XSB.ѧ��,רҵ,�γ̺�,�ɼ� from xsb,CJB where CJB.ѧ�� = XSB.ѧ��;
--������
1��
select *
from XSB where ���� like '��_ %';
2��
select * from XSB where ����ʱ�� < all (select ����ʱ�� from XSB where רҵ = '�����');
3��
select * from XSB where ��ע is not null ;
--������
1��
create or replace function pcfun(in_sex in char)
return number is
    out_num number;
begin
    if in_sex='��' then select count(�Ա�) into out_num from XSB where �Ա� = '��';
    else select count(�Ա�) into out_num from XSB where �Ա� = 'Ů';
    end if;
    return out_num;
end pcfun;
declare
    get_num number;
begin
    get_num:=pcfun('��');
    DBMS_OUTPUT.PUT_LINE('����Ϊ'||to_char(get_num));
end;
2��
create or replace procedure pcnum(in_sex in char,out_num out number)
as
begin
    if in_sex='��' then select count(�Ա�) into out_num from XSB where �Ա� = '��';
    else select count(�Ա�) into out_num from XSB where �Ա� = 'Ů';
    end if;
end;
declare
    get_num number;
begin
    pcnum('��',get_num);
    DBMS_OUTPUT.PUT_LINE('����Ϊ'||to_char(get_num));
end;
3��
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
    insert into XSB(ѧ��,����,�Ա�,����ʱ��,רҵ) values (:new.ѧ��,xm,xb,cssj,:new.רҵ);
    insert into CJB(ѧ��,�γ̺�,�ɼ�) values (:new.ѧ��,:new.�γ̺�,:new.�ɼ�);
end;
alter session set nls_date_format = 'yyyy-mm-dd';
insert into stv values ('151116','�����','101',85);