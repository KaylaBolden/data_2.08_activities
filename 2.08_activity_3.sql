-- Keep using the bank database.

-- 1. Get a rank of districts ordered by the number of customers.
select rank() over(order by count(*) desc), A2 as District, count(*) from bank.client c left join bank.district d on c.district_id=d.A1
group by A2;

-- 2. Get a rank of regions ordered by the number of customers.
select rank() over(order by count(*) desc), A3 as Region, count(*) from bank.client c left join bank.district d on c.district_id=d.A1
group by A3;
-- 3. Get the total amount borrowed by the district together with the average loan in that district.
select A3 as District
,sum(amount) as Total_borrowed
,avg(amount) as Avg_Loan 
from bank.loan l 
inner join bank.account a on l.account_id=a.account_id
inner join bank.district d on a.district_id=d.A1
group by A3
order by Total_borrowed;

select * from bank.loan;
select * from bank.account;
-- 4. Get the number of accounts opened by district and year
select year(convert(date,date)) as created_Year from bank.account;
select year(convert(date,date)) as created_Year
, A3 as district
, count(*) as AccountCount
 from bank.account a 
 left join bank.district d on a.district_id=d.a1
 group by year(convert(date,date))
 ,A3
 order by created_Year
 ,AccountCount desc;