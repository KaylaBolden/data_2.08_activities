-- 1. Use the transactions table in the bank database to find the Top 20 account_ids based on the amount.
select account_id, amount, rank () over(order by amount desc) as 'rank'
from bank.trans
limit 20;
-- 2. Illustrate the difference between rank() and dense_rank().
select account_id, amount, dense_rank () over(order by amount desc) as 'rank'
from bank.trans
limit 20;