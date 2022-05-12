# hr database exercises


#1. Write a query to display the names (first_name, last_name) using alias name “First Name", "Last Name"
select first_name as "First Name", 
last_name as "Last Name" from hr.employees;

#2  Write a query to get unique department ID from employee table
select distinct department_id 
from hr.employees;

 #3 Write a query to get all employee details from the employee table order by first name, descending
select * from hr.employees 
order by first_name desc;

#4. Write a query to get the names (first_name, last_name), salary, PF of all the employees (PF is calculated as 15% of salary)
select first_name, last_name,salary,salary*15 as PF 
from hr.employees;

#5.  Write a query to get the employee ID, names (first_name, last_name), salary in ascending order of salary
select employee_id,first_name,last_name,salary 
from hr.employees
 order by salary asc;

#6.  Write a query to get the total salaries payable to employees
select sum(salary) 
from hr.employees;

#7.  Write a query to get the maximum and minimum salary from employees table
select max(salary),min(salary) 
from hr.employees;

#8.  Write a query to get the average salary and number of employees in the employees table
select avg(salary),count(*) 
from hr.employees;

#9.  Write a query to get the number of employees working with the company
select count(*) 
from hr.employees ;

#10.  Write a query to get the number of jobs available in the employees table
select distinct(job_id) 
from hr.employees;

#11. Write a query get all first name from employees table in upper case
select *, ucase(first_name)
 from hr.employees;

#12.  Write a query to get the first 3 characters of first name from employees table
select left(first_name,3) 
from hr.employees;

#13. Write a query to get first name from employees table after removing white spaces from both side
select trim(first_name) 
from hr.employees;

#14. Write a query to get the length of the employee names (first_name, last_name) from employees table
select first_name,last_name,length(first_name)+length(last_name) as "length of employee names" from hr.employees;

#15. Write a query to check if the first_name fields of the employees table contains numbers
select*from hr.employees where first_name regexp '[0-9]';

#16  Write a query to display the name (first_name, last_name) and salary for all employees whose salary is not in the range $10,000 through $15,000
select first_name,last_name,salary
 from hr.employees where salary
 not between 10000 and 15000 ;

#17  Write a query to display the name (first_name, last_name) and department ID of all employees in departments 30 or 100 in ascending order
select first_name,last_name,department_id from
 hr.employees where department_id in (30,100)
 order by department_id asc;

#18  Write a query to display the name (first_name, last_name) and salary for all employees whose salary is 
# not in the range $10,000 through $15,000 and are in department 30 or 100

select first_name,last_name,salary from 
hr.employees where salary not between 10000 and 15000 and
 department_id in (30,100);

#19  Write a query to display the name (first_name, last_name) and hire date for all employees who were hired in 1987
select first_name,last_name,hire_date from 
hr.employees where year(hire_date) like '1987%';

#20  Write a query to display the first_name of all employees who have both "b" and "c" in their first name
select first_name from hr.employees where first_name
 like '%b%' and first_name like '%c%';

#21. Write a query to display the last name, job, and salary for all employees whose job is that of a 
# Programmer or a Shipping Clerk, and whose salary is not equal to $4,500, $10,000, or $15,000

select last_name, job_id, salary
from hr.employees
where job_id in ('IT_PROG', 'SH_CLERK')
and salary not in (4500,10000, 15000);

#22. write a query to display the last name of employees whose names have exactly 6 characters
select last_name from hr.employees
 where last_name like '__';

#23. Write a query to display the last name of employees having 'e' as the third character
select last_name 
from hr.employees 
where last_name like '__e%';

#24. Write a query to get the job_id and related employee's id
# Partial output of the query : 
# job_id Employees ID
# AC_ACCOUNT206
# AC_MGR 205
# AD_ASST 200
# AD_PRES 100
# AD_VP 101 ,102
# FI_ACCOUNT 110 ,113 ,111 ,109 ,112

select job_id, group_concat(employee_id, ' ')  'Employees ID' 
from hr.employees group by job_id;

#25. Write a query to update the portion of the phone_number in the employees table, within the phone number the substring '124' will be replaced by '999'
update hr.employees 
set phone_number = replace(phone_number, '124', '999') 
where phone_number like '%124%';

