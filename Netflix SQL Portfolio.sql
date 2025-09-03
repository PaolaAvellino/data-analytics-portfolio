-- 1
-- Goal: Find the actor/actress who appears in the largest number of distinct series.

-- How it works: First, I counted how many series each actor participated in using the 'Actuaciones' table, ordering the results by the total number of series. 
-- Then, I ran a second query on the 'Actores' table to match the 'actor_id' with the actor’s name.

-- Why it’s interesting: It highlights the most recurrent talent across the catalog, useful for casting analysis and content strategy.

SELECT actor_id, count(serie_id) AS series_count
FROM Actuaciones 
GROUP BY 1 
ORDER BY series_count DESC;

SELECT actor_id, nombre 
FROM Actores 
WHERE actor_id = 18;

-- 2
-- Goal: Find the series with the highest average IMDb rating.  

-- How it works: First, I calculated the average IMDb rating for each series using the 'Episodios' table and ordered the results in descending order.  
-- Then, I ran a second query on the 'Series' table to get the title of the series with the highest average rating.  

-- Why it’s interesting: Average IMDb rating is a common way to measure the overall quality of a series across all its episodes. 
-- This helps highlight top-rated shows in the catalog.  

SELECT serie_id, AVG(rating_imdb) AS avg_imdb_rating
FROM Episodios 
GROUP BY serie_id 
ORDER BY avg_imdb_rating DESC;

SELECT serie_id, 
	   titulo AS title
FROM Series 
WHERE serie_id = 8;

-- 3
-- Goal: Find the longest episode by duration.

-- How it works: I selected the episode ID, title, and duration from the 'Episodios' table.  
-- Then, I ordered the results by duration in descending order and used LIMIT 1 to return only the longest episode.

-- Why it’s interesting: The longest episode often represents special content such as finales, pilots, or extended episodes, which may attract more viewer attention.

SELECT episodio_id AS episode_id, 
	   titulo AS episode_title, 
       duracion AS duration
FROM Episodios 
ORDER BY duration DESC
LIMIT 1;

-- 4
-- Goal: Find the most prevalent genres in the catalog by counting how many series belong to each genre.

-- How it works: I used the 'Series' table, grouped the data by genre and counted how many series belong to each category.  
-- Finally, I ordered the results in descending order to see the most frequent genres first.

-- Why it’s interesting: This highlights the overall composition of the catalog and shows which genres are most represented, useful for understanding content strategy.

SELECT genero AS genre, 
       count(serie_id) AS series_count
FROM Series 
GROUP BY 1 
ORDER BY series_count DESC;

-- 5
-- Goal: Find the top three series with the highest average IMDb rating and display the number of episodes each one has.

-- How it works: I joined the 'Series' and 'Episodios' tables using the series ID.  
-- Then, I counted the number of episodes for each series and calculated the average IMDb rating.  
-- I used GROUP BY to aggregate results per series and ORDER BY to sort by the average rating in descending order.  
-- Finally, I limited the output to the top three results.

-- Why it’s interesting: This query highlights the best-rated series in the catalog and shows how extensive each one is in terms of episode count. 
-- It combines both quality (rating) and scope (number of episodes).

SELECT 
	s.titulo AS series_title, 
	count(e.episodio_id) AS episode_count, 
    ROUND(AVG(e.rating_imdb),2) AS avg_imdb_rating
FROM Series AS s 
JOIN Episodios AS e
ON s.serie_id = e.serie_id
GROUP BY s.serie_id, s.titulo
ORDER BY avg_imdb_rating DESC
LIMIT 3;

-- 6
-- Goal: Calculate the total duration of all episodes of the series 'Stranger Things'.

-- How it works: I joined the 'Series' and 'Episodios' tables on the series ID.  
-- Then, I filtered the results to include only the series titled 'Stranger Things'.  
-- Finally, I summed up the duration of its episodes to get the total watch time.

-- Why it’s interesting: Knowing the total runtime of a series can help estimate the binge-watching commitment and highlight content length compared to other series.

SELECT s.titulo as series_title, 
       sum(e.duracion) as total_duration_minutes
FROM Series AS s 
JOIN Episodios AS e 
ON s.serie_id = e.serie_id 
WHERE s.titulo = 'Stranger Things';

-- 7
-- Goal: Identify the three most popular genres (based on the number of series) and for each of these genres list the series title, release year and average IMDb rating.

-- How it works: 
-- 1. First, I determined the top three genres by counting how many series belong to each genre.  
-- 2. Then, I filtered the 'Series' and 'Episodios' tables to include only series in those genres.  
-- 3. Finally, I grouped the results by series to calculate the average IMDb rating and displayed the title, release year, and genre.

-- Why it’s interesting: 
-- This query combines popularity (the top three genres in the catalog) with quality (average IMDb rating per series). 
-- It helps to understand which genres dominate the platform and how their series perform in terms of ratings.

SELECT 
	s.titulo AS series_title, 
	s.año_lanzamiento AS release_year, 
	s.genero AS genre,
	ROUND(AVG(e.rating_imdb),2) AS avg_imdb_rating
FROM Series AS s 
JOIN Episodios AS e
ON s.serie_id = e.serie_id
WHERE s.genero IN (SELECT genero FROM (
				   SELECT genero, count(*) AS series_count
                   FROM series 
                   GROUP BY genero 
                   ORDER BY series_count DESC 
                   LIMIT 3) 
                   AS top3)
GROUP BY
	s.serie_id
ORDER BY
	avg_imdb_rating DESC;

-- 8
-- Goal: Display each series along with its total number of episodes and average IMDb rating.

-- How it works:
-- I used two Common Table Expressions (CTEs):
--   1. 'seriestitle' retrieves the series ID and title from the 'Series' table.
--   2. 'infoepisodes' calculates the number of episodes and the average IMDb rating for each series.
-- Then, I joined these two CTEs on the series ID to display the title, episode count and average rating in the final result.

-- Why it’s interesting:
-- This query provides a concise overview of the catalog, showing both the quantity of content (number of episodes) and quality (average rating) for each series.

WITH seriestitle AS 
     (SELECT serie_id, titulo FROM series),
infoepisodes AS (
  SELECT
    serie_id,
    COUNT(*) AS episode_count,
    ROUND(AVG(rating_imdb),2) AS avg_imdb_rating
  FROM episodios
  GROUP BY serie_id
)

SELECT 
      s.titulo AS series_title, 
      i.episode_count, i.avg_imdb_rating
FROM seriestitle AS s
JOIN infoepisodes AS i
ON s.serie_id = i.serie_id
ORDER BY i.avg_imdb_rating DESC


