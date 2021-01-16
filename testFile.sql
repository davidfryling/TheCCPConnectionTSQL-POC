-- this file is to test stored procedures

--begin admin only insert procs testing

--add high school names
EXEC [dbo].[uspAdminAddHSNameToHighSchoolsTbl] @hsName = 'Reynoldsburg HS2';
EXEC [dbo].[uspAdminAddHSNameToHighSchoolsTbl] @hsName = 'Reynoldsburg eSTEM';
EXEC [dbo].[uspAdminAddHSNameToHighSchoolsTbl] @hsName = 'Reynoldsburg Encore';
EXEC [dbo].[uspAdminAddHSNameToHighSchoolsTbl] @hsName = 'Reynoldsburg BELL';
EXEC [dbo].[uspAdminAddHSNameToHighSchoolsTbl] @hsName = 'Reynoldsburg 9X';

--add college names
EXEC [dbo].[uspAdminAddCollegeNameToCollegesTbl] @collegeName = 'CSCC';
EXEC [dbo].[uspAdminAddCollegeNameToCollegesTbl] @collegeName = 'OSU';
EXEC [dbo].[uspAdminAddCollegeNameToCollegesTbl] @collegeName = 'Otterbein';
EXEC [dbo].[uspAdminAddCollegeNameToCollegesTbl] @collegeName = 'OU';

--add term names
EXEC [dbo].[uspAdminAddTermNameToTermsTbl] @termName = 'AUT21';
EXEC [dbo].[uspAdminAddTermNameToTermsTbl] @termName = 'SPR22';
EXEC [dbo].[uspAdminAddTermNameToTermsTbl] @termName = 'SUM22';
EXEC [dbo].[uspAdminAddTermNameToTermsTbl] @termName = 'AUT22';
EXEC [dbo].[uspAdminAddTermNameToTermsTbl] @termName = 'SPR23';
EXEC [dbo].[uspAdminAddTermNameToTermsTbl] @termName = 'SUM23';
EXEC [dbo].[uspAdminAddTermNameToTermsTbl] @termName = 'AUT23';
EXEC [dbo].[uspAdminAddTermNameToTermsTbl] @termName = 'SPR24';
EXEC [dbo].[uspAdminAddTermNameToTermsTbl] @termName = 'SUM24';
EXEC [dbo].[uspAdminAddTermNameToTermsTbl] @termName = 'AUT24';
EXEC [dbo].[uspAdminAddTermNameToTermsTbl] @termName = 'SPR25';
EXEC [dbo].[uspAdminAddTermNameToTermsTbl] @termName = 'SUM25';
EXEC [dbo].[uspAdminAddTermNameToTermsTbl] @termName = 'AUT25';

--add counselor info
EXEC [dbo].[uspAdminAddFandLNameandEmailToCounselorsTbl] @counselorFName = 'David', @counselorLName = 'Fryling', @counselorEmail = 'david.fryling@reyn.org', @counselorHS = 101;
EXEC [dbo].[uspAdminAddFandLNameandEmailToCounselorsTbl] @counselorFName = 'Kristi', @counselorLName = 'Leonard', @counselorEmail = 'kristi.leonard@reyn.org', @counselorHS = 102;
EXEC [dbo].[uspAdminAddFandLNameandEmailToCounselorsTbl] @counselorFName = 'Anna', @counselorLName = 'Shaffer', @counselorEmail = 'anna.shaffer@reyn.org', @counselorHS = 103;
EXEC [dbo].[uspAdminAddFandLNameandEmailToCounselorsTbl] @counselorFName = 'Amy', @counselorLName = 'Cox', @counselorEmail = 'amy.cox@reyn.org', @counselorHS = 104;
EXEC [dbo].[uspAdminAddFandLNameandEmailToCounselorsTbl] @counselorFName = 'Sara', @counselorLName = 'Guidi', @counselorEmail = 'sara.guidi@reyn.org', @counselorHS = 105;

--add advisor info
EXEC [dbo].[uspAdminAddFandLNameandEmailToAdvisorsTbl] @advisorFName = 'Simonne', @advisorLName = 'Gage', @advisorEmail = 'sgage1@cscc.edu', @advisorCollege = 50;

--display tables
SELECT * FROM tbl_highSchools;
SELECT * FROM tbl_colleges;
SELECT * FROM tbl_terms;
SELECT * FROM tbl_counselors;
SELECT * FROM tbl_advisors;

--end admin only insert procs testing

--begin user insert procs testing

--student adds parent
EXEC [dbo].[uspStudentAddFandLNameandEmailToParentsTbl] @parentFName = 'Mama', @parentLName = 'Doe', @parentEmail = 'mama.doe@gamil.com'
EXEC [dbo].[uspStudentAddFandLNameandEmailToParentsTbl] @parentFName = 'Papa', @parentLName = 'Smith', @parentEmail = 'papa.smith@gamil.com'

