--**SQL_DDL. HW_1**

--*Таблица employees*
--1. Создать таблицу employees
--- id. serial,  primary key,
--- employee_name. Varchar(50), not null

create table employees(
	id serial primary key,
	employee_name Varchar(50) not null
);

--2. Наполнить таблицу employee 70 строками.

insert into employees(employee_name)
values 	('Reggie Batey'), 
('Clara Poore'), 
('Tammy Galindo'), 
('Rickey Jones'), 
('Jill Anspach'), 
('Lacy Racicot'), 
('David Macias'), 
('Jessica Manns'), 
('Amber Holcomb'), 
('Betty Wells'), 
('Miguel Fletcher'), 
('Joseph Hodges'), 
('Ida Bohannon'), 
('Cindy Merrifield'), 
('Mary Dowell'), 
('Marie Thomas'), 
('Donald Fierro'), 
('Anna Wick'), 
('Robert Harian'), 
('Michael Mark'), 
('Lucius Patterson'), 
('Lorna Rose'), 
('Karen Santiago'), 
('Peggy Beachler'), 
('Chester Baird'), 
('Ronda Colley'), 
('Robert Chapman'), 
('Sandra Hibbard'), 
('Steven Pagano'), 
('Ramona Russell'), 
('Ryan Morgan'), 
('Shannon Daugherty'), 
('Charlene Little'), 
('Steve Lewandowski'), 
('Donnie Shoemaker'), 
('Veronica Treto'), 
('Jonathon Belanger'), 
('William Hughes'), 
('Courtney Alston'), 
('Isaac Walters'), 
('Leon Ashcraft'), 
('Daniel Patterson'), 
('Randall Phillips'), 
('James Williams'), 
('Nancy Searles'), 
('Edward Hilliard'), 
('Joel Vandevelde'), 
('Nancy Bravo'), 
('Jesse Clark'), 
('Gregory Magelssen'), 
('Ella Cortez'), 
('Michael Diaz'), 
('Robert Walsh'), 
('Valorie Seibert'), 
('Yoshiko Miller'), 
('Timothy Johnson'), 
('Lita Webb'), 
('Lindsay Barrera'), 
('Jacqulyn Matthews'), 
('Lee Rehart'), 
('Fred Spencer'), 
('Melinda Webster'), 
('Shawn Pretti'), 
('Betty Schaefer'), 
('Barbara Teets'), 
('Patricia Tomas'), 
('Mattie Kelley'), 
('Mary Yates'), 
('Andrea Croes'), 
('Amanda Riley');

--*Таблица salary*
--3. Создать таблицу salary
--- id. Serial  primary key,
--- monthly_salary. Int, not null

create table salary(
	id serial primary key,
	monthly_salary int not null
);

--4. Наполнить таблицу salary 15 строками:
--- 1000
--- 1100
--- 1200
--- 1300
--- 1400
--- 1500
--- 1600
--- 1700
--- 1800
--- 1900
--- 2000
--- 2100
--- 2200
--- 2300
--- 2400
--- 2500

insert into salary (monthly_salary)
values (1000),
(1100),
(1200),
(1300),
(1400),
(1500),
(1600),
(1700),
(1800),
(1900),
(2000),
(2100),
(2200),
(2300),
(2400),
(2500);

--*Таблица employee_salary*
--5. Создать таблицу employee_salary
--- id. Serial  primary key,
--- employee_id. Int, not null, unique
--- salary_id. Int, not null

create table employee_salary(
	id serial primary key,
	employee_id int not null unique,
	salary_id int not null
);

--6. Наполнить таблицу employee_salary 40 строками:
--- в 10 строк из 40 вставить несуществующие employee_id

insert into employee_salary(employee_id, salary_id)
values (3, 7),
(1, 4),
(5, 9),
(40, 13),
(23, 4),
(11, 2),
(52, 10),
(15, 13),
(26, 4),
(16, 1),
(33, 7),
(2, 15),
(4, 1),
(71, 2),
(8, 3),
(12, 4),
(78, 5),
(79, 8),
(86, 9),
(13, 10),
(50, 11),
(85, 13),
(83, 15),
(14, 14),
(48, 14),
(34, 13),
(90, 12),
(99, 12),
(190, 2),
(178, 3),
(51, 4),
(53, 5),
(54, 6),
(55, 1),
(56, 2),
(57, 3),
(58, 5),
(64, 1),
(65, 2),
(66, 3);

--*Таблица roles*
--7. Создать таблицу roles
--- id. Serial  primary key,
--- role_name. int, not null, unique

create table roles(
	id serial primary key,
	role_name int not null unique
);

--8. Поменять тип столба role_name с int на varchar(30)

alter table roles alter column role_name type varchar(30);

--9. Наполнить таблицу roles 20 строками:

insert into roles(role_name)
values ('Junior Python developer'),
('Middle Python developer'),
('Senior Python developer'),
('Junior Java developer'),
('Middle Java developer'),
('Senior Java developer'),
('Junior JavaScript developer'),
('Middle JavaScript developer'),
('Senior JavaScript developer'),
('Junior Manual QA engineer'),
('Middle Manual QA engineer'),
('Senior Manual QA engineer'),
('Project Manager'),
('Designer'),
('HR'),
('CEO'),
('Sales manager'),
('Junior Automation QA engineer'),
('Middle Automation QA engineer'),
('Senior Automation QA engineer');

--*Таблица roles_employee*
--10. Создать таблицу roles_employee
--- id. Serial  primary key,
--- employee_id. Int, not null, unique (внешний ключ для таблицы employees, поле id)
--- role_id. Int, not null (внешний ключ для таблицы roles, поле id)

create table roles_employee(
	id serial primary key,
	employee_id int not null unique,
	foreign key (employee_id)
		references employees(id),
	role_id int not null,
	foreign key (role_id)
		references roles(id)
);

--11. Наполнить таблицу roles_employee 40 строками:

insert into roles_employee(employee_id, role_id)
values (1, 1),
(2, 1),
(3, 2),
(4, 3),
(5, 4),
(6, 5),
(7, 6),
(8, 7),
(9, 8),
(10, 9),
(11, 10),
(12, 11),
(13, 12),
(14, 13),
(15, 14),
(16, 15),
(17, 16),
(18, 17),
(19, 18),
(20, 19),
(21, 20),
(22, 1),
(23, 2),
(24, 3),
(25, 4),
(26, 5),
(27, 6),
(28, 7),
(29, 8),
(30, 9),
(31, 10),
(32, 11),
(33, 12),
(34, 13),
(35, 14),
(36, 15),
(37, 16),
(38, 17),
(39, 18),
(40, 19);