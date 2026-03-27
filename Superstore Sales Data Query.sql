SELECT *
FROM superstore_sales;

SELECT `Order Date`, STR_TO_DATE(`Order Date`, '%m/%d/%Y'),
 `Ship Date`, STR_TO_DATE(`Ship Date`, '%m/%d/%Y')
 FROM superstore_sales;

UPDATE superstore_sales
SET 
	`Order Date`= STR_TO_DATE(`Order Date`, '%m/%d/%Y'),
    `Ship Date` = STR_TO_DATE(`Ship Date`, '%m/%d/%Y');
    
SELECT `Order Date`, `Ship Date`
FROM superstore_sales
LIMIT 20
;

ALTER TABLE superstore_sales
MODIFY `Order Date` DATE,
MODIFY  `Ship Date`DATE;

SELECT *
FROM superstore_sales;

-- Q1a: Total Sales and Profit by Region

SELECT Region,
	ROUND(SUM(Sales), 2)  AS total_sales,
    ROUND(SUM(Profit), 2)  AS total_profit,
    ROUND(SUM(Profit)/ SUM(Sales) * 100, 2)  AS profit_margin_pct
FROM superstore_sales
GROUP BY Region
ORDER BY total_sales DESC;

-- Q1b: Sales and Profit by Category

SELECT Category,
	ROUND(SUM(Sales), 2)  AS total_sales,
    ROUND(SUM(Profit), 2)  AS total_profit,
    ROUND(SUM(Profit)/ SUM(Sales) * 100, 2)  AS profit_margin_pct
FROM superstore_sales
GROUP BY Category
ORDER BY total_sales DESC;

-- Q1c: Drill dowm - Sub-Category performance (the revealing one)

SELECT Category, `Sub-Category`,
	ROUND(SUM(Sales), 2)  AS total_sales,
    ROUND(SUM(Profit), 2)  AS total_profit,
    ROUND(SUM(Profit)/ SUM(Sales) * 100, 2)  AS profit_margin_pct,
    COUNT(DISTINCT `Order ID`)  AS order_count
FROM superstore_sales
GROUP BY Category, `Sub-Category`
ORDER BY total_profit ASC;


SELECT Category,
	ROUND(SUM(Sales), 2)  AS total_sales,
    ROUND(SUM(Profit), 2)  AS total_profit,
    ROUND(SUM(Profit)/ SUM(Sales) * 100, 2)  AS profit_margin_pct,
    COUNT(DISTINCT `Order ID`)  AS order_count
FROM superstore_sales
GROUP BY Category
ORDER BY total_profit ASC;

-- Q2a: Average profit margin by discount band

SELECT *
FROM superstore_sales;

SELECT `Discount Band`,
	COUNT(*) AS order_lines,
    ROUND(AVG(Discount)*100, 1)  AS avg_discount_pct,
    ROUND(SUM(Profit), 2)  AS total_profit,
    ROUND(AVG(`Profit Margin %`)* 100, 2)  AS avg_profit_pct
FROM superstore_sales
GROUP BY `Discount Band`
ORDER BY avg_discount_pct;

-- Q2b: Count how many order lines are outright loss making

SELECT `Discount Band`,
	COUNT(*) AS total_lines, ROUND(SUM(Profit) / SUM(Sales) * 100 , 2)  AS avg_margin_pct, ROUND(AVG(Discount)*100, 1)  AS avg_discount_pct,
    SUM(CASE WHEN profit < 0 THEN 1 ELSE 0 END) AS loss_making_lines,
    ROUND(
		SUM(CASE WHEN profit < 0 THEN 1 ELSE 0 END)* 100.0
        /COUNT(*), 1) AS pct_loss_making
        FROM superstore_sales
        GROUP BY `Discount Band`
        ORDER BY avg_discount_pct;
    
-- Q2c: WHich Sub-Categories sufffer most from high discount

SELECT `Sub-Category`,
	 ROUND(AVG(Discount)*100, 1)  AS avg_discount_pct,
     ROUND(SUM(Profit),2)  AS total_profit,
     COUNT(*) AS total_lines
