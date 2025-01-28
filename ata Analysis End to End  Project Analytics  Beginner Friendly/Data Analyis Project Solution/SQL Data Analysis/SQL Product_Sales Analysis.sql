--now we want to create another column to get a discount revenue, which will be the discount we applied to the revenue column
--originally our discount is a integer so we want to convert that to a decimal by multiplying by 1.0 then divide by 100
--Then we want to get the discount revenue by minusing by 1(100) our discount
--Then we apply it by revenue revenu*0.1, 1-revenue*0.1, (1-revenue*0.1)*revenue
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

select *,
(1-Discount*1.0/100)*revenue as discount_revenue
from cte a
join discount_data b
on a.Discount_Band = b.Discount_Band and a.month=b.Month

--Now we will move on into PowerBi
