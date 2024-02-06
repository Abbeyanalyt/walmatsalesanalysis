
# WALMART SALES DATA ANALYSIS

## About

This project aims to explore the Walmart Sales data to understand top-performing branches and products, sales trends of different products, and customer behavior. The goal is to study how sales strategies can be improved and optimized. The dataset was obtained from the Kaggle Walmart Sales Forecasting Competition.

> "In this recruiting competition, job-seekers are provided with historical sales data for 45 Walmart stores located in different regions. Each store contains many departments, and participants must project the sales for each department in each store. To add to the challenge, selected holiday markdown events are included in the dataset. These markdowns are known to affect sales, but it is challenging to predict which departments are affected and the extent of the impact." - source

## Purposes of the Project

The major aim of this project is to gain insight into the sales data of Walmart to understand the different factors that affect sales of the different branches.

## About Data

The dataset was obtained from the Kaggle Walmart Sales Forecasting Competition. It contains sales transactions from three different branches of Walmart located in Mandalay, Yangon, and Naypyitaw. The data contains 17 columns and 1000 rows.


# Table for Columns

| Column Name               | Description                                      | Data Type       |
|---------------------------|--------------------------------------------------|-----------------|
| invoice_id                | Invoice of the sales made                         | VARCHAR(30)     |
| branch                    | Branch at which sales were made                   | VARCHAR(5)      |
| city                      | The location of the branch                        | VARCHAR(30)     |
| customer_type             | The type of the customer                           | VARCHAR(30)     |
| gender                    | Gender of the customer making purchase            | VARCHAR(10)     |
| product_line              | Product line of the product sold                   | VARCHAR(100)    |
| unit_price                | The price of each product                         | DECIMAL(10,2)   |
| quantity                  | The amount of the product sold                     | INT             |
| VAT                       | The amount of tax on the purchase                 | FLOAT(6,4)      |
| total                     | The total cost of the purchase                    | DECIMAL(10,2)   |
| date                      | The date on which the purchase was made           | DATE            |
| time                      | The time at which the purchase was made           | TIMESTAMP       |
| payment_method            | The total amount paid                             | DECIMAL(10,2)   |
| cogs                      | Cost Of Goods sold                                | DECIMAL(10,2)   |
| gross_margin_percentage   | Gross margin percentage                           | FLOAT(11,9)     |
| gross_income              | Gross Income                                     | DECIMAL(10,2)   |
| rating                    | Rating                                           | FLOAT(2,1)      |


## Analysis List

I. **Product Analysis**
   - Conduct analysis on the data to understand the different product lines, the product lines performing best, and the product lines that need improvement.
     
II. **Sales Analysis**
   This analysis aims to answer the question of the sales trends of products. The result of this can help measure the effectiveness of each sales strategy the business applies and what modifications are needed to gain more sales.

III. **Customer Analysis**
   This analysis aims to uncover the different customer segments, purchase trends, and the profitability of each customer segment.

## Approaches Used

I. **Data Wrangling:**
   This is the first step where inspection of data is done to make sure NULL values and missing values are detected, and data replacement methods are used to replace missing or NULL values.

## I. Build a Database

### Database Creation
- Set up the WalmartSales schema.
- Create a sales table with fields such as invoice_id, branch, city, customer_type, gender, product_line, unit_price, quantity, etc.
- Ensure no null values by setting NOT NULL constraints during table creation.
-  
## II. Feature Engineering
- Introduce new columns like `time_of_day`, `day_name`, and `month_name` to derive insights about sales patterns.

## III. Exploratory Data Analysis (EDA)
- Investigate various business questions related to cities, product lines, sales, and customers.
- Analyze revenue and profit calculations using COGS, VAT, total sales, gross profit, and gross margin percentage.

## IV. Business Questions To Answer

### Generic Question
- Identify the number of unique cities and the branch associated with each city.
- in which city is each branch?


### Product
- Examine product-related insights, including payment methods, top-selling product lines, and revenue by month.
-  How many unique product lines does the data have?
-   what is the most selling product line?
-   what is the total revenue by month?
-   what month had the largest COGS?
-   what  at product line had the largest revenue?
-   what is the city with the largest revenue?
-   what product line had the largest VAT?
-   fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
-   which branch sold more products than average product sold?
-   what is the most common product line by gender?
-   what is the average rating of each product line?

### Sales
- Analyze the number of sales per time of day and customer type, along with VAT-related questions.
- Number of sales made in each time of the day per weekday
- Which of the customer types brings the most revenue?
- Which city has the largest tax percent/ VAT (Value Added Tax)?
- Which customer type pays the most in VAT

### Customer
- Explore customer-related metrics, such as customer types, payment methods, and gender distribution.
- How many unique customer types does the data have?
- How many unique payment methods does the data have
- What is the most common customer type?
- Which customer type buys the most?
- What is the gender of most of the customers?
- What is the gender distribution per branch?
- Which time of the day do customers give most ratings?
- Which time of the day do customers give most ratings per branch?
- Which day fo the week has the best avg ratings?
- Which day of the week has the best average ratings per branch?

### Revenue And Profit Calculations
- Understand the calculations behind COGS, VAT, total sales, gross profit, and gross margin percentage.

## CODE

### SQL Queries
- Refer to [ABBEYwalmart SQL queries]for the complete set of SQL commands used in the project.

```sql
CREATE schema WalmartSales;

SELECT @@autocommit;

SET @@autocommit = OFF;

use WalmartSales;

CREATE TABLE sales(
    -- Fields and their data types
);




