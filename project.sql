create database bank;
use bank;


create table Branches(branch_id int primary key, branch_name varchar(20), location varchar(20));
alter table  branches add column ifsc_code varchar(20);
desc branches;

INSERT INTO Branches VALUES (1,'MG Road','Bengaluru','IFSC001'),(2,'Banjara 
Hills','Hyderabad','IFSC002'),(3,'Governorpet','Vijayawada','IFSC003'),(4,'Dwaraka 
Nagar','Vizag','IFSC004'),(5,'Brodipet','Guntur','IFSC005');

select * from branches;


create table Customers(customer_id  int Primary key, customer_name varchar(20), phone varchar(20), email varchar(20), address varchar(20));
desc customers;

INSERT INTO Customers VALUES 
(1,'Aarav','9000000001','aarav@mail.com','Bengaluru'),(2,'Bhavya','9000000002','bhavya@
mail.com','Hyderabad'),(3,'Charan','9000000003','charan@mail.com','Vijayawada'),(4,'Deep
ika','9000000004','deepika@mail.com','Vizag'),(5,'Esha','9000000005','esha@mail.com','Gu
ntur'),(6,'Farhan','9000000006','farhan@mail.com','Nellore'),(7,'Gopi','9000000007','gopi@
mail.com','Kurnool'),(8,'Hari','9000000008','hari@mail.com','Ongole'),(9,'Isha','900000000
9','isha@mail.com','Warangal'),(10,'John','9000000010','john@mail.com','Chennai'); 

select* from customers;


create table Account_Types(account_type_id int primary key , account_type_name varchar(30));
desc account_types;

INSERT INTO Account_Types VALUES (1,'Savings'),(2,'Current'); 

select * from account_types;

INSERT INTO Account_Types VALUES (1,'Savings'),(2,'Current');


create table Accounts(account_id int primary key,
 branch_id int, Foreign key(branch_id) references Branches(branch_id), 
 customer_id int ,Foreign key(customer_id) references customers(customer_id), 
 account_type_id  int ,foreign key(account_type_id) references account_types(account_type_id) , 
account_number varchar(20), balance bigint, opening_date date, status varchar(20)); 
desc accounts;

 
INSERT INTO Accounts values
(101,1,1,1,'100000001',25000,'2025-01-01','Active'), 
(102,2,2,1,'100000002',50000,'2025-01-02','Active'), 
(103,2,2,2,'200000003',120000,'2025-01-03','Active'), 
(104,3,3,1,'100000004',35000,'2025-01-04','Active'), 
(105,4,4,1,'100000005',65000,'2025-01-05','Active'), 
(106,4,4,2,'200000006',150000,'2025-01-06','Active'), 
(107,5,5,2,'200000007',90000,'2025-01-07','Active'), 
(108,6,1,1,'100000008',18000,'2025-01-08','Inactive'), 
(109,7,2,1,'100000009',27000,'2025-01-09','Active'), 
(110,8,3,2,'200000010',78000,'2025-01-10','Active'), 
(111,9,4,1,'100000011',45000,'2025-01-11','Active'), 
(112,9,4,2,'200000012',99000,'2025-01-12','Active'), 
(113,10,5,1,'100000013',60000,'2025-01-13','Active'), 
(114,1,1,2,'200000014',85000,'2025-01-14','Active'), 
(115,3,3,2,'200000015',110000,'2025-01-15','Active'); 
select *from accounts; 



insert into branches values (6,'snpadu','ongole','ifsc006'),(7,'koduru','avanigadda','ifsc007'),
(8,'bimavaram','godavari','ifsc008'),(9,'machilipatnam','krishna','ifsc009'),(10,'chitoor','tirupathi','ifsc010');
select * from branches;

create table Transactions(transaction_id  int Primary key, 
account_id int, foreign key(account_id) references accounts(account_id),
 transaction_type varchar(20) ,amount varchar(20), transaction_date varchar(20), description varchar(20));
 desc transactions;
 
 INSERT INTO Transactions VALUES 
(1001,101,'Deposit',1000,'2025-07-01','Sample Deposit'), 
(1002,102,'Withdrawal',6000,'2025-07-02','Sample Withdrawal'), 
(1003,103,'Transfer',11000,'2025-07-03','Sample Transfer'), 
(1004,104,'Deposit',16000,'2025-07-04','Sample Deposit'), 
(1005,105,'Withdrawal',21000,'2025-07-05','Sample Withdrawal'), 
(1006,106,'Transfer',26000,'2025-07-06','Sample Transfer'), 
(1007,107,'Deposit',31000,'2025-07-07','Sample Deposit'), 
(1008,108,'Withdrawal',36000,'2025-07-08','Sample Withdrawal'), 
(1009,109,'Transfer',41000,'2025-07-09','Sample Transfer'), 
(1010,110,'Deposit',46000,'2025-07-10','Sample Deposit'), 
(1011,111,'Withdrawal',1000,'2025-07-11','Sample Withdrawal'), 
(1012,112,'Transfer',6000,'2025-07-12','Sample Transfer'), 
(1013,113,'Deposit',11000,'2025-07-13','Sample Deposit'), 
(1014,114,'Withdrawal',16000,'2025-07-14','Sample Withdrawal'), 
(1015,115,'Transfer',21000,'2025-07-15','Sample Transfer'), 
(1016,101,'Deposit',26000,'2025-07-16','Sample Deposit'), 
(1017,102,'Withdrawal',31000,'2025-07-17','Sample Withdrawal'), 
(1018,103,'Transfer',36000,'2025-07-18','Sample Transfer'), 
(1019,104,'Deposit',41000,'2025-07-19','Sample Deposit'), 
(1020,105,'Withdrawal',46000,'2025-07-20','Sample Withdrawal'), 
(1021,106,'Transfer',1000,'2025-07-21','Sample Transfer'), 
(1022,107,'Deposit',6000,'2025-07-22','Sample Deposit'), 
(1023,108,'Withdrawal',11000,'2025-07-23','Sample Withdrawal'), 
(1024,109,'Transfer',16000,'2025-07-24','Sample Transfer'), 
(1025,110,'Deposit',21000,'2025-07-25','Sample Deposit'), 
(1026,111,'Withdrawal',26000,'2025-07-26','Sample Withdrawal'), 
(1027,112,'Transfer',31000,'2025-07-27','Sample Transfer'), 
(1028,113,'Deposit',36000,'2025-07-28','Sample Deposit'), 
(1029,114,'Withdrawal',41000,'2025-07-29','Sample Withdrawal'), 
(1030,115,'Transfer',46000,'2025-07-30','Sample Transfer'); 
select * from Transactions;
select * from accounts;
select * from account_types;

#----------------------------------------------------------------Business Reports-------------------------------------------------------
#1 List all customer details. 
select * from customers;

#2 Display all active bank accounts. 
select * from accounts where status='active';

#3 Change the status of an account from Active to Inactive
update accounts set status='inactive' where account_id=108;
update accounts set status='inactive' where account_id=101;
select * from accounts;
set sql_safe_updates=0;

#4 Display customer names along with their account numbers and account types. 
select  c.customer_name,a.account_number,at.account_type_name from 
customers c join accounts a on c.customer_id=a.customer_id
join account_types at on at.account_type_id=a.account_type_id;

#5 Display account number, branch name, and branch city for all accounts
select a.account_number,b.branch_name,b.location from accounts a join branches b on a.branch_id=b.branch_id;

#6 Find customers with the highest account balance. 
select c.customer_name,a.balance from customers c join accounts a on c.customer_id=a.customer_id where a.balance = (select max(balance) from accounts);

#7 Concatenate customer name with account number. Eg.: Aarav - ACC1001 
select concat(c.customer_name, '  -  ', a.account_number) as customer_account_number  from customers c  join accounts a on c.customer_id=a.customer_id;

#8 Display the ceiling and floor value of every transaction amount. 
select ceil(amount) as ceiling_value,floor(amount) as floor_value from transactions;

alter table accounts add opening_balance bigint;
#9 Find the absolute difference between the opening balance and current balance
select account_id, abs(opening_balance - balance) as balance_difference from accounts;

#10 Display all customers and the branches where they hold accounts. 
select c.customer_name,b.branch_name ,a.account_id from customers c join accounts a on a.customer_id=c.customer_id
join branches b on a.branch_id=b.branch_id; 

#11 Calculate total deposits by branch.
select b.branch_name,sum(t.amount) as total_deposits from transactions t join accounts a on t.account_id= a.account_id
join branches b on a.branch_id=b.branch_id where t.transaction_type='deposit' group by b.branch_name;

#12  Find the total balance available across all accounts. 
select sum(balance) from accounts;

#13 Find the highest, lowest, and average account balance. 
select max(balance) as highest_balance, min(balance) as lowest_balance , avg(balance) as avg_balance from accounts;

#14  Calculate the total amount deposited and the total amount withdrawn.
select sum(case when transaction_type ='deposit' then amount else 0 end) as totl_deposits,
sum(case when transaction_type='withdrawal' then amount else 0 end)  as total_withdrawels from transactions;

#15Show branch-wise customer count. 
select b.branch_id,b.branch_name,count(c.customer_name) from customers c join accounts a on a.customer_id=c.customer_id 
join branches b on b.branch_id=a.branch_id group by 1,2;

#16 Count Savings and Current accounts.
select at.account_type_name,count(a.account_id) as count_type from accounts a join 
account_types at on a.account_type_id=at.account_type_id group by 1 ;

#17 Find customers who own more than one account.
select c.customer_name,count(a.account_id )  from accounts a join 
customers c on c.customer_id=a.customer_id group by 1 having count(a.account_id)>1 ;

#18 Find the latest transaction for each account. 
select account_id,max(transaction_date) as latest_transation from transactions group by account_id;

#19 Find the customer(s) having the highest account balance.
select c.customer_name ,a.balance as highest_balance from customers c join
 accounts a on c.customer_id=a.customer_id where a.balance=(select max(balance ) from accounts);

#20 Display accounts whose balance is greater than the average account balance. 
select account_id,balance from accounts where balance>(select avg(balance) from accounts);

#21 Show monthly transaction totals with the month name and rounded total amount.
select monthname(transaction_date) as month_name,
round(sum(amount), 2) as total_amount from transactions group by 1;

#22  Find customers who have never made any transaction. 
select c.customer_name from customers c left join  accounts a on c.customer_id=a.customer_id 
left join transactions t on a.account_id=t.account_id group by c.customer_name having count(t.transaction_id)=0;

#23 Display inactive accounts. 
select account_id from accounts where status='inactive';

#.24 List the top 5 accounts by balance.
select customer_id,balance from accounts order by balance desc limit 5;

# 25 Count transactions by type. 
select transaction_type,count(transaction_type) as count_value from transactions  group by 1;

#26 Generate monthly transaction summaries. 
select monthname(transaction_date) as month_name,count(transaction_id) ,sum(amount) as total_amount,
sum(case when transaction_type='deposit' then amount else 0 end) as total_deposits,
sum( case when transaction_type='withdrawal' then amount else 0 end) as total_withdawala from transactions
group by month(transaction_date),monthname(transaction_date) order by month(transaction_date) asc;

#27 Display account balances branch-wise. 
select b.branch_name,sum(balance) as total_balance from branches b join accounts a on a.branch_id=b.branch_id group by 1;

#28  Display the customer name in uppercase along with the rounded account balance.
select upper(c.customer_name),round(a.balance) from customers c join accounts a on a.customer_id=c.customer_id ;

#.29  Create a view to display all active account details along with customer and branch information. 
create view active_customers as select
 a.branch_id,a.customer_id,a.account_type_id,a.account_number,a.balance,a.opening_date,
 a.status,c.customer_name,c.phone,c.email,c.address,b.branch_name,b.location,b.ifsc_code
 from accounts a join customers c on a.customer_id=c.customer_id
join branches b on a.branch_id=b.branch_id where a.status='active';
select * from active_customers;

#30 Write a transaction to transfer ₹10,000 from one account to another using START TRANSACTION, COMMIT, and ROLLBACK to ensure data consistency. 
start transaction;
update Accounts set balance =balance-10000 where account_id=101;
update accounts set balance=balance+10000 where account_id=102;
commit;
rollback;
select * from accounts;

#31 Create a stored procedure to display all accounts belonging to a particular customer.  
#• Input: customer_id  
#• Display account number, account type, balance, and account status. 
call customer_accounts(4);

#32 Create a stored procedure to display all transactions for a particular account.  
#• Input: account_id  
#• Display transaction type, amount, transaction date, and description. 
call account_transactions(101);

# 33 Create a trigger on the Transactions table. 
# Whenever a new transaction is inserted, automatically store the transaction ID, account ID, transaction type,
# amount, and transaction date in a Transaction_Log table.
create table transaction_log(transaction_id int,account_id int, transaction_type  varchar(20),amount int,transaction_date varchar(20));
select* from transaction_log;
insert into transactions values (1031,101,'deposit',6000,'2025-07-31','new deposit');
show triggers;
insert into transactions values (1032,102,'withdrawel',5000,'2025-08-01','sample transfer');

#34 Create a trigger on the Accounts table. 
#• If an account's balance is updated to a negative value, prevent the update and display an appropriate error message.
select * from accounts;

desc accounts;
alter table accounts modify balance varchar(100);
update accounts set balance = -1000 where account_id = 114;