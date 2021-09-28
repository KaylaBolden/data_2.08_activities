-- In this activity, we will be using the table district from the bank database and according to the description for the different columns:

-- 1. A4: no. of inhabitants
select *, rank() over(order by A4) as "rnk"
from bank.district;

-- 2. A9: no. of cities
select *, rank() over(order by A9) as "rnk"
from bank.district;

-- 3. A10: the ratio of urban inhabitants
select *, rank() over(order by A10) as "rnk"
from bank.district;

-- 4. A11: average salary
select *, rank() over(order by A11) as "rnk"
from bank.district;

-- 5. A12: the unemployment rate
select *, rank() over(order by A12) as "rnk"
from bank.district;

-- 6. Rank districts by different variables.
select *, rank() over(order by A16) as "rnk"
from bank.district;

-- 7. Do the same but group by region.
select *, rank() over(partition by a3 order by A16) as "rnk"
from bank.district;