INSERT INTO EMPLOYEE VALUES
('Lakiel','S','Wade',666666666,'31-May-95','7777 Hillcourt, Oh', 'M',1000000000,666666666,5)

INSERT INTO DEPENDENT VALUES 
(666666666,'Mohammad','M','27-Dec-95','Son In Law')

INSERT INTO WORKS_ON VALUES
(666666666,1,66)

--Select my info from employee dependent and work on
SELECT DISTINCT * FROM EMPLOYEE e, DEPENDENT d, WORKS_ON w
WHERE e.SSN=666666666 and d.ESSN=666666666 and w.ESSN = 666666666

--Q1: Retrieve the name and address of all the female managers. 
SELECT FNAME, MINIT, LNAME, ADDRESS FROM EMPLOYEE
WHERE SEX='F'

--Q2: Make a list of all project numbers for projects that involve an employee whose last
--name is ‘Smith’, either as a worker or as a manager of the department that controls the
--project.
SELECT * FROM WORKS_ON w
JOIN EMPLOYEE e
on e.SSN = w.ESSN
Where e.LNAME='Smith'

--Q3: Retrieve the name and address and his/her department name of the highest ranked
--employee who does not report to anybody in the company.
SELECT e.FNAME,e.MINIT,e.LNAME,d.DNAME
FROM EMPLOYEE e
JOIN DEPARTMENT d  
ON d.DNUMBER = e.DNO
WHERE e.SUPERSSN IS NULL OR e.SUPERSSN = ''

--Q4:
--For each department, list all the employees who are working in the department with
--the employee’s first and last name and first and last name of his or her immediate
--supervisor. List the result in the order of each department number and department
--name.
--Extra points: Include all the employees who do not have any supervisor as well in
--the list.
SELECT (e.FNAME + ' ' + e.LNAME) as EmployeeName,(se.FNAME + ' ' + se.LNAME) as SupervisorName,d.DNAME as DepartmentName
FROM EMPLOYEE e
left JOIN EMPLOYEE se
ON se.SSN=e.SUPERSSN 
JOIN DEPARTMENT d 
ON d.DNUMBER = e.DNO
order by e.DNO, d.DNAME

--Q5: List the name of managers who have no dependents.
SELECT (e.FNAME + ' ' + e.LNAME) as Name
FROM EMPLOYEE e
where e.SSN NOT IN (select ESSN from DEPENDENT)
