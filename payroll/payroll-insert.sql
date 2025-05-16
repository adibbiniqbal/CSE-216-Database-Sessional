--
-- FIT1004 Database
-- SQL Payroll Insert File
-- Target: Oracle 
-- 
-- Author: Lindsay Smith
--

-- ========================================
-- COURSE
-- ========================================
INSERT INTO course VALUES ('SQL','Introduction to SQL',         'GEN',4);
INSERT INTO course VALUES ('OAU','Oracle for application users','GEN',1);
INSERT INTO course VALUES ('JAV','Java for Oracle developers',  'BLD',4);
INSERT INTO course VALUES ('PLS','Introduction to PL/SQL',      'BLD',1);
INSERT INTO course VALUES ('XML','XML for Oracle developers',   'BLD',2);
INSERT INTO course VALUES ('ERM','Data modeling with ERM',      'DSG',3);
INSERT INTO course VALUES ('PMT','Process modeling techniques', 'DSG',1);
INSERT INTO course VALUES ('RSD','Relational system design',    'DSG',2);
INSERT INTO course VALUES ('PRO','Prototyping',                 'DSG',5);
INSERT INTO course VALUES ('GEN','System generation',           'DSG',4);

-- =============================================
-- SALGRADE 
-- =============================================
INSERT INTO salgrade VALUES (1,  700,1200,   0);
INSERT INTO salgrade VALUES (2, 1201,1400,  50);
INSERT INTO salgrade VALUES (3, 1401,2000, 100);
INSERT INTO salgrade VALUES (4, 2001,3000, 200);
INSERT INTO salgrade VALUES (5, 3001,9999, 500);

-- =======================================
-- DEPARTMENT 
-- =======================================
INSERT INTO department VALUES (10,'ACCOUNTING','NEW YORK',null);
INSERT INTO department VALUES (20,'TRAINING',  'DALLAS',  null);
INSERT INTO department VALUES (30,'SALES',     'CHICAGO', null);
INSERT INTO department VALUES (40,'HR',        'BOSTON',  null);

-- ========================================
-- EMPLOYEE 
-- ========================================
INSERT INTO employee VALUES (7839,'KING','CC',   'DIRECTOR', to_date('1952-11-17','yyyy-mm-dd'),  5000, NULL,  10,NULL);
INSERT INTO employee VALUES (7566,'JONES','JM',  'MANAGER' , to_date('1967-04-02','yyyy-mm-dd'),  2975, NULL,  20,7839);
INSERT INTO employee VALUES (7902,'FORD','MG',   'TRAINER' , to_date('1959-02-13','yyyy-mm-dd'),  3000, NULL,  20,7566);
INSERT INTO employee VALUES (7369,'SMITH','N',   'TRAINER' , to_date('1965-12-17','yyyy-mm-dd'),  800 , NULL,  20,7902);
INSERT INTO employee VALUES (7698,'BLAKE','R',   'MANAGER' , to_date('1963-11-01','yyyy-mm-dd'),  2850, NULL,  30,7839);
INSERT INTO employee VALUES (7499,'ALLEN','JAM', 'SALESREP', to_date('1961-02-20','yyyy-mm-dd'),  1600, 300,   30,7698);
INSERT INTO employee VALUES (7521,'WARD','TF' ,  'SALESREP', to_date('1962-02-22','yyyy-mm-dd'),  1250, 500,   30,7698);
INSERT INTO employee VALUES (7654,'MARTIN','P',  'SALESREP', to_date('1956-09-28','yyyy-mm-dd'),  1250, 1400,  30,7698);
INSERT INTO employee VALUES (7782,'CLARK','AB',  'MANAGER' , to_date('1965-06-09','yyyy-mm-dd'),  2450, NULL,  10,7839);
INSERT INTO employee VALUES (7788,'SCOTT','SCJ', 'TRAINER' , to_date('1959-11-26','yyyy-mm-dd'),  3000, NULL,  20,7566);
INSERT INTO employee VALUES (7844,'TURNER','JJ', 'SALESREP', to_date('1968-09-28','yyyy-mm-dd'),  1500, 0,     30,7698);
INSERT INTO employee VALUES (7876,'ADAMS','AA',  'TRAINER' , to_date('1966-12-30','yyyy-mm-dd'),  1100, NULL,  20,7788);
INSERT INTO employee VALUES (7900,'JONES','R',   'ADMIN'   , to_date('1969-12-03','yyyy-mm-dd'),  800 , NULL,  30,7698);
INSERT INTO employee VALUES (7934,'MILLER','TJA','ADMIN'   , to_date('1962-01-23','yyyy-mm-dd'),  1300, NULL,  10,7782);