--new student adds student info
EXEC [dbo].[uspNewStudentAddFandLNameIdsandEmailToStudentsTbl] @studentFName = 'Jane', @studentLName = 'Doe', @studentCID = '1234567', @studentSSID = 'AA12345', @studentEmail = 'jane.doe@reyn.org', @studentParent = 1000, @studentHS = 101, @studentCollege = 50
EXEC [dbo].[uspNewStudentAddFandLNameIdsandEmailToStudentsTbl] @studentFName = 'Jack', @studentLName = 'Doe', @studentCID = '1234568', @studentSSID = 'AA12346', @studentEmail = 'jack.doe@reyn.org', @studentParent = 1000, @studentHS = 102, @studentCollege = 50
EXEC [dbo].[uspNewStudentAddFandLNameIdsandEmailToStudentsTbl] @studentFName = 'Jill', @studentLName = 'Smith', @studentCID = '7418529', @studentSSID = 'AA74185', @studentEmail = 'jill.smith@reyn.org', @studentParent = 1001, @studentHS = 103, @studentCollege = 50

--student adds course request
EXEC [dbo].[uspStudentAddCourseInfoToCourseRequestsTbl] @crTimeStamp = '2020-04-19 02:24:58', @crSubject = 'MATH', @crCNumber = 1149, @crSection = 'W01', @crSynonym = 12345, @crCredits = 4, @crCName = 'Trigonometry', @crDays = 'Mondays and Wednesdays', @crTimes = '2:00pm-4:00pm', @crCollege = 50, @crTerm = 1, @crStudent = 5000
EXEC [dbo].[uspStudentAddCourseInfoToCourseRequestsTbl] @crTimeStamp = '2020-04-19 02:24:58', @crSubject = 'ENGL', @crCNumber = 1100, @crSection = 'W03', @crSynonym = 12356, @crCredits = 3, @crCName = 'Composition I', @crDays = 'Tuesdays and Thursdays', @crTimes = '4:00pm-5:00pm', @crCollege = 50, @crTerm = 1, @crStudent = 5000

--parent adds parent approval status
EXEC [dbo].[uspParentAddApprovalStatusToParentApprovalsTbl] @paTimeStamp = '2020-04-20 07:58:32', @paStatus = 1, @paReason = '', @paRequest = 10001

--counselor adds counselor approval status
EXEC [dbo].[uspCounselorAddApprovalStatusToCounselorApprovalsTbl] @caTimeStamp = '2020-04-21 12:01:01', @caStatus = 1, @caReason = '', @caRequest = 10001

--advisor adds advisor registration status
EXEC [dbo].[uspAdvisorAddRegistrationStatusToAdvisorRegistrationsTbl] @arTimeStamp = '2020-04-22 14:15:47', @arStatus = 1, @arReason = '', @arRequest = 10001

--counselor adds high school max credits
EXEC [dbo].[uspCounselorAddMaxCreditAmountToHighSchoolMaxCreditsTbl] @hsmcTimeStamp = '2020-04-21 11:52:33', @hsmcAmount = 15, @hsmcTerm = 1, @hsmcStudent = 5000

--advisor add total max credits
EXEC [dbo].[uspCAdvisorAddMaxCreditAmountToTotalMaxCreditsTbl] @totalmcTimeStamp = '2020-04-22 12:09:00', @totalmcAmount = 11, @totalmcTerm = 1, @totalmcStudent = 5000

--display tables
SELECT * FROM tbl_parents;
SELECT * FROM tbl_students;
SELECT * FROM tbl_courseRequests;
SELECT * FROM tbl_parentApprovals;
SELECT * FROM tbl_counselorApprovals;
SELECT * FROM tbl_advisorRegistrations;
SELECT * FROM tbl_highSchoolMaxCredits;
SELECT * FROM tbl_totalMaxCredits;
SELECT * FROM tbl_highSchools;
SELECT * FROM tbl_colleges;
SELECT * FROM tbl_terms;
SELECT * FROM tbl_counselors;
SELECT * FROM tbl_advisors;

--end user insert procs testing

--begin display table procs testing

--student profile view
EXEC [dbo].[uspStudentProfileViewTableJoin] @studentCID = 1234567
EXEC [dbo].[uspStudentProfileViewTableJoin] @studentCID = 1234568
EXEC [dbo].[uspStudentProfileViewTableJoin] @studentCID = 7418529

--student course request view
EXEC [dbo].[uspStudentCourseRequestViewTableJoin] @studentID = 5000, @termID = 1
EXEC [dbo].[uspStudentCourseRequestViewTableJoin] @studentID = 5000, @termID = 2
EXEC [dbo].[uspStudentCourseRequestViewTableJoin] @studentID = 5001, @termID = 1
EXEC [dbo].[uspStudentCourseRequestViewTableJoin] @studentID = 5002, @termID = 1

--dashboard course request view
EXEC [dbo].[uspDashboardCourseRequestViewTableJoin] @termID = 1

--display tables
SELECT * FROM tbl_parents;
SELECT * FROM tbl_students;
SELECT * FROM tbl_courseRequests;
SELECT * FROM tbl_parentApprovals;
SELECT * FROM tbl_counselorApprovals;
SELECT * FROM tbl_advisorRegistrations;
SELECT * FROM tbl_highSchoolMaxCredits;
SELECT * FROM tbl_totalMaxCredits;
SELECT * FROM tbl_highSchools;
SELECT * FROM tbl_colleges;
SELECT * FROM tbl_terms;
SELECT * FROM tbl_counselors;
SELECT * FROM tbl_advisors;

--end display table procs testing
