--Data Scientist Role Play: Profiling and Analyzing the Yelp Dataset Coursera Worksheet
--This is a 2-part assignment. In the first part, you are asked a series of questions that will help you profile and understand the data just like a data scientist would. For this first part of the assignment, you will be assessed both on the correctness of your findings, as well as the code you used to arrive at your answer. You will be graded on how easy your code is to read, so remember to use proper formatting and comments where necessary.

--In the second part of the assignment, you are asked to come up with your own inferences and analysis of the data for a particular research question you want to answer. You will be required to prepare the dataset for the analysis you choose to do. As with the first part, you will be graded, in part, on how easy your code is to read, so use proper formatting and comments to illustrate and communicate your intent as required.

--For both parts of this assignment, use this "worksheet." It provides all the questions you are being asked, and your job will be to transfer your answers and SQL coding where indicated into this worksheet so that your peers can review your work. You should be able to use any Text Editor (Windows Notepad, Apple TextEdit, Notepad ++, Sublime Text, etc.) to copy and paste your answers. If you are going to use Word or some other page layout application, just be careful to make sure your answers and code are lined appropriately.
--In this case, you may want to save as a PDF to ensure your formatting remains intact for you reviewer.



--Part 1: Yelp Dataset Profiling and Understanding

--1. Profile the data by finding the total number of records for each of the tables below:
	
SELECT COUNT(*)
FROM table_name;
	
/*
i. Attribute table = 10000
ii. Business table = 10000
iii. Category table = 10000
iv. Checkin table = 10000
v. elite_years table = 10000
vi. friend table = 10000
vii. hours table = 10000
viii. photo table = 10000
ix. review table = 10000
x. tip table = 10000
xi. user table = 10000
*/


--2. Find the total distinct records by either the foreign key or primary key for each table. If two foreign keys are listed in the table, please specify which foreign key.

SELECT COUNT(DISTINCT(key_name))
FROM table_name;

--i. Business = 10000(id)
--ii. Hours = 1562(business_id)
--iii. Category = 2643(business_id)
--iv. Attribute = 1115(business_id)
--v. Review = 10000(id), 8090(business_id), 9581(user_id)
--vi. Checkin = 493(business_id)
--vii. Photo = 10000(id), 6493(business_id)
--viii. Tip = 537(user_id), 3979(business_id)
--ix. User = 10000(id)
--x. Friend = 11(user_id)
--xi. Elite_years = 2780(user_id)

--For all primary keys in a table there are as many unique keys as the total number of rows in the table.
--For foreign keys distinct records would be less than or equal to the total number of records.
--Note: Primary Keys are denoted in the ER-Diagram with a yellow key icon.	



--3. Are there any columns with null values in the Users table? Indicate "yes," or "no."
--
--	Answer: No
--	
--	
--	SQL code used to arrive at answer:
	
SELECT COUNT(*)
FROM user
WHERE id IS NULL OR 
name IS NULL OR 
review_count IS NULL OR 
yelping_since IS NULL OR
useful IS NULL OR 
funny IS NULL OR 
cool IS NULL OR 
fans IS NULL OR 
average_stars IS NULL OR 
compliment_hot IS NULL OR 
compliment_more IS NULL OR 
compliment_profile IS NULL OR 
compliment_cute IS NULL OR 
compliment_list IS NULL OR 
compliment_note IS NULL OR 
compliment_plain IS NULL OR 
compliment_cool IS NULL OR 
compliment_funny IS NULL OR 
compliment_writer IS NULL OR 
compliment_photos IS NULL;
	

	
--4. For each table and column listed below, display the smallest (minimum), largest (maximum), and average (mean) value for the following fields:

SELECT MIN(column),MAX(column),AVG(column)
FROM table;


