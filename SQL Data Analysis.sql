create database Uber_DA;
--IMPORT THE UBER DATASET
select * from [dbo].[uber];
--Import other Dimention Tables such as Payment_type,Ratecode,Passenger_count,Datetime,Pickup, Dropoff,
select * from payment_type;
select * from ratecode;
select * from passenger_count;
select * from datetime_dim;
select * from pickup;
select * from dropoff;



--Find the total_fare by each vendor

select  VendorID, sum(fare_amount) as total_fare from uber group by VendorID;



select b.payment_type_name, avg(tip_amount) as Total_tip from uber a
join payment_type b on a.payment_type = b.payment_type group by payment_type_name
ORDER BY Total_tip DESC;
--FIND TOTAL NUMBER OF TRIPS BY THE PASSENGER COUNTS



--FIND THE TOP 10 PICKUP LOCATIONS BASED ON THE NUMBER OF TRIPS



--FIND THE AVERAGE FARE AMOUNT BY HOUR OF THE DAY

--


