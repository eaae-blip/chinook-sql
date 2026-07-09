-- ============================================================
-- ============================================================

-- Question 1: List all customers who are from Germany.
SELECT CustomerId, FirstName, LastName, Country 
FROM customers 
WHERE Country = 'Germany';


-- Question 2: Find the total number of tracks belonging to each genre.
SELECT g.Name AS GenreName, COUNT(t.TrackId) AS TotalTracks
FROM genres g
JOIN tracks t ON g.GenreId = t.GenreId
GROUP BY g.Name
ORDER BY TotalTracks DESC;


-- Question 3: Retrieve a list of all albums and their corresponding artists.
SELECT al.Title AS AlbumTitle, ar.Name AS ArtistName
FROM albums al
JOIN artists ar ON al.ArtistId = ar.ArtistId
ORDER BY ar.Name;


-- Question 4: Find the total sales (revenue) generated in each country.
SELECT BillingCountry, SUM(Total) AS TotalSales
FROM invoices
GROUP BY BillingCountry
ORDER BY TotalSales DESC;


-- Question 5: Identify the top 5 customers who have spent the most money.
SELECT c.CustomerId, c.FirstName, c.LastName, SUM(i.Total) AS TotalSpent
FROM customers c
JOIN invoices i ON c.CustomerId = i.CustomerId
GROUP BY c.CustomerId
ORDER BY TotalSpent DESC
LIMIT 5;


-- Question 6: Find how many tracks were written or composed by 'AC/DC'.
SELECT COUNT(TrackId) AS ACDC_Track_Count
FROM tracks
WHERE Composer LIKE '%AC/DC%';


-- Question 7: Calculate the total sales handled by each Employee (Support Rep).
SELECT e.EmployeeId, e.FirstName, e.LastName, SUM(i.Total) AS TotalSalesHandled
FROM employees e
JOIN customers c ON e.EmployeeId = c.SupportRepId
JOIN invoices i ON c.CustomerId = i.CustomerId
GROUP BY e.EmployeeId
ORDER BY TotalSalesHandled DESC;


-- Question 8: Find the total revenue generated in the year 2011.
SELECT SUM(Total) AS TotalRevenue_2011
FROM invoices
WHERE InvoiceDate LIKE '2011%';