--	i. Table: Review, Column: Stars
--	
--		min:1		max:5		avg:3.7082
--		
--	
--	ii. Table: Business, Column: Stars
--	
--		min:1		max:5		avg:3.6549
--		
--	
--	iii. Table: Tip, Column: Likes
--	
--		min:0		max:2		avg:0.0144
--		
--	
--	iv. Table: Checkin, Column: Count
--	
--		min:1		max:53		avg:1.9414
--		
--	
--	v. Table: User, Column: Review_count
--	
--		min:0		max:2000		avg:24.2995
		


--5. List the cities with the most reviews in descending order:

--	SQL code used to arrive at answer:
	
SELECT city, SUM(review_count) as num_rev
FROM business	
GROUP BY city
ORDER BY num_rev DESC;
	
--	Copy and Paste the Result Below:
--	
--	+-----------------+---------+
--	| city            | num_rev |
--	+-----------------+---------+
--	| Las Vegas       |   82854 |
--	| Phoenix         |   34503 |
--	| Toronto         |   24113 |
--	| Scottsdale      |   20614 |
--	| Charlotte       |   12523 |
--	| Henderson       |   10871 |
--	| Tempe           |   10504 |
--	| Pittsburgh      |    9798 |
--	| Montr??al        |    9448 |
--	| Chandler        |    8112 |
--	| Mesa            |    6875 |
--	| Gilbert         |    6380 |
--	| Cleveland       |    5593 |
--	| Madison         |    5265 |
--	| Glendale        |    4406 |
--	| Mississauga     |    3814 |
--	| Edinburgh       |    2792 |
--	| Peoria          |    2624 |
--	| North Las Vegas |    2438 |
--	| Markham         |    2352 |
--	| Champaign       |    2029 |
--	| Stuttgart       |    1849 |
--	| Surprise        |    1520 |
--	| Lakewood        |    1465 |
--	| Goodyear        |    1155 |
--	+-----------------+---------+
--	(Output limit exceeded, 25 of 362 total rows shown)
--
--	
--6. Find the distribution of star ratings to the business in the following cities:
--
--i. Avon
--
--SQL code used to arrive at answer:

