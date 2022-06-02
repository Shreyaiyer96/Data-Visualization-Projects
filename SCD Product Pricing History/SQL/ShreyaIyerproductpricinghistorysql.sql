/*Answer the following questions (using SQL & Power BI) */
/*a. How many rows in target table?*/
select count(*) from ProductPriceHistorySCD

/*b. How many unique products are being tracked?*/ 
select distinct productid,productname from ProductPriceHistorySCD

/*c. How many products have more than 1 price? */
select count(pname) [Number of Products having more than 1 price]
from(
select productname pname,count(distinct listprice) [Number of Distinct Prices] from ProductPriceHistorySCD group by productname
having count(distinct listprice)>1) abc


/*d. What is the list of current product prices? (list product, price, start date of that price and what price version) */
select 
productname,
listprice,
scd_start,
scd_version
from ProductPriceHistorySCD
where scd_end is null


/*e. What is the product(s) with the maximum price? (list product, price, start date of that price and what price 
version) */
select productname,listprice, scd_start,scd_version from ProductPriceHistorySCD
where listprice in (select max(listprice) from ProductPriceHistorySCD)


/*f. What is the product(s) with the minimum price? (list product, price, start date of that price and what price 
version) */
select productname,listprice, scd_start,scd_version from ProductPriceHistorySCD
where listprice in (select min(listprice) from ProductPriceHistorySCD)



/*g. What is the price history for “HL Road Frame - Red, 62”?*/
select productname,scd_version,scd_start,scd_end,ListPrice from ProductPriceHistorySCD
where productname='HL Road Frame - Red, 62'



/*h. How many products had a price change in 2020?*/
select * from ProductPriceHistorySCD
where year(scd_end)=2020


select * from ProductPriceHistorySCD;


