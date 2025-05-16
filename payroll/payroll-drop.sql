--
-- FIT1004 Database
-- payroll Payroll Drop File
-- Target: Oracle 
-- 
-- Author: Lindsay Smith
--

--
-- Drop Table    : 'REGISTRATION'   
--
DROP TABLE REGISTRATION PURGE;
--
-- Drop Table    : 'OFFERING'   
--
DROP TABLE OFFERING PURGE;
--
-- Drop Table    : 'HISTORY'   
--
DROP TABLE HISTORY PURGE;
--
-- Drop Table    : 'SALGRADE'   
--
DROP TABLE SALGRADE PURGE;
--
-- Drop Table    : 'COURSE'   
--
DROP TABLE COURSE PURGE;
--
-- Drop Table    : 'EMPLOYEE'   
--
DROP TABLE EMPLOYEE cascade constraints PURGE;
--
-- Drop Table    : 'DEPARTMENT'   
--
DROP TABLE DEPARTMENT cascade constraints PURGE;
--

