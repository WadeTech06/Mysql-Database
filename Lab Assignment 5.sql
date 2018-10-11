--1-1) Create a view named VDept_Budget that reports headcount for each department.
--The report includes 3 columns as follow:
--Dept_Name, Dept_Number, No_Emp.
--Include all the departments.
--Show the content of the view through SQL (Select * from VDept_Budget;)

CREATE VIEW VDept_Budget(Dept_Name, Dept_Num, No_Emp) as
SELECT D.dname, D.dnumber, Count(E.dno)
FROM Department D Left Outer Join Employee E
ON D.Dnumber = E.dno
Group By D.dname, D.dnumber

SELECT * FROM VDept_Budget


--1-3)
--Then Change your view to add two more info – Sum_Salary, Ave_Salary for each department. Include all
--the departments. Your report (view) lists 5 Columns as follow:
--Dept_Name, Dept_Number, No_Emp, Sum_Salary, Ave_Salary

ALTER VIEW VDept_Budget(Dept_Name, Dept_Number, No_Emp, Sum_Salary, Ave_Salary) AS
SELECT D.dname, D.dnumber, Count(E.dno), Sum(E.salary), (Sum(E.salary)/Count(E.DNO))
FROM Department D Left Outer Join Employee E
ON D.Dnumber = E.dno
Group By D.dname, D.dnumber;

SELECT * FROM VDept_Budget

Execute SP_Report_NEW_Budget;
Select * From NEW_Dept_Budget; 