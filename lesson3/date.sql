Select DATE_PART('year', occurred_at) ord_year, SUM(total_amt_usd) as Sales_each_year
From orders
group by 1
order by 2;

Select DATE_PART('month', occurred_at) ord_year, SUM(total_amt_usd) as Sales_each_year
From orders
WHERE occurred_at BETWEEN '2014-01-01' AND '2017-01-01'
group by 1
order by 2 desc;

Select DATE_TRUNC('month', occurred_at) ord_year, sum(gloss_amt_usd) 
From orders o
join accounts a
on a.id = o.account_id
where a.name = 'Walmart'
group by 1
ORDER BY 2 DESC