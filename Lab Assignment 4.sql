INSERT INTO DEPENDENT
Values ('453453453', 'Joe Anderson','m','11/3/2016','Spouse')

INSERT INTO DEPENDENT
VALUES ('987654321', 'Erica','F','11/3/2016','Daughter')

INSERT INTO WORKS_ON 
VALUES ('987654321',10,0)

SELECT * FROM DEPENDENT
SELECT * FROM WORKS_ON

--Q1:
--For each department, list all the employees who are working in the department with the
--employee’s first and last name and first and last name of his or her immediate supervisor. Include
--all the departments and all the employees who do not have any supervisor. List the result in the
--order of each department number and first name of each employee.

SELECT E.FNAME, E.LNAME, EM.FNAME,EM.LNAME,D.DNAME
FROM EMPLOYEE E
INNER JOIN DEPARTMENT D
ON E.DNO = D.DNUMBER
INNER JOIN EMPLOYEE EM
ON E.SUPERSSN = EM.SSN or (Em.SUPERSSN is null and e.SUPERSSN is null)

--Q2:
--Get SSN and the last name of married female employees who work on three or more projects 
SELECT DISTINCT E.SSN,E.LNAME
FROM EMPLOYEE E
JOIN DEPENDENT D
ON D.ESSN = E.SSN AND D.RELATIONSHIP='Spouse'
where e.ssn in (
			select w.essn
			from WORKS_ON w
			group by w.essn
			having count(*) >= 2)
and E.SEX ='F'

--Q3:
--List the name of employees who is working for ‘Research’ department and are married but have
--no children. 
SELECT DISTINCT  e.fname,e.lname
FROM EMPLOYEE e
JOIN DEPARTMENT d
ON (d.DNUMBER = e.DNO and d.DNAME ='Research')
inner JOIN DEPENDENT de
ON e.SSN = de.ESSN
WHERE (de.RELATIONSHIP = 'Spouse' and (de.RELATIONSHIP != 'Daughter' OR de.RELATIONSHIP NOT LIKE 'So%'))

--Q4:
--Get the last name of married employees who only have daughters. 
SELECT e.lname as LastName
FROM Employee e
JOIN Dependent d
ON d.essn = e.ssn 
WHERE  d.relationship = 'Spouse' AND
 d.essn IN (SELECT d2.ESSN
 FROM Dependent d2
 WHERE d.essn = d2.essn and d2.relationship = 'Daughter')
AND
d.essn NOT IN (SELECT d3.ESSN
 FROM Dependent d3
 WHERE d.essn = d3.essn and d3.relationship = 'Son')


--Q5:
--Give the last name and ssn of those employees who work in any project(s) where there
--are more female than male employees. 
Select distinct e2.lname, e2.ssn 
From Works_on w2, employee e2,
(Select w.pno, Count(w.essn)
From Works_on w, Employee E
Where w.essn = e.ssn and e.sex = 'M'
Group By w.pno) As mEmp(pno, Mcnt),

(Select w1.pno, Count(w1.essn)
From Works_on w1, Employee e1
Where w1.essn = e1.ssn AND e1.sex = 'F'
Group By w1.pno) As fEmp(pno, Fcnt)
where e2.ssn = w2.essn
AND w2.pno = fEmp.pno
AND mEmp.pno = fEmp.pno
AND fEmp.Fcnt > mEmp.Mcnt

