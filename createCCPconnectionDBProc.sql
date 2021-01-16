--this procedure builds all tables and columns with primary keys and foriegn keys with contraints and references

CREATE PROC uspCreateCCPconnectionDB
AS
BEGIN

	CREATE TABLE tbl_highSchools (
		hs_id INT PRIMARY KEY NOT NULL IDENTITY (100,1),
		hs_name VARCHAR(50) NOT NULL
	);

	CREATE TABLE tbl_colleges (
		college_id INT PRIMARY KEY NOT NULL IDENTITY (50,1),
		college_name VARCHAR(50) NOT NULL
	);

	CREATE TABLE tbl_terms (
		term_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		term_name VARCHAR(5) NOT NULL
	);

	CREATE TABLE tbl_parents (
		parent_id INT PRIMARY KEY NOT NULL IDENTITY (1000,1),
		parent_fname VARCHAR(50) NOT NULL,
		parent_lname VARCHAR(50) NOT NULL,
		parent_email VARCHAR(50) NOT NULL
	);

	CREATE TABLE tbl_counselors (
		counselor_id INT PRIMARY KEY NOT NULL IDENTITY (500,1),
		counselor_fname VARCHAR(50) NOT NULL,
		counselor_lname VARCHAR(50) NOT NULL,
		counselor_email VARCHAR(50) NOT NULL,
		counselor_hs INT CONSTRAINT fk_counselorToHS FOREIGN KEY REFERENCES tbl_highSchools(hs_id) ON UPDATE CASCADE ON DELETE CASCADE
	);

	CREATE TABLE tbl_advisors (
		advisor_id INT PRIMARY KEY NOT NULL IDENTITY (250,1),
		advisor_fname VARCHAR(50) NOT NULL,
		advisor_lname VARCHAR(50) NOT NULL,
		advisor_email VARCHAR(50) NOT NULL,
		advisor_college INT CONSTRAINT fk_advisorToCollege FOREIGN KEY REFERENCES tbl_colleges(college_id) ON UPDATE CASCADE ON DELETE CASCADE
	);

	CREATE TABLE tbl_students (
		student_id INT PRIMARY KEY NOT NULL IDENTITY (5000,1),
		student_fname VARCHAR(50) NOT NULL,
		student_lname VARCHAR(50) NOT NULL,
		student_cid INT NOT NULL,
		student_ssid VARCHAR(7),
		student_email VARCHAR(50) NOT NULL,
		student_parent INT CONSTRAINT fk_studentToParent FOREIGN KEY REFERENCES tbl_parents(parent_id) ON UPDATE CASCADE ON DELETE CASCADE,
		student_hs INT CONSTRAINT fk_studentToHS FOREIGN KEY REFERENCES tbl_highSchools(hs_id) ON UPDATE CASCADE ON DELETE CASCADE,
		student_college INT CONSTRAINT fk_studentToCollege FOREIGN KEY REFERENCES tbl_colleges(college_id) ON UPDATE CASCADE ON DELETE CASCADE
	);

	CREATE TABLE tbl_courseRequests (
		cr_id INT PRIMARY KEY NOT NULL IDENTITY (10000,1),
		cr_timestamp DATETIME NOT NULL,
		cr_addOrDrop BIT NOT NULL, -- 1 is an add code and 0 is a drop code
		cr_subject VARCHAR(5) NOT NULL,
		cr_cnumber INT NOT NULL,
		cr_section VARCHAR(3) NOT NULL,
		cr_synonym INT NOT NULL,
		cr_credits INT NOT NULL,
		cr_cname VARCHAR(50) NOT NULL,
		cr_days VARCHAR(50) NOT NULL,
		cr_times VARCHAR(25),
		cr_college INT CONSTRAINT fk_crToCollege FOREIGN KEY REFERENCES tbl_colleges(college_id) ON UPDATE CASCADE ON DELETE CASCADE,
		cr_term INT CONSTRAINT fk_crToTerm FOREIGN KEY REFERENCES tbl_terms(term_id) ON UPDATE CASCADE ON DELETE CASCADE,
		cr_student INT CONSTRAINT fk_crToStudent FOREIGN KEY REFERENCES tbl_students(student_id) ON UPDATE NO ACTION ON DELETE NO ACTION -- cannot have multiple cascade paths, no action will cause course request record to orphan if student record primary key is deleted or updated 
	);

	CREATE TABLE tbl_parentApprovals (
		pa_id INT PRIMARY KEY NOT NULL IDENTITY (30000,1),
		pa_timestamp DATETIME NOT NULL,
		pa_status BIT NOT NULL,
		pa_reason VARCHAR(100),
		pa_request INT CONSTRAINT fk_paToRequest FOREIGN KEY REFERENCES tbl_courseRequests(cr_id) ON UPDATE CASCADE ON DELETE CASCADE
	);

	CREATE TABLE tbl_counselorApprovals (
		ca_id INT PRIMARY KEY NOT NULL IDENTITY (40000,1),
		ca_timestamp DATETIME NOT NULL,
		ca_status BIT NOT NULL, -- 1 is an approved code and 0 is a NOT approved code
		ca_reason VARCHAR(100),
		ca_request INT CONSTRAINT fk_caToRequest FOREIGN KEY REFERENCES tbl_courseRequests(cr_id) ON UPDATE CASCADE ON DELETE CASCADE
	);

	CREATE TABLE tbl_advisorRegistrations (
		ar_id INT PRIMARY KEY NOT NULL IDENTITY (50000,1),
		ar_timestamp DATETIME NOT NULL,
		ar_status BIT NOT NULL, -- 1 is an registered code and 0 is a NOT registered code
		ar_reason VARCHAR(100),
		ar_request INT CONSTRAINT fk_arToRequest FOREIGN KEY REFERENCES tbl_courseRequests(cr_id) ON UPDATE CASCADE ON DELETE CASCADE
	);

	CREATE TABLE tbl_highSchoolMaxCredits (
		hsmc_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		hsmc_timestamp DATETIME NOT NULL,
		hsmc_amount INT NOT NULL,
		hsmc_term INT CONSTRAINT fk_hsmcToTerm FOREIGN KEY REFERENCES tbl_terms(term_id) ON UPDATE CASCADE ON DELETE CASCADE,
		hsmc_student INT CONSTRAINT fk_hsmcToStudent FOREIGN KEY REFERENCES tbl_students(student_id) ON UPDATE CASCADE ON DELETE CASCADE
	);

		CREATE TABLE tbl_totalMaxCredits (
		totalmc_id INT PRIMARY KEY NOT NULL IDENTITY (1,1),
		totalmc_timestamp DATETIME NOT NULL,
		totalmc_amount INT NOT NULL,
		totalmc_term INT CONSTRAINT fk_totalmcToTerm FOREIGN KEY REFERENCES tbl_terms(term_id) ON UPDATE CASCADE ON DELETE CASCADE,
		totalmc_student INT CONSTRAINT fk_totalmcToStudent FOREIGN KEY REFERENCES tbl_students(student_id) ON UPDATE CASCADE ON DELETE CASCADE
	);

END