-- =================================================
-- DEPARTMENT fix FK values now employees are loaded
-- =================================================
UPDATE department SET empno = 7782 where deptno = 10;
UPDATE department SET empno = 7566 where deptno = 20;
UPDATE department SET empno = 7698 where deptno = 30;
UPDATE department SET empno = 7839 where deptno = 40;

-- =============================================
-- OFFERING 
-- =============================================
INSERT INTO offering VALUES (to_date('1999-04-12','yyyy-mm-dd'),'SQL','DALLAS' ,7902);
INSERT INTO offering VALUES (to_date('1999-08-10','yyyy-mm-dd'),'OAU','CHICAGO',7566);
INSERT INTO offering VALUES (to_date('1999-10-04','yyyy-mm-dd'),'SQL','SEATTLE',7369);
INSERT INTO offering VALUES (to_date('1999-12-13','yyyy-mm-dd'),'SQL','DALLAS' ,7369);
INSERT INTO offering VALUES (to_date('1999-12-13','yyyy-mm-dd'),'JAV','SEATTLE',7566);
INSERT INTO offering VALUES (to_date('2000-02-03','yyyy-mm-dd'),'XML','DALLAS' ,7369);
INSERT INTO offering VALUES (to_date('2000-02-01','yyyy-mm-dd'),'JAV','DALLAS' ,7876);
INSERT INTO offering VALUES (to_date('2000-09-11','yyyy-mm-dd'),'PLS','DALLAS' ,7788);
INSERT INTO offering VALUES (to_date('2000-09-18','yyyy-mm-dd'),'XML','SEATTLE',NULL);
INSERT INTO offering VALUES (to_date('2000-09-27','yyyy-mm-dd'),'OAU','DALLAS' ,7902);
INSERT INTO offering VALUES (to_date('2001-01-15','yyyy-mm-dd'),'ERM', NULL    ,NULL);
INSERT INTO offering VALUES (to_date('2001-02-19','yyyy-mm-dd'),'PRO','DALLAS' ,NULL);
INSERT INTO offering VALUES (to_date('2001-02-24','yyyy-mm-dd'),'RSD','CHICAGO',7788);

