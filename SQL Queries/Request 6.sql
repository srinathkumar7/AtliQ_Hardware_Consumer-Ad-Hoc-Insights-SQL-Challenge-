/*
6. Generate a report which contains the top 5 customers who received an
average high pre_invoice_discount_pct for the fiscal year 2021 and in the
Indian market. The final output contains these fields,
customer_code
customer
average_discount_percentage
*/

select
		f.customer_code, d.customer, round(avg(f.pre_invoice_discount_pct),4) as average_discount_percentage
from fact_pre_invoice_deductions f
join dim_customer d using(customer_code)
where d.market='India' and f.fiscal_year=2021
group by d.customer_code
order by average_discount_percentage desc
limit 5;