USE [Company]
GO

/****** Object:  StoredProcedure [dbo].[SP_Report_NEW_Budget]    Script Date: 11/21/2016 10:50:39 PM ******/
DROP PROCEDURE [dbo].[SP_Report_NEW_Budget]
GO

/****** Object:  StoredProcedure [dbo].[SP_Report_NEW_Budget]    Script Date: 11/21/2016 10:50:39 PM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE PROCEDURE [dbo].[SP_Report_NEW_Budget] as
BEGIN
Declare @VDBCount int
Select @VDBCount = count(*) FROM VDept_Budget;
IF @VDBCount > 0
BEGIN

CREATE TABLE NEW_Dept_Budget
(
 Dept_Name CHAR(30),
 Dept_No INT,
 COUNT_Emp INT,
 New_SUM_Salary MONEY,
 New_AVE_Salary MONEY
 )

 DECLARE @DebtCheck int,
 @EmployeeCount int

INSERT INTO NEW_Dept_Budget (Dept_Name, Dept_No, COUNT_Emp, New_SUM_Salary,New_AVE_Salary)
SELECT * FROM VDept_Budget

DECLARE Cursor_Dept_Budget Cursor for
SELECT Dept_No, COUNT_Emp
FROM NEW_Dept_Budget

Open Cursor_Dept_Budget
Fetch Next From Cursor_Dept_Budget INTO @DebtCheck, @EmployeeCount

While @@FETCH_STATUS = 0
Begin
 IF @DebtCheck = 1
 Update NEW_Dept_Budget Set
New_SUM_Salary=(New_SUM_Salary*1.1),New_AVE_Salary=((New_SUM_Salary*1.1)/@EmployeeCount)
WHERE Dept_No=1;
 IF @DebtCheck = 4
 Update NEW_Dept_Budget Set
New_SUM_Salary=(New_SUM_Salary*1.2),New_AVE_Salary=((New_SUM_Salary*1.2)/@EmployeeCount)
WHERE Dept_No=4;
 IF @DebtCheck = 5
 Update NEW_Dept_Budget Set
New_SUM_Salary=(New_SUM_Salary*1.3),New_AVE_Salary=((New_SUM_Salary*1.3)/@EmployeeCount)
WHERE Dept_No=5;
 IF @DebtCheck = 7 
 Update NEW_Dept_Budget Set
New_SUM_Salary=(New_SUM_Salary*1.4),New_AVE_Salary=((New_SUM_Salary*1.4)/@EmployeeCount)
WHERE Dept_No=7;

 Fetch Next From Cursor_Dept_Budget INTO @DebtCheck, @EmployeeCount
END

Close Cursor_Dept_Budget
Deallocate Cursor_Dept_Budget
END

 END
GO


