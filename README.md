
# WALMART SALES DATA ANALYSIS

## About

This project aims to explore the Walmart Sales data to understand top-performing branches and products, sales trends of different products, and customer behavior. The goal is to study how sales strategies can be improved and optimized. The dataset was obtained from the Kaggle Walmart Sales Forecasting Competition.

> "In this recruiting competition, job-seekers are provided with historical sales data for 45 Walmart stores located in different regions. Each store contains many departments, and participants must project the sales for each department in each store. To add to the challenge, selected holiday markdown events are included in the dataset. These markdowns are known to affect sales, but it is challenging to predict which departments are affected and the extent of the impact." - source

## Purposes of the Project

The major aim of this project is to gain insight into the sales data of Walmart to understand the different factors that affect sales of the different branches.

## About Data

The dataset was obtained from the Kaggle Walmart Sales Forecasting Competition. It contains sales transactions from three different branches of Walmart located in Mandalay, Yangon, and Naypyitaw. The data contains 17 columns and 1000 rows.

[Book1.xlsx](https://github.com/Abbeyanalyt/walmatsalesanalysis/files/14072332/Book1.xlsx)

### 17 Columns
1. (List of 17 columns)

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

    II.	Build a database
    Create table and insert the data.
    Select columns with null values in them. There are no null values in our database as in creating the tables, we set NOT NULL for each field, hence null values are filtered out.

    III. Feature Engineering: This will help use generate some new columns from existing  ones.
      Add a new column named time_of_day to give insight of sales in the Morning, Afternoon and Evening. This will help answer the question on which part of the day most sales are made.
      Add a new column named day_name that contains the extracted days of the week on which the given transaction took place (Mon, Tue, Wed, Thur, Fri). This will help answer the question on which week of the day each 
      branch is busiest.
      Add a new column named month_name that contains the extracted months of the year on which the given transaction took place (Jan, Feb, Mar). Help determine which month of the year has the most sales and profit.

    IV. Exploratory Data Analysis (EDA): Exploratory data analysis is done to answer the listed questions and aims of this project.

CONCLUSION:

Business Questions To Answer

⦁	Generic Question

    How many unique cities does the data have?
    In which city is each branch?

⦁	Product

    How many unique product lines does the data have?
    What is the most common payment method?
    What is the most selling product line?
    What is the total revenue by month?
    What month had the largest COGS?
    What product line had the largest revenue?
    What is the city with the largest revenue?
    What product line had the largest VAT?
    Fetch each product line and add a column to those product line showing "Good", "Bad". Good if its greater than average sales
    Which branch sold more products than average product sold?
    What is the most common product line by gender?
    What is the average rating of each product line?


⦁	Sales

    Number of sales made in each time of the day per weekday
    Which of the customer types brings the most revenue?
    Which city has the largest tax percent/ VAT (Value Added Tax)?
    Which customer type pays the most in VAT?


Customer

    How many unique customer types does the data have?
    How many unique payment methods does the data have?
    What is the most common customer type?
    Which customer type buys the most?
    What is the gender of most of the customers?
    What is the gender distribution per branch?
    Which time of the day do customers give most ratings?
    Which time of the day do customers give most ratings per branch?
    Which day fo the week has the best avg ratings?
    Which day of the week has the best average ratings per branch?



Revenue And Profit Calculations

    $ COGS = unitsPrice * quantity $

    $ VAT = 5% * COGS $

    is added to the 
    and this is what is billed to the customer.

    $ total(gross_sales) = VAT + COGS $

    $ grossProfit(grossIncome) = total(gross_sales) - COGS $

    Gross Margin is gross profit expressed in percentage of the total(gross profit/revenue)

    $ \text{Gross Margin} = \frac{\text{gross income}}{\text{total revenue}} $

    Example with the first row in our DB:

    Data given:

    $ \text{Unite Price} = 45.79 $
    $ \text{Quantity} = 7 $
    $ COGS = 45.79 * 7 = 320.53 $

    $ \text{VAT} = 5% * COGS\= 5% 320.53 = 16.0265 $

    $ total = VAT + COGS\= 16.0265 + 320.53 = 

    $ \text{Gross Margin Percentage} = \frac{\text{gross income}}{\text{total revenue}}\=\frac{16.0265}{336.5565} = 0.047619\\approx 4.7619% $



CODE

  For the rest of code, check the ABBEYwalmart SQL queries
  
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


     Column	Description	data type



C
