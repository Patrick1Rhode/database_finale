/* Creating DB */
CREATE DATABASE alu_project_db;


/* Creating Entities */

-- Address Table
CREATE TABLE alu_project_db.Addresses (
	address_id int NOT NULL PRIMARY KEY,
    country varchar(50) NOT NULL,
    city varchar(50) NOT NULL,
    street_number varchar(50),
    house_number int
);

-- Department Table
CREATE TABLE alu_project_db.Department (
	dept_id int NOT NULL PRIMARY KEY,
    name varchar(50),
    number_of_staff int
);

-- Staff Table
CREATE TABLE alu_project_db.Staff (
	staff_id int NOT NULL PRIMARY KEY,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    staff_position varchar(100) NOT NULL,
    address_id int,
    FOREIGN KEY (address_id) REFERENCES alu_project_db.Addresses(address_id)
);

-- Facilitators Table
CREATE TABLE alu_project_db.Teacher (
	teacher_id int NOT NULL PRIMARY KEY,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    email varchar(100) NOT NULL,
    gender varchar(20) NOT NULL,
    dob date NOT NULL,
    address_id int,
    dept_id int,
    staff_id int,
    FOREIGN KEY (address_id) REFERENCES alu_project_db.Addresses(address_id),
    FOREIGN KEY (dept_id) REFERENCES alu_project_db.Department(dept_id),
    FOREIGN KEY (staff_id) REFERENCES alu_project_db.Staff(staff_id)
);

-- Clubs Tables
CREATE TABLE alu_project_db.Clubs (
	club_id int NOT NULL PRIMARY KEY,
    name varchar(100),
    number_of_members int,
    teacher_id int,
    dept_id int,
    FOREIGN KEY (teacher_id) REFERENCES alu_project_db.Facilitators(teacher_id),
    FOREIGN KEY (dept_id) REFERENCES alu_project_db.Department(dept_id)
);

-- Degree Programs Table
CREATE TABLE alu_project_db.Degree (
	degree_id int NOT NULL PRIMARY KEY,
    name varchar(100) NOT NULL,
    duration int,
    dept_id int,
    FOREIGN KEY (dept_id) REFERENCES alu_project_db.Department(dept_id)
);

-- Courses Table
CREATE TABLE alu_project_db.Courses (
	course_id int NOT NULL PRIMARY KEY,
    course_name varchar(100) NOT NULL,
    year_taught int NOT NULL,
    term_taught int NOT NULL,
    degree_id int,
    teacher_id int,
    FOREIGN KEY (degree_id) REFERENCES alu_project_db.DegreePrograms(degree_id),
    FOREIGN KEY (teacher_id) REFERENCES alu_project_db.Facilitators(teacher_id)
);

-- Students Table // DONE
CREATE TABLE alu_project_db.Students (
	student_id int NOT NULL PRIMARY KEY,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    email varchar(100) NOT NULL,
    gender varchar(20) NOT NULL,
    dob date NOT NULL,
    course_id int,
    address_id int,
    FOREIGN KEY (course_id) REFERENCES alu_project_db.Courses(course_id),
    FOREIGN KEY (address_id) REFERENCES alu_project_db.Addresses(address_id)
);

-- Grade Report Table
CREATE TABLE alu_project_db.Grades (
	grade_id int NOT NULL PRIMARY KEY,
    GPA int NOT NULL,
    passed bool,
    student_id int,
    FOREIGN KEY (stuedent_id) REFERENCES alu_project_db.Students(stuedent_id)
);


/* Inserting entries into Tables */

-- Inserting entries into Address table
INSERT INTO alu_project_db.Addresses VALUES (1, 'Rwanda', 'Kigali', 'KG-1', 1);
INSERT INTO alu_project_db.Addresses VALUES (2, 'Rwanda', 'Kigali', 'KG-2', 2);
INSERT INTO alu_project_db.Addresses VALUES (3, 'Rwanda', 'Kigali', 'KG-3', 3);
INSERT INTO alu_project_db.Addresses VALUES (4, 'Rwanda', 'Kigali', 'KG-4', 4);
INSERT INTO alu_project_db.Addresses VALUES (5, 'Rwanda', 'Kigali', 'KG-5', 5);
INSERT INTO alu_project_db.Addresses VALUES (6, 'Rwanda', 'Kigali', 'KG-6', 6);
INSERT INTO alu_project_db.Addresses VALUES (7, 'Rwanda', 'Kigali', 'KG-7', 7);
INSERT INTO alu_project_db.Addresses VALUES (8, 'Rwanda', 'Kigali', 'KG-8', 8);
INSERT INTO alu_project_db.Addresses VALUES (9, 'Rwanda', 'Kigali', 'KG-9', 9);
INSERT INTO alu_project_db.Addresses VALUES (10, 'Rwanda', 'Kigali', 'KG-10', 10);

