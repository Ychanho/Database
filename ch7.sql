--7-1 SUM 함수(다중행 함수) (NULL 데이터는 제외하고 합계를 구함)
SELECT SUM(SAL)
  FROM EMP;
  
--7-2 다중행 함수를 사용할 때 여러 행이 결과로 나올 수 있는 열을 함께 사용할 수 없음( 오류 남)
SELECT ENAME, SUM(SAL)
  FEOM EMP;
  
--7-3 추가 수당 합계
SELECT SUM(COMM)
  FROM EMP;
  
--7-4 급여 합계 구하기(DISTINCT, ALL 사용)
SELECT SUM(DISTINCT SAL),
       SUM(ALL SAL),
       SUM(SAL)
  FROM EMP;
  
--7-5 COUNT 함수 (EMP 테이블의 데이터 개수 출력하기)
SELECT COUNT(*)
  FROM EMP;
  
--7-6 부서 번호가 30번인 직원수 구하기
SELECT COUNT(*)
  FROM EMP
 WHERE DEPTNO = 30;
 
--7-7 COUNT 함수를 사용하여 급여 개수 구하기(DISTINCT, ALL 사용)
SELECT COUNT(DISTINCT SAL),
       COUNT(ALL SAL),
       COUNT(SAL)
  FROM EMP;
  
--7-8 COUNT 함수를 사용하여 추가 수당 열 개수 출력하기
SELECT COUNT(COMM)
  FROM EMP; 
  
--7-9 COUNT 함수와 IS NOT NULL 을 사용하여 추가 수당 열 개수 출력하기
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
 
--7-12 날짜 데이터에 MAX, MIN 함수 사용하기 
-- 부서 번호가 20인 사원의 임사일 중 제일 최근 입사일 출력하기
SELECT MAX(HIREDATE)
  FROM EMP
 WHERE DEPTNO = 20;
 
--7-13 
SELECT MIN(HIREDATE)
  FROM EMP
 WHERE DEPTNO = 20;
 
--7-14 AVG로 평균 급여 출력
SELECT AVG(SAL)
  FROM EMP
 WHERE DEPTNO = 30;
 
--7-15 AVG로 평균 급여 출력(DISTINCT 사용)
SELECT AVG(DISTINCT SAL)
  FROM EMP
 WHERE DEPTNO = 30;


--7-16 집합 연산자를 사용하여 각 부서별 평균 급여 출력하기
SELECT AVG(SAL), '10' AS DEPTNO FROM EMP WHERE DEPTNO = 10
UNION ALL
SELECT AVG(SAL), '20' AS DEPTNO FROM EMP WHERE DEPTNO = 20
UNION ALL
SELECT AVG(SAL), '30' AS DEPTNO FROM EMP WHERE DEPTNO = 30;

--7-17 GROUP BY 사용하여 부서별 평균 급여 출력하기
SELECT AVG(SAL), DEPTNO
  FROM EMP
 GROUP BY DEPTNO;
 
--7-18 GROUP BY부서 번호 및 직책별 평균 급여로 정렬하기
SELECT DEPTNO, JOB, AVG(SAL)
  FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;

--7-19 GROUP BY 절에 없는 열을 SELECT 절에 포함했을 경우
SELECT ENAME, DEPTNO, AVG(SAL)
  FROM EMP
GROUP BY DEPTNO;

--7-20 GROUP BY절과 HAVING절을 사용하여 출력하기
SELECT DEPTNO, JOB, AVG(SAL)
  FROM EMP
GROUP BY DEPTNO, JOB
  HAVING AVG(SAL) >= 2000
 ORDER BY DEPTNO, JOB;
 
--7-21 HAVING 절 대신 WHERE절을 잘못 사용했을 경우
SELECT DEPTNO, JOB, AVG(SAL)
  FROM EMP
 WHERE AVG(SAL) >= 2000;
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB; 

--7-22 WHERE 절을 사용하지 않고 HAVING 절만 사용한 경우
SELECT DEPTNO, JOB, AVG(SAL)
  FROM EMP
GROUP BY DEPTNO, JOB
  HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;

--7-23 WHERE 절과 HAVING 절을 모두 사용한 경우
SELECT DEPTNO, JOB, AVG(SAL)
  FROM EMP
 WHERE SAL <= 3000
GROUP BY DEPTNO, JOB
  HAVING AVG(SAL) >= 2000
ORDER BY DEPTNO, JOB;

--7-24 기존 GROUP BY 절만 사용한 그룹화
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
   FROM EMP
 GROUP BY DEPTNO, JOB
 ORDER BY DEPTNO, JOB;

