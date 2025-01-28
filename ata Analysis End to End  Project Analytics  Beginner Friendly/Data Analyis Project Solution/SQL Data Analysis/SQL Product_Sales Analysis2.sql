--now we want to join the discount data to the cte using dscount_band and month
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

select * from cte a
join discount_data b
on a.Discount_Band = b.Discount_Band and a.month=b.Month
--now we want to create another column to get a discount revenue, which will be the discount we applied to the revenue column