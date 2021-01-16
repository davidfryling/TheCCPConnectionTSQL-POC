--these procedures allow users to add and update data to the user tables

--begin user insert procs

CREATE PROC uspStudentAddFandLNameandEmailToParentsTbl @parentFName VARCHAR(50), @parentLName VARCHAR(50), @parentEmail VARCHAR(50)
AS
BEGIN

	INSERT INTO tbl_parents(parent_fname, parent_lname, parent_email)
			VALUES (@parentFName, @parentLName, @parentEmail);

END

CREATE PROC uspNewStudentAddFandLNameIdsandEmailToStudentsTbl @studentFName VARCHAR(50), @studentLName VARCHAR(50), @studentCID INT, @studentSSID VARCHAR(7), @studentEmail VARCHAR(50), @studentParent INT, @studentHS INT, @studentCollege INT
AS
BEGIN

	INSERT INTO tbl_students(student_fname, student_lname, student_cid, student_ssid, student_email, student_parent, student_hs, student_college)
			VALUES (@studentFName, @studentLName, @studentCID, @studentSSID, @studentEmail, @studentParent, @studentHS, @studentCollege);

END

CREATE PROC uspStudentAddCourseInfoToCourseRequestsTbl @crTimeStamp DATETIME, @crSubject VARCHAR(5), @crCNumber INT, @crSection VARCHAR(3), @crSynonym INT, @crCredits INT, @crCName VARCHAR(50), @crDays VARCHAR(50), @crTimes VARCHAR(25), @crCollege INT, @crTerm INT, @crStudent INT
AS
BEGIN

	INSERT INTO tbl_courseRequests(cr_addOrDrop, cr_timestamp, cr_subject, cr_cnumber, cr_section, cr_synonym, cr_credits, cr_cname, cr_days, cr_times, cr_college, cr_term, cr_student)
			VALUES (1, @crTimeStamp, @crSubject, @crCNumber, @crSection, @crSynonym, @crCredits, @crCName, @crDays, @crTimes, @crCollege, @crTerm, @crStudent);

END

CREATE PROC uspParentAddApprovalStatusToParentApprovalsTbl  @paTimeStamp DATETIME, @paStatus BIT, @paReason VARCHAR(100), @paRequest INT
AS
BEGIN

	INSERT INTO tbl_parentApprovals(pa_timestamp, pa_status, pa_reason, pa_request)
			VALUES (@paTimeStamp, @paStatus, @paReason, @paRequest);

END

CREATE PROC uspCounselorAddApprovalStatusToCounselorApprovalsTbl  @caTimeStamp DATETIME, @caStatus BIT, @caReason VARCHAR(100), @caRequest INT
AS
BEGIN

	INSERT INTO tbl_counselorApprovals(ca_timestamp, ca_status, ca_reason, ca_request)
			VALUES (@caTimeStamp, @caStatus, @caReason, @caRequest);

END

CREATE PROC uspAdvisorAddRegistrationStatusToAdvisorRegistrationsTbl  @arTimeStamp DATETIME, @arStatus BIT, @arReason VARCHAR(100), @arRequest INT
AS
BEGIN

	INSERT INTO tbl_advisorRegistrations(ar_timestamp, ar_status, ar_reason, ar_request)
			VALUES (@arTimeStamp, @arStatus, @arReason, @arRequest);

END

CREATE PROC uspCounselorAddMaxCreditAmountToHighSchoolMaxCreditsTbl  @hsmcTimeStamp DATETIME, @hsmcAmount INT, @hsmcTerm INT, @hsmcStudent INT
AS
BEGIN

	INSERT INTO tbl_highSchoolMaxCredits(hsmc_timestamp, hsmc_amount, hsmc_term, hsmc_student)
			VALUES (@hsmcTimeStamp, @hsmcAmount, @hsmcTerm, @hsmcStudent);

END

CREATE PROC uspCAdvisorAddMaxCreditAmountToTotalMaxCreditsTbl  @totalmcTimeStamp DATETIME, @totalmcAmount INT, @totalmcTerm INT, @totalmcStudent INT
AS
BEGIN

	INSERT INTO tbl_totalMaxCredits(totalmc_timestamp,totalmc_amount, totalmc_term, totalmc_student)
			VALUES (@totalmcTimeStamp, @totalmcAmount, @totalmcTerm, @totalmcStudent);

END

--end user insert procs

--begin user update procs

--end user update procs