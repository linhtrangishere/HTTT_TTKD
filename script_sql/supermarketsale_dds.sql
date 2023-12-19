USE MASTER
GO

IF DB_ID('supermarketsale_dds') IS NOT NULL
	DROP DATABASE supermarketsale_dds;
GO

CREATE DATABASE supermarketsale_dds
GO

USE supermarketsale_dds
GO


CREATE TABLE dim_customer_type(
	CustomerType_SK int primary key,
	CustomerType varchar(10),
	Active bit default 1
)
GO

CREATE TABLE dim_gender(
	Gender_SK int primary key,
	Gender char(1), --F for Femail and M for Male
	Active bit default 1
)
GO

CREATE TABLE dim_payment_type(
	PaymentType_SK int primary key,
	PaymentType varchar(20),
	Active bit default 1
)
GO

CREATE TABLE dim_city(
	Branch_SK int primary key,
	Branch_NK char(1),
	City varchar(10),
	Active bit default 1
)
GO

CREATE TABLE dim_productline(
	ProductLineID_SK int primary key,
	ProductLineID_NK varchar(5),
	ProductLine varchar(30),
	Active bit default 1
)

GO

CREATE TABLE dim_product
(
	ProductID_SK int primary key,
	ProductID_NK varchar(20),
	UnitPrice float,
	ProductLine int foreign key references dim_productline(ProductLineID_SK),
	Active bit default 1
)
GO

CREATE TABLE dim_date
(
	DateID_SK int identity (1,1) primary key,
	Date date null, -- Full date in mm/dd/yyyy format
	AnsiDate char(10) null, --Full date in yyyy-mm-dd format
	SqlDate datetime, --Full date in SQL Server datetime data type.
	Day int, --The day of the month
	Month int,
	Quarter char(2), --Q1, Q2 etc
	Year int,
	Time time(7) NULL,
	Active bit default 1
)
GO

CREATE TABLE fact_sales
(
	InvoiceID_SK int,
	Branch_SK int foreign key references dim_city(Branch_SK),
	CustomerType_SK int foreign key references dim_customer_type(CustomerType_SK),
	Gender_SK int foreign key references dim_gender(Gender_SK),
	ProductID_SK int foreign key references dim_product(ProductID_SK),
	DateID_SK int foreign key references dim_date(DateID_SK),
	PaymentType_SK int foreign key references dim_payment_type(PaymentType_SK),
	InvoiceID_NK varchar(20),
	Quantity int,
	Tax5Percentage float,
	Total float,
	Date date,
	Time time, 
	Cogs float,
	GrossMarginPercentage float,
	GrossIncome float,
	Rating float, 
	Active bit default 1
	primary key(InvoiceID_SK, Branch_SK, CustomerType_SK, Gender_SK, ProductID_SK, PaymentType_SK, DateID_SK)
)
GO
--use metadata
--go
--update data_flow 
--set lset = null, cet = null
