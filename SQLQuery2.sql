create table Department
(
Id int not null primary key,
DepartmentName nvarchar(50),
Location nvarchar(50),
DepartmentHead nvarchar(50)
)

create table Employees
(
Id int not null primary key,
Name nvarchar(50),
Gender nvarchar(50),
Salary nvarchar(50),
DepartmentId int
)

insert into Employees values
(1, 'Tom', 'Male', 4000, 1)

insert into Employees values
(2, 'Pam','Female',3000,3)
insert into Employees values
(3, 'John','Male',3500,1)
insert into Employees values
(4,'Sam','Male',4500,2)
insert into Employees values
(5,'Todd','Male',2800,2)
insert into Employees values
(6,'Ben','Male',7000,1)
insert into Employees values
(7,'Sara','Female',4800,3)
insert into Employees values
(8,'Valarie','Female',5500,1)
insert into Employees values
(9,'James','Male',6500,NULL)
insert into Employees values
(10,'Russell','Male',8800,NULL)

select * from Employees


insert into Department values
(1, 'IT', 'London', 'Rick'),
(2,'Payroll','Delhi','Ron'),
(3, 'HR','New York', 'Christie'),
(4,'Other Department','Sydney','Cindrella')

select * from Department
select * from Employees

--left join
select Name, Gender, Salary, DepartmentName
from Employees 
left join Department
on Employees.DepartmentId =Department.Id

--arvutab kõikide palgad kokku, Employees tabelis
select sum(cast(Salary as int)) from Employees
--kõige madalam palk
select min(cast(salary as int)) from Employees

--palgad linnade lõikes
select location, sum(cast(salary as int)) as TotalSalary
from Employees
left join department on Employees.DepartmentId =Department.Id
group by location

alter table Employees
add City nvarchar(30)

update Employees
set City = 'New York'
where Id = 10

select * from Employees
-- palgad linnade ja soos osas 
select city,gender, sum(cast(salary as int)) as TotalSalary
from Employees group by City, gender
--sama päring nagu eelmine aga linnad on tähestikulises järjestuses
select city,gender, sum(cast(salary as int)) as TotalSalary
from Employees group by City, gender order by city

--loeb ära ridade arvu Employees tabelis
select count(*) from employees

--mitu töötajat on soo ja linna kaupa
select count(Id) as [Töötajate arv], gender, city  from Employees
group by Gender, city

--kuvab ainult kõik naised linnade kaupa

select count(Id) as [Töötajate arv], gender, city  from Employees
where gender = 'Female'
group by Gender, city


--kuvab ainult mehed linnade kaupa
--kasutame having 
select count(Id) as [Töötajate arv], gender, city  from Employees
group by Gender, city having gender = 'Male'


--see ei tööta
select * from Employees where sum(cast(salary as int)) > 4000
--töötav alternatiiv
SELECT gender, city, SUM(CAST(salary AS int)) AS TotalSalary, COUNT(Id) AS InimesteArv 
FROM employees 
GROUP BY gender, city 
HAVING SUM(CAST(salary AS int)) > 4000;

--loome tabeli, milles hakatase automaatselt nummerdama Id-d
create table Test1
(id int identity(1,1),
value nvarchar(20))

insert into Test1 values('X')
select * from Test1
