/*
7. Get the complete report of the Gross sales amount for the customer “Atliq
Exclusive” for each month. This analysis helps to get an idea of low and
high-performing months and take strategic decisions.
The final report contains these columns:
Month
Year
Gross sales Amount
*/
select 
		monthname(s.date) as Month,
        year(s.date) as Year, 
      concat(round(sum(g.gross_price*s.sold_quantity/1000000),2),'m') as Gross_sales_Amount
from fact_sales_monthly s
join fact_gross_price g using(product_code)
where s.customer_code in (select customer_code from dim_customer where customer='Atliq Exclusive')
group by s.date
order by year;


