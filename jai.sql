create table dropd
(eId int primary key identity(1,1),
eN varchar(50))

insert into dropd values('dance')
insert into dropd values('play')

create proc sp_viewdropd
as
begin
select * from dropd
end


create table main
(cId int primary key identity(100,1),
name varchar(50),
eId int foreign key references dropd(eId),
email varchar(50))

insert into main values ('manj',1,'a2b')

create proc sp_inupmain
(@cId int,
@name varchar(50),
@eId int,
@email varchar(50),
@cIdout int out)
as
if(@cId=0)
begin
insert into main
values(@name,@eId,@email)
set @cIdout=@@identity
end
else
begin
update main
set name=@name,eId=@eId,email=@email 
where cId=@cId
set @cIdout=@cId
end

create proc sp_viewmain
as
begin
select * from main
end

create proc sp_viewbyidmain
@cId int
as
begin
select * from main where cId=@cId
end


create proc sp_delbyidmain
@cId int
as
begin
delete from main where cId=@cId
end

create table loginnow
(uI int primary key identity(1,1),
uN varchar(50),
pW varchar(20),
rol int)

insert into loginnow values ('adm','adm',1)
insert into loginnow values ('tes','tes',1)

create proc sp_loginnow
@uN varchar(50)
as
begin
select * from loginnow where uN=@uN
end





