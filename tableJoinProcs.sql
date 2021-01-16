--these procedures will render joined tables so that they are ready to display to users

--begin table join procedures

CREATE PROC uspStudentProfileViewTableJoin @studentCID INT
AS
BEGIN

	SELECT 
	t1.student_fname + ' ' + t1.student_lname AS 'Your Name', t1.student_email AS 'Your Email', t2.parent_email AS 'Your Parent/Guardian Email', t3.hs_name AS 'Your High School', t4.college_name AS 'Your College'
	FROM tbl_students AS t1
	LEFT JOIN tbl_parents AS t2 ON t2.parent_id = t1.student_parent
	LEFT JOIN tbl_highSchools AS t3 ON t3.hs_id = t1.student_hs
	LEFT JOIN tbl_colleges AS t4 ON t4.college_id = t1.student_college
	WHERE student_cid = @studentCID;

END

CREATE PROC uspStudentCourseRequestViewTableJoin @studentID INT, @termID INT
AS
BEGIN

	SELECT 
	t1.cr_timestamp AS 'Date/Time of Request', t1.cr_subject AS 'Suject', t1.cr_cnumber AS 'Course #', t1.cr_section AS 'Section #', t1.cr_synonym AS 'Synonym #', t1.cr_credits AS 'Credit Hours', t1.cr_cname AS 'Course Name', t1.cr_days + ' at ' + t1.cr_times AS 'Days & Times', t2.pa_status AS 'Parent Approval Status', t3.ca_status AS 'Counselor Approval Status', t4.ar_status AS 'Advisor Registration Status'
	FROM tbl_courseRequests AS t1
	LEFT JOIN tbl_parentApprovals AS t2 ON t2.pa_request = t1.cr_id
	LEFT JOIN tbl_counselorApprovals AS t3 ON t3.ca_request = t1.cr_id
	LEFT JOIN tbl_advisorRegistrations AS t4 ON t4.ar_request = t1.cr_id
	WHERE cr_student = @studentID AND cr_term = @termID;

END

CREATE PROC uspDashboardCourseRequestViewTableJoin @termID INT
AS
BEGIN

	SELECT 
	t5.student_lname + ', ' + t5.student_fname AS 'Student Name', t1.cr_timestamp AS 'Date/Time of Request', t1.cr_subject AS 'Suject', t1.cr_cnumber AS 'Course #', t1.cr_section AS 'Section #', t1.cr_synonym AS 'Synonym #', t1.cr_credits AS 'Credit Hours', t1.cr_cname AS 'Course Name', t1.cr_days + ' at ' + t1.cr_times AS 'Days & Times', t2.pa_status AS 'Parent Approval Status', t3.ca_status AS 'Counselor Approval Status', t4.ar_status AS 'Advisor Registration Status'
	FROM tbl_courseRequests AS t1
	LEFT JOIN tbl_parentApprovals AS t2 ON t2.pa_request = t1.cr_id
	LEFT JOIN tbl_counselorApprovals AS t3 ON t3.ca_request = t1.cr_id
	LEFT JOIN tbl_advisorRegistrations AS t4 ON t4.ar_request = t1.cr_id
	LEFT JOIN tbl_students AS t5 ON t5.student_id = t1.cr_student
	WHERE cr_term = @termID;

END

--local test junk section

DECLARE @studentCID INT
	SET @studentCID = 1234567;

DECLARE @studentID INT
	SET @studentID = 5000;
	DECLARE @termID INT
	SET @termID = 1;

DECLARE @termID INT
	SET @termID = 1;

SELECT * FROM tbl_students
--end table join procedures