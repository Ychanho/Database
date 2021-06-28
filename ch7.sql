--7-1 SUM �Լ�(������ �Լ�) (NULL �����ʹ� �����ϰ� �հ踦 ����)
SELECT SUM(SAL)
  FROM EMP;
  
--7-2 ������ �Լ��� ����� �� ���� ���� ����� ���� �� �ִ� ���� �Բ� ����� �� ����( ���� ��)
SELECT ENAME, SUM(SAL)
  FEOM EMP;
  
--7-3 �߰� ���� �հ�
SELECT SUM(COMM)
  FROM EMP;
  
--7-4 �޿� �հ� ���ϱ�(DISTINCT, ALL ���)
SELECT SUM(DISTINCT SAL),
       SUM(ALL SAL),
       SUM(SAL)
  FROM EMP;
  
--7-5 COUNT �Լ� (EMP ���̺��� ������ ���� ����ϱ�)
SELECT COUNT(*)
  FROM EMP;
  
--7-6 �μ� ��ȣ�� 30���� ������ ���ϱ�
SELECT COUNT(*)
  FROM EMP
 WHERE DEPTNO = 30;
 
--7-7 COUNT �Լ��� ����Ͽ� �޿� ���� ���ϱ�(DISTINCT, ALL ���)
SELECT COUNT(DISTINCT SAL),
       COUNT(ALL SAL),
       COUNT(SAL)
  FROM EMP;
  
--7-8 COUNT �Լ��� ����Ͽ� �߰� ���� �� ���� ����ϱ�
SELECT COUNT(COMM)
  FROM EMP; 
  
--7-9 COUNT �Լ��� IS NOT NULL �� ����Ͽ� �߰� ���� �� ���� ����ϱ�
SELECT COUNT(COMM)
  FROM EMP
 WHERE COMM IS NOT NULL;
 
--7-10 MAX
SELECT MAX(SAL)
  FROM EMP
 WHERE DEPTNO = 10;

--7-11 MIN
SELECT MIN(SAL)
  FROM EMP
 WHERE DEPTNO = 10;
 
--7-12 ��¥ �����Ϳ� MAX, MIN �Լ� ����ϱ� 
-- �μ� ��ȣ�� 20�� ����� �ӻ��� �� ���� �ֱ� �Ի��� ����ϱ�
SELECT MAX(HIREDATE)
  FROM EMP
 WHERE DEPTNO = 20;
 
--7-13 
SELECT MIN(HIREDATE)
  FROM EMP
 WHERE DEPTNO = 20;
 
--7-14 AVG�� ��� �޿� ���
SELECT AVG(SAL)
  FROM EMP
 WHERE DEPTNO = 30;
 
--7-15 AVG�� ��� �޿� ���(DISTINCT ���)
SELECT AVG(DISTINCT SAL)
  FROM EMP
 WHERE DEPTNO = 30;


--7-16 ���� �����ڸ� ����Ͽ� �� �μ��� ��� �޿� ����ϱ�
SELECT AVG(SAL), '10' AS DEPTNO FROM EMP WHERE DEPTNO = 10
UNION ALL
SELECT AVG(SAL), '20' AS DEPTNO FROM EMP WHERE DEPTNO = 20
UNION ALL
SELECT AVG(SAL), '30' AS DEPTNO FROM EMP WHERE DEPTNO = 30;

--7-17 GROUP BY ����Ͽ� �μ��� ��� �޿� ����ϱ�
SELECT AVG(SAL), DEPTNO
  FROM EMP
 GROUP BY DEPTNO;
 
--7-18 GROUP BY�μ� ��ȣ �� ��å�� ��� �޿��� �����ϱ�
SELECT DEPTNO, JOB, AVG(SAL)
  FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;

--7-19 GROUP BY ���� ���� ���� SELECT ���� �������� ���
SELECT ENAME, DEPTNO, AVG(SAL)
  FROM EMP
GROUP BY DEPTNO;

--7-20 GROUP BY���� HAVING���� ����Ͽ� ����ϱ�
SELECT DEPTNO, JOB, AVG(SAL)
  FROM EMP
GROUP BY DEPTNO, JOB
  HAVING AVG(SAL) >= 2000
 ORDER BY DEPTNO, JOB;
 
--7-21 HAVING �� ��� WHERE���� �߸� ������� ���
SELECT DEPTNO, JOB, AVG(SAL)
  FROM EMP
 WHERE AVG(SAL) >= 2000;
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB; 

--7-22 WHERE ���� ������� �ʰ� HAVING ���� ����� ���
SELECT DEPTNO, JOB, AVG(SAL)
  FROM EMP
GROUP BY DEPTNO, JOB
  HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;

--7-23 WHERE ���� HAVING ���� ��� ����� ���
SELECT DEPTNO, JOB, AVG(SAL)
  FROM EMP
 WHERE SAL <= 3000
GROUP BY DEPTNO, JOB
  HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;

--7-24 ���� GROUP BY ���� ����� �׷�ȭ
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
   FROM EMP
 GROUP BY DEPTNO, JOB
 ORDER BY DEPTNO, JOB;

--7-25 ROLLUP �Լ��� ������ �׷�ȭ
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
  FROM EMP
GROUP BY ROLLUP(DEPTNO, JOB);

--7-26 CUBE �Լ��� ������ �׷�ȭ
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
  FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY DEPTNO, JOB;

--7-27 DEPTNO�� ���� �׷�ȭ�� �� ROLLUP�Լ��� JOB�����ϱ�
SELECT DEPTNO, JOB, COUNT(*)
  FROM EMP
