USE movie_db;

-- 1. Show the films with a budget greater than $10 million and a ranking lower than 6.
SELECT title, budget, ranking
FROM movies
WHERE budget > 10000000
  AND ranking < 6;

-- 2. Show the action films with a rating higher than 8.8, produced after 2009.
-- rating FLOAT oldugu icin 8.8 aslinda 8.80000019 olarak tutuluyor,
-- "rating > 8.8" puani tam 8.8 olan filmleri de getiriyor. Bu yuzden ROUND ile karsilastiriyorum.
SELECT m.title, m.rating, m.year
FROM movies m
JOIN genres g ON g.movie_id = m.movie_id
WHERE g.genre_name = 'Action'
  AND ROUND(m.rating, 1) > 8.8
  AND m.year > 2009;

-- 3. Show the drama films with a duration of more than 150 minutes and more than 2 Oscars.
SELECT m.title, m.duration, m.oscars
FROM movies m
JOIN genres g ON g.movie_id = m.movie_id
WHERE g.genre_name = 'Drama'
  AND m.duration > 150
  AND m.oscars > 2;

-- 4. Show the thriller films whose budget is greater than 25 million$.
SELECT m.title, m.budget
FROM movies m
JOIN genres g ON g.movie_id = m.movie_id
WHERE g.genre_name = 'Thriller'
  AND m.budget > 25000000;

-- 5. Show the drama films whose language is Italian and produced between 1990-2000.
SELECT m.title, m.year
FROM movies m
JOIN genres g    ON g.movie_id = m.movie_id
JOIN languages l ON l.movie_id = m.movie_id
WHERE g.genre_name = 'Drama'
  AND l.language_name = 'Italian'
  AND m.year BETWEEN 1990 AND 2000;

-- 6. Show the Quentin Tarantino films which have more than 500000 votes and produced before 2000.
SELECT m.title, m.votes, m.year
FROM movies m
JOIN movie_directors md ON md.movie_id = m.movie_id
JOIN directors d        ON d.director_id = md.director_id
WHERE d.director_name = 'Quentin Tarantino'
  AND m.votes > 500000
  AND m.year < 2000;