SELECT stars,
SUM(review_count) AS count
FROM business
WHERE city == 'Avon'
GROUP BY stars;	
--
--Copy and Paste the Resulting Table Below (2 columns ???????? star rating and count):
--
--	+-------+-------+
--	| stars | count |
--	+-------+-------+
--	|   1.5 |    10 |
--	|   2.5 |     6 |
--	|   3.5 |    88 |
--	|   4.0 |    21 |
--	|   4.5 |    31 |
--	|   5.0 |     3 |
--	+-------+-------+
--
--ii. Beachwood
--
--SQL code used to arrive at answer:
--
SELECT stars,
SUM(review_count) AS count
FROM business
WHERE city == 'Beachwood'
GROUP BY stars	
--
--Copy and Paste the Resulting Table Below (2 columns ???????? star rating and count):
--		
--	+-------+-------+
--	| stars | count |
--	+-------+-------+
--	|   2.0 |     8 |
--	|   2.5 |     3 |
--	|   3.0 |    11 |
--	|   3.5 |     6 |
--	|   4.0 |    69 |
--	|   4.5 |    17 |
--	|   5.0 |    23 |
--	+-------+-------+
--
--7. Find the top 3 users based on their total number of reviews:
--		
--	SQL code used to arrive at answer:
--	
SELECT id,name,review_count
FROM user
ORDER BY review_count DESC
LIMIT 3	
--		
--	Copy and Paste the Result Below:
--		
--	+------------------------+--------+--------------+
--	| id                     | name   | review_count |
--	+------------------------+--------+--------------+
--	| -G7Zkl1wIWBBmD0KRy_sCw | Gerald |         2000 |
--	| -3s52C4zL_DHRK0ULG6qtg | Sara   |         1629 |
--	| -8lbUNlXVSoXqaRRiHiSNg | Yuri   |         1339 |
--	+------------------------+--------+--------------+
--
--8. Does posing more reviews correlate with more fans?
--
--	Please explain your findings and interpretation of the results:
--	
SELECT id,review_count,fans
FROM user
ORDER BY review_count DESC
--	
--	+------------------------+--------------+------+
--	| id                     | review_count | fans |
--	+------------------------+--------------+------+
--	| -G7Zkl1wIWBBmD0KRy_sCw |         2000 |  253 |
--	| -3s52C4zL_DHRK0ULG6qtg |         1629 |   50 |
--	| -8lbUNlXVSoXqaRRiHiSNg |         1339 |   76 |
--	| -K2Tcgh2EKX6e6HqqIrBIQ |         1246 |  101 |
--	| -FZBTkAZEXoP7CYvRV2ZwQ |         1215 |  126 |
--	| --2vR0DIsmQ6WfcSzKWigw |         1153 |  311 |
--	| -gokwePdbXjfS0iF7NsUGA |         1116 |   16 |
--	| -DFCC64NXgqrxlO8aLU5rg |         1039 |  104 |
--	| -8EnCioUmDygAbsYZmTeRQ |          968 |  497 |
--	| -0IiMAZI2SsQ7VmyzJjokQ |          930 |  173 |
--	| -fUARDNuXAfrOn4WLSZLgA |          904 |   38 |
--	| -hKniZN2OdshWLHYuj21jQ |          864 |   43 |
--	| -9da1xk7zgnnfO1uTVYGkA |          862 |  124 |
--	| -B-QEUESGWHPE_889WJaeg |          861 |  115 |
--	| -kLVfaJytOJY2-QdQoCcNQ |          842 |   85 |
--	| -kO6984fXByyZm3_6z2JYg |          836 |   37 |
--	| -lh59ko3dxChBSZ9U7LfUw |          834 |  120 |
--	| -g3XIcCb2b-BD0QBCcq2Sw |          813 |  159 |
--	| -l9giG8TSDBG1jnUBUXp5w |          775 |   61 |
--	| -dw8f7FLaUmWR7bfJ_Yf0w |          754 |   78 |
--	| -AaBjWJYiQxXkCMDlXfPGw |          702 |   35 |
--	| -jt1ACMiZljnBFvS6RRvnA |          696 |   10 |
--	| -IgKkE8JvYNWeGu8ze4P8Q |          694 |  101 |
--	| -hxUwfo3cMnLTv-CAaP69A |          676 |   25 |
--	| -H6cTbVxeIRYR-atxdielQ |          675 |   45 |
--	+------------------------+--------------+------+
--	
SELECT id,review_count,fans
FROM user
ORDER BY review_count ASC
--
--	+------------------------+--------------+------+
--	| id                     | review_count | fans |
--	+------------------------+--------------+------+
--	| -61V4ZkRsKUChYFZtdZDvQ |            0 |    0 |
--	| -9TyYbKtEz-pxeZyLICOgA |            0 |    0 |
--	| -arJ-0bq2eycINnHrm0LFA |            0 |    0 |
--	| -d8nnc-pp6qj_6qnp4IN-g |            0 |    0 |
--	| -Dhxu5B36bkm65ciME0vxg |            0 |    0 |
--	| -G0sArycZyO_-AHlCPI4IQ |            0 |    0 |
--	| -hQK8Yu-Be8tZu-5K3j6RA |            0 |    0 |
--	| -lfArh6lSfDddoa-KP5ZPQ |            0 |    0 |
--	| -lyoqQ69K6RWsZHstAoQ1A |            0 |    0 |
--	| --0sXNBv6IizZXuV-nl0Aw |            1 |    0 |
--	| --5BsHjOVLIGoTwjol-V2w |            1 |    0 |
--	| --6u02ZqjZRnwtX3t9bZtQ |            1 |    0 |
--	| --6_wnx2sD1rqOQAQH96wg |            1 |    0 |
--	| --7gZYIAVGCaPT4k0qbbrw |            1 |    0 |
--	| --9yZb1OLNN18HyDXgZrJA |            1 |    0 |
--	| --B1_68kNRRoT9k61Qlu3g |            1 |    0 |
--	| --C5cBJscv6TNMpF_OSJnA |            1 |    0 |
--	| --cAxfHMTBqYGmvkDNXK-g |            1 |    0 |
--	| --d2gPjSkSEQuhncWxs-kw |            1 |    0 |
--	| --DKDJlRHfsvufdGSk_Sdw |            1 |    0 |
--	| --ERQVpqAAoi262TTbLVzQ |            1 |    0 |
--	| --erV6Uzfa42Wk2nf4OIfg |            1 |    0 |
--	| --G7oWdtqbbbmNfe6efMdA |            1 |    0 |
--	| --haaCngcz4NnX_IVSFswA |            1 |    0 |
--	| --HTK7EdtoCKTsNbA17CNA |            1 |    0 |
--	+------------------------+--------------+------+
--	
--9. Are there more reviews with the word "love" or with the word "hate" in them?
--
--	Answer:1780 reviews has love, 232 reviews has hate inside it
--
--	
--	SQL code used to arrive at answer:
SELECT COUNT(*)
FROM review
WHERE text LIKE '%love%'

