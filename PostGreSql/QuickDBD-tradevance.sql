-- NOTE: It is a good practice to type all SQL keywords in caps. 
-- SQL is case insensitive, but helps other programmer get a better
-- Understanding of the code.
-- Drop tables
DROP TABLE IF EXISTS user_profile CASCADE;
DROP TABLE IF EXISTS account CASCADE;
DROP TABLE IF EXISTS transaction_records CASCADE;
DROP TABLE IF EXISTS equity CASCADE;
DROP TABLE IF EXISTS transaction_side CASCADE;
DROP TABLE IF EXISTS alpaca_journal CASCADE;


-- Exported from QuickDBD: https://www.quickdatabasediagrams.com/
-- Link to schema: https://app.quickdatabasediagrams.com/#/d/aqzLIf
-- NOTE! If you have used non-SQL datatypes in your design, you will have to change these here.


CREATE TABLE user_profile (
    user_id 			SERIAL PRIMARY KEY,
    first_name 			VARCHAR(120)  NOT NULL,
    last_name 			VARCHAR(120)  NOT NULL,
    usr_password 		TEXT  NOT NULL,
    alpaca_acnt_no 		INT   NOT NULL,
    account_id 			INT   NOT NULL
);


CREATE TABLE account (
    account_id 			SERIAL PRIMARY KEY,
	user_account_id		INT   NOT NULL,
    balance				MONEY   NOT NULL,
    trans_date 			TIMESTAMP   NOT NULL
);


CREATE TABLE transaction_records (
    transaction_id		SERIAL PRIMARY KEY,
    account_id 			INT NOT NULL,
    trans_side_id 		INT   NOT NULL,
    trans_date 			TIMESTAMP   NOT NULL,
    quantity 			INT   NOT NULL,
	equity1_id 			INT   NOT NULL,
    equity2_id 			INT   NOT NULL,
	trans_currency    	VARCHAR(10)
);


CREATE TABLE transaction_side (
    trans_side_id 			SERIAL PRIMARY KEY,
    trans_name 				VARCHAR(25)   NOT NULL,
    trans_action 			VARCHAR(12)   NOT NULL,
	trans_code 				VARCHAR(12)   NOT NULL
);

CREATE TABLE equity (
    equity_id 			SERIAL PRIMARY KEY,
    ticker				VARCHAR(25)   NOT NULL,
    value_open 			MONEY   NOT NULL,
    value_high 			MONEY   NOT NULL,
    value_low 			MONEY   NOT NULL,
    value_close 		MONEY   NOT NULL,
    trans_date 			TIMESTAMP   NOT NULL
);

CREATE TABLE alpaca_journal (
    alpaca_journal_id 			SERIAL PRIMARY KEY,
	alpaca_transaction_id 		VARCHAR(255)   NOT NULL,
    user_id 					INT   NOT NULL,
	user_to_account 			INT   NOT NULL,
    entry_type 					INT   NOT NULL,
    status 						VARCHAR(50)   NOT NULL,
    user_from_account 			VARCHAR(100)   NOT NULL,
    settle_date 				TIMESTAMP   NOT NULL,
    system_date 				TIMESTAMP   NOT NULL,
    net_amount 					MONEY   NOT NULL,
    description 				VARCHAR(255)   NOT NULL,
    currency 					VARCHAR(10)   NOT NULL
);





ALTER TABLE "user_profile" ADD CONSTRAINT "fk_user_profile_account_id" FOREIGN KEY("account_id")
REFERENCES "account" ("account_id");

ALTER TABLE "transactions_records" ADD CONSTRAINT "fk_transactions_records_account_id" FOREIGN KEY("account_id")
REFERENCES "user_profile" ("account_id");

ALTER TABLE "transaction_side" ADD CONSTRAINT "fk_transaction_side_trans_side_id" FOREIGN KEY("trans_side_id")
REFERENCES "transactions_records" ("trans_side_id");

ALTER TABLE "alpaca_journal" ADD CONSTRAINT "fk_alpaca_journal_user_id" FOREIGN KEY("user_id")
REFERENCES "user_profile" ("user_id");

