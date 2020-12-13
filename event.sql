create table Logintab123
(userId int primary key identity(1,1),
uN varchar(20),
uP varchar(20),
rol int)

insert into Logintab123 values('adm','adm',1)
insert into Logintab123 values('test','test',2)

create proc sp_2bynamelog
@uN varchar(50)
as
begin
select * from Logintab123 where uN=@uN
end


create table ddeve
(eId int primary key identity(1,1),
eveN varchar(50))
 
 insert into ddeve values ('dance')
 insert into ddeve values ('concert')
  insert into ddeve values ('music')


create proc sp_2viewddeve
as
begin
select  * from ddeve 
end


create table evemastert
(cId int primary key identity(100,1),
cName varchar(50),
eId int foreign key references ddeve(eId),
venue varchar(50))

create proc sp_2inupevemaster
(@cId int,
@cName varchar(50),
@eId int,
@venue varchar(50),
@cIdout int out)
as
if(@cId=0)

begin
insert into evemastert
values(
@cName,
@eId,
@venue)
set @cIdout=@@identity
end
else
begin
update evemastert
set cName= @cName,
eId=@eId,
venue=@venue
where cId=@cId
set @cIdout=@cId
end

create proc sp_2viewmaster
as
begin
select * from evemastert
end

create proc sp_2viewbyIDmaster
@cId int
as
begin
select * from evemastert where cId=@cId
end


create proc sp_2delbyIDmaster
@cId int
as
begin
delete from evemastert where cId=@cId
end





