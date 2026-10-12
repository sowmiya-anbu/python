create database interview;
use interview;
CREATE TABLE employees (
    emp_id INT PRIMARY KEY,
    name VARCHAR(50),
    department VARCHAR(50),
    salary INT,
    city VARCHAR(50)
);

INSERT INTO employees VALUES
(1, 'Arun', 'IT', 50000, 'Chennai'),
(2, 'Priya', 'HR', 40000, 'Chennai'),
(3, 'Kumar', 'IT', 60000, 'Bangalore'),
(4, 'Divya', 'Finance', 45000, 'Chennai'),
(5, 'Ravi', 'IT', 50000, 'Hyderabad'),
(6, 'Meena', 'HR', 55000, 'Bangalore'),
(7, 'Karthik', 'Finance', 35000, 'Chennai'); 

select * from employees; 
select name,salary from employees;
select name,salary from employees
where salary > 50000;
select name from employees where city = "chennai"
select * from employees
order by salary desc;
select * from employees
where salary between 40000 and 50000;
select * from employees
where department in ("it" ,"hr");
select count(*) as total_employees from employees;
select distinct department from employees; 

select max(salary) from employees;
select avg(salary) from employees;
select min(salary) from employees;
select sum(salary) from employees;
select department,count(*) from employees
group by department;
select department,avg(salary) from employees
group by department;
select department,count(*) from employees
group by department
having count(*) > 2;
select department,avg(salary) from employees
group by department
having avg(salary) > 45000; 
select max(salary) from employees where salary < (select max(salary) from employees);

select * from employees where salary = (select max(salary) from employees); 
select salary, count(*) from employees group by salary having count(*) > 1 ;
select * from employees where salary > (select avg(salary) from employees); 
select * from employees where department = "IT";
select city,count(*) from employees group by city ;
set sql_safe_updates = 0;
update employees set salary = salary * 1.10 where department = "IT";
set sql_safe_updates = 1;
select * from employees;
select * from employees where name like "%A";
select * from employees where salary <> 55000; 
select department,max(salary) from employees group by department;
select * from employees where city = "chennai" and salary > 40000;