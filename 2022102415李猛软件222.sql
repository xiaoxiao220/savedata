--2024-2025-1Oracle���ݿ� ��ĩ����A��
/*��һ�⵽�ڶ�����ѧϰͨ����
�������⵽������д����ѧ��+����+�༶.sql���ļ���
�ļ�����Ϊ:ѧ��+����+�༶.sql
һ��Ҫд���Լ���������ѧ�ţ��༶��ֻ��Ҫ�ύ���.sql�ļ�����Ҫ�ύѹ������
�ύ��󣬽�ʦ�˼���Ƿ��ύ�ɹ�����ǩ��ȷ��*/
--������������  ѧ�ţ�2022102415  �༶�����222

--������
1��create Undo tablesplace UNDOTBS2
     datafile 'D;\oracledata\undotbs02'
     size 100MB
     autoextend on
     next 50MB maxsize unlimited
     extent management local autoallocate;
     
2��create view stv(ѧ��,רҵ,�γ̺�,�ɼ�);



--������
1��select * from xsb where ���� like '��_%';

2��select * from xsb where ����ʱ��< all( select ����ʱ��  from xsb where רҵ= '�����' );

3��select * from xsb where ��ע is not null;




--������
1��create or replace procedure pcfun
     (insex in varchar2)
      return number;
      as
      countset number;
       begin
       if insex='��' then
       select count(�Ա�) into countsex from xsb where �Ա�='��';
       else
       select count(�Ա�) into countsex from xsb where �Ա�='Ů';
       end if;
       return countsex;
       end pcfun;
       exec pcfun;

2��create or replace procedure pcnum(sex in char,num out number)
     as
     begin
     if insex='��' then
     select count(�Ա�) into countsex from xsb where �Ա�='��';
      else
      select count(�Ա�) into countsex from xsb where �Ա�='Ů';
      end if;

      declare 
      boy_num;
      begin
      out_num('��','boy_num')
      dbms_output.put_line(boy_num);
      end;
      
3��create or replace view stv
     as
     select xsb.ѧ��,����,�γ���,�ɼ� from xsb,cjb,kcb
     where xsb.ѧ��=cjb.ѧ�� and kcb.�γ̺�=cjb.�γ̺�;

     create or replace trigger itring
     instead of 
     insert on xsb_view
     for each row
     declare 
      xm char(8);
      xb char(2)
      cssj date;
     begin
     xm:='���';
     xb:='��';
     cssj:=to_date('1997-07-28','YYYY-MM-DD') 
     end;







