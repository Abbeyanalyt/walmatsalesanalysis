CREATE schema WalmartSales;

SELECT  @@autocommit;
 
 SET @@autocommit = OFF;

use WalmartSales;

CREATE TABLE sales(
invoice_id VARCHAR(30) NOT NULL PRIMARY KEY,
branch VARCHAR(30) NOT NULL,
city VARCHAR(30) NOT NULL,
customer_type VARCHAR(30) NOT NULL,
gender VARCHAR(30) NOT NULL,
product_line VARCHAR(100) NOT NULL,
unit_price DECIMAL(10,2) NOT NULL,
quantity INT NOT NULL,
tax_pct FLOAT(6,4) NOT NULL,
total DECIMAL(12,4) NOT NULL,
date DATETIME NOT NULL,
time TIME NOT NULL,
payment VARCHAR(15) NOT NULL,
cogs DECIMAL(10,2) NOT NULL,
gross_margin_pct FLOAT(11,9),
gross_income DECIMAL(12,4),
rating FLOAT(2,1)
);

SELECT * FROM sales;







-- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------Feature Engineering----------------------------------------------------------
-- time_of_day

SELECT 
    time,
    CASE
        WHEN time BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
		WHEN time BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
		ELSE "evening" 
	END AS time_of_date 
FROM sales ; 

ALTER TABLE sales ADD COLUMN time_of_day VARCHAR(20);

UPDATE sales 
SET time_of_day =  (
   CASE
        WHEN time BETWEEN "00:00:00" AND "12:00:00" THEN "Morning"
		WHEN time BETWEEN "12:01:00" AND "16:00:00" THEN "Afternoon"
		ELSE "evening" 
   END
 );  
 
 -- DAY_NAME
 SELECT
     date,
 DAYNAME(date) AS day_name
FROM sales;     

ALTER TABLE sales
ADD COLUMN day_name VARCHAR(10);

UPDATE sales
SET day_name = DAYNAME(date);

-- ----month_name
SELECT 
    date,
    MONTHNAME(DATE) AS month_name
FROM sales ; 

ALTER TABLE sales
ADD COLUMN  month_name VARCHAR(10);

UPDATE sales 
set month_name = MONTHNAME(date);
-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------

 

-- --------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- -------------------------------------------------------GENERIC-----------------------------------------------------------------------------------------------------------

-- How many unique cities does the data have?
select 
    DISTINCT(city) 
FROM sales;

select 
    DISTINCT(branch) 
FROM sales;

SELECT
    DISTINCT city,
    branch 
FROM sales; 

-- -----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ------------------------------------------------------- Products -----------------------------------------------------------------------------------------------------------

-- How many unique product lines does the data have?  
SELECT 
   COUNT(DISTINCT product_line)
FROM sales; 

-- What is the most common payment method?
SELECT 
   payment AS payment_method,
   COUNT(payment) AS counts
FROM sales
GROUP BY payment
ORDER BY counts DESC;

-- What is the most selling product_line
SELECT 
   product_line,
   count(product_line) AS counts
FROM sales
GROUP BY product_line
ORDER BY counts DESC; 

-- What is the total revenue by month
 SELECT 
     month_name AS Month,
    SUM(total) AS total_revenue
FROM sales 
GROUP BY Month 
ORDER BY total_revenue DESC; 

-- What month had the largest COGS
SELECT 
   month_name AS month,
   SUM(cogs) AS cog
FROM sales
GROUP BY month
ORDER BY cog DESC;

-- What product line had the largest revenue
SELECT 
    product_line,
    SUM(total) as total_revenue
FROM sales
GROUP BY product_line
ORDER BY total_revenue DESC;

-- what is the city with the largest revenue
SELECT 
   branch, 
   city,
   SUM(total) AS total_revenue
FROM sales
GROUP BY city, branch
ORDER BY total_revenue;
   

