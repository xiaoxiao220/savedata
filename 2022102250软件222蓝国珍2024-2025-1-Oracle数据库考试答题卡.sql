--2024-2025-1Oracle���ݿ� ��ĩ����A��
/*��һ�⵽�ڶ�����ѧϰͨ����
�������⵽������д����ѧ��+����+�༶.sql���ļ���
�ļ�����Ϊ:ѧ��+����+�༶.sql
һ��Ҫд���Լ���������ѧ�ţ��༶��ֻ��Ҫ�ύ���.sql�ļ�����Ҫ�ύѹ������
�ύ��󣬽�ʦ�˼���Ƿ��ύ�ɹ�����ǩ��ȷ��*/
--������������  ѧ�ţ�2022102250  �༶�����222
--������
1��
create Undo  TABLESPACE UNDOTBS2
DATAFILE  'D:\oracledata\undotbs02.dbf'
size 100m
autoextend on
 next  100m maxsize unlimited
EXTENT MANAGEMENT LOCAL autoallocate ;
2��create view stv 
as 
    select ѧ��,רҵ,�γ̺�,�ɼ�
from XSB,CJB
where xsb.ѧ��=CJB.ѧ��
with check option ;
--������
1��SELECT *
FROM XSB
WHERE ���� LIKE'��_%'
2��select *
from XSB
    where ����ʱ��>all
          (
              select ����ʱ��
              from XSB
              where רҵ='�����'
              );
3��select *
from XSB
where ��ע is not null ;
--������
1��create or replace function pcfun
(insex in char)
return number
as out_pcfun number;
begin
    if insex='��' then
        select count('�Ա�')
              into out_pcfun
        from XSB
            where �Ա�='��';
        else
        select count('�Ա�')
            into out_pcfun
        from XSB
            where �Ա�='Ů';
end if;
return out_pcfun;
end pcfun;
2��
create or replace procedure  pcnum
(insex in char,num out number)
3��