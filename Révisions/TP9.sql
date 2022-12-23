/* Question 1 */

SELECT titre FROM Film
    WHERE genre =  (SELECT genre from film WHERE UPPER(titre) = UPPER('Crash'));