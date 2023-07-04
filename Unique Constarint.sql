------------------UNIQUE CONSTRAINTS IN ACTION------------------------------------------
--------------unique constraints can be added in more than 1 columns in a same table

alter table tblEmployee
ADD CONSTRAINT unqGovernmentID UNIQUE (EmployeeGovernmentID); /*syntax to alter unique constraint*/

select EmployeeGovernmentID, count(EmployeeGovernmentID) as MyCount from tblEmployee
group by EmployeeGovernmentID
having count(EmployeeGovernmentID)>1 /* looking for duplicate EmployeeGovernmentID */  

select * from tblEmployee where EmployeeGovernmentID = 'TX593671R'

begin tran
delete from tblEmployee
where EmployeeNumber < 3

delete top(1) from tblEmployee
where EmployeeNumber = 131

select * from tblEmployee where EmployeeGovernmentID = 'TX593671R' /* duplicates are removed*/

 rollback tran

alter table tblTransaction
add constraint unqTransaction UNIQUE (Amount, DateOfTransaction, EmployeeNumber)

delete from tblTransaction
where EmployeeNumber = 131

select * from tblTransaction
where EmployeeNumber = 131

insert into tblTransaction
VALUES (1,'2015-01-01', 131)
insert into tblTransaction
VALUES (1,'2015-01-01', 131)

alter table tblTransaction
Drop constraint unqTransaction

create table tblTransaction2
(Amount smallmoney not null,
DateOfTransaction smalldatetime not null,
EmployeeNumber int not null,
CONSTRAINT unqTransaction2 UNIQUE (Amount,DateOfTransaction,EmployeeNumber))

drop table tblTransaction2







