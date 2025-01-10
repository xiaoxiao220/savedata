--2024-2025-1Oracle数据库 期末考试A卷
/*第一题到第二题在学习通考试
将第三题到第五题写到‘学号+姓名+班级.sql’文件中
文件保存为:学号+姓名+班级.sql
一定要写好自己的姓名，学号，班级，只需要提交这个.sql文件，不要提交压缩包，
提交完后，教师端检查是否提交成功，并签字确认*/
--姓名：；李猛  学号：2022102415  班级：软件222

--第三题
1、create Undo tablesplace UNDOTBS2
     datafile 'D;\oracledata\undotbs02'
     size 100MB
     autoextend on
     next 50MB maxsize unlimited
     extent management local autoallocate;
     
2、create view stv(学号,专业,课程号,成绩);



--第四题
1、select * from xsb where 姓名 like '王_%';

2、select * from xsb where 出生时间< all( select 出生时间  from xsb where 专业= '计算机' );

3、select * from xsb where 备注 is not null;




--第五题
1、create or replace procedure pcfun
     (insex in varchar2)
      return number;
      as
      countset number;
       begin
       if insex='男' then
       select count(性别) into countsex from xsb where 性别='男';
       else
       select count(性别) into countsex from xsb where 性别='女';
       end if;
       return countsex;
       end pcfun;
       exec pcfun;

2、create or replace procedure pcnum(sex in char,num out number)
     as
     begin
     if insex='男' then
     select count(性别) into countsex from xsb where 性别='男';
      else
      select count(性别) into countsex from xsb where 性别='女';
      end if;

      declare 
      boy_num;
      begin
      out_num('男','boy_num')
      dbms_output.put_line(boy_num);
      end;
      
3、create or replace view stv
     as
     select xsb.学号,姓名,课程名,成绩 from xsb,cjb,kcb
     where xsb.学号=cjb.学号 and kcb.课程号=cjb.课程号;

     create or replace trigger itring
     instead of 
     insert on xsb_view
     for each row
     declare 
      xm char(8);
      xb char(2)
      cssj date;
     begin
     xm:='徐鹤';
     xb:='男';
     cssj:=to_date('1997-07-28','YYYY-MM-DD') 
     end;







