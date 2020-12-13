create table Madhu
(emp_id int identity(1,1),
emp_name varchar(50))

alter table Madhu 
add gender varchar(10)

select*from Madhu

insert into Madhu(emp_id,emp_name,gender)
insert into Madhu values ('madhu','male')
insert into madhu values ('Manju','male')
insert into madhu values ('Nikhil','male')