create database if not exists education_management;

/*create student table include fields*/
create table if not exists education_management.student (
	id int not null auto_increment primary key,
    full_name varchar(50),
    dob varchar(20),
    gender varchar(3),
    pob varchar(20),
    mobile varchar(12),
    email varchar(50)
);

/*add 7 rows in student table*/
insert into education_management.student (full_name, dob, gender, pob, mobile, email) values 
('Nguyen Thanh Nhan', '01/01/1998', 'Nam', 'Can Tho', '0901234561' , 'nhan@gmail.com'), 
('Pham Thu Huong', '01/01/1998', 'Nu', 'Vinh Long', '0901234562' , 'huong@gmail.com'),
('Nguyen Nhu Ngoc', '01/01/1998', 'Nu', 'Soc Trang', '0901234563' , 'ngoc@gmail.com'),
('Bui Thanh Bao', '01/01/1998', 'Nam', 'Soc Trang', '0901234564' , 'bao@gmail.com'),
('Le My Nhan', '01/01/1998', 'Nu', 'Can Tho', '0901234565' , 'nhan@gmail.com'),
('Tan Thuc Bao', '01/01/1998', 'Nam', 'An Giang', '0901234566' , 'bao@gmail.com'),
('Trinh Giao Kim', '01/01/1998', 'Nam', 'Bac Lieu', '0901234567' , 'kim@gmail.com');

select * from education_management.student;

alter table education_management.student add clazz_id int not null default (1);

/*create clazz table include fields*/
create table if not exists education_management.clazz (
	id int not null auto_increment primary key,
    name varchar(50)
);

/*add 3 rows in student table*/
insert into education_management.clazz (name) values 
('Frontend'), ('Backend'), ('FullStack');

select * from education_management.clazz;

update education_management.student set clazz_id = 2 where id in (3, 4);
update education_management.student set clazz_id = 3 where id in (5, 6, 7);

select * from education_management.student;

-- delete from education_management.student where id in (8, 9, 10, 11, 12, 13, 14);

alter table education_management.clazz add dep_id int not null default (1);

select * from education_management.clazz;

/*create department table include fields*/
create table if not exists education_management.department (
	id int not null auto_increment primary key,
    name varchar(50)
);

select * from education_management.department;

/*add 2 rows in student table*/
insert into education_management.department (name) values 
('Su Van Hanh'),  ('Cao Thang');

/*create student table include fields*/
create table if not exists education_management.subject (
	id int not null auto_increment primary key,
    name varchar(50),
    hours int
);

select * from education_management.subject;

/*add 2 rows in student table*/
insert into education_management.subject (name, hours) values 
('Java', 63), ('JavaScript', 63), ('NodeJS', 63), ('ReactJS', 63), ('AngularJS', 63);

/*create student table include fields*/
create table if not exists education_management.lecture (
	id int not null auto_increment primary key,
    full_name varchar(50),
    major varchar(20)
);

select * from education_management.lecture;

/*add 3 rows in student table*/
insert into education_management.lecture (full_name, major) values 
('Nguyen Van Teo', 'Frontend'), 
('Le Thi Ty', 'Backend'), 
('Tran Le Tin', 'FullStack');

alter table education_management.lecture add dep_id int not null default (1);
alter table education_management.subject add lecture_id int not null default (1);

select * from education_management.subject;
select * from education_management.lecture;

update education_management.subject set lecture_id = 2 where id in (1, 2);

/*create score table inclue fields*/
create table if not exists education_management.score(
	id int not null auto_increment primary key,
    student_id int not null,
    subject_id int not null,
    exam_times int,
	exam_score int
);

alter table education_management.score add unique key(student_id, subject_id);

select * from education_management.student;
select * from education_management.subject;
select * from education_management.score;

/*add 7 rows in student table*/
insert into education_management.score (student_id, subject_id, exam_times, exam_score) values
(1, 1, 1, 7),
(2, 2, 1, 8),
(3, 4, 1, 7),
(4, 5, 1, 7),
(5, 3, 1, 8),
(6, 2, 1, 7),
(7, 3, 2, 7);

-- add foreign key for student table on clazz_id field
alter table student add constraint fk_clazz foreign key (clazz_id) references clazz(id);

-- add foreign key for department table on dep_id field
alter table clazz add constraint fk_dep foreign key (dep_id) references department(id);

-- add foreign key for lecture table on dep_id field
alter table lecture add constraint fk_dep foreign key (dep_id) references department(id);