-- ====================================================
-- REGISTRATION 
-- ====================================================
INSERT INTO registration VALUES (to_date('1999-04-12','yyyy-mm-dd'),'SQL',7499,4   );
INSERT INTO registration VALUES (to_date('1999-04-12','yyyy-mm-dd'),'SQL',7934,5   );
INSERT INTO registration VALUES (to_date('1999-04-12','yyyy-mm-dd'),'SQL',7698,4   );
INSERT INTO registration VALUES (to_date('1999-04-12','yyyy-mm-dd'),'SQL',7876,2   );
INSERT INTO registration VALUES (to_date('1999-10-04','yyyy-mm-dd'),'SQL',7788,NULL);
INSERT INTO registration VALUES (to_date('1999-10-04','yyyy-mm-dd'),'SQL',7839,3   );
INSERT INTO registration VALUES (to_date('1999-10-04','yyyy-mm-dd'),'SQL',7902,4   );
INSERT INTO registration VALUES (to_date('1999-12-13','yyyy-mm-dd'),'SQL',7902,NULL);
INSERT INTO registration VALUES (to_date('1999-12-13','yyyy-mm-dd'),'SQL',7698,NULL);
INSERT INTO registration VALUES (to_date('1999-08-10','yyyy-mm-dd'),'OAU',7521,4   );
INSERT INTO registration VALUES (to_date('1999-08-10','yyyy-mm-dd'),'OAU',7900,4   );
INSERT INTO registration VALUES (to_date('1999-08-10','yyyy-mm-dd'),'OAU',7902,5   );
INSERT INTO registration VALUES (to_date('2000-09-27','yyyy-mm-dd'),'OAU',7844,5   );
INSERT INTO registration VALUES (to_date('1999-12-13','yyyy-mm-dd'),'JAV',7499,2   );
INSERT INTO registration VALUES (to_date('1999-12-13','yyyy-mm-dd'),'JAV',7782,5   );
INSERT INTO registration VALUES (to_date('1999-12-13','yyyy-mm-dd'),'JAV',7876,5   );
INSERT INTO registration VALUES (to_date('1999-12-13','yyyy-mm-dd'),'JAV',7788,5   );
INSERT INTO registration VALUES (to_date('1999-12-13','yyyy-mm-dd'),'JAV',7839,4   );
INSERT INTO registration VALUES (to_date('2000-02-01','yyyy-mm-dd'),'JAV',7566,3   );
INSERT INTO registration VALUES (to_date('2000-02-01','yyyy-mm-dd'),'JAV',7788,4   );
INSERT INTO registration VALUES (to_date('2000-02-01','yyyy-mm-dd'),'JAV',7698,5   );
INSERT INTO registration VALUES (to_date('2000-02-03','yyyy-mm-dd'),'XML',7900,4   );
INSERT INTO registration VALUES (to_date('2000-02-03','yyyy-mm-dd'),'XML',7499,5   );
INSERT INTO registration VALUES (to_date('2000-09-11','yyyy-mm-dd'),'PLS',7566,NULL);
INSERT INTO registration VALUES (to_date('2000-09-11','yyyy-mm-dd'),'PLS',7499,NULL);
INSERT INTO registration VALUES (to_date('2000-09-11','yyyy-mm-dd'),'PLS',7876,NULL);

