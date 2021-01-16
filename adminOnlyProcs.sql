--these procedures allow a DB admin to add and update data to 5 admin only tables

--begin admin only insert procs

CREATE PROC uspAdminAddHSNameToHighSchoolsTbl @hsName VARCHAR(50)
AS
BEGIN

	INSERT INTO tbl_highSchools(hs_name)
		VALUES (@hsName);

END

CREATE PROC uspAdminAddCollegeNameToCollegesTbl @collegeName VARCHAR(50)
AS
BEGIN

	INSERT INTO tbl_colleges(college_name)
		VALUES (@collegeName);

END

CREATE PROC uspAdminAddTermNameToTermsTbl @termName VARCHAR(5)
AS
BEGIN

	INSERT INTO tbl_terms(term_name)
		VALUES (@termName);

END

CREATE PROC uspAdminAddFandLNameandEmailToCounselorsTbl @counselorFName VARCHAR(50), @counselorLName VARCHAR(50), @counselorEmail VARCHAR(50), @counselorHS INT
AS
BEGIN

	INSERT INTO tbl_counselors(counselor_fname, counselor_lname, counselor_email, counselor_hs)
			VALUES (@counselorFName, @counselorLName, @counselorEmail, @counselorHS);

END

CREATE PROC uspAdminAddFandLNameandEmailToAdvisorsTbl @advisorFName VARCHAR(50), @advisorLName VARCHAR(50), @advisorEmail VARCHAR(50), @advisorCollege INT
AS
BEGIN

	INSERT INTO tbl_advisors(advisor_fname, advisor_lname, advisor_email, advisor_college)
			VALUES (@advisorFName, @advisorLName, @advisorEmail, @advisorCollege);

END

--end admin only insert procs

--begin admin only update procs

--end admin only update procs