SELECT COUNT(*)
FROM review
WHERE text LIKE '%hate%'
--	
--	
--10. Find the top 10 users with the most fans:
--
--	SQL code used to arrive at answer:
--	
SELECT id,name,fans
FROM user
ORDER BY fans DESC
LIMIT 10
--
--	Copy and Paste the Result Below:
--
--	+------------------------+-----------+------+
--	| id                     | name      | fans |
--	+------------------------+-----------+------+
--	| -9I98YbNQnLdAmcYfb324Q | Amy       |  503 |
--	| -8EnCioUmDygAbsYZmTeRQ | Mimi      |  497 |
--	| --2vR0DIsmQ6WfcSzKWigw | Harald    |  311 |
--	| -G7Zkl1wIWBBmD0KRy_sCw | Gerald    |  253 |
--	| -0IiMAZI2SsQ7VmyzJjokQ | Christine |  173 |
--	| -g3XIcCb2b-BD0QBCcq2Sw | Lisa      |  159 |
--	| -9bbDysuiWeo2VShFJJtcw | Cat       |  133 |
--	| -FZBTkAZEXoP7CYvRV2ZwQ | William   |  126 |
--	| -9da1xk7zgnnfO1uTVYGkA | Fran      |  124 |
--	| -lh59ko3dxChBSZ9U7LfUw | Lissa     |  120 |
--	+------------------------+-----------+------+
--		
--
--Part 2: Inferences and Analysis
--
--1. Pick one city and category of your choice and group the businesses in that city or category by their overall star rating. Compare the businesses with 2-3 stars to the businesses with 4-5 stars and answer the following questions. Include your code.
--	
SELECT city,category,Count(*) as count_
FROM business inner join category
on business.id = category.business_id
Group by city, category
ORDER BY count_ desc
--
--The above code for getting all the distinct cities. I chose city of 'Toronto' and category is 'Restaurants'.
--
--i. Do the two groups you chose to analyze have a different distribution of hours?
--
SELECT B.name,
B.review_count,B.city,C.category,
H.hours,
postal_code,
CASE
WHEN hours LIKE "%monday%" THEN 1
WHEN hours LIKE "%tuesday%" THEN 2
WHEN hours LIKE "%wednesday%" THEN 3
WHEN hours LIKE "%thursday%" THEN 4
WHEN hours LIKE "%friday%" THEN 5
WHEN hours LIKE "%saturday%" THEN 6
WHEN hours LIKE "%sunday%" THEN 7
END AS ord,
CASE
WHEN B.stars BETWEEN 2 AND 3 THEN '2-3 stars'
WHEN B.stars BETWEEN 4 AND 5 THEN '4-5 stars'
END AS star_rating
FROM business B INNER JOIN hours H
ON B.id = H.business_id
INNER JOIN category C
ON C.business_id = B.id
WHERE (B.city == 'Toronto'
AND C.category LIKE 'Restaurants')
AND (B.stars BETWEEN 2 AND 3 OR B.stars BETWEEN 4 AND 5)
GROUP BY stars,ord
ORDER BY star_rating, ord
--
--No, the distribution of hours is same for both the groups. There is no visible differences in both the groups.
--
--ii. Do the two groups you chose to analyze have a different number of reviews?
--         
--		 
SELECT AVG(B.review_count),B.city,C.category,
CASE
WHEN B.stars BETWEEN 2 AND 3 THEN '2-3 stars'
WHEN B.stars BETWEEN 4 AND 5 THEN '4-5 stars'
END AS star_rating
FROM business B INNER JOIN hours H
ON B.id = H.business_id
INNER JOIN category C
ON C.business_id = B.id
WHERE (B.city == 'Toronto'
AND C.category LIKE 'Restaurants')
AND (B.stars BETWEEN 2 AND 3 OR B.stars BETWEEN 4 AND 5)
GROUP BY star_rating
ORDER BY star_rating, review_count
--
--	+---------------------+---------+-------------+-------------+
--	| AVG(B.review_count) | city    | category    | star_rating |
--	+---------------------+---------+-------------+-------------+
--	|       28.6666666667 | Toronto | Restaurants | 2-3 stars   |
--	|       35.9473684211 | Toronto | Restaurants | 4-5 stars   |
--	+---------------------+---------+-------------+-------------+
--	
--Yes, the average of review_counts is greater for the group which has 4-5 stars compared to the group which has 2-3 stars
--
--
--iii. Are you able to infer anything from the location data provided between these two groups? Explain.
--
--No, we couldn't find any correlation with the rating group0 and the business location.
--
--SQL code used for analysis:
--
SELECT B.id,B.address,B.city,C.category,H.hours,
CASE
WHEN B.stars BETWEEN 2 AND 3 THEN '2-3 stars'
WHEN B.stars BETWEEN 4 AND 5 THEN '4-5 stars'
END AS star_rating

