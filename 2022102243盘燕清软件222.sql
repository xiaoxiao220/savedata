--������
--1
create undo tablespace undotbs2
datafile 'D:\oracledata\undotbs02.dbf' size 100m
autoextend on
next 100m maxsize unlimited
extent management local autoallocate;

--2
CREATE VIEW stv AS 
SELECT XSB.ѧ��,רҵ,�γ̺�,�ɼ�
FROM XSB, CJB 
WHERE XSB.ѧ��=CJB.ѧ��;




---������
select * from xsb
where ���� like '��_ %';


select * from xsb
where ����ʱ��< all( select ����ʱ��  from xsb
                    where רҵ= '�����'  );

                 
select * from xsb
where ��ע is not null;



--������
--1
Create or replace function pcfun(in_sex in char)
Return number
As
Out_num number;
Begin
If in_sex='��'then
Select count(�Ա�)into out_num
From XSB Where �Ա�='��';
Else 
Select count(�Ա�)into out_num
From XSB Where �Ա�='Ů';
End if;
Return(out_num);
End pcfun;

Declare
Boy_num number;
Begin
Boy_num:=pcfun('��');
DBMS_OUTPUT.PUT_LINE(TO_CHAR(Boy_num));
End;



--2
Create or replace procedure pcnum
(sex in char,num OUT number)
As
Begin
If sex='��'then
Select count(�Ա�)into num
From XSB
Where �Ա�='��';
Else
Select count(�Ա�)into num
From XSB
Where �Ա�='Ů';
End if;
end;

Declare
Boy_num number;
Begin
pcnum('��'Boy_num);
DBMS_OUTPUT.PUT_LINE(Boy_num);
End;





CREATE VIEW stv AS 
SELECT XSB.ѧ��,רҵ,�γ̺�,�ɼ�
FROM XSB, CJB 
WHERE XSB.ѧ��=CJB.ѧ��;

CREATE TRIGGER itrig 
INSTEAD OF INSERT ON stv FOR EACH ROW 
DECLARE 
xm char(8); 
xb char(2); 
cssj date;
BEGIN 
xm:'���'; 
xb:-='��';
cssj:-'1997-07-28';








