create database ola;
use ola;


# 1. Retrieve all successful bookings:
create view all_successful_bookings as
select * from bookings
where Booking_Status = 'Success';
# select * from all_successful_bookings;

# 2. Find the average ride distance for each vehicle type:
 create view average_ride_distance as
 select Vehicle_Type, ROUND(AVG(Ride_Distance), 2) as average_ride
 from bookings 
 group by Vehicle_Type;

# 3. Get the total number of cancelled rides by customers:

create view cancelled_rides_by_customers as
SELECT COUNT(*) FROM bookings
WHERE Booking_Status = 'Canceled by Customer';


# 4. List the top 5 customers who booked the highest number of rides:

create view top_5_customers as 
select Customer_ID , count(Booking_ID) as Total_rides
from bookings 
group by customer_ID 
order by  Total_rides DESC limit 5;


# 5. Get the number of rides cancelled by drivers due to personal and car-related issues:

create view cancelled_by_drivers_P_C as
select count(*) from bookings
where Canceled_Rides_by_Driver = 'Personal & Car related issue'


# 6. Find the maximum and minimum driver ratings for Prime Sedan bookings:

create view max_and_min_driver_ratings as
select max(Driver_Ratings) as Maximun_Rating,
min(Driver_Ratings) as Minimun_Rating
from bookings
where Vehicle_Type = 'Prime Sedan'


# 7. Retrieve all rides where payment was made using UPI:

create view  rides_UPI as 
select * from bookings
where Payment_Method= 'UPI'


# 8. Find the average customer rating per vehicle type:

create view avg_cus_rating as
select Vehicle_Type, round(avg(Customer_Rating),2) as avg_rating
from bookings
group by Vehicle_Type;


# 9. Calculate the total booking value of rides completed successfully:

Create View total_successful_ride_value As
select sum(Booking_value) as total_successful_ride_value
from bookings
where Booking_Status = 'Success';


# 10. List all incomplete rides along with the reason:

Create View Incomplete_Rides_Reason As
select Booking_ID,Incomplete_Rides_Reason
from bookings
where Incomplete_Rides = 'Yes';