FROM business B INNER JOIN hours H
ON B.id = H.business_id
INNER JOIN category C
ON C.business_id = B.id
WHERE (B.city == 'Toronto'
AND C.category LIKE 'Restaurants')
AND (B.stars BETWEEN 2 AND 3 OR B.stars BETWEEN 4 AND 5)
GROUP BY B.id
ORDER BY star_rating, review_count
--		
--		
--2. Group business based on the ones that are open and the ones that are closed. What differences can you find between the ones that are still open and the ones that are closed? List at least two differences and the SQL code you used to arrive at your answer.
--		
--i. Difference 1:
--
--	+---------+---------------+
--	| is_open |  AVG(C.count) |
--	+---------+---------------+
--	|       0 |          1.25 |
--	|       1 | 1.65261044177 |
--	+---------+---------------+  
--
--	The average number of checkins are greater for opened businesses with 1.65. For closed businesses it is 1.25.
--         
--ii. Difference 2:
--
--	The review counts are more for closed businesses. For closed businesses it is at an average of 16 while for open businesses it is at an average of 13.5.
--	The reason might be closed businesses attract more negative reviews and hence the increase
--         
--SQL code used for analysis:
--
SELECT DISTINCT B.is_open, AVG(C.count)
FROM business B INNER JOIN checkin C
ON B.id = C.business_id
GROUP BY B.is_open 

