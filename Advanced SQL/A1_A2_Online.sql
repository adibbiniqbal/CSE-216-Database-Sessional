-- 1.Find employees who are either in departments with more than 5 employees or have a job title with a minimum salary above 10000, or both. Exclude those in departments where the manager earns less than their department's average.
	
	WITH
    LARGE_DEPT AS (
        SELECT
            DEPARTMENT_ID
        FROM
            EMPLOYEES
        GROUP BY
            DEPARTMENT_ID
        HAVING
            COUNT(EMPLOYEE_ID) > 5
    ),
    HIGH_JOB AS (
        SELECT
            JOB_ID
        FROM
            JOBS
        WHERE
            MIN_SALARY > 10000
    ),
    INVALID_DEPT AS (
        SELECT
            D.DEPARTMENT_ID
        FROM
            DEPARTMENTS D
            JOIN EMPLOYEES M ON M.EMPLOYEE_ID = D.MANAGER_ID
        WHERE
            M.SALARY < (
                SELECT
                    AVG(SALARY)
                FROM
                    EMPLOYEES E
                WHERE
                    E.DEPARTMENT_ID = D.DEPARTMENT_ID
            )
    )
SELECT
    E.EMPLOYEE_ID,
    E.FIRST_NAME,
    E.LAST_NAME,
    CASE
        WHEN (
            E.DEPARTMENT_ID IN (
                SELECT
                    DEPARTMENT_ID
                FROM
                    LARGE_DEPT
            )
            AND E.JOB_ID IN (
                SELECT
                    JOB_ID
                FROM
                    HIGH_JOB
            )
        ) THEN 'BOTH'
        WHEN E.DEPARTMENT_ID IN (
            SELECT
                DEPARTMENT_ID
            FROM
                LARGE_DEPT
        ) THEN 'LARGE DEPT'
        WHEN E.JOB_ID IN (
            SELECT
                JOB_ID
            FROM
                HIGH_JOB
        ) THEN 'HIGH PAY JOB'
    END TYPE
FROM
    EMPLOYEES E
WHERE
    (
        E.DEPARTMENT_ID IN (
            SELECT
                DEPARTMENT_ID
            FROM
                LARGE_DEPT
        )
        OR E.JOB_ID IN (
            SELECT
                JOB_ID
            FROM
                HIGH_JOB
        )
    )
    AND E.DEPARTMENT_ID NOT IN (
        SELECT
            DEPARTMENT_ID
        FROM
            INVALID_DEPT
    )
    
-- 2.For each country, count the number of departments. Display only the country_name and department_count, in ascending order of the country_name. Include the countries having no departments, too.
    
    SELECT
    C.COUNTRY_NAME,
    COUNT(D.DEPARTMENT_ID) DEPARTMENT_COUNT
FROM
    COUNTRIES C
    LEFT JOIN LOCATIONS L ON C.COUNTRY_ID = L.COUNTRY_ID
    LEFT JOIN DEPARTMENTS D ON L.LOCATION_ID = D.LOCATION_ID
GROUP BY
    C.COUNTRY_ID,
    C.COUNTRY_NAME
ORDER BY
    C.COUNTRY_NAME ASC
    
3.For each department, find the employee_id, full_name, salary, department_name, and job title of the second-highest-paid employee(s) i.e. employee(s) having the second-highest salary. If a department has fewer than two employees, do not include it in the results. Display the output in descending order of the salary. If two employees have the same salary, prioritize the one whose department name is lexicographically smaller. If a tie still exists, prioritize the employee with the lower employee_id.
    
    SELECT
    E.EMPLOYEE_ID,
    E.FIRST_NAME || ' ' || E.LAST_NAME FULL_NAME,
    E.SALARY,
    D.DEPARTMENT_NAME,
    J.JOB_TITLE
FROM
    EMPLOYEES E
    JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
    JOIN JOBS J USING (JOB_ID)
