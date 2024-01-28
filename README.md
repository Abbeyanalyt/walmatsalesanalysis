
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
   Conduct analysis on the data to understand the different product lines, the product lines performing best, and the product lines that need improvement.

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

## II. Feature Engineering
- Introduce new columns like `time_of_day`, `day_name`, and `month_name` to derive insights about sales patterns.

## III. Exploratory Data Analysis (EDA)
- Investigate various business questions related to cities, product lines, sales, and customers.
- Analyze revenue and profit calculations using COGS, VAT, total sales, gross profit, and gross margin percentage.

## IV. Business Questions To Answer

### Generic Question
- Identify the number of unique cities and the branch associated with each city.

### Product
- Examine product-related insights, including payment methods, top-selling product lines, and revenue by month.

### Sales
- Analyze the number of sales per time of day and customer type, along with VAT-related questions.

### Customer
- Explore customer-related metrics, such as customer types, payment methods, and gender distribution.

### Revenue And Profit Calculations
- Understand the calculations behind COGS, VAT, total sales, gross profit, and gross margin percentage.

## CODE

### SQL Queries
- Refer to [ABBEYwalmart SQL queries](ABBEYwalmart.sql) for the complete set of SQL commands used in the project.

```sql
CREATE schema WalmartSales;

SELECT @@autocommit;

SET @@autocommit = OFF;

use WalmartSales;

CREATE TABLE sales(
    -- Fields and their data types
);




