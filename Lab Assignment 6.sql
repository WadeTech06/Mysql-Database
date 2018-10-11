

--2) Write(Create) triggers to implement Constraint EMPDEPTFK in
--Table Employee based on the following rules as defined in DDL for
--Employee as in Figure 4.2:
--FK Dno of Employee On Delete SET DEFAULT (= 1 ) and
--FK Dno of Employee On Update CASCADE of Dnumber PK of
--Department 

CREATE TRIGGER EMPDEPTFK ON Department
AFTER DELETE 
AS
BEGIN
	
	DECLARE @oldDno INT;

	SELECT @oldDno = D.Dnumber FROM DELETED D;

	UPDATE Employee
	SET Dno = DEFAULT
	WHERE Dno = @oldDno
END;
go

CREATE TRIGGER EMPDEPTFK_Update ON Department
AFTER UPDATE
AS
BEGIN
	
	DECLARE @oldDno INT;
	DECLARE @newDno INT;

	SELECT @oldDno = D.Dnumber FROM DELETED D;
	SELECT @newDno = I.Dnumber FROM INSERTED I;

	UPDATE Employee
	SET Dno = @newDno
	WHERE Dno = @oldDno
END;

--3) Write (Create) Stored Procedure SP_Audit_Dept that inserts all the
--history of the data of changes by the trigger you created in 1) above into
--a table Audit_Dept_Table. See for the more specific instructions that are
--given in 2 below.
CREATE TABLE Audit_Dept_Table
(
	Date_of_change DATE,
	Old_Dname VARCHAR(20),
	New_Dname VARCHAR(20),
	Old_Dnumber INT,
	New_Dnumber INT,
	Old_mgr_ssn CHAR(9),
	New_mgr_ssn CHAR(9),
	Old_mgr_start_date DATE,
	New_mgr_start_date DATE
)
GO

CREATE PROCEDURE SP_Audit_Dept
	@oldName VARCHAR(20) = NULL,
	@newName VARCHAR(20) = NULL,
	@oldNum INT = NULL,
	@newNum INT = NULL,
	@oldMgr CHAR(9) = NULL,
	@newMgr CHAR(9) = NULL,
	@oldMgrStart DATE = NULL,
	@newMgrStart DATE = NULL
AS
BEGIN
    SET NOCOUNT ON

    INSERT INTO Audit_Dept_Table
	VALUES (GETDATE(), @oldName, @newName, @oldNum, @newNum, @oldMgr, @newMgr, @oldMgrStart, @newMgrStart)
END
GO

--1) On Update of the trigger, Insert the new record into a table named
--Audit_ Dept_Table as follow:
ALTER TRIGGER EMPDEPTFK_Update ON Department
AFTER UPDATE
AS
BEGIN
	
	DECLARE @oldDno INT;
	DECLARE @newDno INT;
	DECLARE @oldDname VARCHAR(20);
	DECLARE @newDname VARCHAR(20);
	DECLARE @oldMgr CHAR(9);
	DECLARE @newMgr CHAR(9);
	DECLARE @oldMgrStart DATE;
	DECLARE @newMgrStart DATE;

	SELECT @oldDno = D.Dnumber,@oldDname = D.Dname ,@oldMgr = D.MGRSSN,@oldMgrStart = D.MGRSTARTDATE 
	FROM DELETED D;

	SELECT @newDno = I.Dnumber,  @newDname = I.Dname,@newMgr = I.MGRSSN, @newMgrStart = I.MGRSTARTDATE 
	FROM INSERTED I;
	

	UPDATE Employee
	SET Dno = @newDno
	WHERE Dno = @oldDno;

	EXEC sp_Audit_Dept @Oldname = @oldDname, @Newname = @newDname, @Oldnum = @oldDno, @Newnum = @newDno,
					   @Oldmgr = @oldMgr, @Newmgr = @newMgr, @Oldmgrstart = @oldMgrStart, @Newmgrstart = @newMgrStart;
END;
Go


ALTER TRIGGER EMPDEPTFK ON Department
AFTER DELETE 
AS
BEGIN
	
	DECLARE @oldDno INT;
	DECLARE @oldDname VARCHAR(20);
	DECLARE @oldMgr CHAR(9);
	DECLARE @oldMgrStart DATE;

	SELECT @oldDno = D.Dnumber, @oldDname = D.Dname,@oldMgr = D.MGRSSN,@oldMgrStart = D.MGRSTARTDATE
	FROM DELETED D;

	UPDATE Employee
	SET Dno = 1
	WHERE Dno = @oldDno;

	EXEC sp_Audit_Dept @Oldname = @oldDname, @Oldnum = @oldDno, @Oldmgr = @oldMgr, @Oldmgrstart = @oldMgrStart;
END;
GO

UPDATE Department SET Dnumber = 99 WHERE Dnumber = 4

DELETE Department WHERE Dnumber = 5