CREATE DATABASE Company
GO
USE Company
CREATE TABLE EMPLOYEE (
[FNAME] NVARCHAR(80) NOT NULL,
[MINIT] NVARCHAR(1)	NOT NULL,
[LNAME] NVARCHAR(80) NOT NULL,
[SSN] NVARCHAR(9) NOT NULL,
[BDATE] DATE,
[ADDRESS] NVARCHAR(120),
[SEX] NVARCHAR(1),
[SALARY] DECIMAL,
[SUPERSSN] NVARCHAR(9),
[DNO] INT
CONSTRAINT PK_SSN PRIMARY KEY(ssn),
CONSTRAINT FKSuperssnPKSsn Foreign Key (superssn) References Employee (ssn)
)

CREATE TABLE DEPARTMENT(
[DNAME] NVARCHAR(80),
[DNUMBER] INT NOT NULL,
[MGRSSN] NVARCHAR(9) NOT NULL,
[MGRSTARTDATE] DATE,
CONSTRAINT PK_DEPARTMENT_DNUMBER PRIMARY KEY(dnumber),
)

CREATE TABLE  DEPT_LOCATIONS(
[Dnumber] INT NOT NULL,
[Dlocation] NVARCHAR(20) NOT NULL
)
 
CREATE TABLE PROJECT(
[PNAME] NVARCHAR(30) NOT NULL,
[PNUMBER] INT NOT NULL,
[PLOCATION] CHAR(20),
[DNUM] INT
CONSTRAINT PK_PROJECT_PNUMBER PRIMARY KEY (pnumber)
)

CREATE  TABLE WORKS_ON(
[ESSN] NVARCHAR(9) NOT NULL,
[PNO] INT NOT NULL,
[HOURS] DECIMAL
)

CREATE TABLE DEPENDENT(
[ESSN] NVARCHAR(9) NOT NULL,
[DEPENDENT_NAME] CHAR(30) NOT NULL,
[SEX] CHAR(1),
[BDATE] DATE,
[RELATIONSHIP] CHAR(20)
)
GO

INSERT INTO EMPLOYEE VALUES
('John','B','Smith',123456789,'09-Jan-55','731 Fondren,Houston, TX', 'M',30000,123456789,5),
('James','E','Borg',888665555,'10-Nov-27','450 Stone, Houston, TX','M',55000,null,1),
('Franklin','T','Wong',333445555,'08-Dec-45', '638 Voss, Houston, TX','M',40000,888665555,5),
('Joyce','A','English',453453453,'31-Jul-62','5631 Rice, Houston, TX','F',25000,333445555,5),
('Ramesh','K','Narayan',666884444,'15-Sep-52','975 Fire Oak, Humble, TX','M',38000,333445555,5),
('Jennifer','S','Wallace', 987654321,'20-Jun-31','291 Berry, Bellaire, TX','F',43000, 888665555,4),
('Ahmad','V','Jabbar',987987987,'29-Mar-1959','980 Dallas, Houston, TX', 'M', 25000, 987654321,4),
('Alicia','J','Zelaya',999887777,'19-Jul-1958','3321 Castle, Spring, TX','F',25000, 987654321,4)   
GO

INSERT INTO DEPARTMENT VALUES
('Headquarters',1,888665555,'19-Jun-71'),
('Administration',4,987654321,'01-Jan-85'),
('Research',5,333445555,'22-May-78'),
('Automation',7,123456789,'06-Oct-05')
GO

INSERT INTO DEPENDENT VALUES 
(123456789,'Alice','F','31-Dec-78','Daughter'),
(123456789,'Elizabeth','F','05-may-57','Spouse'),
(123456789,'Michael','M','01-jan-78','Son'),
(333445555,'Alice','F','05-apr-76','Daughter'),
(333445555,'Joy','F','03-may-48','Spouse'),
(333445555,'Theodore','M','25-oct-73','Son'),
(987654321,'Abner','M','29-feb-32','Spouse')
GO

INSERT INTO DEPT_LOCATIONS VALUES
(1,'Houston'),
(4,'Stafford'),
(5,'Bellaire'),
(5,'Sugarland'),
(5,'Houston')
GO

INSERT INTO PROJECT VALUES 
('ProductX',1,'Bellaire',5),
('ProductY',2,'Sugarland',5),
('ProductZ',3,'Houston',5),
('Computerization',10,'Stafford',5),
('Reorganization',20,'Houston',5),
('Newbenefits',30,'Stafford',5)

INSERT INTO WORKS_ON VALUES
(123456789,1,32.5),
(123456789,2,7.5),
(333445555,2,10),
(333445555,3,10),
(333445555,10,10),
(333445555,20,10),
(453453453,1,20),
(453453453,2,20),
(666884444,3,40),
(888665555,20,0),
(987654321,20,15),
(987654321,30,20),
(987987987,10,35),
(987987987,30,5),
(999887777,10,10),
(999887777,30,30)

ALTER TABLE EMPLOYEE ADD foreign key (dno) references department(dnumber);
ALTER TABLE DEPARTMENT ADD CONSTRAINT FKMgrSsnPKSsn foreign key (mgrssn) references employee(ssn)


ALTER TABLE PROJECT ADD foreign key (dnum) references department(dnumber);
ALTER TABLE DEPT_LOCATIONS ADD foreign key (dnumber) references department(dnumber);


ALTER TABLE WORKS_ON ADD
 foreign key (pno) references project(pnumber),
 foreign key (essn) references employee(ssn)


ALTER TABLE DEPENDENT ADD foreign key (essn) references employee(ssn);
GO

INSERT INTO EMPLOYEE VALUES
(NULL,NULL,NULL,123456789,'09-Jan-55','731 Fondren,Houston, TX', 'M',30000,123456789,5),