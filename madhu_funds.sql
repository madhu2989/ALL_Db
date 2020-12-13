create table fund_login
(username varchar(50),
name char(50),
password_ varchar(50),
user_roleId int)

ALTER TABLE fund_login
ADD confirm_password varchar(50)

ALTER TABLE fund_login
ADD mobile_no bigint

select *from fund_login

create proc sp_fund_login
(@username varchar(50),
@name char(50),
@mobile_no bigint,
@password_ varchar(50),
@confirm_password varchar(50),
@user_roleId int)
as
begin 
insert into fund_login(username,name,mobile_no,password_,confirm_password,user_roleId) values
(@username,
@name,
@mobile_no,
@password_,
@confirm_password,
@user_roleId)
end

create proc sp_usernamebyid
@username varchar(100)
as
begin
select * from fund_login where username=@username
end

insert into fund_login values('Madhu123','Madhusudhan','madhu123',1)

select * from praddfundz_

--main tble
create table praddfundz_
(cus_no int primary key,
Name varchar(100),
mobile_no bigint,
no_ofFunds int,
loan_amt money,
Dateof_loan Datetime)




insert into praddfundz_ values(100,'Madhu',9902700647,1,50000,'02-02-2018')

alter proc sp_praddfundz
(@cus_no int,
@Name varchar(50),
@mobile_no bigint,
@no_ofFunds int,
@loan_amt money,
@Dateof_loan Datetime)
as
if(@cus_no=(select cus_no from praddfundz_ where cus_no=@cus_no))

begin
update praddfundz_
set cus_no=@cus_no,Name=@Name,mobile_no=@mobile_no,
no_ofFunds=@no_ofFunds,loan_amt=@loan_amt,Dateof_loan=@Dateof_loan
where cus_no=@cus_no

end
else
begin
insert into praddfundz_ values
(@cus_no,
@Name,
@mobile_no,
@no_ofFunds,
@loan_amt,
@Dateof_loan)

end

select * from praddfundz_

exec sp_praddfundz 110,'Ranga',9902184441,1,100000,'10/01/2018'

create proc sp_funs_view
as
begin
select * from praddfundz_
end

create proc sp_funs_viewbycus_no
@cus_no int
as
begin
select * from praddfundz_ where @cus_no=cus_no
end

exec sp_funs_viewbycus_no 202


create table fund_transactions
(trans_no int primary key,
cus_no int foreign key references praddfundz_(cus_no),
Name varchar(100),
loan_amt money,
weekly_paymnt money,
balance_amt money,
date_ofpayment datetime)

create proc sp_fund_transactions
(@trans_no int,
@cus_no int,
@Name varchar(100),
@loan_amt money,
@weekly_paymnt money,
@date_ofpayment datetime,
@trans_noOUT int out,
@balance_amt money out)
as
if(@trans_no=0)
begin
update praddfundz_ set loan_amt=@loan_amt-@weekly_paymnt where cus_no=@cus_no
set @balance_amt=(select loan_amt from praddfundz_ where cus_no=@cus_no)-@weekly_paymnt

insert into fund_transactions values
(@trans_no,
@cus_no,
@Name,
@loan_amt,
@weekly_paymnt,
@balance_amt,
@date_ofpayment
)
set @trans_noOUT=@@identity
end
