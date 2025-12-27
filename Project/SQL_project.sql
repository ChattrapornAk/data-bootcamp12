-- Project to analyze data in Customer database in SQLite
-- 1.Selcect top 3 customers that have the highest total sale : to analyze regular customer
SELECT
	  cus.FirstName || ' ' || cus.LastName fullname,
    SUM(inv.Total) total_sale
FROM customers cus
JOIN invoices inv On cus.CustomerId = inv.CustomerId
JOIN invoice_items invi on inv.InvoiceId = invi.InvoiceLineId
JOIN tracks tra on invi.TrackId = tra.TrackId
GROUP by 1
ORDER by 2 DESC
LIMIT 3

-- 2.Select the most favorite album of 'Helena' who is a regular customer : to analyze customer genres
SELECT
  cus.FirstName || ' ' || cus.LastName fullname,
  alb.Title album_name,
  COUNT(alb.Title) 
FROM customers cus
join invoices inv on cus.CustomerId = inv.CustomerId
join invoice_items invi on inv.InvoiceId = invi.InvoiceId
join tracks tra on tra.TrackId = invi.TrackId
JOIN albums alb on tra.AlbumId = alb.AlbumId
WHERE fullname LIKE 'Helena%'
group by 2
ORDER BY 3 DESC

-- 3.Select tpo 5 genres : to analyze trends of genres
SELECT
   gen.Name type_of_song,
   ROUND (sum(inv.Total), 2) sum_sale
FROM genres gen
JOIN tracks tra on gen.GenreId = tra.GenreId
JOIN invoice_items invi ON tra.TrackId = invi.TrackId
JOIN invoices inv on invi.InvoiceId = inv.InvoiceId
GROUP by 1
order by 2 DESC
limit 5

-- 4.Rank the annual sale from highest to lowest : to analyze annual sale in each year
SELECT
   cast (STRFTIME('%Y', invoicedate)AS INT) AS year,
   SUM(inv.total) total_sale
FROM invoices inv
JOIN invoice_items invi ON inv.InvoiceId = invi.InvoiceLineId
GROUP BY 1
ORDER BY 2 DESC

-- 5.Rank number of sale bills per each employee : to analyze performance of employee
SELECT
   emp.FirstName || ' ' || emp.LastName fullname,
   COUNT(inv.InvoiceId) count_invoice
FROM employees emp
JOIN customers cus on emp.EmployeeId = cus.SupportRepId
JOIN invoices inv on cus.CustomerId = inv.CustomerId
GROUP BY 1
ORDER BY 2 DESC
