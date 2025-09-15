use bookstore;

-- Retrieving the Total No. of Books sold for each Genre--
select b.Genre, sum(o.Quantity) from orders o join books b 
on b.Book_id=o.Book_id group by b.genre;

-- Average Price of books in the "Fantasy" genre --
select avg(Price) as Average_price from 
Books where Genre="Fantasy";

-- List of Customers who have placed at least 2 orders --
select c.Customer_id, count(o.Order_id) as Total_orders, c.Name
 from Customers c join Orders o 
on c.Customer_id=o.Customer_id
 group by o.Customer_id having count(Order_id)>=2;
 
 -- Most Frequently Ordered Book --
 select b.Title, o.Book_id, count(o.Book_id) as Order_Count
 from books b join orders o 
 on b.Book_id=o.Book_id
 group by o.Book_id, b.Title
 order by count(b.Book_id) desc limit 1 ;
 
 -- Top 3 Most Expensive book of "Fantasy" genre --
 select * from books 
 where Genre="Fantasy"
 order by Price Desc limit 3;
 
 -- Total Quantity of books sold by each Author --
 select b.Author, sum(o.Quantity) as Total_Quantity_Sold
 from books b join orders o on b.Book_id=o.Book_id
 group by b.Author;
 
 -- List of the cities where customers who spent over 30$ are located --
 select distinct c.city, o.Total_Amount
 from customers c join orders o on c.Customer_id=o.customer_id
 where o.Total_Amount>=30;
 
 -- The Customer who spent most --
 select c.Name, o.Customer_id, sum(o.Total_Amount) as Total_Spent
 from customers c join orders o on c.Customer_id=o.Customer_id
 group by c.Name, o.Customer_id 
 order by Total_Spent desc limit 1;
 
 -- Stock remaining after fullfilling all orders --
 select b.Title, b.Stock, coalesce(sum(o.Quantity),0)as Order_Quantity,
 b.Stock-coalesce(sum(o.Quantity),0) as Remaining_Quantity
 from books b left join orders o on b.Book_id=o.Book_id
 group by b.Book_id
 order by b.Book_id;