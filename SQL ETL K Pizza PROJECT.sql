USE [KPizza]
GO

SELECT *  FROM [dbo].[ETL]
select DAY,sum(Total_amount) as REVENUE
from [dbo].[ETL] group by day
order by sum(total_amount) desc

SELECT
    CASE
        WHEN DATEPART(HOUR, Time) >= 5 AND DATEPART(HOUR, TIME) < 12 THEN 'Morning'
        WHEN DATEPART(HOUR, Time) >= 12 AND DATEPART(HOUR, TIME) < 18 THEN 'Afternoon'
        ELSE 'Evening'
    END AS TimeOfDay
FROM [dbo].[ETL]

SELECT LOCATION, SUM(TOTAL_AMOUNT) AS REVENUE_2018 FROM [dbo].[ETL] WHERE YEAR= 2018 GROUP BY LOCATION ORDER BY SUM(TOTAL_AMOUNT)
SELECT LOCATION, SUM(TOTAL_AMOUNT) AS REVENUE_2019 FROM [dbo].[ETL] WHERE YEAR= 2019 GROUP BY LOCATION ORDER BY SUM(TOTAL_AMOUNT)
SELECT LOCATION, SUM(TOTAL_AMOUNT) AS REVENUE_2020 FROM [dbo].[ETL] WHERE YEAR= 2020 GROUP BY LOCATION ORDER BY SUM(TOTAL_AMOUNT)

select count(Money_Type) as trans,Money_Type ,YEAR from [dbo].[ETL] group by Money_Type,YEAR
select count(Money_Type) as trans,Money_Type, YEAR from [dbo].[ETL] where year= 2019 group by Money_Type,YEAR
select count(Money_Type) as trans,Money_Type ,YEAR from [dbo].[ETL] where year= 2020 group by Money_Type,YEAR













