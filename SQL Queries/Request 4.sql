/*
4. Follow-up: Which segment had the most increase in unique products in
2021 vs 2020? The final output contains these fields,
segment
product_count_2020
product_count_2021
difference
*/
with table_20 as (
		select
				d.segment,
				count(distinct(d.product_code)) as product_count,
				f.fiscal_year
		from dim_product d
		join fact_sales_monthly f using(product_code)
		where f.fiscal_year=2020
		group by d.segment
),
	table_21 as(
	select
			d.segment,
			count(distinct(d.product_code)) as product_count,
			f.fiscal_year
	from dim_product d
	join fact_sales_monthly f using(product_code)
	where f.fiscal_year=2021
	group by d.segment
)
select 
		a.segment,
        a.product_count as product_count_2020,
        b.product_count as product_count_2021,
       b.product_count-a.product_count as difference
from table_20 as a
join table_21 b on a.segment =b.segment
order by a.product_count desc;