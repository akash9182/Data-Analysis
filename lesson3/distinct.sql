SELECT a.id as "account id", r.id as "region id", 
a.name as "account name", r.name as "region name"
FROM accounts a
JOIN sales_reps s
ON s.id = a.sales_rep_id
JOIN region r
ON r.id = s.region_id;

Select Distinct id, name 
from accounts;

Select count(a.id), a.name
From accounts a
Join sales_reps s
on s.id = a.sales_rep_id
group by a.name

