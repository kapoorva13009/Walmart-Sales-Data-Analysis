# Walmart-Sales-Data-Analysis

Walmart is a global market leader in Superstore category, diving into its data and gaining insights from it leverage us to understand the business much more and help the company to take more robust and customer centric approch in expanding its business and increasing its Mega Mart outlets.

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

### 6. Data Cleaning
   - **Removing Duplicates**: Identified and removed duplicate entries to avoid skewed results.
   - **Handling Missing Values**: Droped rows or columns with missing values if they are insignificant; filled values where essential.
   - **Fixed Data Types**: Ensured all columns have consistent data types (e.g., dates as `datetime`, prices as `float`).
   - **Currency Formatting**: Used `.replace()` to handle and format currency values for analysis.
   - **Validation**: Checked for any remaining inconsistencies and verified the cleaned data.

### 7. Feature Engineering
   - **Created New Columns**: Created the `Total Amount` for each transaction by multiplying `unit_price` by `quantity` and added it as a new column.
   - **Enhanced Dataset**: This calculated field will streamline further SQL analysis and aggregation tasks.

### 8. Loading Data into MySQL database
   - **Setting Connection**: Connecting to MySQL using `sqlalchemy` and `pymysql` , then loading the cleaned data into the database.
   - **Table Creation**: Set up tables in both MySQL and PostgreSQL using Python SQLAlchemy to automate table creation and data insertion.
   - **Verification**: Run initial SQL queries to confirm that the data has been loaded accurately.

### 9. SQL Analysis: Complex Queries and Business Problem Solving
   - **Business Problem-Solving**: Write and execute complex SQL queries to answer critical business questions, such as:
     - Revenue trends across branches and categories.
     - Identifying best-selling product categories.
     - Sales performance by time, city, and payment method.
     - Analyzing peak sales periods and customer buying patterns.
     - Profit margin analysis by branch and category.
   - **Documentation**: Keep clear notes of each query's objective, approach, and results.

### 10. Project Publishing and Documentation
   - **Documentation**: Maintain well-structured documentation of the entire process in Markdown or a Jupyter Notebook.
   - **Project Publishing**: Publish the completed project on GitHub or any other version control platform, including:
     - The `README.md` file (this document).
     - Jupyter Notebooks (if applicable).
     - SQL query scripts.
     - Data files (if possible) or steps to access them.


