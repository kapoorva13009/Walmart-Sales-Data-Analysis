# Walmart-Sales-Data-Analysis

Walmart is a global market leader in Supermarket's category, diving into its data and gaining insights from it leverage us to understand the business much more and help the company to take more robust and customer centric approch in expanding its business and increasing its Mega Mart outlets.

---

## Project Overview

![project flow](https://github.com/kapoorva13009/Walmart-Sales-Data-Analysis/blob/main/Walmart%20project%20pipeline.png)

This project helps me to understand the use of Python, Kaggle, SQL and Power BI in synergy to produce data-driven business outcomes and gaining insights from the data to make greater business decisions.

---

## Project Steps

### 1. Setting Up the Environment
   - **Tools Used**: Visual Studio Code (VS Code), Python, SQL (MySQL)
   - **Goal**: Created a structured workspace within VS Code and organize project folders for smooth development and data handling.

### 2. Using Kaggle API
   - **API Setup**: Obtaining my Kaggle API token from [Kaggle](https://www.kaggle.com/) by navigating to profile settings and downloading the JSON file.
   - **Configuring Kaggle**: 
      - Placed the downloaded `kaggle.json` file in local `.kaggle` folder.
      - Used the command `kaggle datasets download -d <dataset-path>` to pull datasets directly into project.
        
### 3. Downloading Walmart Sales Data
   - **Data Source**: Using Kaggle API to download the Walmart sales datasets from Kaggle.
   - **Dataset Link**: [Walmart Sales Dataset](https://www.kaggle.com/najir0123/walmart-10k-sales-datasets)
   - **Storage**: Saving the data in the project folder for easy reference and access.

### 4. Installing Required Libraries and Loading Data
   - **Libraries**: Installing necessary Python libraries using:
     ```bash
     pip install pandas numpy sqlalchemy pymysql  
     ```
   - **Loadinging Data**: Reading the data into a Pandas DataFrame for initial analysis and transformations.

### 5. Exploring the Data
   - **Goal**: Conducted an initial data exploration to understand data distribution, checked column names, types, and identified potential issues.
   - **Analysis**: Used functions like `.info()`, `.describe()`, and `.head()` to get a quick overview of the data structure and statistics.
```python
       #Checking the data

       df.describe()
       df.info()
       df.isnull().sum()

```

### 6. Data Cleaning
   - **Removing Duplicates**: Identified and removed duplicate entries to avoid skewed results.
   - **Handling Missing Values**: Droped rows or columns with missing values if they are insignificant; filled values where essential.
   - **Fixed Data Types**: Ensured all columns have consistent data types (e.g., dates as `datetime`, prices as `float`).
   - **Currency Formatting**: Used `.replace()` to handle and format currency values for analysis.
   - **Validation**: Checked for any remaining inconsistencies and verified the cleaned data.
```python

      #as we see their is $ sign we need to remove it.

      df['unit_price'] = df['unit_price'].str.replace("$", "")

```

### 7. Feature Engineering
   - **Created New Columns**: Created the `Total Amount` for each transaction by multiplying `unit_price` by `quantity` and added it as a new column.
   - **Enhanced Dataset**: This calculated field will streamline further SQL analysis and aggregation tasks.
```python

      #Adding a column Total

      df['total'] = df['unit_price'] * df['quantity']

```

### 8. Loading Data into MySQL database
   - **Setting Connection**: Connecting to MySQL using `sqlalchemy` and `pymysql` , then loading the cleaned data into the database.
   - **Table Creation**: Using Python SQLAlchemy to automate table creation and data insertion in MySQL.
   - **Verification**: Runnig initial SQL queries to confirm that the data has been loaded accurately.

### 9. SQL Analysis: Complex Queries and Business Problem Solving
   - **Business Problem-Solving**: Executing complex SQL queries to answer critical business questions, such as:
     - Revenue trends across branches and categories.
     - Identifying best-selling product categories.
     - Sales performance by time, city, and payment method.
     - Analyzing peak sales periods and customer buying patterns.
     - Profit margin analysis by branch and category.
   - **Documentation**: Kept a clear note of each query's objective, approach, and results.
     - Example:
```sql
       --- Find the differnet payment method and for each payment method find number of transaction and number qty sold:

       SELECT
             payment_method,
             COUNT(total) as number_of_transaction,
             SUM(quantity) as number_of_quantity
       FROM walmart_table
       GROUP BY payment_method;
       
```

---

## Results and Insights

1. **Sales Insights**: Found key categories, branches with highest sales and preferred payment methods.
2. **Profitability**: Insights into the most profitable product categories and locations.
3. **Customer Behavior**: Trends in ratings, payment preferences, and peak shopping hours.

---

## License

This project is licensed under the MIT License. 

---

## Acknowledgments

- **Data Source**: Kaggle’s Walmart Sales Dataset
- **Inspiration**: Walmart’s business case studies on sales and supply chain optimization.

---
