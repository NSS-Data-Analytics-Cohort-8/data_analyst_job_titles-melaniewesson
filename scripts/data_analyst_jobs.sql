SELECT *
FROM data_analyst_jobs
LIMIT 1;

-- 1.	How many rows are in the data_analyst_jobs table?

SELECT COUNT(*)
FROM data_analyst_jobs;

-- 1793 rows

-- 2.	Write a query to look at just the first 10 rows. What company is associated with the job posting on the 10th row?

SELECT *
FROM data_analyst_jobs
LIMIT 10;

-- ExxonMobil

-- 3.	How many postings are in Tennessee? How many are there in either Tennessee or Kentucky?

SELECT COUNT(*)
FROM data_analyst_jobs
WHERE location = 'TN';

-- 21 postings

-- 4.	How many postings in Tennessee have a star rating above 4?

SELECT COUNT(*)
FROM data_analyst_jobs
WHERE location = 'TN' 
AND star_rating > 4;

-- 3 postings


-- 5.	How many postings in the dataset have a review count between 500 and 1000?

SELECT COUNT(*)
FROM data_analyst_jobs
WHERE review_count BETWEEN 500 AND 1000;

-- 151 postings

-- 6.	Show the average star rating for companies in each state. The output should show the state as `state` and the average rating for the state as `avg_rating`. Which state shows the highest average rating?

SELECT location AS state, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE star_rating IS NOT NULL
GROUP BY location
ORDER BY avg_rating DESC;

-- Nebraska

-- 7.	Select unique job titles from the data_analyst_jobs table. How many are there?

SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs;

-- 881 unique job titles

-- 8.	How many unique job titles are there for California companies?

SELECT COUNT(DISTINCT title)
FROM data_analyst_jobs
WHERE location = 'CA';

-- 230 unique job titles

-- 9.	Find the name of each company and its average star rating for all companies that have more than 5000 reviews across all locations. How many companies are there with more that 5000 reviews across all locations?

SELECT company, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE review_count >5000 AND company IS NOT NULL
GROUP BY company;

-- 40 companies (and 1 NULL)

-- 10.	Add the code to order the query in #9 from highest to lowest average star rating. Which company with more than 5000 reviews across all locations in the dataset has the highest star rating? What is that rating?

SELECT company, AVG(star_rating) AS avg_rating
FROM data_analyst_jobs
WHERE review_count >5000 AND company IS NOT NULL
GROUP BY company
ORDER BY avg_rating DESC;

-- Unilever, General Motors, Nike, American Express, Microsoft, and Kaiser Permanente all have average ratings of 
4.199999809

-- 11.	Find all the job titles that contain the word ‘Analyst’. How many different job titles are there? 

SELECT COUNT(title)
FROM data_analyst_jobs
WHERE LOWER(title) LIKE LOWER('%Analyst%');

-- 1669 job titles

-- 12.	How many different job titles do not contain either the word ‘Analyst’ or the word ‘Analytics’? What word do these positions have in common?

SELECT title
FROM data_analyst_jobs
WHERE LOWER(title) NOT LIKE LOWER('%Analyst%')
AND LOWER(title) NOT LIKE LOWER('%Analytics%');

-- 4 job titles.  These jobs are all related to data visualization.

-- **BONUS:**
-- You want to understand which jobs requiring SQL are hard to fill. Find the number of jobs by industry (domain) that require SQL and have been posted longer than 3 weeks. 
-- Disregard any postings where the domain is NULL. 
-- Order your results so that the domain with the greatest number of `hard to fill` jobs is at the top. 
-- Which three industries are in the top 4 on this list? How many jobs have been listed for more than 3 weeks for each of the top 4?

SELECT domain, COUNT(title) AS hard_to_fill
FROM data_analyst_jobs
WHERE domain IS NOT NULL
AND skill LIKE '%SQL%'
AND days_since_posting > 21
GROUP BY domain
ORDER BY hard_to_fill DESC;

--Internet & Software (62 jobs), Banks & Financial Services (61 jobs), Consulting and Business Services (57 jobs), Health Care (52 jobs)