-- What product line had the largest VAT
SELECT 
      product_line,
	  AVG(tax_pct) AS avg_tax
 FROM sales
 GROUP BY product_line
 ORDER BY avg_tax DESC;
 
 -- Fetch each product line and add a column to those product line showing "Good", "BAD". Good ifs greater 
 -- than average sales
 
 SELECT 
     product_line, 
     SUM(total) as total_sum,
     CASE 
     WHEN total_sum > AVG(total) THEN "GOOD"
     ELSE "BAD"
     END AS sale_reviews
 FROM sales
 GROUP BY product_line, total_sum;
 
 -- What branch sold more products than average product sold?
 
 SELECT 
     branch,
     SUM(quantity) AS qty
  FROM sales
  GROUP BY branch
  HAVING SUM(quantity) > (select AVG(quantity) FROM sales);
  
  -- What is the most common product line by gender
  SELECT 
     gender, 
     product_line,
     COUNT(gender) AS total_count
FROM sales
GROUP BY gender, product_line 
ORDER BY total_count DESC;

-- What is the average rating of each product line
SELECT 
     product_line,
	ROUND(AVG(rating), 2) as average_rating
FROM sales
GROUP BY product_line
ORDER BY average_rating DESC;  

-- ----------------------------------------------------------------------------------------------------------------------------------------------------------------------------
-- ----------------------------------------------- Sale ---------------------------------------------------------------------------------------------------------------------

-- number of sales made in each time of the year per weekday
SELECT 
      time_of_day,
      COUNT(*) AS total_sales
 FROM sales
 WHERE day_name = "tuesday"
 GROUP BY time_of_day
 ORDER BY total_sales DESC;
 
 -- which of the customer types brings the most revenue?
 SELECT 
   customer_type,
   SUM(total) AS most_revenue
FROM sales
GROUP BY customer_type
ORDER BY most_revenue DESC;   

-- which city has the largest tax percent/VAT(value added TAX)
 
 SELECT 
 city,
    ROUND(avg(tax_pct), 2) as largest_tax_percent
 FROM sales
 GROUP BY city 
 ORDER BY largest_tax_percent DESC;
 
 -- which customer type pays the most in VAT
 SELECT 
     customer_type,
     AVG(tax_pct) as most_VAX
  FROM sales
  GROUP BY customer_type
  ORDER BY most_VAX DESC;
  
  -- ------------------------------------------------------------------------------------------------------------------------------------------------------------------------------
  -- ------------------------------------ Customers -----------------------------------------------------------------------------------
  
  -- How many unique customer types does the data have?
  
   SELECT 
     distinct
     customer_type
  FROM sales ;
  
  -- How many unique payment method deos the data have
  SELECT 
    DISTINCT 
    payment AS payment_type
FROM sales;  

-- What is the most common customer type

SELECT 
    customer_type,
    COUNT(customer_type) as most_common
FROM sales
GROUP BY customer_type
ORDER BY most_common DESC; 

-- Which customer type buys the most ?
SELECT 
   customer_type ,
   ROUND(SUM(total), 2) AS most_purchased
FROM sales
GROUP BY customer_type
ORDER BY most_purchased DESC;

-- what is the gender of most of the customers?
SELECT 
  gender,
  COUNT(gender) AS gender_count
FROM sales
GROUP BY gender 
ORDER BY gender_count;  

-- What is the gender distribution by branch 
SELECT
    branch,
    gender,
    COUNT(gender) as total_count
FROM sales
GROUP BY branch, gender
ORDER BY total_count DESC;  

-- which time of the day do customers give most ratings?
SELECT 
  time_of_day,
  AVG(rating) AS most_rating
FROM sales
GROUP BY time_of_day
ORDER BY most_rating DESC;

-- which time of the day do customers give most rating per branch
SELECT 
   branch,
  time_of_day,
  AVG(rating) AS most_rating
FROM sales
GROUP BY branch, time_of_day
ORDER BY most_rating DESC;

-- which day of the week has the best avg rating 

SELECT 
    day_name,
    AVG(rating) AS best_avg_rating 
FROM sales
GROUP BY day_name 
ORDER BY best_avg_rating DESC;

-- which day of the week has the best average rating per branch
SELECT 
	branch,
    day_name,
    AVG(rating) AS best_avg_rating 
FROM sales
GROUP BY branch,day_name 
ORDER BY branch, best_avg_rating DESC;

COMMIT;


    

  


  
    
  


  
  

  
  
  
  
     
	
     
 
     



    
    
     

  
  
 