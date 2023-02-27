/*
2. What is the percentage of unique product increase in 2021 vs. 2020? The
final output contains these fields,
unique_products_2020
unique_products_2021
percentage_chg
*/

with table_20 as(
        select
			 count(distinct(product_code)) as prd
		from fact_sales_monthly
        where fiscal_year=2020
),
	table_21 as(
        select
			 count(distinct(product_code)) as prd
		from fact_sales_monthly
        where fiscal_year=2021
)
select
     a.prd as unique_products_2020,
     b.prd as unique_products_2021,
    round(((b.prd-a.prd)/a.prd)*100,2) as percentage_chg
from table_20 as a
cross join table_21 as b ;





 with a as(select
			 count(distinct(product_code)) as unique_products_2020,
             (select
			 count(distinct(product_code)) as prd
		from fact_sales_monthly
        where fiscal_year=2021) as unique_products_2021 
		from fact_sales_monthly
        where fiscal_year=2020
)
select unique_products_2020, unique_products_2021,
round(((unique_products_2021-unique_products_2020)/unique_products_2020)*100,2) as percentage_chg
from a;