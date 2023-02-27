/*
9. Which channel helped to bring more gross sales in the fiscal year 2021
and the percentage of contribution? The final output contains these fields,
channel
gross_sales_mln
percentage
*/
with max_gs as(
		select
				c.channel as channel,
                sum(g.gross_price*s.sold_quantity)/1000000 as max_GS
		from fact_sales_monthly s 
        join fact_gross_price g using(product_code)
        join dim_customer c using(customer_code)
        where s.fiscal_year=2021
        group by c.channel
        order by max_GS desc
),	
	total_gs as (
		select
					sum(g.gross_price*s.sold_quantity)/1000000 as total_gs
			from fact_sales_monthly s 
			join fact_gross_price g using(product_code)
			join dim_customer c using(customer_code)
			where s.fiscal_year=2021
)
	select
			a.channel, round(a.max_GS,2) as gross_sales_mln,
            round((a.max_GS/b.total_gs)*100,2) as percentage
	from max_gs as a
    cross join total_gs as b;
	