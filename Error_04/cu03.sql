create table package_definition_values (package_id int primary key,display_value varchar(100))


insert into package_definition_values values (987456,'Sony sports')

insert into package_definition_values values (654123,'Kannada regional')

create table product (tracking_id int identity(100,1) primary key,component_id int foreign key references 
package_definition_values(package_id), account_no int )

select * from product

insert into product values(987456,456789)

create proc get_kenan_paks
@account_no int
as
begin
select display_value from package_definition_values where 
package_id in(select component_id from product where account_no=@account_no)
end;
