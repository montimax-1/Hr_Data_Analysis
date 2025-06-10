
--create datbase
CREATE DATABASE HR_db

Use HR_db

--import dataset using Import flat file 


--Retrieve all columns from the dataset. 

Select * from HR_Analytics

--Show all employees who are older than 30. 

 Select * from HR_Analytics 
 Where Age>30;

 --List the unique job roles in the company.

 Select JobRole from HR_Analytics
 Group By JobRole;

--Find the top 10 highest paid employees by MonthlyIncome. 

Select Top 10 EmpID, MonthlyIncome from HR_Analytics
Order By MonthlyIncome DESC;

--Display the number of employees in each department. 

Select Department, Count(EmpID) as No_of_Employees from HR_Analytics
Group by Department;

--Count how many employees are in the Sales department. 

Select count(EmpID) as No_of_Emp_in_Sales from HR_Analytics
where Department = 'Sales';

--Show employees who have "Yes" in the Attrition column. 

Select EmpID, Attrition from HR_Analytics
where Attrition = 1;

--Get the average DailyRate for all employees.

Select Avg(DailyRate) as Avg_dailyrate from HR_Analytics

--Retrieve employees who travel "Frequently". 

Select EmpID from HR_Analytics
where BusinessTravel = 'Travel_Frequently'

-- Find the minimum and maximum Age of employees. 

Select Max(Age) as Max_age, Min(Age) as Min_age from HR_Analytics



Select * from HR_Analytics

--List employees with Education level 3. 

Select EmpId, Education from HR_Analytics
where Education = 3

--Show how many employees are there in each EducationField. 

Select Count(EducationField) as No_of_emp_in_EF from HR_Analytics
Group by EducationField

--Sort employees by YearsAtCompany in descending order. 

Select * from HR_Analytics
Order By YearsAtCompany DESC;

--Find the total number of employees who are male.

Select Count(Gender) as Total_Male from HR_Analytics
where Gender = 'Male'
Group By Gender;

--List all employees who are working in the "Research & Development" department.

Select EmpID, Department from HR_Analytics
where Department = 'Research & Development'

-- Show the employee(s) with the highest HourlyRate.

Select Max(HourlyRate) as highest_HourlyRate from HR_Analytics

--Display the count of employees in each MaritalStatus group. 

Select MaritalStatus, count(MaritalStatus) as No_Of_Emp from HR_Analytics
Group by MaritalStatus

-- Show the EmpID, Age, and MonthlyIncome for employees with overtime. 

Select EmpID, Age, MonthlyIncome from HR_Analytics
where OverTime = 1

-- Count the number of employees in each BusinessTravel category. 

Select BusinessTravel, Count(BusinessTravel) as No_of_emp from HR_Analytics
group by BusinessTravel

--Show all female employees under the age of 25.
Select * from HR_Analytics
where Gender = 'Female' and Age < 25;

--Find the average MonthlyIncome by department. 

Select Department, Avg(MonthlyIncome) as Avg_Monthly_Income
from HR_Analytics
Group By Department

-- Identify the average YearsAtCompany for each job role.
Select JobRole, Avg(YearsAtCompany) as Avg_Years_at_comp from HR_Analytics
Group by JobRole

-- Display total MonthlyRate grouped by Gender.

Select Gender, Sum(MonthlyRate) as Total_Monthlyrate from HR_Analytics
Group by Gender

--Calculate the percentage of employees who left the company (Attrition = Yes).

--Select 
--    Round(
--        100 * Count(*)) as AttritionPercentage
--From HR_Analytics; 

--For each department, find the employee with the highest MonthlyIncome. 

Select Department, MonthlyIncome from HR_Analytics
Where MonthlyIncome = (Select Max(MonthlyIncome) from HR_Analytics)



Select * from HR_Analytics


-- Show average PerformanceRating by JobRole. 

Select JobRole, avg(PerformanceRating) as avg_perf_rating from HR_Analytics
group by JobRole

--Display employees who earn more than the average MonthlyIncome. 

Select * from HR_Analytics 
where MonthlyIncome > (
Select avg(MonthlyIncome) from HR_Analytics );

--Find employees who have more than 5 years in the company but no promotion (YearsSinceLastPromotion = 0). 

Select * from HR_Analytics
where TotalWorkingYears > 5 And YearsSinceLastPromotion = 0;

--Rank employees by MonthlyIncome within each department. 
Select EmpID,Department,MonthlyIncome,
    Rank() OVER (Partition By Department Order by MonthlyIncome DESC) AS IncomeRank
