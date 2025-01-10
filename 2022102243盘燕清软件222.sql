--第三题
--1
create undo tablespace undotbs2
datafile 'D:\oracledata\undotbs02.dbf' size 100m
autoextend on
next 100m maxsize unlimited
extent management local autoallocate;

--2
CREATE VIEW stv AS 
SELECT XSB.学号,专业,课程号,成绩
FROM XSB, CJB 
WHERE XSB.学号=CJB.学号;




---第四题
select * from xsb
where 姓名 like '王_ %';


select * from xsb
where 出生时间< all( select 出生时间  from xsb
                    where 专业= '计算机'  );

                 
select * from xsb
where 备注 is not null;



--第五题
--1
Create or replace function pcfun(in_sex in char)
Return number
As
Out_num number;
Begin
If in_sex='男'then
Select count(性别)into out_num
From XSB Where 性别='男';
Else 
Select count(性别)into out_num
From XSB Where 性别='女';
End if;
Return(out_num);
End pcfun;

Declare
Boy_num number;
Begin
Boy_num:=pcfun('男');
DBMS_OUTPUT.PUT_LINE(TO_CHAR(Boy_num));
End;



--2
Create or replace procedure pcnum
(sex in char,num OUT number)
As
Begin
If sex='男'then
Select count(性别)into num
From XSB
Where 性别='男';
Else
Select count(性别)into num
From XSB
Where 性别='女';
End if;
end;

Declare
Boy_num number;
Begin
pcnum('男'Boy_num);
DBMS_OUTPUT.PUT_LINE(Boy_num);
End;





CREATE VIEW stv AS 
SELECT XSB.学号,专业,课程号,成绩
FROM XSB, CJB 
WHERE XSB.学号=CJB.学号;

CREATE TRIGGER itrig 
INSTEAD OF INSERT ON stv FOR EACH ROW 
DECLARE 
xm char(8); 
xb char(2); 
cssj date;
BEGIN 
xm:'徐鹤'; 
xb:-='男';
cssj:-'1997-07-28';








