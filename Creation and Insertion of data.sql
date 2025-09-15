create database Bookstore;
use Bookstore;
create table Books(
Book_id serial primary key,
Title varchar(100),
Author varchar(100),
Genre varchar(50),
Published_year int,
Price numeric(10,2),
stock int
);
create table Customers(
Customer_id serial primary key,
Name varchar(100),
Email varchar(100),
Phone Varchar(15),
City varchar(50),
Country varchar(150)
);
create table Orders(
Order_id serial primary key,
Customer_id int references Customers(Customer_id),
Book_id int references Books(Books_id),
Order_Date date,
Quantity int,
Total_Amount numeric(10,2)
);
-- Imported Data from CSV files into Tables by using Table Data Import Wizard --
select * from Customers;
select * from Orders;
select * from Books;
