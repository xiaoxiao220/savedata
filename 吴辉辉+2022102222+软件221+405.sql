--2024-2025-1Oracle���ݿ� ��ĩ����A��
/*��һ�⵽�ڶ�����ѧϰͨ����
�������⵽������д����ѧ��+����+�༶.sql���ļ���
�ļ�����Ϊ:ѧ��+����+�༶.sql
һ��Ҫд���Լ���������ѧ�ţ��༶��ֻ��Ҫ�ύ���.sql�ļ�����Ҫ�ύѹ������
�ύ��󣬽�ʦ�˼���Ƿ��ύ�ɹ�����ǩ��ȷ��*/
--��������Ի�  ѧ�ţ�2022102222  �༶�����221
--������
1 create undo tablespace undotbs2
datafile 'D:\oracledata\undotbs02.dbf' size 100m
autoextend on next 50m maxsize unlimited
extend management local autoallocate;
2 create view stv
as
select xsb.ѧ��,רҵ,�γ̺�,�ɼ�
from xsb,kcb,cjb
where xsb.ѧ��=cjb.ѧ�� and kcb.�γ̺�=cjb.�γ̺�;
--������
1 select * from xsb where ���� like '��_%';
2 select * from xsb where ����ʱ�� < all (select * from xsb where רҵ = '�����' );
3��select * from xsb where ��ע in is not null;
--������
1��create function pcfun(in_sex in char)
  return number
  as
  out_num number;
  begin
  if sex='��' then
  select COUNT(�Ա�) into pcfun 
  from xsb
  where �Ա�='��';
  else
  select COUNT(�Ա�) into pcfun
  from xsb
  where �Ա�='Ů';
  end if;
  return (out_num);
  end;
  
  decare
  boy_num number;
  begin 
  boy_num := pcfun('��');
  dbms_output.put_line(to_char(boy_num));
  end;
2��create procedure pcnum(sex in char , num out number)
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
boy_num := pcnum('��',boy_num);
dbms_output.put_line(boy_num);
end;

3��create trigger itrig
instead of insert 
on stu
 for each row
declare
xm char(8):='���'
xb char(2):='��'
cssj date:='1997-07-28';
begin
insert into xsb(ѧ��,����,�Ա�,����ʱ��,רҵ)
vaules(:newѧ��,xm,xb,cssj,:newרҵ);
insert into cjb values(:newѧ��,:new�γ̺�,:new�ɼ�);
end;

insert into stu values('15116','�����','101',85);
 
