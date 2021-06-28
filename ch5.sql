--5-1
SELECT *
  FROM EMP;
  
-- 5-2
SELECT *
  FROM EMP
WHERE DEPTNO = 30;

--5-3
SELECT *
  FROM EMP
 WHERE DEPTNO = 30
  AND JOB = 'SALESMAN';
  
--5-4
SELECT *
  FROM EMP
 WHERE DEPTNO = 30
  OR JOB = 'CLERK';
  
--5-5 ���� ��� ������ ���
SELECT *
  FROM EMP
 WHERE SAL * 12 = 36000;
 
--5-6 �� ������
SELECT *
  FROM EMP
 WHERE SAL >= 3000;
 
--5-7
SELECT *
  FROM EMP
 WHERE ENAME >= 'F';
 
--5-8
SELECT *
  FROM EMP
 WHERE ENAME <= 'FORZ';
 
--5-9
SELECT *
  FROM EMP
 WHERE SAL != 3000;
 
--5-10
SELECT *
  FROM EMP
 WHERE SAL <> 3000;
 
--5-11
SELECT *
  FROM EMP
 WHERE SAL ^= 3000;
 
--5-12
SELECT *
  FROM EMP
 WHERE NOT SAL =3000;
 
--5-13
SELECT *
  FROM EMP
 WHERE JOB = 'MANAGER'
    OR JOB = 'SALESMAN'
    OR JOB = 'CLERK';
    
--5-14    5-13�� ������ ����� �����ϰ� IN������
SELECT *
  FROM EMP
 WHERE JOB IN ('MANAGER', 'SALESMAN', 'CLERK');
 
--5-15
SELECT *
  FROM EMP
 WHERE JOB != 'MANAGER'
   AND JOB <> 'SALESMAN'
   AND JOB ^= 'CLERK';
   
--5-16
SELECT *
  FROM EMP
 WHERE JOB NOT IN ('MANAGER', 'SALESMAN', 'CLERK');
 
--5-17
SELECT *
  FROM EMP
 WHERE SAL >= 2000
   AND SAL <= 3000;
 
--5-18  BETWEEN A AND B ������
SELECT *
  FROM EMP
 WHERE SAL BETWEEN 2000 AND 3000; 
 
--5-19 NOT BETWEEN A AND B
SELECT *
  FROM EMP
 WHERE SAL NOT BETWEEN 2000 AND 3000;
 
--5-20 LIKE    'S%' => �빮�� S�� �����ϴ� ������
SELECT *
  FROM EMP
 WHERE ENAME LIKE 'S%';
 
--5-21 LIKE   '_L%' => 2��° ���ڰ� L�� ������
SELECT *
  FROM EMP
 WHERE ENAME LIKE '_L%';
 
--5-22 LIKE '%AM%' => AM�� ���ԵǾ� �ִ� ������
SELECT *
  FROM EMP
 WHERE ENAME LIKE '%AM%';
 
--5-23 NOT LIKE  => AM�� ���ԵǾ� ���� �ʴ� ������
SELECT *
  FROM EMP
 WHERE ENAME NOT LIKE '%AM%'
 
--�丷 ��� ESCAPE �� (ESCAPE���ڴ� ����� ���Ƿ� ���� ����)
--  A_A�� �����ϴ� �����͸� ã�� �κ�
SELECT *
  FROM SOME_TABLE
 WERE SOME_COLUMN LIKE 'A\_A%' ESCAPE 'W';
 
--5-25 �Ʒ��� �����ڷδ� NULL�� ���� ã�� �� ����
SELECT *
  FROM EMP
 WHERE COMM = NULL;
 
--5-26 IS NULL ������
SELECT *
  FROM EMP
 WHERE COMM IS NULL;
 
--5-27 ���� ����� �ִ� ��� �����͸� ����ϱ�
SELECT *
  FROM EMP
 WHERE MGR IS NOT NULL;
 
--5-28 AND �����ڿ� IS NULL ������
SELECT *
  FROM EMP
 WHERE SAL > NULL
   AND COMM IS NULL;
 
--5-29 AND �����ڿ� IS NULL ������
SELECT *
  FROM EMP
 WHERE SAL > NULL
    OR COMM IS NULL;
    
--5-30 ���� ������(UNION)�� ����Ͽ� ����ϱ�
SELECT EMPNO,ENAME, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 10
UNION
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 20;
 
--5-31 SELECT ���� ��� �� ������ �ٸ� ��(���� ��)
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 10
UNION
SELECT EMPNO, ENAME, SAL
  FROM EMP
 WHERE DEPTNO = 20; 

--5-32 SELECT ���� ��� ���� �ڷ����� �ٸ� ��(���� ��)
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 10
UNION
SELECT ENAME, EMPNO, DEPTNO, SAL
  FROM EMP
 WHERE DEPTNO = 20;
 
--5-33 ��� �� ������ �ڷ����� ���� ��
--(�� �̸��� �� �տ� �ۼ��� SELECT���� �� �̸��� ���)
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 10
UNION
SELECT SAL, JOB, DEPTNO, SAL
  FROM EMP
 WHERE DEPTNO = 20;
 
 
--5-34 ��� ��� �����Ͱ� ���� �� UNION
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 10
UNION
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 10;
 
--5-35 ��� ��� �����Ͱ� ���� �� UNION ALL
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 10
UNION ALL
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 10;
 
--5-36 MINUS������ ( DEPTNO�� 10, 20�� �����͸� ����)
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
MINUS
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 10
MINUS
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 20;
 
--5-37 INTERSECT ������ ( ������)
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
INTERSECT
SELECT EMPNO, ENAME, SAL, DEPTNO
  FROM EMP
 WHERE DEPTNO = 10;
 