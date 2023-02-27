/*
8. In which quarter of 2020, got the maximum total_sold_quantity? The final
output contains these fields sorted by the total_sold_quantity,
Quarter
total_sold_quantity
*/

with fiscal_table as(
		Select 
				date_add(date, INTERVAL 4 MONTH) as fiscal_date,date,
				fiscal_year, sold_quantity
				from fact_sales_monthly
				where fiscal_year=2020
)
select  
		concat('Q',ceil(month(fiscal_date)/3)) as Quarters,
		concat(round(sum(sold_quantity)/1000000,2),'m') as total_sold_quantity
from fiscal_table
group by Quarters
order by total_sold_quantity desc;








