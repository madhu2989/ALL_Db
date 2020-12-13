use manju
create table Box_type(MonthlyRecharge numeric(5,0) ,CableBoxType varchar(50)primary key)

insert into Box_type values (250,'Hathway')
insert into Box_type values (300,'DEN')
insert into Box_type values (350,'e-Digital')

create proc sp_viewBox_type
as
begin
select*from Box_type
end

create table Cablelogin(UserId int identity(1,1) primary key,UserName varchar(10),password_ varchar(50))

insert into Cablelogin values ('madhu','madhu')
insert into Cablelogin values ('koli','koli')
insert into Cablelogin values ('nikhil','nikhil')

create proc sp_viewCableLoginbyname
@userName varchar(10)
as
begin
select*from Cablelogin where UserName=@UserName
end
exec sp_viewCableLoginbyname 'koli'
create table CableMaster(
CustomerId int identity(1,1) primary key,
CustomerName varchar(50),
CableBoxType varchar(50) foreign key references Box_type(CableBoxType),
Address_ varchar(100),
ContactNo numeric(10,0))

create proc sp_insertCableMaster(
@CustomerId int,
@CustomerName varchar(50),
@CableBoxType varchar(50),
@Address_ varchar(100),
@ContactNo numeric(10,0),
@CusIdout int)
as
if(@CustomerId=0)
begin
insert into CableMaster values(@CustomerName,@CableBoxType,@Address_,@ContactNo)
set @CusIdout=@@identity
end
else
begin
update CableMaster
set CustomerName=@CustomerName,CableBoxType=@CableBoxType,Address_=@Address_,ContactNo=@ContactNo
where customerId=@customerId
end

exec sp_insertCableMaster 0,'madhu',,'shimoga',9902700647,0
select*from CableMaster

create proc sp_viewCableMaster
as
begin
select*from CableMaster
end

create proc sp_viewCableMasterbyid
@CustomerId int
as
begin
select*from CableMaster where CustomerId=@CustomerId
end

create proc sp_deleteCableMasterbyid
@CustomerId int
as
begin
delete from CableMaster where CustomerId=@CustomerId
end