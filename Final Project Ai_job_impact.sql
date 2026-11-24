
CREATE DATABASE AI_Job_Impact;
USE AI_Job_Impact;

CREATE TABLE ai_job_impact (
    Employee_ID VARCHAR(20),
    Age INT,
    Gender VARCHAR(20),
    Education_Level VARCHAR(50),
    Industry VARCHAR(100),
    Job_Role VARCHAR(100),
    Years_Experience INT,
    AI_Adoption_Level VARCHAR(20),
    Automation_Risk VARCHAR(20),
    Upskilling_Required VARCHAR(20),
    Salary_Before_AI DECIMAL(12,2),
    Salary_After_AI DECIMAL(12,2),
    Job_Status VARCHAR(50),
    Work_Hours_Per_Week INT,
    Remote_Work VARCHAR(10),
    Job_Satisfaction INT,
    `Productivity_Change_%` DECIMAL(10,2)
);




LOAD DATA INFILE '‪C:/Users/patel/Downloads/ai_job_impact.csv'
INTO TABLE ai_job_impact
character set	latin1
FIELDS TERMINATED BY ','
ENCLOSED BY '"'
LINES TERMINATED BY '\r\n'
IGNORE 1 ROWS;

select * from ai_job_impact;

select 1;

/*====================================================
1. Total Number of Employees
======================================================*/

SELECT COUNT(*) AS Total_Employees
FROM ai_job_impact;

/*============================================
2. Average Age of Employees
==============================================*/

SELECT AVG(Age) AS Average_Age
FROM ai_job_impact;

/*=============================================
3. Highest Salary After AI
==============================================*/

SELECT MAX(Salary_After_AI) AS Highest_Salary
FROM ai_job_impact;

/*==============================================
4. Lowest Salary Before AI
==============================================*/

SELECT MIN(Salary_Before_AI) AS Lowest_Salary
FROM ai_job_impact;

/*==============================================
5. Total Salary After AI
================================================*/

SELECT SUM(Salary_After_AI) AS Total_Salary
FROM ai_job_impact;

/*==============================================
6. Count Employees by Gender
================================================*/

SELECT Gender, COUNT(*) AS Employee_Count
FROM ai_job_impact
GROUP BY Gender;
/*===============================================
7. Average Salary by Industry
=================================================*/

SELECT Industry,
       AVG(Salary_After_AI) AS Avg_Salary
FROM ai_job_impact
GROUP BY Industry;
/*=================================================
8. Salary Difference for Each Employee
===================================================*/

SELECT Employee_ID,
       Salary_Before_AI,
       Salary_After_AI,
       Salary_After_AI - Salary_Before_AI AS Salary_Change
FROM ai_job_impact;

/*==================================================
9. Display Employee IDs in Uppercase
====================================================*/

SELECT UPPER(Employee_ID) AS Employee_ID
FROM ai_job_impact;

/*===================================================
10. Find Length of Each Job Role
====================================================*/

SELECT Job_Role,
       LENGTH(Job_Role) AS Role_Length
FROM ai_job_impact;

/*===================================================
11. Show First 4 Letters of Industry
====================================================*/

SELECT Industry,
       LEFT(Industry,4) AS Industry_Code
FROM ai_job_impact;

/*====================================================
12. Round Salary After AI
======================================================*/

SELECT Employee_ID,
       ROUND(Salary_After_AI,0) AS Rounded_Salary
FROM ai_job_impact;

/*======================================================
13. Absolute Salary Change
========================================================*/

SELECT Employee_ID,
       ABS(Salary_After_AI - Salary_Before_AI) AS Salary_Difference
FROM ai_job_impact;

/*========================================================
14. Experience Category Using CASE
=========================================================*/

SELECT Employee_ID,
       Years_Experience,
       CASE
           WHEN Years_Experience < 5 THEN 'Beginner'
           WHEN Years_Experience BETWEEN 5 AND 10 THEN 'Intermediate'
           ELSE 'Expert'
       END AS Experience_Level
FROM ai_job_impact;

/*==============================================================
15. Count Employees Requiring Upskilling
================================================================*/

SELECT COUNT(*) AS Upskilling_Count
FROM ai_job_impact
WHERE Upskilling_Required = 'Yes';

/*=================================================================
16. Average Productivity Change by AI Adoption Level
===================================================================*/

SELECT AI_Adoption_Level,
       AVG(`Productivity_Change_%`) AS Avg_Productivity
FROM ai_job_impact
GROUP BY AI_Adoption_Level;

/*====================================================================
17. Employees with Above Average Salary
=====================================================================*/

SELECT Employee_ID,
       Salary_After_AI
FROM ai_job_impact
WHERE Salary_After_AI >
(
    SELECT AVG(Salary_After_AI)
    FROM ai_job_impact
);
/*========================================================================
18. Rank Employees by Salary After AI
=========================================================================*/

SELECT Employee_ID,
       Salary_After_AI,
       RANK() OVER(ORDER BY Salary_After_AI DESC) AS Salary_Rank
FROM ai_job_impact;

/*===========================================================================
19. Industry Having More Than 10 Employees
============================================================================*/

SELECT Industry,
       COUNT(*) AS Employee_Count
FROM ai_job_impact
GROUP BY Industry
HAVING COUNT(*) > 10;

/*============================================================================
20. Top 5 Highest Paid Employees Before AI
=============================================================================*/

SELECT Employee_ID,
       Job_Role,
       Salary_Before_AI
FROM ai_job_impact
ORDER BY Salary_After_AI DESC
LIMIT 5;
/*============================================================================
21. Top 5 Highest Paid Employees After AI
=============================================================================*/

SELECT Employee_ID,
       Job_Role,
       Salary_After_AI
FROM ai_job_impact
ORDER BY Salary_After_AI DESC
LIMIT 5;

/*============================================================================
22. Top 5 Highest Paid Employees Salary difference After AI
=============================================================================*/

SELECT Employee_ID,
       ABS(Salary_After_AI - Salary_Before_AI) AS Salary_Difference
FROM ai_job_impact
ORDER BY Salary_After_AI - Salary_Before_AI DESC
LIMIT 5;


