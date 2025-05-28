-- 1

WITH
    DEPT_EMP AS (
        SELECT
            DEPARTMENT_ID,
            COUNT(*) AS TOTAL_EMP
        FROM
            EMPLOYEES
        GROUP BY
            DEPARTMENT_ID
    ),
    DEPT_JOB_CNG AS (
        SELECT
            E.DEPARTMENT_ID,
            COUNT(DISTINCT E.EMPLOYEE_ID) AS EMP_WITH_JOB_CHANGE
        FROM
            EMPLOYEES E
            JOIN JOB_HISTORY J ON E.EMPLOYEE_ID = J.EMPLOYEE_ID
        GROUP BY
            E.DEPARTMENT_ID
    ),
    QUALIFIED_DEPTS AS (
        SELECT
            DJC.DEPARTMENT_ID
        FROM
            DEPT_JOB_CNG DJC
            JOIN DEPT_EMP DE ON DJC.DEPARTMENT_ID = DE.DEPARTMENT_ID
        WHERE
            DJC.EMP_WITH_JOB_CHANGE = DE.TOTAL_EMP
    ),
    DEPT_INF AS (
        SELECT
            DEPARTMENT_ID,
            COUNT(*) AS EMP_CNT,
            AVG(NVL (SALARY, 0)) AS AVG_SAL
        FROM
            EMPLOYEES
        GROUP BY
            DEPARTMENT_ID
    ),
    COMPANY_AVG AS (
        SELECT
            AVG(NVL (SALARY, 0)) AS AVG_SAL
        FROM
            EMPLOYEES
    )
SELECT
    D.DEPARTMENT_NAME,
    DI.EMP_CNT,
    CASE
        WHEN DI.AVG_SAL > CA.AVG_SAL THEN 'Above Company Average'
        ELSE 'Below or Equal to Company Average'
    END AS SALARY_STATUS
FROM
    QUALIFIED_DEPTS QD
    JOIN DEPARTMENTS D ON QD.DEPARTMENT_ID = D.DEPARTMENT_ID
    JOIN DEPT_INF DI ON QD.DEPARTMENT_ID = DI.DEPARTMENT_ID
    CROSS JOIN COMPANY_AVG CA;

-- 2

WITH
    STEVEN_DEPTS AS (
        SELECT
            D.DEPARTMENT_ID
        FROM
            DEPARTMENTS D
            JOIN EMPLOYEES M ON D.MANAGER_ID = M.EMPLOYEE_ID
        WHERE
            M.FIRST_NAME = 'Steven'
    ),
    TOP3_EMPLOYEES AS (
        SELECT
            E1.EMPLOYEE_ID
        FROM
            EMPLOYEES E1
        WHERE
            (
                SELECT
                    COUNT(DISTINCT E2.SALARY)
                FROM
                    EMPLOYEES E2
                WHERE
                    E2.DEPARTMENT_ID = E1.DEPARTMENT_ID
                    AND E2.SALARY > E1.SALARY
            ) < 3
    ),
    UNIQUE_JOB_EMPLOYEES AS (
        SELECT
            EMPLOYEE_ID
        FROM
            EMPLOYEES
        WHERE
            (DEPARTMENT_ID, JOB_ID) IN (
                SELECT
                    DEPARTMENT_ID,
                    JOB_ID
                FROM
                    EMPLOYEES
                GROUP BY
                    DEPARTMENT_ID,
                    JOB_ID
                HAVING
                    COUNT(*) = 1
            )
    )
SELECT
    E.EMPLOYEE_ID,
    E.FIRST_NAME,
    E.LAST_NAME,
    E.DEPARTMENT_ID,
    CASE
        WHEN E.EMPLOYEE_ID IN (
            SELECT
                EMPLOYEE_ID
            FROM
                TOP3_EMPLOYEES
        ) THEN 'Top 3 Salary'
        ELSE 'Unique Job'
    END AS TYPE
FROM
    EMPLOYEES E
WHERE
    (
        E.EMPLOYEE_ID IN (
            SELECT
                EMPLOYEE_ID
            FROM
                TOP3_EMPLOYEES
        )
        OR E.EMPLOYEE_ID IN (
            SELECT
                EMPLOYEE_ID
            FROM
                UNIQUE_JOB_EMPLOYEES
        )
    )
    AND E.DEPARTMENT_ID NOT IN (
        SELECT
            DEPARTMENT_ID
        FROM
            STEVEN_DEPTS
    )
ORDER BY
    E.EMPLOYEE_ID;


-- 3

SELECT
    D.DEPARTMENT_NAME,
    L.CITY,
    C.COUNTRY_NAME
FROM
    DEPARTMENTS D
    JOIN LOCATIONS L USING (LOCATION_ID)
    JOIN COUNTRIES C USING (COUNTRY_ID)
    JOIN EMPLOYEES M ON D.MANAGER_ID = M.EMPLOYEE_ID
WHERE
    D.DEPARTMENT_ID NOT IN (
        SELECT
            DEPARTMENT_ID
        FROM
            EMPLOYEES
        WHERE
            HIRE_DATE < '01-JUL-2000'
        GROUP BY
            DEPARTMENT_ID
    )
    AND M.JOB_ID <> (
        SELECT
            JOB_ID
        FROM
            JOBS
        WHERE
            JOB_TITLE = 'Stock Manager'
    )
    AND D.DEPARTMENT_ID IN (
        SELECT
            DEPARTMENT_ID
        FROM
            EMPLOYEES
        GROUP BY
            DEPARTMENT_ID
        HAVING
            COUNT(EMPLOYEE_ID) > 0
    )
ORDER BY
    C.COUNTRY_NAME ASC,
    L.CITY DESC,
    D.DEPARTMENT_NAME ASC

-- 4

SELECT
    E.EMPLOYEE_ID,
    E.FIRST_NAME,
    E.LAST_NAME,
    E.JOB_ID,
    J.MIN_SALARY,
    D.DEPARTMENT_NAME
FROM
    EMPLOYEES E
    JOIN JOBS J ON E.JOB_ID = J.JOB_ID
    JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
WHERE
    E.JOB_ID IN (
        SELECT
            J2.JOB_ID
        FROM
            JOBS J2
        WHERE
            J2.MIN_SALARY > (
                SELECT
                    AVG(MIN_SALARY)
                FROM
                    JOBS
            )
    )
    AND E.DEPARTMENT_ID IN (
        SELECT
            DEPARTMENT_ID
        FROM
            EMPLOYEES
        GROUP BY
            DEPARTMENT_ID
        HAVING
            COUNT(EMPLOYEE_ID) > 5
    )

-- 5

SELECT
    D.DEPARTMENT_NAME,
    SUM(NVL (E.SALARY, 0)) TOTAL_SALARY_EXPENSE,
    CASE
        WHEN SUM(E.SALARY) > 100000 THEN 'VERY HIGH'
        WHEN SUM(E.SALARY) > 50000 THEN 'HIGH'
        WHEN SUM(E.SALARY) > 15000 THEN 'MEDIUM'
        ELSE 'LOW'
    END EXPENSE_CATEGORY
FROM
    DEPARTMENTS D
    LEFT JOIN EMPLOYEES E ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
GROUP BY
    E.DEPARTMENT_ID,
    D.DEPARTMENT_NAME
ORDER BY
    TOTAL_SALARY_EXPENSE DESC,
    D.DEPARTMENT_NAME ASC