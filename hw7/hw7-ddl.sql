<<<<<<< HEAD
# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS peopleroles;
# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

    CREATE TABLE skills (
        id int not null,
        name varchar(255) not null,
        description varchar(255) not null,
        tag varchar(255) not null,
        url varchar(255),
        time_commitment varchar(255),
        primary key (id)
    );


# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills (id, name, description, tag, url, time_commitment ) values
    (1, 'kick boxing', 'visualize this!', 'Skill 1', 'mma.com', '3 days a week'),
    (2, 'python coding', 'writing python programs', 'Skill 2', 'leetcode.com', 'everday'),
    (3, 'basketball', 'can dunk', 'Skill 3', 'nba.com', '5 days a week'),
    (4, 'knitting', 'make sweaters', 'Skill 4', 'knit.com', 'everday'),
    (5, 'piano', 'beautiful music', 'Skill 5', 'music.com', '3 days a week'),
    (6, 'CPR', 'Certified', 'Skill 6', 'cpr.com', 'once a month'),
    (7, 'Korean', 'Able to speak korean fluently', 'Skill 7', 'korea.com', 'everyday'),
    (8, 'Cooking', 'Able to cook meals', 'Skill 8', 'cooking.com', 'everyday');

# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

    CREATE TABLE people (
        id int NOT NULL,
        first_name varchar(256),
        last_name varchar(256) NOT NULL,
        email varchar(256),
        linkedin_url varchar(256),
        headshot_url varchar(256),
        discord_handle varchar(256),
        brief_bio varchar(256),
        date_joined varchar(256) NOT NULL,
        PRIMARY KEY (id)
    );


# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

insert into people (id,first_name,last_name,email,linkedin_url,headshot_url,discord_handle,brief_bio,date_joined) values 
(1,'Joe', 'Person 1', 'person1@gmail.com', 'linkedin.com/person1', 'person1headshot.jpg', '@person1', 'Computer Scientist', '11/23/19'),
(2,'Jerry', 'Person 2', 'person2@gmail.com', 'linkedin.com/person2', 'person2headshot.jpg', '@person2', 'Project Manager', '01/5/16'),
(3,'John', 'Person 3', 'person3@gmail.com', 'linkedin.com/person3', 'person3headshot.jpg', '@person3', 'Systems Engineer', '10/04/18'),
(4,'Joseph', 'Person 4', 'person4@gmail.com', 'linkedin.com/person4', 'person4headshot.jpg', '@person4', 'Therapist', '04/23/19'),
(5,'Joey', 'Person 5', 'person5@gmail.com', 'linkedin.com/person5', 'person5headshot.jpg', '@person5', 'Surgeon', '07/4/13'),
(6,'Jay', 'Person 6', 'person6@gmail.com', 'linkedin.com/person6', 'person6headshot.jpg', '@person6', 'Physician', '05/30/19'),
(7,'Johnny', 'Person 7', 'person7@gmail.com', 'linkedin.com/person7', 'person7headshot.jpg', '@person7', 'Data Scientist', '05/30/19'),
(8,'Johnathan', 'Person 8', 'person8@gmail.com', 'linkedin.com/person8', 'person8headshot.jpg', '@person8', 'Dog Walker', '05/30/19'),
(9,'Jorge', 'Person 9', 'person9@gmail.com', 'linkedin.com/person9', 'person9headshot.jpg', '@person9', 'Neuroscientist', '05/30/19'),
(10,'June', 'Person 10', 'person10@gmail.com', 'linkedin.com/person10', 'person10headshot.jpg', '@person10', 'Doctor', '05/30/19');



# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE peopleskills (
        id int auto_increment NOT NULL,
        skills_id int NOT NULL,
        people_id int NOT NULL,
        date_acquired date default (current_date) NOT NULL,
        primary key (id),
        foreign key (skills_id) references skills(id) on delete cascade,
        foreign key (people_id) references people(id),
        unique (skills_id,people_id)
    );

# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.
 

INSERT INTO peopleskills(people_id, skills_id) VALUES
 (1, 1),
 (1, 3),
 (1, 6),
 (2, 3),
 (2, 4),
 (2, 5),
 (3, 1),
 (3, 5),
 (5, 3),
 (5, 6),
 (6, 2),
 (6, 3),
 (6, 4),
 (7, 3),
 (7, 5),
 (7, 6),
 (8, 1),
 (8, 3),
 (8, 5),
 (8, 6),
 (9, 2),
 (9, 5),
 (9, 6),
 (10, 1),
 (10, 4),
 (10, 5);


# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles (
        id int,
        name varchar(255),
        sort_priority int,
        PRIMARY KEY (id)
    );


# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles(id, roles_name, roles_sort_priority) values
(1,'Designer', 10),
(2,'Developer', 20),
(3,'Recruit', 30),
(4,'Team Lead', 40),
(5,'Boss', 50),
(6,'Mentor', 60)


# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles (
    id int NOT NULL,
    people_id int NOT NULL,
    role_id int NOT NULL,
    date_assigned varchar(255) NOT NULL 
);


# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