-- Inserting entries into Departments table
INSERT INTO alu_project_db.Department VALUES (1, 'Engineering & Computing', 10);
INSERT INTO alu_project_db.Department VALUES (2, 'Global Challenges', 10);
INSERT INTO alu_project_db.Department VALUES (3, 'Governance and Policy', 10);
INSERT INTO alu_project_db.Department VALUES (4, 'Aerospace Engineering', 10);
INSERT INTO alu_project_db.Department VALUES (5, 'Physics', 10);
INSERT INTO alu_project_db.Department VALUES (6, 'Business Studies', 10);
INSERT INTO alu_project_db.Department VALUES (7, 'Political Science', 10);
INSERT INTO alu_project_db.Department VALUES (8, 'Robotics and Automation', 10);
INSERT INTO alu_project_db.Department VALUES (9, 'Agriculture', 10);
INSERT INTO alu_project_db.Department VALUES (10, 'Material Design', 10);

-- Inserting entries into Staff table
INSERT INTO alu_project_db.Staff VALUES (1, 'Robert', 'Last Name', 'Facilitator', 1);
INSERT INTO alu_project_db.Staff VALUES (2, 'Tatenda', 'Last Name', 'Facilitator', 2);
INSERT INTO alu_project_db.Staff VALUES (3, 'Thadee', 'Last Name', 'Facilitator', 3);
INSERT INTO alu_project_db.Staff VALUES (4, 'Donart', 'Last Name', 'Facilitator', 4);
INSERT INTO alu_project_db.Staff VALUES (5, 'Lucy', 'Last Name', 'Facilitator', 5);
INSERT INTO alu_project_db.Staff VALUES (6, 'Clovis', 'Last Name', 'Facilitator', 6);
INSERT INTO alu_project_db.Staff VALUES (7, 'Obed', 'Last Name', 'Facilitator', 7);
INSERT INTO alu_project_db.Staff VALUES (8, 'Mehdi', 'Last Name', 'Facilitator', 8);
INSERT INTO alu_project_db.Staff VALUES (9, 'Emelyne', 'Last Name', 'Facilitator', 9);
INSERT INTO alu_project_db.Staff VALUES (10, 'Ela', 'Last Name', 'Facilitator', 10);

-- Inserting entries into Facilitators table
INSERT INTO alu_project_db.Facilitators VALUES (1, 'Robert', 'Last Name', 'remail@alueducation.com', 'Male', '1990-01-01', 1, 1, 1);
INSERT INTO alu_project_db.Facilitators VALUES (2, 'Tatenda', 'Last Name', 'temail@alueducation.com', 'Male', '1990-02-01', 2, 1, 2);
INSERT INTO alu_project_db.Facilitators VALUES (3, 'Thadee', 'Last Name', 'themail@alueducation.com', 'Male', '1990-03-01', 3, 1, 3);
INSERT INTO alu_project_db.Facilitators VALUES (4, 'Donart', 'Last Name', 'demail@alueducation.com', 'Male', '1990-04-01', 4, 1, 4);
INSERT INTO alu_project_db.Facilitators VALUES (5, 'Lucy', 'Last Name', 'lemail@alueducation.com', 'Male', '1990-05-01', 5, 1, 5);
INSERT INTO alu_project_db.Facilitators VALUES (6, 'Clovis', 'Last Name', 'cemail@alueducation.com', 'Male', '1990-01-01', 6, 1, 6);
INSERT INTO alu_project_db.Facilitators VALUES (7, 'Obed', 'Last Name', 'oemail@alueducation.com', 'Male', '1990-07-01', 7, 1, 7);
INSERT INTO alu_project_db.Facilitators VALUES (8, 'Mehdi', 'Last Name', 'memail@alueducation.com', 'Male', '1990-08-01', 8, 1, 8);
INSERT INTO alu_project_db.Facilitators VALUES (9, 'Emelyne', 'Last Name', 'eemail@alueducation.com', 'Male', '1990-09-01', 9, 1, 9);
INSERT INTO alu_project_db.Facilitators VALUES (10, 'Ela', 'Last Name', 'elemail@alueducation.com', 'Male', '1990-01-01', 10, 1, 10);

