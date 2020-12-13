create table products (authocode varchar (40) primary key,caid varchar(20),package_name varchar(100));

select * from products

insert into products values ('1','1','Dhamaka')

insert into products values ('1','2','Dhamaka')

create proc list_of_packs
as 
begin
select * from products
end;

exec list_of_packs