create table validateLogin
(usId int primary key identity(1,1),
uName varchar(50),
pwd varchar(50),
rol int)

insert into validateLogin values ('admin','admin',1)
insert into validateLogin values ('te','te',2)



create proc sp_1bynamevalidateLogin
@uName varchar(50)
as
begin
select * from validateLogin where uName=@uName
end


create table eveMaster
(eId int primary key identity(1,1),
eName  varchar(50),
venue varchar(50),
tPrice numeric(5,2))

insert into eveMaster values ('dance','smg',10)
insert into eveMaster values ('music','smg',20)
insert into eveMaster values ('concert','smg',30)

 create proc sp_1inupeveMaster
 (@eId int,
@eName  varchar(50),
@venue varchar(50),
@tPrice numeric(5,2),
@eIdout int out) 
as
if(@eId=0)
begin
insert into eveMaster 
values(@eName, @venue, @tPrice)
set @eIdout=@@identity
end
else
begin
update eveMaster
set eName=@eName,venue=@venue,tPrice=@tPrice
where eId=@eId
set @eIdout=@eIdout
end

create proc sp_1vieweveMaster
as
begin
select * from eveMaster
end


create proc sp_1viewbyideveMaster
@eId int
as
begin
select * from eveMaster where eId=@eId
end


create proc sp_1delbyideveMaster
@eId int
as
begin
delete from eveMaster where eId=@eId
end

create table bookTicket
(bId int primary key identity(1,1),
eId int foreign key references eveMaster(eId),
nTks int,
tPr numeric(5,0))
drop table bookTicket
insert into bookTicket values (1,1,2,20)
alter proc sp_1inupbookTicket
(@bId int,
@eId int,
@nTks int,
@bIdout int out)
as
begin
declare @tPr numeric(5,0)
set @tPr=(select tPrice from eveMaster where eId=@eId)*@nTks
end
if(@bId=0)
begin 
insert into bookTicket(eId,nTks,tPr)
values (@eId,@nTks,@tPr)
set @bIdout=@@identity
end
else
begin
update bookTicket
set eId=@eId,nTks=@nTks,tPr=@tPr
where bId=@bId
set @bIdout=@bId
end

select * from bookTicket
exec sp_1inupbookTicket 0,1,2,20

create proc sp_view



















