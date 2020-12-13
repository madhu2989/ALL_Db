use manju
create table TaxiMaster(
TaxiId int identity(500,25)primary key,
TaxiName char(50)Not null,
TaxiType char(50) not null,
TaxiNo numeric(10) not null,
TaxiPricePerkm int not null)
select *from TaxiMaster
exec Sp_insertTaxiMaster 500,'Tata','Hatchback',9902700647,6,500
create proc Sp_insertTaxiMaster(
@TaxiId int,
@TaxiName char(50),
@TaxiType char(50),
@TaxiNo numeric(10),
@TaxiPricePerkm int,
@TaxiIdOut int out)
as
if(@TaxiId=0)
begin
insert into TaxiMaster values (@TaxiName,@TaxiType,@TaxiNo,@TaxiPricePerkm)
set @TaxiIdOut=@@identity
end
else
begin
update TaxiMaster
set TaxiName=@TaxiName,TaxiType=@TaxiType,TaxiNo=@TaxiNo,TaxiPricePerkm=@TaxiPricePerkm
where TaxiId=@TaxiId
set @TaxiIdOut=@TaxiId
end

select*from Taxi_master
insert into Taxi_master values ('Tata','Sedan',9902700647,8)

create proc sp_viewTaxiMaster
as
begin 
select*from TaxiMaster
end

create proc sp_viewTaxiMasterbyid
@TaxiId int
as
begin 
select*from TaxiMaster where TaxiId=@TaxiId
end

create proc sp_deleteTaxiMasterbyid
@TaxiId int
as
begin 
delete from TaxiMaster where TaxiId=@TaxiId
end

create table logintaxiNEW(
userid int identity(1,1) primary key,
userName char(50)not null,
userPassword char(50)not null unique)


create proc sp_insertLogin(
@userid int,
@userName char(50),
@userPassword char(50),
@useridout int out)
as
begin
insert into logintaxiNEW values
(
@userName,
@userPassword
)
set @useridout=@@IDENTITY
end

exec sp_insertLogin 0,'admin','admin',0

insert into logintaxi values ('madhu','madhu')
insert into logintaxi values ('koli','koli')
insert into logintaxi values ('sri','sri')

select*from  logintaxi 

alter proc sp_viewloginTaxibyName
@userName char(50)
as
begin
select*from logintaxiNEW where userName=@userName
end

exec sp_viewloginTaxibyName 'sri'

create table TaxiBooking(
BookingId int identity(1,1) primary key,
Name char(50)not null,
ContactNo bigint not null,
TaxiId int foreign key references TaxiMaster(TaxiId)not null,
DistanceInKm int not null,
TotalPrice numeric(10,2)not null)

create proc sp_insertTaxiBooking(
@BookingId int,
@Name char(50),
@ContactNo bigint,
@TaxiId int,
@DistanceInKm int,
@BookingIdout int out)
as
begin
declare
@TotalPrice numeric(10,2)
set @TotalPrice=(select TaxiPricePerkm from TaxiMaster)*@DistanceInKm
end 
as
if(@BookingId=0)
begin
insert into TaxiBooking values(@Name,@ContactNo,@TaxiId,@DistanceInKm)
set @BookingIdout=@@IDENTITY
end
else
begin
update TaxiBooking
set Name=@Name,ContactNo=@ContactNo,TaxiId=@TaxiId,DistanceInKm=@DistanceInKm
where BookingId=@BookingId
set @BookingIdout=@BookingId
end