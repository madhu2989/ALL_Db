create table madhu_new(
emp_id int identity(1,1),
emp_name varchar(20),
contact_no bigint)
go
alter proc sp_insert_1342040
@emp_name varchar(20),
@contact_no bigint,
@gender varchar(10)
 as
 begin 
 insert into Madhu_new values(@emp_name,@contact_no,@gender)
 end
 go
 create proc sp_view_1342040
 as 
 select*from Madhu_new
 
 alter table Madhu_new
 add gender varchar(10)

 exec sp_view_1342040

 insert into Madhu_new values ('madhu',213,'male')