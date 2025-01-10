--����1
create tablespace undotbs2
 datafile 'D:\oracledata\undotbs02.dbf'  
 size 100M
 autoextend on next 50M maxsize unlimited
 extent management local
 segment space management auto;
--����2
create view stv 
as
select xsb.ѧ��,רҵ,�γ̺�,�ɼ� from xsb,cjb
where xsb.ѧ��=cjb.ѧ��;
--�ġ�1
select * from xsb
where ���� like '��%';
--�ġ�2
select * from xsb
where ����ʱ��< all( select ����ʱ��  from xsb
                    where רҵ= '�����');
--�ġ�3
select * from xsb
where ��ע is not null;

--�塢1
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
end;

declare
 boy_num number;
begin
 boy_num:=pcfun('��');
 dbms_output.put_line(boy_num);
end;
--�塢2
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
 sex_num number;
begin 
 pcnum('��',sex_num);
 dbms_output.put_line(sex_num);
end;

declare 
 sex_num number;
begin 
 pcnum('Ů',sex_num);
 dbms_output.put_line(sex_num);
end;
--�塢3
create or replace trigger itrig
 instead of insert on stv for each row
begin
 insert into xsb (ѧ��,����,�Ա�,����ʱ��,רҵ) 
 values('151116','����','��',to_date('YYYY-MM-DD','1997-07-28'),'�����');
 insert into cjb (ѧ��,�γ̺�,�ɼ�)
 values('151116','101',85);
end;

