sp_rename 'market_segment.market_segment', 'market_segment1', 'COLUMN'
sp_rename 'meal_cost.meal', 'meal1', 'COLUMN'

create view hotel as 
(select * from
(select * from dbo.hotel2018
union 
select * from dbo.hotel2019
union
select * from dbo.hotel2020) t
left join dbo.market_segment ms
on t.market_segment = ms.market_segment1
left join meal_cost
on t.meal=meal_cost.meal1)

--calculate total revenue
select round(SUM((stays_in_week_nights+stays_in_weekend_nights)*adr*(1-discount)),2) as total_revenue 
from hotel

--calculate the total revenue each year for room rent 
select arrival_date_year, round(SUM((stays_in_week_nights+stays_in_weekend_nights)*adr*(1-discount)),2) as revenue 
from hotel
group by arrival_date_year
order by 1

--calculate total revenue each year for every services including meals
select arrival_date_year, round(SUM((stays_in_week_nights+stays_in_weekend_nights)*adr*(1-discount)+cost),2) as revenue_add
from hotel
group by arrival_date_year
order by 1

--calculate total revenue each year each hotel for every services including meals
select arrival_date_year, hotel, round(SUM((stays_in_week_nights+stays_in_weekend_nights)*adr*(1-discount)+cost),2) as revenue_add
from hotel
group by arrival_date_year, hotel 
order by 1,2

--calculate total visit each year
select arrival_date_year, SUM(adults+children) as visit
from hotel
group by arrival_date_year
order by 1

--calculate total visitor each year each hotel
select arrival_date_year, hotel, SUM(adults+children) as visitor
from hotel
group by arrival_date_year, hotel 
order by 1,2

--Number of visits by months
select arrival_date_year, arrival_date_month, COUNT(arrival_date_month) as month_number
from hotel
group by arrival_date_year, arrival_date_month
order by 1,3 DESC