INSERT INTO peopleroles(id, people_id, role_id, date_assigned) values
(1,1,2,'1/1/2020'),
(2,2,5,'1/1/2020'),
(2,2,6,'1/1/2020'),
(3,3,2,'1/1/2020'),
(3,3,4,'1/1/2020'),
(4,4,3,'1/1/2020'),
(5,5,3,'1/1/2020'),
(6,6,2,'1/1/2020'),
(6,6,1,'1/1/2020'),
(7,7,1,'1/1/2020'),
(8,8,1,'1/1/2020'),
(8,8,4,'1/1/2020'),
(9,9,2,'1/1/2020'),
(10,10,2,'1/1/2020'),
=======
# hw7-ddl.sql

## DO NOT RENAME OR OTHERWISE CHANGE THE SECTION TITLES OR ORDER.
## The autograder will look for specific code sections. If it can't find them, you'll get a "0"

# Code specifications.
# 0. Where there a conflict between the problem statement in the google doc and this file, this file wins.
# 1. Complete all sections below.
# 2. Table names must MATCH EXACTLY to schemas provided.
# 3. Define primary keys in each table as appropriate.
# 4. Define foreign keys connecting tables as appropriate.
# 5. Assign ID to skills, people, roles manually (you must pick the ID number!)
# 6. Assign ID in the peopleskills and peopleroles automatically (use auto_increment)
# 7. Data types: ONLY use "int", "varchar(255)", "varchar(4096)" or "date" as appropriate.

# Section 1
# Drops all tables.  This section should be amended as new tables are added.

SET FOREIGN_KEY_CHECKS=0;
DROP TABLE IF EXISTS people;
DROP TABLE IF EXISTS skills;
DROP TABLE IF EXISTS peopleskills;
DROP TABLE IF EXISTS roles;
DROP TABLE IF EXISTS peopleroles;
# ... 
SET FOREIGN_KEY_CHECKS=1;

# Section 2
# Create skills( id,name, description, tag, url, time_commitment)
# ID, name, description and tag cannot be NULL. Other fields can default to NULL.
# tag is a skill category grouping.  You can assign it based on your skill descriptions.
# time committment offers some sense of how much time was required (or will be required) to gain the skill.
# You can assign the skill descriptions.  Please be creative!

    CREATE TABLE skills (
        id int not null,
        name varchar(255) not null,
        description varchar(255) not null,
        tag varchar(255) not null,
        url varchar(255),
        time_commitment varchar(255),
        primary key (id)
    );


# Section 3
# Populate skills
# Populates the skills table with eight skills, their tag fields must exactly contain “Skill 1”, “Skill 2”, etc.
# You can assign skill names.  Please be creative!

INSERT INTO skills (id, name, description, tag, url, time_commitment ) values
    (1, 'kick boxing', 'visualize this!', 'Skill 1', 'mma.com', '3 days a week'),
    (2, 'python coding', 'writing python programs', 'Skill 2', 'leetcode.com', 'everday'),
    (3, 'basketball', 'can dunk', 'Skill 3', 'nba.com', '5 days a week'),
    (4, 'knitting', 'make sweaters', 'Skill 4', 'knit.com', 'everday'),
    (5, 'piano', 'beautiful music', 'Skill 5', 'music.com', '3 days a week'),
    (6, 'CPR', 'Certified', 'Skill 6', 'cpr.com', 'once a month'),
    (7, 'Korean', 'Able to speak korean fluently', 'Skill 7', 'korea.com', 'everyday'),
    (8, 'Cooking', 'Able to cook meals', 'Skill 8', 'cooking.com', 'everyday');

# Section 4
# Create people( id,first_name, last_name, email, linkedin_url, headshot_url, discord_handle, brief_bio, date_joined)
# ID cannot be null, Last name cannot be null, date joined cannot be NULL.
# All other fields can default to NULL.

    CREATE TABLE people (
        id int NOT NULL,
        first_name varchar(256),
        last_name varchar(256) NOT NULL,
        email varchar(256),
        linkedin_url varchar(256),
        headshot_url varchar(256),
        discord_handle varchar(256),
        brief_bio varchar(256),
        date_joined varchar(256) NOT NULL,
        PRIMARY KEY (id)
    );


# Section 5
# Populate people with six people.
# Their last names must exactly be “Person 1”, “Person 2”, etc.
# Other fields are for you to assign.

