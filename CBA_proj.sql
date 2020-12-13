create table customers
(cusId int identity(100,2) primary key,
cusName char(15),
cusMob bigint)

insert into customers values('Srivatsa',9538449257);

select *from customers

create table orders
(orderId int identity(3,4) primary key,
cusId_ int foreign key(cusId_)references customers(cusId),
orderitem char(15))

select * from orders

insert into orders values(104,'Shirt');

select o.orderId,o.cusId_,o.orderitem,c.cusName from orders o
join customers c on o.cusId_=c.cusId

create table labors
(labId int identity(60,1) primary key,
orderId int foreign key(orderId)references orders(orderId),
labSec char(1))

insert into labors values(3,'C');
select * from labors
select * from orders
select * from customers

select l.labId,l.orderId,o.orderitem,c.cusName,c.cusMob from labors l 
join orders o on  o.orderId=l.orderId
join customers c on c.cusId=o.cusId_