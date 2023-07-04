alter table tblTransaction
add constraint chkAmount check (Amount>-1000 and Amount < 1000)/*added a check constraints to limit range value for Amount column, any  value that is entered must be >-1000 and <1000 */

begin tran
insert into tblTransaction
values (1010, '2014-01-01', 1) /* The INSERT  statement will conflict with the CHECK constraint "chkAmount", because Amount record(1010) is > 100*/
rollback tran

insert into tblTransaction
values (-110, '2014-01-01', 1)/*replace 1010 with any number <1000 and >-1000*/

alter table tblEmployee with nocheck /*added "with nocheck" so that contraints does not check the exising rows*/
add constraint chkMiddleName check
(REPLACE(EmployeeMiddleName,'.','') = EmployeeMiddleName or EmployeeMiddleName is null)/* here check constraints specify that employee middle name do not allow middle name with commas*/ 

begin tran
  insert into tblEmployee
  values (2003, 'A', 'B', 'C', 'D', '2014-01-01', 'Accounts')
  select * from tblEmployee where EmployeeNumber = 2003
rollback tran

alter table tblEmployee
drop constraint chkMiddleName/* dropping the check constraints from the table*/


alter table tblEmployee with nocheck
add constraint chkDateOfBirth check (DateOfBirth between '1900-01-01' and getdate())

begin tran
  insert into tblEmployee
  values (2003, 'A', 'B', 'C', 'D', '2023-01-01', 'Accounts')
  select * from tblEmployee where EmployeeNumber = 2003
rollback tran

create table tblEmployee2
(EmployeeMiddleName varchar(50) null constraint CK_EmployeeMiddleName check
(REPLACE(EmployeeMiddleName,'.','') = EmployeeMiddleName or EmployeeMiddleName is null))

select * from tblEmployee2
drop table tblEmployee2

alter table tblEmployee
drop chkDateOfBirth
alter table tblEmployee
drop chkMiddleName
alter table tblTransaction
drop chkAmount

