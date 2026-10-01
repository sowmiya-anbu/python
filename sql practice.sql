create database problem;
use problem; 

create table department(
department_id int primary key,
department_name varchar(50),
location varchar(20)
);

insert into department values
(10,'Engineering','New York'),
(20,'Sales','Chicago'),
(30,'HR','Boston');

create table employee (
emp_id int primary key,
emp_name varchar(30),
department_id int,
foreign key (department_id) references department(department_id),
manager_id int,
foreign key (manager_id) references employee(emp_id),
job_title varchar(50),
salary decimal(10,2),
join_date date,
email varchar(100)
);

insert into employee values
(1,'John Smith',10,NULL,'Director',120000,'2018-03-01','john@gmail.com'),
(2,'Aman Verma',10,'1','Manager',85000,'2019-06-15','aman@gmail.com'),
(3,'priya Singh',20,'1','Manager',90000,'2020-01-10','priya@gmail.com'),
(4,'Rahul Mehta',20,'3','Analyst',55000,'2021-09-20','rahul@gmail.com'),
(5,'Sara Khan',10,'2','Analyst',52000,'2022-02-05','sara@gmail.com');

create table customer (
customer_id int primary key,
customer_name varchar(30),
email varchar(100),
phone varchar(20),
signup_date date,
country varchar(20)
); 

insert into customer values
(1, 'Arun Kumar', 'arun@gmail.com', '9876543210', '2024-01-15', 'India'),
(2, 'Priya', 'priya@gmail.com', '9876543211', '2024-02-20', 'India'),
(3, 'Ravi', 'ravi@gmail.com', '9876543212', '2024-03-10', 'India'),
(4, 'Divya', 'divya@gmail.com', '9876543213', '2024-04-05', 'India'),
(5, 'Karthik', 'karthik@gmail.com', '9876543214', '2024-05-12', 'India'),
(6, 'Sneha', 'sneha@gmail.com', '9876543215', '2024-06-18', 'India'),
(7, 'Vijay', 'vijay@gmail.com', '9876543216', '2024-07-22', 'India'),
(8, 'Meena', 'meena@gmail.com', '9876543217', '2024-08-14', 'India'),
(9, 'Suresh', 'suresh@gmail.com', '9876543218', '2024-09-25', 'India'),
(10, 'Anitha', 'anitha@gmail.com', '9876543219', '2024-10-30', 'India'); 

create table orders (
order_id int primary key,
customer_id int,
foreign key (customer_id) references customer(customer_id),
order_date date,
amount decimal(10,2)
);

INSERT INTO orders VALUES
(1, 1, '2024-01-20', 1500.00),
(2, 2, '2024-02-25', 2500.50),
(3, 3, '2024-03-15', 1200.00),
(4, 4, '2024-04-10', 3500.75),
(5, 5, '2024-05-18', 1800.25),
(6, 6, '2024-06-22', 4200.00),
(7, 7, '2024-07-28', 2750.50),
(8, 8, '2024-08-20', 3200.00),
(9, 9, '2024-09-30', 1950.75),
(10, 10, '2024-10-15', 5000.00);

create table category (
category_id int primary key,
category_name varchar(50)
);

INSERT INTO category VALUES
(1, 'Electronics'),
(2, 'Clothing'),
(3, 'Groceries'),
(4, 'Furniture'),
(5, 'Books'),
(6, 'Sports'),
(7, 'Beauty'),
(8, 'Toys'),
(9, 'Footwear'),
(10, 'Accessories');

create table product (
product_id int primary key,
product_name varchar(30),
category_id int,
foreign key (category_id) references category(category_id),
price int,
vendor_id int,
stock_quantity int
);

INSERT INTO product VALUES
(1, 'Laptop', 1, 55000, 101, 25),
(2, 'T-Shirt', 2, 800, 102, 50),
(3, 'Rice Bag', 3, 1200, 103, 40),
(4, 'Office Chair', 4, 7500, 104, 15),
(5, 'Python Book', 5, 650, 105, 30),
(6, 'Cricket Bat', 6, 2500, 106, 20),
(7, 'Face Wash', 7, 450, 107, 35),
(8, 'Toy Car', 8, 900, 108, 25),
(9, 'Running Shoes', 9, 2200, 109, 18),
(10, 'Smart Watch', 10, 3500, 110, 22);

create table order_items (
order_id int,
foreign key (order_id) references orders(order_id),
product_id int,
foreign key (product_id) references product(product_id),
quantity int,
price decimal(10,2)
); 

INSERT INTO order_items VALUES
(1, 1, 2, 800.00),
(1, 3, 1, 1200.00),
(2, 2, 3, 800.00),
(2, 5, 2, 650.00),
(3, 4, 1, 7500.00),
(4, 6, 2, 2500.00),
(5, 7, 3, 450.00),
(6, 8, 2, 900.00),
(7, 9, 1, 2200.00),
(8, 10, 1, 3500.00); 

select * from employee 
where salary > (select avg(salary) from employee); 

select department_id,count(*) as total_employees
from employee
group by department_id; 

select * from employee 
where manager_id is null; 

select * from employee
where email is null; 

select * from employee
where extract(year from join_date) = extract(year from current_date); 

select * from (
select e.*,
	row_number() over (partition by department_id
order by salary desc) as rnk
from employee e
) ranked
where rnk <= 3;

select emp_id,department_id,salary,max(salary)
from employee
group by emp_id  
order by salary desc
limit 3;

select * from employee
where emp_name like 'A%'; 

select * from employee
where emp_name like '%n'; 

select department_id,sum(salary) as total_salary
from employee
group by department_id;

select max(salary) as highest_salary,min(salary) as lowest_salary 
from employee; 

select * from employee 
where salary between 40000 and 80000; 

select count(distinct job_title) as distinct_titles
from employee; 

select * from employee
where salary is not null and salary > 0; 

select * from employee
order by salary desc; 

select min(salary) as second_lowest_salary
from employee
where salary > (select min(salary) from employee); 

select department_id,avg(salary) as avg_salary
from employee
group by department_id
having avg(salary) > 50000; 

select * from employee
where job_title in ('Manager' , 'Director'); 

select * from employee
where join_date between '2021-09-19' and '2022-02-06'; 

select count(*) as highearners
from employee
where salary > 100000; 