--7-25 ROLLUP 함수를 적용한 그룹화
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
  FROM EMP
GROUP BY ROLLUP(DEPTNO, JOB);

--7-26 CUBE 함수를 적용한 그룹화
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL)
  FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY DEPTNO, JOB;

--7-27 DEPTNO를 먼저 그룹화한 후 ROLLUP함수에 JOB지정하기
SELECT DEPTNO, JOB, COUNT(*)
  FROM EMP
GROUP BY DEPTNO, ROLLUP(JOB);

--7-28 JOB을 먼저 그룹화한 후 ROLLUP함수에 DEPTNO 지정하기
SELECT DEPTNO, JOB, COUNT(*)
  FROM EMP
GROUP BY JOB, ROLLUP(DEPTNO);

--7-29  GROUPING SETS 함수를 사용하여 열별로 그룹으로 묶어 출력하기
SELECT DEPTNO, JOB, COUNT(*)
  FROM EMP
GROUP BY GROUPING SETS(DEPTNO, JOB)
ORDER BY DEPTNO, JOB;

--7-30 DEPTNO, JOB 열의 그룹화 결과 여부를 GROUPING 함수로 확인하기
SELECT DEPTNO, JOB, COUNT(*), MAX(SAL), SUM(SAL), AVG(SAL),
       GROUPING(DEPTNO),
       GROUPING(JOB)
  FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY DEPTNO, JOB;

--7-31 DECODED문으로 GROUPING 함수를 적용하여 결과 표기하ㅣㄱ
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

--7-32 DEPTNO, JOB을 함께 명시한 GROUPING_ID 함수 사용하기
SELECT DEPTNO, JOB, COUNT(*), SUM(SAL),
       GROUPING(DEPTNO),
       GROUPING(JOB),
       GROUPING_ID(DEPTNO, JOB)
  FROM EMP
GROUP BY CUBE(DEPTNO, JOB)
ORDER BY DEPTNO, JOB;

--7-33 GROUOP BY 절로 그룹화하여 부서 번호와 사원 이름 출력하기
SELECT DEPTNO, ENAME
  FROM EMP
GROUP BY DEPTNO, ENAME;

--7-34 LISTAGG 함수 부서별 사원 이름을 나란히 나열하여 출력하기
SELECT DEPTNO,
       LISTAGG(ENAME, ' | ')
       WITHIN GROUP(ORDER BY SAL DESC) AS ENAMES
  FROM EMP
GROUP BY DEPTNO;

--7-35 부서별, 직책별로 그룹화하여 최고 급여 데이터 출력하기
SELECT DEPTNO, JOB, MAX(SAL)
  FROM EMP
GROUP BY DEPTNO, JOB
ORDER BY DEPTNO, JOB;

--7-36 PIVOT 함수를 사용하여 직책별, 부서별 최고 급여를 2차원 표 형태로 출력하기
SELECT *
  FROM(SELECT DEPTNO, JOB, SAL
       FROM EMP)
 PIVOT(MAX(SAL)
       FOR DEPTNO IN (10, 20, 30)
       )
ORDER BY JOB;

--7-37 PIVOT 함수를 사용하여 부서별, 직책별 최고 급여를 2차원 표 형태로 출력하기
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

--7-37-2 PIVOT 함수를 사용하여 부서별, 직책별 최고 급여를 2차원 표 형태로 출력하기
SELECT *
  FROM(SELECT JOB, DEPTNO, SAL
       FROM EMP)
 PIVOT(MAX(SAL)
       FOR JOB IN ('CLERK', 'SALESMAN', 'PRESIDENT', 'MANAGER', 'ANALYST')
       )
ORDER BY DEPTNO;

--7-38 DECODE 문을 활용하여 PIVOT 함수와 같은 출력 구현하기
SELECT DEPTNO,
       MAX(DECODE(JOB, 'CLERK', SAL)) AS "CLERK",
       MAX(DECODE(JOB, 'SALESMAN', SAL)) AS "SALESMAN",
       MAX(DECODE(JOB, 'PRESIDENT', SAL)) AS "PRESIDENT",
       MAX(DECODE(JOB, 'MANAGER', SAL)) AS "MANAGER",
       MAX(DECODE(JOB, 'ANALYST', SAL)) AS "ANALYST"
  FROM EMP
GROUP BY DEPTNO
ORDER BY DEPTNO;

--7-39 UNPIVOT 함수를 사용하여 열로 구분된 그룹을 행으로 출력하기
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