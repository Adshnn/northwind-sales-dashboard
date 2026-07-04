use NorthwindSalesDW
/* ====================================================
   NORTHWIND SALES DASHBOARD ANALYSIS
   ==================================================== */

/* Total Sales */
SELECT
    SUM(SoldAmount) AS TotalSales
FROM [northwind].[FactSales];

/* Total Orders */
SELECT
    COUNT(SoldAmount) AS TotalSales
FROM [northwind].[FactSales];

/* Sales by Product Category */

SELECT
    p.CategoryName,
    SUM(f.SoldAmount) AS TotalSales
FROM [northwind].[FactSales] f
INNER JOIN [northwind].[DimProduct] p
    ON f.ProductKey = p.ProductKey
GROUP BY p.CategoryName
ORDER BY TotalSales DESC;


/* Top 5 Countries by Sales */

SELECT TOP 5
    c.CustomerCountry,
    SUM(f.SoldAmount) AS TotalSales
FROM [northwind].[FactSales] f
INNER JOIN [northwind].[DimCustomer] c
    ON f.CustomerKey = c.CustomerKey
GROUP BY c.CustomerCountry
ORDER BY TotalSales DESC;


/* Employee Ranking */

SELECT
    e.EmployeeName,
    SUM(f.SoldAmount) AS TotalSales,
    RANK() OVER(
        ORDER BY SUM(f.SoldAmount) DESC
    ) AS SalesRank
FROM [northwind].[FactSales] f
INNER JOIN [northwind].[DimEmployee] e
    ON f.EmployeeKey = e.EmployeeKey
GROUP BY e.EmployeeName
ORDER BY SalesRank;