#26. Write a query to get the details of the employees where the length of the first name greater than or equal to 8
select* from hr.employees where length(first_name)>=8; 

#27. Write a query to append '@example.com' to email field
select concat(email,'@examole.com') from hr.employees;

#28. Write a query to extract the last 4 character of phone numbers
select right(phone_number,4) from hr.employees;

#29. Write a query to get the last word of the street address
select street_address, 
substring_index(replace(replace(replace(street_address,',',' '),')',' '),'(',' '),' ',-1) 
as 'Last-word-of-street_address' 
from hr.locations;

#30. Write a query to get the locations that have minimum street length
select * from hr.locations
where length(street_address) <= 
(select min(length(street_address)) 
from hr.locations);

#31. Write a query to display the first word from those job titles which contains more than one words
select job_title, 
substr(job_title,1, instr(job_title, ' ')-1)
from hr.jobs;

#32. Write a query to display the length of first name for employees where last name contain character 'c' after 2nd position
select first_name, last_name 
from hr.employees 
where instr(last_name,'C') > 2;

#33. Write a query that displays the first name and the length of the first name for all employees whose 
# name starts with the letters 'A', 'J' or 'M'. Give each column an appropriate label. Sort the results by the employees' first names

select first_name "Name",length(first_name) "Length"from hr.employees
where first_name like 'J%'or first_name like 'M%'or first_name like 'A%'
order by first_name ;

#34. Write a query to display the first name and salary for all employees. Format the salary to be 10 
# characters long, left-padded with the $ symbol. Label the column SALARY

select first_name,lpad(salary, 10, '$') SALARY 
from hr.employees;

#35. Write a query to display the first eight characters of the employees' first names and indicates the 
# amounts of their salaries with '$' sign. Each '$' sign signifies a thousand dollars. Sort the data in  descending order of salary 

select left(first_name, 8),
repeat('$',floor(salary/1000))
'salary($)',salary
from hr.employees order by salary desc;


#36. Write a query to display the employees with their code, first name, last name and hire date who hired 
# either on seventh day of any month or seventh month in any year

select employee_id,first_name,last_name,hire_date 
from hr.employees 
where position("07" in date_format(hire_date, '%d %m %Y'))>0;



# Northwind Database Excercises


#1. Write a query to get Product name and quantity/unit
select ProductName, QuantityPerUnit 
from northwind.Products;

#2. Write a query to get current Product list (Product ID and name)
select ProductID, ProductName 
from northwind.Products 
where Discontinued = "False"
order by ProductName;

#3. Write a query to get discontinued Product list (Product ID and name)
select ProductID, ProductName 
from northwind.Products 
where Discontinued = 1
order by ProductName;

#4. Write a query to get most expense and least expensive Product list (name and unit price)
select ProductName, UnitPrice 
from northwind.Products 
order by UnitPrice desc;

#5. Write a query to get Product list (id, name, unit price) where current products cost less than $20
select ProductID, ProductName, UnitPrice from northwind.Products
where (((UnitPrice)<20) and ((Discontinued)=False))
order by UnitPrice desc;

#6. Write a query to get Product list (id, name, unit price) where products cost between $15 and $25
select ProductName, UnitPrice from northwind.Products
where (((UnitPrice)>=15 And (UnitPrice)<=25) 
and ((Products.Discontinued)=False))
order by Products.UnitPrice desc;

#7. Write a query to get Product list (name, unit price) of above average price
select distinct ProductName, UnitPrice
from northwind.Products
where UnitPrice > (select avg(UnitPrice) from northwind.Products)
order by UnitPrice;

#8. Write a query to get Product list (name, unit price) of ten most expensive products
select distinct ProductName as Ten_Most_Expensive_Products, UnitPrice
from northwind.Products as a where 10 >= (select count(distinct UnitPrice) from northwind.Products as b
where b.UnitPrice >= a.UnitPrice)order by UnitPrice desc;

#9. Write a query to count current and discontinued products
select Count(ProductName) 
from northwind.Products 
group by Discontinued;

#10. Write a query to get Product list (name, units on order , units in stock) of stock is less than the quantity on order
select ProductName,  UnitsOnOrder , UnitsInStock from northwind.Products
where (((Discontinued)=False) and ((UnitsInStock)<UnitsOnOrder));