GROUP BY DEPTNO, ROLLUP(JOB);

--7-28 JOB�� ���� �׷�ȭ�� �� ROLLUP�Լ��� DEPTNO �����ϱ�
SELECT DEPTNO, JOB, COUNT(*)
  FROM EMP
GROUP BY JOB, ROLLUP(DEPTNO);

--7-29  GROUPING SETS �Լ��� ����Ͽ� ������ �׷����� ���� ����ϱ�
SELECT DEPTNO, JOB, COUNT(*)
  FROM EMP
GROUP BY GROUPING SETS(DEPTNO, JOB)
ORDER BY DEPTNO, JOB;

--7-30 DEPTNO, JOB ���� �׷�ȭ ��� ���θ� GROUPING �Լ��� Ȯ���ϱ�
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL),
       GROUPING(DEPTNO),
       GROUPING(JOB)
  FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY DEPTNO, JOB;

--7-31 DECODED������ GROUPING �Լ��� �����Ͽ� ��� ǥ���ϤӤ�
SELECT DECODE(GROUPING(DEPTNO), 
               1, 'ALL_DEPT', 
               DEPTNO) AS DEPTNO,
       DECODE(GROUPING(JOB), 
              1, 'ALL_JOB', 
              JOB) AS JOB,
       COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
  FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY DEPTNO, JOB; 

--7-32 DEPTNO, JOB�� �Բ� ����� GROUPING_ID �Լ� ����ϱ�
SELECT DEPTNO, JOB, COUNT(*), SUM(SAL),
       GROUPING(DEPTNO),
       GROUPING(JOB),
       GROUPING_ID(DEPTNO, JOB)
  FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY DEPTNO, JOB;

--7-33 GROUOP BY ���� �׷�ȭ�Ͽ� �μ� ��ȣ�� ��� �̸� ����ϱ�
SELECT DEPTNO, ENAME
  FROM EMP
GROUP BY DEPTNO, ENAME;

--7-34 LISTAGG �Լ� �μ��� ��� �̸��� ������ �����Ͽ� ����ϱ�
SELECT DEPTNO,
       LISTAGG(ENAME, ' | ')
       WITHIN GROUP(ORDER BY SAL DESC) AS ENAMES
  FROM EMP
GROUP BY DEPTNO;

--7-35 �μ���, ��å���� �׷�ȭ�Ͽ� �ְ� �޿� ������ ����ϱ�
SELECT DEPTNO, JOB, MAX(SAL)
  FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;

--7-36 PIVOT �Լ��� ����Ͽ� ��å��, �μ��� �ְ� �޿��� 2���� ǥ ���·� ����ϱ�
SELECT *
  FROM(SELECT DEPTNO, JOB, SAL
       FROM EMP)
 PIVOT(MAX(SAL)
       FOR DEPTNO IN (10, 20, 30)
       )
ORDER BY JOB;

--7-37 PIVOT �Լ��� ����Ͽ� �μ���, ��å�� �ְ� �޿��� 2���� ǥ ���·� ����ϱ�
SELECT *
  FROM(SELECT JOB, DEPTNO, SAL
       FROM EMP)
 PIVOT(MAX(SAL)
       FOR JOB IN ('CLERK' AS CLERK,
                   'SALESMAN' AS SALESMAN,
                   'PRESIDENT' AS PRESIDENT, 
                   'MANAGER' AS MANAGER, 
                   'ANALYST' AS ANALYST)
       )
ORDER BY DEPTNO;

--7-37-2 PIVOT �Լ��� ����Ͽ� �μ���, ��å�� �ְ� �޿��� 2���� ǥ ���·� ����ϱ�
SELECT *
  FROM(SELECT JOB, DEPTNO, SAL
       FROM EMP)
 PIVOT(MAX(SAL)
       FOR JOB IN ('CLERK', 'SALESMAN', 'PRESIDENT', 'MANAGER', 'ANALYST')
       )
ORDER BY DEPTNO;

--7-38 DECODE ���� Ȱ���Ͽ� PIVOT �Լ��� ���� ��� �����ϱ�
SELECT DEPTNO,
       MAX(DECODE(JOB, 'CLERK', SAL)) AS "CLERK",
       MAX(DECODE(JOB, 'SALESMAN', SAL)) AS "SALESMAN",
       MAX(DECODE(JOB, 'PRESIDENT', SAL)) AS "PRESIDENT",
       MAX(DECODE(JOB, 'MANAGER', SAL)) AS "MANAGER",
       MAX(DECODE(JOB, 'ANALYST', SAL)) AS "ANALYST"
  FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;

--7-39 UNPIVOT �Լ��� ����Ͽ� ���� ���е� �׷��� ������ ����ϱ�
SELECT *
  FROM(SELECT DEPTNO,
              MAX(DECODE(JOB, 'CLERK', SAL)) AS "CLERK",
              MAX(DECODE(JOB, 'SALESMAN', SAL)) AS "SALESMAN",
              MAX(DECODE(JOB, 'PRESIDENT', SAL)) AS "PRESIDENT",
              MAX(DECODE(JOB, 'MANAGER', SAL)) AS "MANAGER",
              MAX(DECODE(JOB, 'ANALYST', SAL)) AS "ANALYST"
         FROM EMP
         GROUP BY DEPTNO
         ORDER BY DEPTNO)
 UNPIVOT(
    SAL FOR JOB IN (CLERK, SALESMAN, PRESIDENT, MANAGER, ANALYST))
ORDER BY DEPTNO, JOB;