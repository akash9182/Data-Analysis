/* 
How many of the sales reps have more than 5 accounts that they manage?

How many accounts have more than 20 orders?

Which account has the most orders?

Which accounts spent more than 30,000 usd total across all orders?

Which accounts spent less than 1,000 usd total across all orders?

Which account has spent the most with us?

Which account has spent the least with us?

Which accounts used facebook as a channel to contact customers more than 6 times?

Which account used facebook most as a channel? 

Which channel was most frequently used by most accounts
*/


select s.name ,count(*) total 
from sales_reps s
join accounts a
on a.sales_rep_id = s.id
group by s.id, s.name  
having count(*) > 5 
order by total

select a.id, a.name, count(*) total 
from orders o
join accounts a
on a.id = o.account_id
group by a.name , a.id
having count(*) > 20
order by total

select a.id, a.name, count(*) total 
from orders o
join accounts a
on a.id = o.account_id
group by a.name , a.id
having count(*) > 20
order by total desc 
Limit 1

SELECT a.id, a.name, sum(total_amt_usd) total 
from orders o
join accounts a
on a.id = o.account_id
group by a.name , a.id
having sum(total_amt_usd) > 30000
order by total

SELECT a.id, a.name, SUM(o.total_amt_usd) total_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
HAVING SUM(o.total_amt_usd) < 1000
ORDER BY total_spent;

SELECT a.id, a.name, SUM(o.total_amt_usd) total_spent
FROM accounts a
JOIN orders o
ON a.id = o.account_id
GROUP BY a.id, a.name
ORDER BY total_spent DESC
LIMIT 1;

select a.id, a.name, count(*) use_of_channel 
from web_events w
join accounts a
on a.id = w.account_id
group by a.name , a.id, w.channel
having w.channel = 'facebook' AND count(*) > 6

SELECT a.id, a.name, w.channel, COUNT(*) use_of_channel
FROM accounts a
JOIN web_events w
ON a.id = w.account_id
GROUP BY a.id, a.name, w.channel
ORDER BY use_of_channel DESC
LIMIT 10;