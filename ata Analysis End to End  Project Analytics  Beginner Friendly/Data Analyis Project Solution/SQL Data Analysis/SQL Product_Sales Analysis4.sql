--viewing our schema
select * from product_sales;--Date(year,month,day),product(id),discount_band,Units_sold
select * from Product_data;--product_id,cost_price,sales_price
select * from discount_data;--Month, Discount_band,Discount

-- well start with the "product data" table
-- product_id and product from product sales and product data- match so we can join them
select * 
from Product_data a
join product_sales b
on a.Product_ID = b.Product;

--Creating columns on our joined table
--Revenue(sale_price*units_sold)
--Total_cost(Cost_Price*Units_Sold)
select 
*,
(Sale_Price*Units_Sold) as revenue,
(Cost_Price*Units_Sold) as total_cost
from Product_data a
join product_sales b
on a.Product_ID = b.Product;

--Lets create two more columns for the importance of connecting to our discount table
--which has a month
-- well use format to pull out the month and year from the date
select 
*,
(Sale_Price*Units_Sold) as revenue,
(Cost_Price*Units_Sold) as total_cost,
FORMAT(Date,'MMMM') as month,
FORMAT(Date,'yyyy') as year
from Product_data a
join product_sales b
on a.Product_ID = b.Product;

 --Theres products in our a and b table which are different
 --Its genrally good to add all the columns by name
 --we have a and b side, so we are going to add those in
 select 
a.Product,
a.Category,
a.Brand,
a.Description,
a.Sale_Price,
a.Cost_Price,
a.Image_url,
b.Date,
b.Customer_Type,
b.Discount_Band,
b.Units_Sold
,
(Sale_Price*Units_Sold) as revenue,
(Cost_Price*Units_Sold) as total_cost,
FORMAT(Date,'MMMM') as month,
FORMAT(Date,'yyyy') as year
from Product_data a
join product_sales b
on a.Product_ID = b.Product;
--Now let's turn the above query into a CTE
--Common Table Expression that will allow us to select from this table multiple times
--if want to do some other joints instead of continually writing other joints
WITH cte AS(select 
a.Product,
a.Category,
a.Brand,
a.Description,
a.Sale_Price,
a.Cost_Price,
a.Image_url,
b.Date,
b.Customer_Type,
b.Discount_Band,
b.Units_Sold
,
(Sale_Price*Units_Sold) as revenue,
(Cost_Price*Units_Sold) as total_cost,
FORMAT(Date,'MMMM') as month,
FORMAT(Date,'yyyy') as year
from Product_data a
join product_sales b
on a.Product_ID = b.Product)

select * from cte;
--The above cte will only excute only on a seperate quert, all the above queries sum up to the cte


