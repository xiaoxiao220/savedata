--2024-2025-1Oracle���ݿ� ��ĩ����A��
/*��һ�⵽�ڶ�����ѧϰͨ����
�������⵽������д����ѧ��+����+�༶.sql���ļ���
�ļ�����Ϊ:ѧ��+����+�༶.sql
һ��Ҫд���Լ���������ѧ�ţ��༶��ֻ��Ҫ�ύ���.sql�ļ�����Ҫ�ύѹ������
�ύ��󣬽�ʦ�˼���Ƿ��ύ�ɹ�����ǩ��ȷ��*/
--�����������  ѧ�ţ�2022102287  �༶�����222
--������
1��
CREATE UNDO TABLESPACE UNDOTBS2
    DATAFILE 'D:\oracledata\UNDOTBS2.dbf' SIZE 100M
    AUTOEXTEND ON NEXT 50M MAXSIZE UNLIMITED
    EXTENT MANAGEMENT LOCAL AUTOALLOCATE;

2��
CREATE OR REPLACE VIEW stv
    AS
    SELECT c.ѧ��, רҵ, �γ̺�, �ɼ� FROM XSB x
        FULL OUTER JOIN CJB c ON x.ѧ�� = c.ѧ��;
--������
1��
SELECT * FROM XSB
    WHERE ���� LIKE '��_%' AND LENGTH(����) = 2 * 4;

2��
SELECT * FROM XSB
    WHERE ����ʱ�� < (
        SELECT MIN(����ʱ��) FROM XSB
            WHERE רҵ = '�����'
    );
--SELECT * FROM XSB WHERE ����ʱ�� < ALL(
--    SELECT ����ʱ�� FROM XSB
--        WHERE רҵ = '�����'
--);

3��
SELECT * FROM XSB WHERE ��ע IS NOT NULL;
--������
1��
CREATE OR REPLACE FUNCTION pcfun (sex IN CHAR)
    RETURN NUMBER
AS
    ret NUMBER;
BEGIN
    IF sex = '��' THEN
        SELECT COUNT(�Ա�) INTO ret
            FROM XSB WHERE �Ա�='��';
    ELSE
        SELECT COUNT(�Ա�) INTO ret
            FROM XSB WHERE �Ա�='Ů';
    END IF;
    RETURN(ret);
END pcfun;

DECLARE
    boys NUMBER;
BEGIN
    boys := pcfun('��');
    DBMS_OUTPUT.PUT_LINE('��ͬѧ������Ϊ' || TO_CHAR(boys));
END;

2��
CREATE OR REPLACE PROCEDURE pcnum
    (sex IN CHAR, counts OUT NUMBER)
AS
BEGIN
    IF sex = '��' THEN
        SELECT COUNT(�Ա�) INTO counts
            FROM XSB WHERE �Ա� = '��';
    ELSE
        SELECT COUNT(�Ա�) INTO counts
            FROM XSB WHERE �Ա� = 'Ů';
    END IF;
END;

DECLARE
    boys NUMBER;
BEGIN
    pcnum('��', boys);
    DBMS_OUTPUT.PUT_LINE('��ͬѧ������Ϊ' || TO_CHAR(boys));
END;

3��
CREATE OR REPLACE TRIGGER itrig
    INSTEAD OF INSERT ON stv FOR EACH ROW
DECLARE
    xh XSB.ѧ��%TYPE;
BEGIN
    xh := '151116';
    INSERT INTO XSB (ѧ��, ����, �Ա�, ����ʱ��, רҵ)
        VALUES (xh, '���', '��', '1997-07-28', '�����');
    INSERT INTO CJB VALUES (xh, '101', 85);
END;