-- Inserting entries into Clubs table
INSERT INTO alu_project_db.Clubs VALUES (1, 'Robotics Club', 10, 1, 1);
INSERT INTO alu_project_db.Clubs VALUES (2, 'IoT', 11, 2, 1);
INSERT INTO alu_project_db.Clubs VALUES (3, 'Data Science Club', 12, 3, 1);
INSERT INTO alu_project_db.Clubs VALUES (4, 'Entreprenuership Club', 13, 4, 2);
INSERT INTO alu_project_db.Clubs VALUES (5, 'Consulting Club', 14, 5, 2);
INSERT INTO alu_project_db.Clubs VALUES (6, 'AI Lab', 15, 6, 1);
INSERT INTO alu_project_db.Clubs VALUES (7, 'Problem-Solving Lab', 16, 7, 3);
INSERT INTO alu_project_db.Clubs VALUES (8, 'Club-123', 17, 8, 4);
INSERT INTO alu_project_db.Clubs VALUES (9, 'Club-124', 18, 9, 4);
INSERT INTO alu_project_db.Clubs VALUES (10, 'Club-125', 19, 10, 4);

-- Inserting entries into Degree Programs table
INSERT INTO alu_project_db.DegreePrograms VALUES (1, 'Computer Science', 4, 1);
INSERT INTO alu_project_db.DegreePrograms VALUES (2, 'Global Challenges', 4, 2);
INSERT INTO alu_project_db.DegreePrograms VALUES (3, 'International Business & Trade', 6, 1);
INSERT INTO alu_project_db.DegreePrograms VALUES (4, 'Entreprenuership', 6, 1);
INSERT INTO alu_project_db.DegreePrograms VALUES (5, 'Physics', 1, 1);
INSERT INTO alu_project_db.DegreePrograms VALUES (6, 'Chemistry', 1, 1);
INSERT INTO alu_project_db.DegreePrograms VALUES (7, 'Mathematics', 1, 1);
INSERT INTO alu_project_db.DegreePrograms VALUES (8, 'Mechanical Engineering', 1, 1);
INSERT INTO alu_project_db.DegreePrograms VALUES (9, 'Political Science', 3, 1);
INSERT INTO alu_project_db.DegreePrograms VALUES (10, 'Engineering Science', 1, 1);

-- Inserting entries into Courses table
INSERT INTO alu_project_db.Courses VALUES (1, 'Advanced Databases', 4, 2, 1, 1);
INSERT INTO alu_project_db.Courses VALUES (2, 'Databases Systems', 2, 1, 1, 9);
INSERT INTO alu_project_db.Courses VALUES (3, 'Programming I - Python', 2, 1, 1, 8);
INSERT INTO alu_project_db.Courses VALUES (4, 'Programming II - Java', 2, 2, 1, 8);
INSERT INTO alu_project_db.Courses VALUES (5, 'Macro Economics', 3, 2, 3, 10);
INSERT INTO alu_project_db.Courses VALUES (6, 'Micro Economics', 3, 1, 3, 10);
INSERT INTO alu_project_db.Courses VALUES (7, 'Design Thinking', 2, 1, 6, 10);
INSERT INTO alu_project_db.Courses VALUES (8, 'Mobile Development', 3, 1, 1, 5);
INSERT INTO alu_project_db.Courses VALUES (9, 'Machine Learning', 4, 1, 1, 2);
INSERT INTO alu_project_db.Courses VALUES (10, 'Data Mining', 4, 2, 1, 2);

-- Inserting entries into Students table
INSERT INTO alu_project_db.Students VALUES (1, 'Musa', 'Last Name', 'mstudent@email.com', 'Male', '1999-01-01', 1, 1);
INSERT INTO alu_project_db.Students VALUES (2, 'Jorja', 'Last Name', 'jjstudent@email.com', 'Female', '1999-02-01', 1, 1);
INSERT INTO alu_project_db.Students VALUES (3, 'John', 'Last Name', 'jstudent@email.com', 'Male', '1999-03-01', 1, 1);
INSERT INTO alu_project_db.Students VALUES (4, 'Kevin', 'Last Name', 'kstudent@email.com', 'Male', '1999-04-01', 2, 1);
INSERT INTO alu_project_db.Students VALUES (5, 'Joe', 'Last Name', 'j2student@email.com', 'Male', '1999-05-01', 2, 1);
INSERT INTO alu_project_db.Students VALUES (6, 'Sam', 'Last Name', 'sstudent@email.com', 'Male', '1999-06-01', 2, 2);
INSERT INTO alu_project_db.Students VALUES (7, 'Jane', 'Last Name', 'jastudent@email.com', 'Female', '1999-07-01', 3, 2);
INSERT INTO alu_project_db.Students VALUES (8, 'Philip', 'Last Name', 'pstudent@email.com', 'Male', '1999-08-01', 3, 3);
INSERT INTO alu_project_db.Students VALUES (9, 'Mary', 'Last Name', 'mystudent@email.com', 'Female', '1999-09-01', 3, 3);
INSERT INTO alu_project_db.Students VALUES (10, 'Judith', 'Last Name', 'jdstudent@email.com', 'Female', '1999-10-01', 4, 3);
