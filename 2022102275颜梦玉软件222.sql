--2024-2025-1Oracle���ݿ� ��ĩ����A��
/*��һ�⵽�ڶ�����ѧϰͨ����
�������⵽������д����ѧ��+����+�༶.sql���ļ���
�ļ�����Ϊ:ѧ��+����+�༶.sql
һ��Ҫд���Լ���������ѧ�ţ��༶��ֻ��Ҫ�ύ���.sql�ļ�����Ҫ�ύѹ������
�ύ��󣬽�ʦ�˼���Ƿ��ύ�ɹ�����ǩ��ȷ��*/
--������������  ѧ�ţ�2022102275  �༶�����222
--������
1��create undo tablespase undotbs2
datafile'D:\oracledata\undotbs02.dbf' size 100m
autoextend on
next 100m maxsise unlimited 
extend management local autoallocate;
2��create view stu-view
as
select xsb.ѧ�ţ�רҵ���γ̺ţ��ɼ�
from sxb,cjb
where xsb.ѧ��=cjb.ѧ��

--������
1��select * 
from xsb
where ���� like'��_%';
2��select* from xsb
where ����ʱ�� < all(
select ����ʱ��
from xsb
where רҵ='�����');
3��select * from xsb
where ��ע is not null;

--������
1�� create or repuace function coumt_num(in_sex in char
return number;
as
out-num number;
begin
if in-sex='��'then
select COUNT(�Ա�)into out_num
from xsb
where �Ա�='Ů';
end if;
return(out_num);
end count_num;               
2��create or repuace function coumt_num(in_sex in char
return number;
as
out-num number;
begin
if in-sex='��'then
select COUNT(�Ա�)into out_num
from xsb
where �Ա�='Ů';
end if;
return(out_num);
end count_num;
3��create view stu-view
as
select xsb.ѧ�ţ�רҵ���γ̺ţ��ɼ�
from sxb,cjb
where xsb.ѧ��=cjb.ѧ��
create trigger znsteadting
instead of znsert on stu-view for each row
declare
xm char(8);
xb char(2);
cssj data;
begin
xm:='���';
xb:='��';
cssj:='1997-07-28';
insert into xsb(ѧ�ţ��������Ա𣬳���ʱ�䣬רҵ)
values(:new.ѧ��,xm,xb,cssj,:new.רҵ)
insert into cjb values(:new.ѧ�ţ�:new.�γ̺�,:new.�ɼ�)
end
insert into stu_view values('151116','�����','101',85);

