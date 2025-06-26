CREATE DATABASE walmart;
USE walmart;

SELECT * FROM walmart_table;

#Checking for the table and its related information like datatypes
SELECT *
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_NAME = 'walmart_table';


#1. Find the differnet payment method and for each payment method : number of transaction and number qty sold:

SELECT payment_method, COUNT(total) as number_of_transaction, SUM(quantity) as number_of_quantity
FROM walmart_table
GROUP BY payment_method; 

#2. Identify the hieghest-rated category in each branch, displaying the branch, category and average rating:

with cte_wt_1 as (select branch, category, round(avg(rating),2) as average_ratings, rank() over(partition by branch order by avg(rating) desc) as num
from walmart_table
group by branch, category)

select * from cte_wt_1 where num = 1;

#3. Identify the busiest day for each branch based on number of transaction:

with cte_wt_2 as (
	select branch, 
           dayname(str_to_date(`date`, '%d/%m/%Y')) as day_of_date, 
           count(total) as number_of_transaction, 
           rank() over(partition by branch order by count(total) desc) as num
    from walmart_table
    group by branch, day_of_date)

select * 
from cte_wt_2
where num = 1;

#4. Determine the average, minimum and maximum ratings of products for each city:

select city, category, avg(rating), max(rating), min(rating)
from walmart_table
group by city, category
order by city, category;

#5. Calculate the total profit for each category displaying highest to lowest
    -- By considering total profit as : (unit_price * quantity * profit_margin)
    
select category, sum(total * profit_margin) as total_profit
from walmart_table
group by category;

#6. Determine the most common payment method for each branch:

with cte_wt_3 as (
select branch, payment_method, count(total) as amount_received, rank() over(partition by branch order by count(total) desc) as rn
from walmart_table
group by branch, payment_method)

select * from cte_wt_3 where rn = 1;

#7. Categorize sales into 3 shifts Morning, Afternoon, Evening and find number of transactions in each shift:

select branch,
       case
           when hour(time(`time`)) < 12 then "Morning"
           when hour(time(`time`)) between 12 and 17 then "Afternoon"
           else "Evening"
		end as shifts,
        count(total) as num_of_transaction
from walmart_table
group by branch, shifts
order by branch, num_of_transaction desc;

#8. Identify the five branch with highest decrease ration in revenue in 2023 comapre to last year 2022:

with revenue_2022 as (
  select branch,
         sum(total) as r_2022
  from walmart_table
  where year(date(`date`)) = 2022
  group by branch
  order by branch
) ,

revenue_2023 as (
  select branch,
         sum(total) as r_2023
  from walmart_table
  where year(date(`date`)) = 2023
  group by branch
  order by branch
)

select r_2.branch,
       r_2.r_2022 as last_year,
       r_3.r_2023 as this_year,
       round((((r_3.r_2023 - r_2.r_2022)/r_2.r_2022)*100) , 2) as rev_dec_ratio
from revenue_2022 as r_2 
inner join revenue_2023 as r_3 
on r_2.branch = r_3.branch
where r_3.r_2023 < r_2.r_2022
order by rev_dec_ratio
limit 5;