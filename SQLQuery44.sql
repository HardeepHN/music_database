--Q4:  Which city has the best customers? We would like to throw a promotional Music Festival in the city we made the most money. 

select SUM(total) as invoice_total, billing_city
from invoice
group by billing_city
order by invoice_total desc