SELECT DISTINCT B.is_open, AVG(B.review_count)
FROM business B INNER JOIN checkin C
ON B.id = C.business_id
GROUP BY B.is_open 
--	
--	3. For this last part of your analysis, you are going to choose the type of analysis you want to conduct on the Yelp dataset and are going to prepare the data for analysis.
--
--Ideas for analysis include: Parsing out keywords and business attributes for sentiment analysis, clustering businesses to find commonalities or anomalies between them, predicting the overall star rating for a business, predicting the number of fans a user will have, and so on. These are just a few examples to get you started, so feel free to be creative and come up with your own problem you want to solve. Provide answers, in-line, to all of the following:
--	
--i. Indicate the type of analysis you chose to do:
--
--	Recommending the business to users based on user history of ratings.	
--
--ii. Write 1-2 brief paragraphs on the type of data you will need for your analysis and why you chose that data:
--
--	For this we are planning to do a user based collaborative filtering and content matching. So we just need all the reviews of all users to the corresponding businesses. Features of user and features of business.
--	Also it is important to take the review text so that we can create another model to predict stars with the help of review text so we can fill this using some pretrained NLP models in case this is missing.
--	So we are taking the columns stars, date, text, useful, funny features for review.
--	category, latitude, longitude, review count, category for business
--	Yelping_since, review_count, useful, funny, cool, fans features from users.
--                
--iii. Output of your finished dataset:
--         
--+------------------------+------------------------+-------+---------------------+--------+-------+------+-------+----------+-----------+--------+-----------------------+---------+-------------------+---------------------+---------+--------+-------+------+
--| user_id_               | business_id            | stars | date                | useful | funny | cool | state | latitude | longitude | stars  | business_review_count | is_open | user_review_count | yelping_since       | useful  | funny  | cool  | fans |
--+------------------------+------------------------+-------+---------------------+--------+-------+------+-------+----------+-----------+--------+-----------------------+---------+-------------------+---------------------+---------+--------+-------+------+
--| -Hpah8QHUeWjSWq1qSIozQ | 01Ov9eDxKRY5k6ImMdiWLQ |     3 | 2016-08-18 00:00:00 |      0 |     0 |    0 | NV    |  36.1272 |  -115.225 |    3.0 |                   147 |       1 |                 8 | 2009-12-05 00:00:00 |      37 |      4 |     3 |    0 |
--| -BevLRnJhh9JeIT2g5I3mQ | 2EvCdL1LaU8Nw10obv4zYg |     5 | 2016-12-22 00:00:00 |      0 |     1 |    1 | NV    |  35.9844 |  -115.189 |    3.5 |                     5 |       1 |               198 | 2008-12-21 00:00:00 |    6974 |   6033 |  4746 |    4 |
--| -jSTFDuaDXMrLYvU1KbK5Q | 2MoYmEGS50Eg16fJv7Sxvg |     4 | 2017-06-14 00:00:00 |      0 |     0 |    0 | NV    |  36.1322 |  -115.164 |    2.0 |                     7 |       1 |                62 | 2008-01-04 00:00:00 |      17 |      5 |     6 |    3 |
--| -H7TR-AfFK5sNzoWNRqhdQ | 16Fplxu-OwVmTEFxQAUP4g |     4 | 2011-05-19 00:00:00 |      0 |     0 |    0 | NV    |  36.0954 |  -115.177 |    3.5 |                   385 |       1 |                27 | 2011-02-18 00:00:00 |       7 |      0 |     1 |    3 |
--+------------------------+------------------------+-------+---------------------+--------+-------+------+-------+----------+-----------+--------+-----------------------+---------+-------------------+---------------------+---------+--------+-------+------+
--
--iv. Provide the SQL code you used to create your final dataset:
--
--
select
u.id as user_id_,
r.business_id,
r.stars,
r.date,
r.useful,
r.funny,
r.cool,

b.state,
b.latitude,
b.longitude,
b.stars,
b.review_count as business_review_count,
b.is_open,


u.review_count as user_review_count,
u.yelping_since,
u.useful,
u.funny,
u.cool,
u.fans

FROM (review r inner join user u on r.user_id = u.id)
inner join business b on r.business_id = b.id;