WHERE
    E.SALARY = (
        SELECT
            MAX(E2.SALARY)
        FROM
            EMPLOYEES E2
        WHERE
            E.DEPARTMENT_ID = E2.DEPARTMENT_ID
            AND E2.SALARY < (
                SELECT
                    MAX(E3.SALARY)
                FROM
                    EMPLOYEES E3
                WHERE
                    E.DEPARTMENT_ID = E3.DEPARTMENT_ID
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
            COUNT(EMPLOYEE_ID) > 1
    )
ORDER BY
    E.SALARY DESC,
    D.DEPARTMENT_NAME ASC,
    E.EMPLOYEE_ID ASC
    
-- 4.Find the employee_id, first_name, and salary of employees in descending order of the salary and ascending order of the employee ID, who meet exactly one of the following two conditions:
--		a. They report to a manager whose salary is greater than 15000.
--		b. They work in a department located in 'Seattle'.
    
    SELECT
    E.EMPLOYEE_ID,
    E.FIRST_NAME,
    E.SALARY
FROM
    EMPLOYEES E
    JOIN EMPLOYEES M ON E.MANAGER_ID = M.EMPLOYEE_ID
    JOIN DEPARTMENTS D ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
    JOIN LOCATIONS L ON D.LOCATION_ID = L.LOCATION_ID
WHERE
    (
        M.SALARY > 15000
        AND UPPER(L.CITY) <> 'SEATTLE'
    )
    OR (
        M.SALARY <= 15000
        AND UPPER(L.CITY) = 'SEATTLE'
    )
ORDER BY
    E.SALARY DESC,
    E.EMPLOYEE_ID ASC
    
-- 5.Find employees (first and last name), their departments, and salary, for those who earn more than the average salary in their own department. Only consider departments where there is at least one employee earning less than the company average salary and at least one earning more than the company average salary. Use a CASE statement to categorize salary as 'High' (if above 10,000), 'Medium' (if between 5,000 and 10,000), or 'Low' (if below 5,000).

WITH
    COMPANY_AVG AS (
        SELECT
            AVG(SALARY) COMPANY_AVGSAL
        FROM
            EMPLOYEES
    ),
    DEPT_AVG AS (
        SELECT
            DEPARTMENT_ID,
            AVG(SALARY) DEPT_AVGSAL
        FROM
            EMPLOYEES
        GROUP BY
            DEPARTMENT_ID
    ),
    VALID_DEPT AS (
        SELECT
            E.DEPARTMENT_ID
        FROM
            EMPLOYEES E
            JOIN COMPANY_AVG CA ON 1 = 1
        GROUP BY
            DEPARTMENT_ID
        HAVING
            COUNT(
                CASE
                    WHEN E.SALARY > CA.COMPANY_AVGSAL THEN 1
                    ELSE 0
                END
            ) > 0
            AND COUNT(
                CASE
                    WHEN E.SALARY < CA.COMPANY_AVGSAL THEN 1
                    ELSE 0
                END
            ) > 0
    )
SELECT
    E.FIRST_NAME,
    E.LAST_NAME,
    D.DEPARTMENT_NAME,
    E.SALARY,
    CASE
        WHEN E.SALARY > 10000 THEN 'HIGH'
        WHEN E.SALARY >= 5000
        AND E.SALARY <= 10000 THEN 'MID'
        ELSE 'LOW'
    END SALARY_CATEGORY
FROM
    EMPLOYEES E
    JOIN DEPARTMENTS D
    -- USING(DEPARTMENT_ID)
    ON E.DEPARTMENT_ID = D.DEPARTMENT_ID
    JOIN DEPT_AVG DA
    -- USING(DEPARTMENT_ID)
    ON E.DEPARTMENT_ID = DA.DEPARTMENT_ID
    -- JOIN VALID_DEPT VD
    -- USING(DEPARTMENT_ID)
WHERE
    E.SALARY > DA.DEPT_AVGSAL
    AND E.DEPARTMENT_ID IN (
        SELECT
            DEPARTMENT_ID
        FROM
            VALID_DEPT
    )