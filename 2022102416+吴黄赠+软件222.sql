--�����������  ѧ�ţ�2022102416  �༶�����222
--������
1��create undo tablespace UNDOTBS2
   datafile 'D:\oracledata' size 100m
   autoextend on next 50m maxsize unlimited
   extent management local autoallocate;
   
2��create view stv
   as
   select xsb.ѧ��,רҵ,kcb.�γ̺�,�ɼ�
   from xsb,kcb,cjb
   where xsb.ѧ��=cjb.ѧ�� and kcb.�γ̺�=cjb.�γ̺�;
--������
1��select * from xsb where ���� like '��_ %';
2��select * from xsb where ����ʱ��< all(
select ����ʱ�� from xsb where רҵ='�����');
3��select * from xsb where ��ע is not null;
--������
1��create or replace function pcfun
   (insex in char)
   return number
   as
   sexnum number;
   begin
   if insex='��' then
   select count(�Ա�) into sexnum from xsb where �Ա�='��';
   end if;
   if insex='Ů' then
   select count(�Ա�) into sexnum from xsb where �Ա�='Ů';
   end if;
   return sexnum;
   end;
   
   declare sexcou number;
   begin
   sexcou:=pcfun(insex=>'��');
   dbms_output.put_line(sexcou);
   end;
2��create or replace procedure pcnum
   (insex in char,outnum out number)
   as
   sexnum number;
   begin
   if insex='��' then
   select count(�Ա�) into sexnum from xsb where �Ա�='��';
   end if;
   if insex='Ů' then
   select count(�Ա�) into sexnum from xsb where �Ա�='Ů';
   end if;
   dbms_output.put_line(outnum);
   end;
   
   declare sexcou number;
   begin
   pcnum('��',sexcou);
   end;
3��alter session set nls_date_format='YYYY-MM-DD';
 
   create or replace trigger itrig 
   instead of insert on stv
   for each row
   declare
   xm char(10);
   xb char(5);
   cssj date;
   zy char(10);
   begin
   xm:='���';
   xb:='��';
   cssj:='1997-07-28';
   insert into xsb (ѧ��,����,�Ա�,����ʱ��,רҵ) 
              values(:new.ѧ��,'���','��','1997-07-28',:new.רҵ);
   insert into cjb (ѧ��,�γ̺�,�ɼ�) 
              values(:new.ѧ��,:new.�γ̺�,:new.�ɼ�);
   end;
   
   insert into stv(ѧ��,רҵ,�γ̺�, �ɼ�) 
              values('151116','�����','101','85');