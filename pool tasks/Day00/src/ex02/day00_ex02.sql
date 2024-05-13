SELECT name, rating
FROM pizzeria AS pizza
WHERE rating >= 3.5 AND rating <= 5
ORDER BY rating;

SELECT name, rating
FROM pizzeria AS pizza
WHERE rating BETWEEN 3.5 AND 5
ORDER BY rating;