FROM superstore_sales
WHERE `Discount Band` = 'High(41%+)'
GROUP BY `Sub-Category`
ORDER BY total_profit ASC;

SELECT *
FROM superstore_sales;

SELECT `Discount Band`,
	 ROUND(SUM(Profit) /SUM(Sales) * 100, 2) AS avg_margin_pct
FROM superstore_sales
GROUP BY `Discount band`;

SELECT `Discount Band`,
	COUNT(*) AS losing_orders,
    COUNT(*) / (SELECT COUNT(*) FROM superstore_sales) AS fraction_losing,
    ROUND(1/ (COUNT(*) / (SELECT COUNT(*)
FROM superstore_sales))) AS one_in_n
FROM superstore_sales
WHERE `Discount band` = 'High(41%+)';

SELECT `Order ID`, Sales, Profit, Discount, `Profit Margin %`
FROM superstore_sales
WHERE `Discount Band` = 'High(41%+)'
LIMIT 10;

SELECT `Discount Band`,
	ROUND(SUM(Sales), 2)  AS total_sales,
    ROUND(SUM(Profit), 2)  AS total_profit,
    ROUND(AVG(Discount) * 100, 2)  AS avg_discount_pct,
    ROUND(SUM(Profit)/SUM(Sales) * 100, 2) AS profit_margin_pct
FROM superstore_sales
WHERE `Discount Band` = 'High(41%+)'
GROUP BY `Discount Band`
ORDER BY total_profit ASC;

SELECT `Sub-Category`,
	ROUND(SUM(Sales), 2)  AS total_sales,
    ROUND(SUM(Profit), 2)  AS total_profit,
    ROUND(AVG(Discount) * 100, 2)  AS avg_discount_pct,
    COUNT(*)  AS order_lines,
    ROUND(SUM(Profit)/SUM(Sales) * 100, 2) AS profit_margin_pct
FROM superstore_sales
WHERE `Discount Band` = 'High(41%+)'
GROUP BY `Sub-Category`
ORDER BY total_profit ASC
LIMIT 5;

SELECT `Sub-Category`, `Discount Band`,
    ROUND(SUM(Profit), 2)  AS total_profit,
    ROUND(AVG(Discount) * 100, 2)  AS avg_discount_pct,
    COUNT(*) AS order_lines,
    ROUND(SUM(Profit)/SUM(Sales) * 100, 2) AS profit_margin_pct
FROM superstore_sales
WHERE `Sub-Category` IN ('Binders', 'Machines', 'Bookcases', 'Tables')
GROUP BY `Sub-Category`, `Discount Band`
ORDER BY `Sub-Category`, avg_discount_pct;


SELECT `Sub-Category`, `Discount Band`,
    ROUND(SUM(Profit), 2)  AS total_profit,
    ROUND(AVG(Discount) * 100, 2)  AS avg_discount_pct,
    COUNT(*) AS order_lines,
    ROUND(SUM(Profit)/SUM(Sales) * 100, 2) AS profit_margin_pct
FROM superstore_sales
WHERE `Sub-Category` = 'Tables'
GROUP BY `Sub-Category`, `Discount Band`
ORDER BY total_profit ASC;

SELECT 
	ROUND(SUM(Profit)/(99559)* 100, 2)  AS total_profit
FROM superstore_sales;

SELECT `Discount Band`,
	ROUND(SUM(Profit), 2)  AS total_profit
FROM superstore_sales
WHERE `Discount Band` IN ('no discount', 'Low(1-20%)', 'Medium(21-40%)')
GROUP BY `Discount Band`;


SELECT `Sub-Category`,
	ROUND(SUM(Sales), 2)  AS total_sales,
    ROUND(SUM(Profit), 2)  AS total_profit,
    ROUND(SUM(Profit)/ SUM(Sales) * 100, 2)  AS profit_margin_pct,
    ROUND(AVG(Discount), 2) avg_discount
FROM superstore_sales
GROUP BY `Sub-Category`
ORDER BY total_sales DESC;



