insert into people (id,first_name,last_name,email,linkedin_url,headshot_url,discord_handle,brief_bio,date_joined) values 
(1,'Joe', 'Person 1', 'person1@gmail.com', 'linkedin.com/person1', 'person1headshot.jpg', '@person1', 'Computer', '11/23/19'),
(2,'Jerry', 'Person 2', 'person2@gmail.com', 'linkedin.com/person2', 'person2headshot.jpg', '@person2', 'Project Manager', '01/5/16'),
(3,'John', 'Person 3', 'person3@gmail.com', 'linkedin.com/person3', 'person3headshot.jpg', '@person3', 'Systems Engineer', '10/04/18'),
(4,'Joseph', 'Person 4', 'person4@gmail.com', 'linkedin.com/person4', 'person4headshot.jpg', '@person4', 'Therapist', '04/23/19'),
(5,'Joey', 'Person 5', 'person5@gmail.com', 'linkedin.com/person5', 'person5headshot.jpg', '@person5', 'Surgeon', '07/4/13'),
(6,'Jay', 'Person 6', 'person6@gmail.com', 'linkedin.com/person6', 'person6headshot.jpg', '@person6', 'Physician', '05/30/19'),
(7,'Johnny', 'Person 7', 'person7@gmail.com', 'linkedin.com/person7', 'person7headshot.jpg', '@person7', 'Data Scientist', '05/30/19'),
(8,'Johnathan', 'Person 8', 'person8@gmail.com', 'linkedin.com/person8', 'person8headshot.jpg', '@person8', 'Dog Walker', '05/30/19'),
(9,'Jorge', 'Person 9', 'person9@gmail.com', 'linkedin.com/person9', 'person9headshot.jpg', '@person9', 'Neuroscientist', '05/30/19'),
(10,'June', 'Person 10', 'person10@gmail.com', 'linkedin.com/person10', 'person10headshot.jpg', '@person10', 'Doctor', '05/30/19');



# Section 6
# Create peopleskills( id, skills_id, people_id, date_acquired )
# None of the fields can ba NULL. ID can be auto_increment.

CREATE TABLE peopleskills (
        id int auto_increment NOT NULL,
        skills_id int NOT NULL,
        people_id int NOT NULL,
        date_acquired date default (current_date) NOT NULL,
        primary key (id),
        foreign key (skills_id) references skills(id) on delete cascade,
        foreign key (people_id) references people(id),
        unique (skills_id,people_id)
    );

# Section 7
# Populate peopleskills such that:
# Person 1 has skills 1,3,6;
# Person 2 has skills 3,4,5;
# Person 3 has skills 1,5;
# Person 4 has no skills;
# Person 5 has skills 3,6;
# Person 6 has skills 2,3,4;
# Person 7 has skills 3,5,6;
# Person 8 has skills 1,3,5,6;
# Person 9 has skills 2,5,6;
# Person 10 has skills 1,4,5;
# Note that no one has yet acquired skills 7 and 8.
 
-- Corrected peopleskills INSERT statements
INSERT INTO peopleskills(people_id, skills_id) VALUES
 (1, 1),
 (1, 3),
 (1, 6),
 (2, 3),
 (2, 4),
 (2, 5),
 (3, 1),
 (3, 5),
 (5, 3),
 (5, 6),
 (6, 2),
 (6, 3),
 (6, 4),
 (7, 3),
 (7, 5),
 (7, 6),
 (8, 1),
 (8, 3),
 (8, 5),
 (8, 6),
 (9, 2),
 (9, 5),
 (9, 6),
 (10, 1),
 (10, 4),
 (10, 5);


# Section 8
# Create roles( id, name, sort_priority )
# sort_priority is an integer and is used to provide an order for sorting roles

CREATE TABLE roles(
    roles_id int,
    roles_name varchar(255),
    roles_sort_priority int,
    PRIMARY KEY (roles_id)
);


# Section 9
# Populate roles
# Designer, Developer, Recruit, Team Lead, Boss, Mentor
# Sort priority is assigned numerically in the order listed above (Designer=10, Developer=20, Recruit=30, etc.)

INSERT INTO roles(roles_id, roles_name, roles_sort_priority) values
(1,'Designer', 10),
(2,'Developer', 20),
(3,'Recruit', 30),
(4,'Team Lead', 40),
(5,'Boss', 50),
(6,'Mentor', 60)


# Section 10
# Create peopleroles( id, people_id, role_id, date_assigned )
# None of the fields can be null.  ID can be auto_increment

CREATE TABLE peopleroles (
    peopleroles_id int NOT NULL,
    peopleroles_people_id int NOT NULL,
    peopleroles_role_id int NOT NULL,
    peoplerolls_date_assigned varchar(255) NOT NULL 
);


# Section 11
# Populate peopleroles
# Person 1 is Developer 
# Person 2 is Boss, Mentor
# Person 3 is Developer and Team Lead
# Person 4 is Recruit
# person 5 is Recruit
# Person 6 is Developer and Designer
# Person 7 is Designer
# Person 8 is Designer and Team Lead
# Person 9 is Developer
# Person 10 is Developer and Designer

INSERT INTO peopleroles(peopleroles_id, peopleroles_people_id, peopleroles_role_id, peoplerolls_date_assigned) values
(1,1,2,'1/1/2020'),
(2,2,5,'1/1/2020'),
(2,2,6,'1/1/2020'),
(3,3,2,'1/1/2020'),
(3,3,4,'1/1/2020'),
(4,4,3,'1/1/2020'),
(5,5,3,'1/1/2020'),
(6,6,2,'1/1/2020'),
(6,6,1,'1/1/2020'),
(7,7,1,'1/1/2020'),
(8,8,1,'1/1/2020'),
(8,8,4,'1/1/2020'),
(9,9,2,'1/1/2020'),
(10,10,2,'1/1/2020'),
>>>>>>> f159370b31512c8c4d3e4fce83446148e24da115
(10,10,1,'1/1/2020');