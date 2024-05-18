/* Q9: Find how much amount spent by each customer on artists? Write a query to return customer name, artist name and total spent */

WITH best_selling_artist AS (
select top 1 artist.artist_id as artist_id, artist.name as artist_name, SUM(invoice_line.unit_price*invoice_line.quantity) as total_sales
from invoice_line
JOIN track ON track.track_id = invoice_line.track_id
JOIN album ON album.album_id = track.album_id
JOIN artist ON artist.artist_id = album.artist_id
group by 1
order by 3 desc
)
select c.customer_id, c.first_name, c.last_name, SUM(il.unit_price*il.quantity) AS amount_spent
from invoice i
JOIN customer c ON c.customer_id = i.customer_id
JOIN invoice_line il ON il.invoice_id = i.invoice_id
JOIN track t ON t.track_id = il.track_id
JOIN album alb ON alb.album_id = t.album_id
JOIN best_selling_artist bsa ON bsa.artist_id = alb.artist_id
group by 1,2,3,4
ORDER by 5 DESC;