-- ================================================================
-- HISTORY 
-- ================================================================
INSERT INTO history VALUES (7369,to_date('01-01-2000','dd-mm-yyyy'),2000,to_date('01-02-2000','dd-mm-yyyy'), 950,'',40);
INSERT INTO history VALUES (7369,to_date('01-02-2000','dd-mm-yyyy'),2000,NULL                              , 800,'Transfer to training department -- salary "correction" 150',20);
--                          ===========================================================================================
INSERT INTO history VALUES (7499,to_date('01-06-1988','dd-mm-yyyy'),1988,to_date('01-07-1989','dd-mm-yyyy'),1000,'',30);
INSERT INTO history VALUES (7499,to_date('01-07-1989','dd-mm-yyyy'),1989,to_date('01-12-1993','dd-mm-yyyy'),1300,'',30);
INSERT INTO history VALUES (7499,to_date('01-12-1993','dd-mm-yyyy'),1993,to_date('01-10-1995','dd-mm-yyyy'),1500,'',30);
INSERT INTO history VALUES (7499,to_date('01-10-1995','dd-mm-yyyy'),1995,to_date('01-11-1999','dd-mm-yyyy'),1700,'',30);
INSERT INTO history VALUES (7499,to_date('01-11-1999','dd-mm-yyyy'),1999,NULL                              ,1600,'Missed targets again; salary reduction',30);
--                          ============================================================================================
INSERT INTO history VALUES (7521,to_date('01-10-1986','dd-mm-yyyy'),1986,to_date('01-08-1987','dd-mm-yyyy'),1000,'',20);
INSERT INTO history VALUES (7521,to_date('01-08-1987','dd-mm-yyyy'),1987,to_date('01-01-1989','dd-mm-yyyy'),1000,'Transfer to sales department: own request',30);
INSERT INTO history VALUES (7521,to_date('01-01-1989','dd-mm-yyyy'),1989,to_date('15-12-1992','dd-mm-yyyy'),1150,'',30);
INSERT INTO history VALUES (7521,to_date('15-12-1992','dd-mm-yyyy'),1992,to_date('01-10-1994','dd-mm-yyyy'),1250,'',30);
INSERT INTO history VALUES (7521,to_date('01-10-1994','dd-mm-yyyy'),1994,to_date('01-10-1997','dd-mm-yyyy'),1250,'',20);
INSERT INTO history VALUES (7521,to_date('01-10-1997','dd-mm-yyyy'),1997,to_date('01-02-2000','dd-mm-yyyy'),1300,'',30);
INSERT INTO history VALUES (7521,to_date('01-02-2000','dd-mm-yyyy'),2000,NULL                              ,1250,'',30);
--                          ============================================================================================
INSERT INTO history VALUES (7566,to_date('01-01-1982','dd-mm-yyyy'),1982,to_date('01-12-1982','dd-mm-yyyy'), 900,'',20); 
INSERT INTO history VALUES (7566,to_date('01-12-1982','dd-mm-yyyy'),1982,to_date('15-08-1984','dd-mm-yyyy'), 950,'',20);
INSERT INTO history VALUES (7566,to_date('15-08-1984','dd-mm-yyyy'),1984,to_date('01-01-1986','dd-mm-yyyy'),1000,'Not a great trainer; let''s try the sales department!',30);
INSERT INTO history VALUES (7566,to_date('01-01-1986','dd-mm-yyyy'),1986,to_date('01-07-1986','dd-mm-yyyy'),1175,'Sales also turns out to be not a success...',30);
INSERT INTO history VALUES (7566,to_date('01-07-1986','dd-mm-yyyy'),1986,to_date('15-03-1987','dd-mm-yyyy'),1175,'',10);
INSERT INTO history VALUES (7566,to_date('15-03-1987','dd-mm-yyyy'),1987,to_date('01-04-1987','dd-mm-yyyy'),2200,'',10);
INSERT INTO history VALUES (7566,to_date('01-04-1987','dd-mm-yyyy'),1987,to_date('01-06-1989','dd-mm-yyyy'),2300,'',10);
INSERT INTO history VALUES (7566,to_date('01-06-1989','dd-mm-yyyy'),1989,to_date('01-07-1992','dd-mm-yyyy'),2300,'From accounting to human resources; 0% salary change',40);
INSERT INTO history VALUES (7566,to_date('01-07-1992','dd-mm-yyyy'),1992,to_date('01-11-1992','dd-mm-yyyy'),2450,'',40);
INSERT INTO history VALUES (7566,to_date('01-11-1992','dd-mm-yyyy'),1992,to_date('01-09-1994','dd-mm-yyyy'),2600,'Back to the training department, as manager',20);
INSERT INTO history VALUES (7566,to_date('01-09-1994','dd-mm-yyyy'),1994,to_date('01-03-1995','dd-mm-yyyy'),2550,'',20);
INSERT INTO history VALUES (7566,to_date('01-03-1995','dd-mm-yyyy'),1995,to_date('15-10-1999','dd-mm-yyyy'),2750,'',20);
INSERT INTO history VALUES (7566,to_date('15-10-1999','dd-mm-yyyy'),1999,NULL                              ,2975,'',20);
--                          ============================================================================================
INSERT INTO history VALUES (7654,to_date('01-01-1999','dd-mm-yyyy'),1999,to_date('15-10-1999','dd-mm-yyyy'),1100,'Senior sales rep; high potential?',30);
INSERT INTO history VALUES (7654,to_date('15-10-1999','dd-mm-yyyy'),1999,NULL                              ,1250,'Turns out to be slightly disappointing :-( ',30);
--                          ============================================================================================
INSERT INTO history VALUES (7698,to_date('01-06-1982','dd-mm-yyyy'),1982,to_date('01-01-1983','dd-mm-yyyy'), 900,'',30);
INSERT INTO history VALUES (7698,to_date('01-01-1983','dd-mm-yyyy'),1983,to_date('01-01-1984','dd-mm-yyyy'),1275,'',30);
INSERT INTO history VALUES (7698,to_date('01-01-1984','dd-mm-yyyy'),1984,to_date('15-04-1985','dd-mm-yyyy'),1500,'',30);
INSERT INTO history VALUES (7698,to_date('15-04-1985','dd-mm-yyyy'),1985,to_date('01-01-1986','dd-mm-yyyy'),2100,'',30);
INSERT INTO history VALUES (7698,to_date('01-01-1986','dd-mm-yyyy'),1986,to_date('15-10-1989','dd-mm-yyyy'),2200,'',30);
INSERT INTO history VALUES (7698,to_date('15-10-1989','dd-mm-yyyy'),1989,NULL                              ,2850,'Promoted to become manager of the sales department',30);
--                          ============================================================================================
INSERT INTO history VALUES (7782,to_date('01-07-1988','dd-mm-yyyy'),1988,NULL                              ,2450,'Hired as the new manager for the accounting department',10);
--                          ============================================================================================
INSERT INTO history VALUES (7788,to_date('01-07-1982','dd-mm-yyyy'),1982,to_date('01-01-1983','dd-mm-yyyy'), 900,'',20);
INSERT INTO history VALUES (7788,to_date('01-01-1983','dd-mm-yyyy'),1983,to_date('15-04-1985','dd-mm-yyyy'), 950,'',20);
INSERT INTO history VALUES (7788,to_date('15-04-1985','dd-mm-yyyy'),1985,to_date('01-06-1985','dd-mm-yyyy'), 950,'Transfer to human resources; 0% salary raise',40);
INSERT INTO history VALUES (7788,to_date('01-06-1985','dd-mm-yyyy'),1985,to_date('15-04-1986','dd-mm-yyyy'),1100,'',40);
INSERT INTO history VALUES (7788,to_date('15-04-1986','dd-mm-yyyy'),1986,to_date('01-05-1986','dd-mm-yyyy'),1100,'',20);
INSERT INTO history VALUES (7788,to_date('01-05-1986','dd-mm-yyyy'),1986,to_date('15-02-1987','dd-mm-yyyy'),1800,'',20);
INSERT INTO history VALUES (7788,to_date('15-02-1987','dd-mm-yyyy'),1987,to_date('01-12-1989','dd-mm-yyyy'),1250,'Salary reduction 550, insufficient achievements',20);
INSERT INTO history VALUES (7788,to_date('01-12-1989','dd-mm-yyyy'),1989,to_date('15-10-1992','dd-mm-yyyy'),1350,'',20);
INSERT INTO history VALUES (7788,to_date('15-10-1992','dd-mm-yyyy'),1992,to_date('01-01-1998','dd-mm-yyyy'),1400,'',20);
INSERT INTO history VALUES (7788,to_date('01-01-1998','dd-mm-yyyy'),1998,to_date('01-01-1999','dd-mm-yyyy'),1700,'',20);
INSERT INTO history VALUES (7788,to_date('01-01-1999','dd-mm-yyyy'),1999,to_date('01-07-1999','dd-mm-yyyy'),1800,'',20);
INSERT INTO history VALUES (7788,to_date('01-07-1999','dd-mm-yyyy'),1999,to_date('01-06-2000','dd-mm-yyyy'),1800,'',20);
INSERT INTO history VALUES (7788,to_date('01-06-2000','dd-mm-yyyy'),2000,NULL                              ,3000,'',20);
--                          ============================================================================================
INSERT INTO history VALUES (7839,to_date('01-01-1982','dd-mm-yyyy'),1982,to_date('01-08-1982','dd-mm-yyyy'),1000,'Founder and first employee of the company',30);
INSERT INTO history VALUES (7839,to_date('01-08-1982','dd-mm-yyyy'),1982,to_date('15-05-1984','dd-mm-yyyy'),1200,'',30);
INSERT INTO history VALUES (7839,to_date('15-05-1984','dd-mm-yyyy'),1984,to_date('01-01-1985','dd-mm-yyyy'),1500,'',30);
INSERT INTO history VALUES (7839,to_date('01-01-1985','dd-mm-yyyy'),1985,to_date('01-07-1985','dd-mm-yyyy'),1750,'',30);
INSERT INTO history VALUES (7839,to_date('01-07-1985','dd-mm-yyyy'),1985,to_date('01-11-1985','dd-mm-yyyy'),2000,'Accounting established as an independent department',10);
INSERT INTO history VALUES (7839,to_date('01-11-1985','dd-mm-yyyy'),1985,to_date('01-02-1986','dd-mm-yyyy'),2200,'',10);
INSERT INTO history VALUES (7839,to_date('01-02-1986','dd-mm-yyyy'),1986,to_date('15-06-1989','dd-mm-yyyy'),2500,'',10);
INSERT INTO history VALUES (7839,to_date('15-06-1989','dd-mm-yyyy'),1989,to_date('01-12-1993','dd-mm-yyyy'),2900,'',10);
INSERT INTO history VALUES (7839,to_date('01-12-1993','dd-mm-yyyy'),1993,to_date('01-09-1995','dd-mm-yyyy'),3400,'',10);
INSERT INTO history VALUES (7839,to_date('01-09-1995','dd-mm-yyyy'),1995,to_date('01-10-1997','dd-mm-yyyy'),4200,'',10);
INSERT INTO history VALUES (7839,to_date('01-10-1997','dd-mm-yyyy'),1997,to_date('01-10-1998','dd-mm-yyyy'),4500,'',10);
INSERT INTO history VALUES (7839,to_date('01-10-1998','dd-mm-yyyy'),1998,to_date('01-11-1999','dd-mm-yyyy'),4800,'',10);
INSERT INTO history VALUES (7839,to_date('01-11-1999','dd-mm-yyyy'),1999,to_date('15-02-2000','dd-mm-yyyy'),4900,'',10);
INSERT INTO history VALUES (7839,to_date('15-02-2000','dd-mm-yyyy'),2000,NULL                              ,5000,'',10);
--                          ============================================================================================
INSERT INTO history VALUES (7844,to_date('01-05-1995','dd-mm-yyyy'),1995,to_date('01-01-1997','dd-mm-yyyy'), 900,'',30);
INSERT INTO history VALUES (7844,to_date('15-10-1998','dd-mm-yyyy'),1998,to_date('01-11-1998','dd-mm-yyyy'),1200,'Project (half a month) for the ACCOUNTING department',10);
INSERT INTO history VALUES (7844,to_date('01-11-1998','dd-mm-yyyy'),1998,to_date('01-01-2000','dd-mm-yyyy'),1400,'',30);
INSERT INTO history VALUES (7844,to_date('01-01-2000','dd-mm-yyyy'),2000,NULL                              ,1500,'',30);
--                         ============================================================================================
INSERT INTO history VALUES (7876,to_date('01-01-2000','dd-mm-yyyy'),2000,to_date('01-02-2000','dd-mm-yyyy'), 950,'',20);
INSERT INTO history VALUES (7876,to_date('01-02-2000','dd-mm-yyyy'),2000,NULL                              ,1100,'',20);
--                          ============================================================================================
INSERT INTO history VALUES (7900,to_date('01-07-2000','dd-mm-yyyy'),2000,NULL                              , 800,'Junior sales rep -- has lots to learn... :-)',30);
--                          ============================================================================================
INSERT INTO history VALUES (7902,to_date('01-09-1998','dd-mm-yyyy'),1998,to_date('01-10-1998','dd-mm-yyyy'),1400,'',40);
INSERT INTO history VALUES (7902,to_date('01-10-1998','dd-mm-yyyy'),1998,to_date('15-03-1999','dd-mm-yyyy'),1650,'',30);
INSERT INTO history VALUES (7902,to_date('15-03-1999','dd-mm-yyyy'),1999,to_date('01-01-2000','dd-mm-yyyy'),2500,'',30);
INSERT INTO history VALUES (7902,to_date('01-01-2000','dd-mm-yyyy'),2000,to_date('01-08-2000','dd-mm-yyyy'),3000,'',30);
INSERT INTO history VALUES (7902,to_date('01-08-2000','dd-mm-yyyy'),2000,NULL                              ,3000,'',20);
--                          ============================================================================================
INSERT INTO history VALUES (7934,to_date('01-02-1998','dd-mm-yyyy'),1998,to_date('01-05-1998','dd-mm-yyyy'),1275,'',10);
INSERT INTO history VALUES (7934,to_date('01-05-1998','dd-mm-yyyy'),1998,to_date('01-02-1999','dd-mm-yyyy'),1280,'',10);
INSERT INTO history VALUES (7934,to_date('01-02-1999','dd-mm-yyyy'),1999,to_date('01-01-2000','dd-mm-yyyy'),1290,'',10);
INSERT INTO history VALUES (7934,to_date('01-01-2000','dd-mm-yyyy'),2000,NULL                              ,1300,'',10);
--                          ============================================================================================

commit;
