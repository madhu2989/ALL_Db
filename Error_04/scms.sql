create table package_mapping (authocode varchar(100) primary key,caid varchar(100),package_name varchar(100))

create table products (serial_no int primary key identity (1,1),auth_code varchar (100) foreign key references
 package_mapping(authocode),caid varchar (100),ala_carte varchar(5))


 create proc FAuthocode_select
 @pack_name varchar(100)
 as
 begin
 select REPLACE(authocode,'#',',') as authocode,package_name from package_mapping where package_name=@pack_name;
 end

 exec Authocode_sel "Kannada regional"

 select * from package_mapping 

 insert into package_mapping values('104#105#106','4,5,6','Sony sports')

  insert into package_mapping values('106','6','Sony HD')

  insert into products values('106','6','Y')

  select * from products 

  drop 

  alter table products
  drop constraint auth_code

  

  create proc authocode_selection 
  @pack_name varchar(100) 
  as
  begin
 select stuff((select ','+REPLACE(authocode,'#',',') from package_mapping where package_name ='Sony sports' for xml path ('')),1,1,'');
  end;

 modify proc authocode_selection 
   @pack_name varchar(100) 
  as
  begin
 select auth_code from products where  auth_code in (select REPLACE(authocode,'#',',') from package_mapping where package_name='Sony sports')
   
 end;



create table products (auth_code int primary key,caid int,ala_carte varchar(3))

insert into products values(106,6,'Y')

 Sony sports

