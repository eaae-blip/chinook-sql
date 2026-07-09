-- ============================================================

-- Q1: List the name of every genre.
SELECT Name 
FROM genres;


-- Q2: Show the name and length of all tracks longer than 300,000 milliseconds.
SELECT Name, Milliseconds 
FROM tracks 
WHERE Milliseconds > 300000;


-- Q3: What distinct billing countries appear in the invoices table?
SELECT DISTINCT BillingCountry 
FROM invoices;


-- Q4: Show the 5 most expensive tracks by UnitPrice (most expensive first).
SELECT Name, UnitPrice 
FROM tracks 
ORDER BY UnitPrice DESC 
LIMIT 5;


-- Q5: Find all customers whose email ends in .com (show name and email).
SELECT FirstName, LastName, Email 
FROM customers 
WHERE Email LIKE '%.com';


-- Q6: How many albums are in the database in total?
SELECT COUNT(*) AS TotalAlbums 
FROM albums;


-- Q7: What is the average invoice total?
SELECT AVG(Total) AS AverageInvoiceTotal 
FROM invoices;


-- Q8: What are the cheapest and most expensive track prices?
SELECT MIN(UnitPrice) AS CheapestPrice, MAX(UnitPrice) AS MostExpensivePrice 
FROM tracks;


-- Q9: How many customers are in each country? Show country and count, most customers first.
SELECT Country, COUNT(*) AS CustomerCount 
FROM customers 
GROUP BY Country 
ORDER BY CustomerCount DESC;


-- Q10: What is the total revenue per billing country? Highest first.
SELECT BillingCountry, SUM(Total) AS TotalRevenue 
FROM invoices 
GROUP BY BillingCountry 
ORDER BY TotalRevenue DESC;


-- Q11: Which billing countries have more than 10 invoices?
SELECT BillingCountry, COUNT(*) AS InvoiceCount 
FROM invoices 
GROUP BY BillingCountry 
HAVING InvoiceCount > 10;


-- Q12: List each album title alongside its artist's name.
SELECT al.Title AS AlbumTitle, ar.Name AS ArtistName 
FROM albums al 
JOIN artists ar ON al.ArtistId = ar.ArtistId;


-- Q13: Show each track's name with its genre name.
SELECT t.Name AS TrackName, g.Name AS GenreName 
FROM tracks t 
JOIN genres g ON t.GenreId = g.GenreId;


-- Q14: List all track names that belong to the 'Rock' genre.
SELECT t.Name AS TrackName 
FROM tracks t 
JOIN genres g ON t.GenreId = g.GenreId 
WHERE g.Name = 'Rock';


-- Q15: How many tracks does each genre have? Show genre name and count.
SELECT g.Name AS GenreName, COUNT(t.TrackId) AS TrackCount 
FROM genres g 
JOIN tracks t ON g.GenreId = t.GenreId 
GROUP BY g.Name;


-- Q16: For each artist, how many albums do they have? Show artist name and album count, most first.
SELECT ar.Name AS ArtistName, COUNT(al.AlbumId) AS AlbumCount 
FROM artists ar 
JOIN albums al ON ar.ArtistId = al.ArtistId 
GROUP BY ar.Name 
ORDER BY AlbumCount DESC;


-- Q17: What is the total amount spent by each customer? Show full name and total, highest first.
SELECT c.FirstName || ' ' || c.LastName AS FullName, SUM(i.Total) AS TotalSpent 
FROM customers c 
JOIN invoices i ON c.CustomerId = i.CustomerId 
GROUP BY c.CustomerId 
ORDER BY TotalSpent DESC;


-- Q18: Which 10 tracks generated the most revenue? (Revenue = UnitPrice * Quantity.)
SELECT t.Name AS TrackName, SUM(ii.UnitPrice * ii.Quantity) AS TotalRevenue 
FROM invoice_items ii 
JOIN tracks t ON ii.TrackId = t.TrackId 
GROUP BY t.TrackId 
ORDER BY TotalRevenue DESC 
LIMIT 10;


-- Q19: Find all artists that have no albums.
SELECT ar.Name AS ArtistName 
FROM artists ar 
LEFT JOIN albums al ON ar.ArtistId = al.ArtistId 
WHERE al.AlbumId IS NULL;


-- Q20: Using a CTE, list the customers who spent more than the average customer's total spend.
WITH CustomerSpend AS (
    SELECT 
        c.CustomerId,
        c.FirstName || ' ' || c.LastName AS FullName,
        SUM(i.Total) AS TotalSpent
    FROM customers c
    JOIN invoices i ON c.CustomerId = i.CustomerId
    GROUP BY c.CustomerId
)
SELECT FullName, TotalSpent 
FROM CustomerSpend 
WHERE TotalSpent > (SELECT AVG(TotalSpent) FROM CustomerSpend)
ORDER BY TotalSpent DESC;