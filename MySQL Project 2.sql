-- use database 
use paints;
-- show tables
show tables;

select * from artist;
select * from museum;
select * from work;
select * from museum_hours;
select * from product_size;
select * from subject;
select * from canvas_size;
select * from image_link;

-- Joining Tables:
-- 1. Retrieve the full name of artists along with the names of the museums where their works are displayed.

select artist.full_name,museum.name
from artist
JOIN  work on artist.artist_id = work.artist_id
Join museum on work.museum_id = museum.museum_id;

-- 2. Group By and Count:
-- How many works does each artist have in the database? Display the artist's full name along with the count of their works, ordered by the count in descending order.
select artist.full_name, count(work.work_id) as work_count
from artist
Left Join work on artist.artist_id=work.artist_id
group by artist.artist_id,artist.full_name
order by work_count desc;


-- 3. Order By and Limit:
-- List the top 5 museums with the highest number of works displayed in the database, along with their respective counts.
select museum.name , count(work.work_id) as work_count
from museum
Join work on museum.museum_id=work.museum_id
group by museum.name
order by work_count desc
limit 5;


-- 4. Join, Order By, and Limit:
-- Display the names and styles of the works along with the corresponding museum names, ordered by the museum name in ascending order. Limit the results to 10.
select work.name,work.style,museum.name as Museum_Name
from work
Join museum on work.museum_id = museum.museum_id
order by museum.name
limit 10;


-- 5.Join, Group By, and Sum:
-- Show the total sale price for each artist's works. Display the artist's full name along with the total sale price, ordered by the total sale price in descending order.
select artist.full_name as artist_fullname,product_size.sale_price as total_sale_price
from product_size
Join work on product_size.work_id = work.work_id
Join artist on work.work_id = artist.artist_id
order by total_sale_price desc;


-- 6. Join, Group By, and Having:
-- List artists who have more than 3 works in the database, along with the count of their works.

select artist.full_name,count(work.artist_id) as artist_work from work
join artist on work.artist_id=artist.artist_id
group by artist.full_name
order by artist_work desc;


-- 7. Join, Where, and Order By:
-- Retrieve the names of works and their corresponding artists' full names for works that have a sale price smaller than their regular price. 
select work.name,artist.full_name,product_size.sale_price,product_size.regular_price from work
Join artist on work.work_id = artist.artist_id
join product_size on work.work_id = product_size.work_id;


-- 8. Join, Group By, and Average:
-- Calculate the average height and width of the artworks in the database. Display the average height and width.
select canvas_size.height,sum(canvas_size.height) as avg_height, canvas_size.width ,avg(canvas_size.width) as avg_width
from Canvas_size;


Select Canvas_size.height,sum(canvas_size.height) from canvas_size;



-- Join, Group By, and Max:
-- 9 Find the maximum sale price among all the works in each museum. Display the museum name along with the maximum sale price.
select max(product_size.Sale_price) as max_saleprice,museum.name
from product_size
join work on  product_size.work_id = work.work_id
join Museum on work.museum_id=Museum.museum_id
group by Museum.name
order by Max_saleprice desc;


-- Join, Group By, and Concatenate:
-- 10. Concatenate the first name and last name of artists along with their nationality, separated by a comma. Display the concatenated string along with the count of works by each artist, ordered by the count in descending order.

select artist.first_name,artist.last_name,artist.nationality,work.artist_id,count(work.artist_id) as Cwork
from artist
join work on artist.artist_id = work.artist_id
order by Cwork desc;



Select * from artist;
select * from museum;
select * from work;
select * from museum_hours;
select * from product_size;
select * from subject;
select * from canvas_size;
select * from image_link;
Select * from artist;