From HR_Analytics;



--Write a CASE statement to categorize MonthlyIncome as "Low", "Medium", or "High". 
Select EmpID, MonthlyIncome,
CASE 
        WHEN MonthlyIncome < 3000 THEN 'Low'
        WHEN MonthlyIncome BETWEEN 3000 AND 7000 THEN 'Medium'
        ELSE 'High'
    END AS IncomeCategory
From
    HR_Analytics

--List employees with the maximum YearsWithCurrManager in each department.

Select * from HR_Analytics H
where YearsWithCurrManager = (Select Max(YearsWithCurrManager) from HR_Analytics
Where Department = H.Department);

--Count how many employees had training more than 3 times last year. 
Select Count(*) AS EmployeesWithHighTraining
From HR_Analytics
WHERE TrainingTimesLastYear > 3;

--Show average satisfaction (JobSatisfaction) by Gender and MaritalStatus. 

Select Gender,  MaritalStatus, Avg(JobSatisfaction) as AvgjobSatis from HR_Analytics
Group By Gender, MaritalStatus



--Identify employees with above-average PerformanceRating and below-average MonthlyIncome. 

Select * from HR_Analytics
Where PerformanceRating > ( Select Avg(PerformanceRating) from HR_Analytics)
And MonthlyIncome < (Select Avg(MonthlyIncome) from HR_Analytics);

--Create a query to show number of employees grouped by both Gender and Department. 

Select Gender, Department, Count(*) as EmpCount from HR_Analytics
Group By Gender, Department;

--Use a subquery to find employees who have the minimum DistanceFromHome. 

Select * from HR_Analytics
where DistanceFromHome = (Select Min(DistanceFromHome) from HR_Analytics);

--Identify how many employees have never changed jobs (NumCompaniesWorked = 1 and YearsAtCompany > 1).
Select Count(*) as NevercgJobsCount from HR_Analytics
Where NumCompaniesWorked = 1
and YearsAtCompany > 1;

--Calculate average TotalWorkingYears for employees aged between 30 and 40. 

Select Avg(TotalWorkingYears) as AvgWorkingYears from HR_Analytics
where Age Between 30 and 40;

--Find employees who were hired recently (YearsAtCompany = 0) but already have OverTime = Yes. 

Select * from HR_Analytics 
Where YearsAtCompany = 0 and OverTime = 1;


--Write a query to calculate the attrition rate per AgeGroup. 

--Select Concat


--Compare average MonthlyIncome between employees who do and do not work overtime. 
Select OverTime, Avg(MonthlyIncome) as AvgMonthlyincome from HR_Analytics
Group By OverTime;

--Show the top 5 departments with the highest average JobSatisfaction. 
Select Department, Avg(JobSatisfaction) as AvgJobsatisfaction from HR_Analytics
group By Department
Order By AvgJobsatisfaction Desc;

--Find which EducationField has the most employees who left (Attrition = Yes). 

Select Top 1 EducationField, Count(*) as NumAttri from HR_Analytics
Where Attrition = 1
Group By EducationField
Order By NumAttri Desc;


--Identify employees whose JobLevel is higher than the average job level for their department. 

Select * from HR_Analytics H 
Where JobLevel > (Select Avg(JobLevel) From  HR_Analytics Where Department = H.Department);


--Show the distribution of OverTime across different JobRoles. 
Select JobRole, Overtime, Count(*) as No_Emp From HR_Analytics
Group By JobRole, OverTime
Order By JobRole, OverTime


--List all employees who have received a PercentSalaryHike greater than 15. 

Select * from HR_Analytics
Where PercentSalaryHike > 15;


--For each JobRole, calculate the average number of TrainingTimesLastYear. 

Select JobRole, Avg(TrainingTimesLastYear) as Avg_trainingTimes from HR_Analytics
Group By JobRole
Order By Avg_trainingTimes Desc;


--Identify employees who have worked at more than 3 companies and have Attrition = Yes. 

Select * from HR_Analytics
Where NumCompaniesWorked > 3 and Attrition = 1;

--Calculate the average WorkLifeBalance by Department. 

select Department, Avg(WorkLifeBalance) As AvgWorklifebalance from HR_Analytics
group by Department


--Write a query to find the correlation between OverTime and Attrition.
Select OverTime, Attrition, Count(*) as NumEmployees
From HR_Analytics
Group By  OverTime, Attrition
Order By OverTime, Attrition;



