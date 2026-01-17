/*Movie Recommendation & Rating Analysis*/
CREATE TABLE movies (
    movie_id INT PRIMARY KEY,
    title VARCHAR(100),
    genre VARCHAR(50)
);
CREATE TABLE ratings (
    movie_id INT,
    user_id INT,
    rating INT
);
INSERT INTO movies VALUES
(1,'Inception','Sci-Fi'),
(2,'Interstellar','Sci-Fi'),
(3,'Titanic','Romance');

INSERT INTO ratings VALUES
(1,101,5),
(1,102,4),
(2,103,5),
(3,104,4),
(3,105,5);
SELECT title, genre, avg_rating
FROM (
    SELECT m.title, m.genre,
           AVG(r.rating) AS avg_rating,
           RANK() OVER (PARTITION BY m.genre ORDER BY AVG(r.rating) DESC) AS rnk
    FROM movies m
    JOIN ratings r ON m.movie_id = r.movie_id
    GROUP BY m.movie_id
) t
WHERE rnk = 1;
