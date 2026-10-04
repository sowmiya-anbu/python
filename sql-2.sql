
# part-1 --> database and table creation

create database school_db;
use school_db; 

create table students(
student_id int primary key,
name varchar(50) not null,
age int,
gender varchar(10),
marks int,
city varchar(20)
);
use school_db;
create table courses(
course_id int primary key,
course_name varchar(100) not null,
duration_months int
); 
use school_db;
create table enrollments(
enroll_id int primary key,
student_id int,
course_id int
);

# part-2 --> insert data

insert into students values
(1,'varsha',20,'female',80,'chennai'),
(2,'karthik',22,'male',90,'mumbai'),
(3,'priya',24,'female',85,'bangalore'),
(4,'anbu',21,'male',98,'noida'),
(5,'deepika',25,'female',95,'hyderabad');

insert into courses values
(101,'python',6),
(102,'ai',10),
(103,'java',7); 

insert into enrollments values
(3301,1,103),
(3302,2,102),
(3303,3,101),
(3304,4,102),
(3305,5,103);

# part-3 --> basics select queries

select * from students;
select distinct name,marks from students ;
select course_name from courses;

# part-4 --> where clause

select * from students
where age > 20;
select * from students
where marks > 80;
select * from students
where city = 'chennai';
select * from students
where marks < 50;

# part-5 --> comparison operators

select * from students
where age = 21;
select * from students
where marks >= 75;
select * from students
where marks <= 40;
select * from students
where age != 20;

# part-6 --> logical operators 

select * from students
where marks = 70 and city ='chennai';
select * from students
where age > 18 and marks > 60;
select * from students
where city = 'chennai' or city = 'bangalore';
select * from students
where marks < 40 or marks > 90;
select * from students
where city != 'chennai';
select * from students
where marks <= 60;

# part-7 --> between operator 

select * from students
where marks between 60 and 80;
select * from students
where age between 18 and 22; 

# part-8 --> order by 

select * from students
order by marks asc; 
select * from students
order by marks desc; 
select * from students
order by name; 
select * from students 
order by age desc; 
select name,marks from students
order by name , marks desc;
select name from students
where name like "A%";
select name from students
where name like "%A";
select name from students
where name not like "A%";
update students
set name = 'ramya', marks = 95
where student_id =1;



show databases;
show tables;