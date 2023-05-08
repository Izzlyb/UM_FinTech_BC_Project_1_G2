SELECT * FROM account


SELECT * FROM alpaca_journal


SELECT * FROM equity


SELECT * FROM transaction_records


SELECT * FROM transaction_side


SELECT * FROM user_profile


UPDATE account SET user_account_id = 9 WHERE user_account_id = 12;



UPDATE transaction_records SET account_id = 9 WHERE account_id = 12;


SELECT ticker,value_high,value_close,trans_date FROM equity WHERE ticker='meta' ORDER BY value_close DESC;


UPDATE equity SET ticker = 'UAL' WHERE value_close='$45.70' and ticker='meta'


-- select empno,ename,hiredate from emp order by hiredate desc;
-- UPDATE HUMAN SET ADDRESS = 'Miami' WHERE LICENSENO = 44;