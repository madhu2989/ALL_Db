create table external_id_acct_map (external_id varchar(12) primary key,account_no int,server_id int)


insert into external_id_acct_map values('7411191240',456789,5)


select * from external_id_acct_map

drop table product

drop table package_definition_values

create proc get_server_acc
@external_id varchar(12),
@servr_id int out,
@acc_no int out
as
begin 
set @servr_id=(select server_id from external_id_acct_map where external_id=@external_id)
set @acc_no= (select account_no from external_id_acct_map where external_id=@external_id)
end;