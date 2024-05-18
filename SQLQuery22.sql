--Q2: Which country has the most Invoices?

select COUNT(*) as c, billing_country
from invoice
group by billing_country
order by c desc