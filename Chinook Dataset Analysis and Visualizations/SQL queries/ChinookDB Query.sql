/*Query 1*/
select sum(total) AS "Total Sales" from dbo.Invoice;

/*Query 2*/
select SUM(UnitPrice*Quantity) AS "Total Sales" from dbo.InvoiceLine;

/*Query 3*/
select SUM(Quantity) AS TotalSongsSold from dbo.InvoiceLine;

/*Query 4*/
select cu.customerid,cu.country,iv.total
from customer cu
join Invoice iv
ON cu.CustomerId = iv.CustomerId
group by cu.CustomerId,cu.Country,iv.Total
order by iv.Total desc;

/*Query 5*/
select cu.customerid,cu.country,cu.State,cu.City,iv.total
from customer cu
join Invoice iv
ON cu.CustomerId = iv.CustomerId
group by cu.CustomerId,cu.Country,cu.State,cu.City,iv.Total
order by iv.Total desc;

/*Query 6*/
select cu.CustomerId,CONCAT(cu.LastName,' ',cu.FirstName) AS "Customer Name" ,SUM(iv.Total) AS "Total Sales"
from customer cu
join Invoice iv
ON cu.CustomerId = iv.CustomerId
group by cu.CustomerId,cu.LastName,cu.FirstName
order by SUM(iv.Total) desc;

/*Query 7*/
select cu.Company,SUM(iv.total)
from customer cu
join Invoice iv
ON cu.CustomerId = iv.CustomerId
group by cu.Company
order by SUM(iv.Total) desc,cu.Company;

/*Query 8*/
select ar.Name,SUM(il.UnitPrice*il.Quantity) AS "Total Sales"
from Artist ar
JOIN Album ab
ON ar.ArtistId = ab.ArtistId
JOIN Track tr
ON ab.AlbumId = tr.AlbumId
JOIN InvoiceLine il
ON tr.TrackId = il.TrackId
group by ar.Name,il.UnitPrice*il.Quantity
order by SUM(il.UnitPrice*il.Quantity) desc;

/*Query 9*/
select ab.Title,SUM(il.UnitPrice*il.Quantity) AS "Total Sales"
from Album ab
JOIN Track tr
ON ab.AlbumId = tr.AlbumId
JOIN InvoiceLine il
ON tr.TrackId = il.TrackId
group by ab.Title,il.UnitPrice*il.Quantity
order by SUM(il.UnitPrice*il.Quantity) desc;

/*Query 10*/
select em.EmployeeId, sum(inv.Total) as "Total Sales"
from Employee em
join Customer cu
on em.EmployeeId = cu.SupportRepId
join Invoice inv 
on cu.CustomerId = inv.CustomerId 
group by em.EmployeeId
order by sum(inv.Total);

/*Query 11*/
select me.Name, SUM(inv.UnitPrice*inv.Quantity) as "Total Sales"
from MediaType me
join Track tr
on me.MediaTypeID = tr.MediaTypeId
JOIN InvoiceLine inv 
on tr.TrackId = inv.TrackId
group by me.Name
order by SUM(inv.UnitPrice*inv.Quantity) desc;


/*Query 12*/
select gr.Name,SUM(il.UnitPrice*il.Quantity) AS "Total Sales"
from Genre gr
JOIN Track tr
ON gr.GenreId = tr.GenreId
JOIN InvoiceLine il
ON tr.TrackId = il.TrackId
group by gr.Name
order by SUM(il.UnitPrice*il.Quantity) desc;


/*Question 13*/
select year(InvoiceDate) as "Year", sum(Total) as  "Total Sales"
from Invoice 
group by year(InvoiceDate)
order by year(InvoiceDate);


/*Query 14*/
select year(InvoiceDate) as "Year",month(InvoiceDate) as "Month", sum(Total) as  "Total Sales"
from Invoice 
group by year(InvoiceDate),month(InvoiceDate)
order by year(InvoiceDate),month(InvoiceDate);

/*Question 15(make changes in variable)*/
select concat(emp.FirstName, ' ', emp.LastName) as "Employee Name", cast(emp.BirthDate as date)as "BirthDate", 
cast(emp.HireDate as date) as "HireDate", DATEDIFF(year,emp.HireDate ,GETDATE()) as "Years of working with company" , 
emp.Address, emp.City, emp.State, emp.Country, emp.Title, concat(emp1.FirstName, ' ', emp1.LastName) as Manager,
emp1.Title as ManagerTitle
from Employee emp
join Employee emp1
on emp.ReportsTo = emp1.EmployeeId;

/*Query 16*/
select DATEDIFF(YEAR,emp.BirthDate,inv.InvoiceDate) AS "Employee's Age",sum(inv.Total) as "Total Sales"
from Employee emp
JOIN Customer cu
ON emp.EmployeeID = cu.SupportRepID
JOIN Invoice inv
ON cu.CustomerId = inv.CustomerId
group by DATEDIFF(YEAR,emp.BirthDate,inv.InvoiceDate)
order by DATEDIFF(YEAR,emp.BirthDate,inv.InvoiceDate) desc;

/*Query 17*/
select DATEDIFF(YEAR,emp.BirthDate,inv.InvoiceDate) AS "EmployeeAge",sum(inv.Total) as "Total Sales"
from Employee emp
JOIN Customer cust
ON emp.EmployeeID = cust.SupportRepID
JOIN Invoice inv
ON cust.CustomerId = inv.CustomerId
group by DATEDIFF(YEAR,emp.BirthDate,inv.InvoiceDate)
having DATEDIFF(YEAR,emp.BirthDate,inv.InvoiceDate) between 30 and 69	
order by DATEDIFF(YEAR,emp.BirthDate,inv.InvoiceDate) desc;