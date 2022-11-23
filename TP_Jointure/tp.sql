/* Question 3 */

SELECT prenom FROM individu
intersect
SELECT role FROM jouer;

SELECT prenom FROM individu i, jouer j
where i.prenom = j.role;

/* Question 4 */

SELECT role from jouer
UNION
SELECT prenom FROM individu;

/* Question 5 */

SELECT nom FROM individu WHERE nom LIKE 'T%'
OR nom LIKE 'W%'
minus
SELECT nom FROM individu WHERE prenom = 'John';

SELECT nom FROM individu
WHERE(nom LIKE 'T%'
    OR nom LIKE 'W%')
AND prenom < > 'John';


/* Question 6 */

SELECT * FROM individu, film;

/* Question 7 */


SELECT nom, prenom FROM individu i
WHERE num_ind = (SELECT num_ind FROM film WHERE titre = 'Pulp Fiction');

SELECT nom, prenom
FROM individu i, film f
where i.num_ind = f.num_ind
AND f.titre = 'Pulp Fiction';

/* Question 8 */

SELECT titre from film f, individu i
where f.num_ind = i.num_ind
AND i.nom = 'von Trier'
AND i.prenom = 'Lars';

SELECT titre
from film natural join individu
where nom = 'von Trier'
AND prenom = 'Lars';

SELECT titre
from film f inner join individu i
on f.num_ind = i.num_ind
where nom = 'von Trier'
and prenom = 'Lars';

SELECT titre from film f
where f.num_ind = (SELECT num_ind from individu where nom = 'von Trier'
    and prenom = 'Lars');

/* Question 9 */

SELECT distinct titre
from projection natural join film
where to_char(pdate, 'YYYY') = '2002';

/* Question 10 */

SELECT prenom, nom FROM individu i, film f, jouer j
where(i.num_ind = j.num_ind and i.num_ind = f.num_ind);

/* Question 11 */

SELECT nom, prenom
FROM individu i, jouer j
where i.num_ind = j.num_ind
AND i.num_ind NOT IN(
    SELECT DISTINCT j.num_ind FROM jouer j JOIN film f on f.num_film = j.num_film WHERE f.genre = 'Drame'
);

SELECT distinct nom, prenom
    from individu i, jouer j
        where i.num_ind = j.num_ind
minus
SELECT distinct nom, prenom
    from individu i, jouer j, film f
        where i.num_ind = j.num_ind
            and j.num_film = f.num_film
                and genre = 'Drame';

/* Question 12 */

SELECT distinct nom, prenom
    from individu i, jouer j, film f
        where i.num_ind = j.num_ind
        and j.num_film = f.num_film
            AND f.genre <> 'Drame';

/* Question 13 */

select distinct f.titre
from individu i, jouer j, projection p, cinema c, film f
    where c.nom='Le Fontenelle'
        and c.num_cine=p.num_cine
            and p.num_film=f.num_film
                and f.num_film=j.num_film
                    and j.num_ind=i.num_ind
                        and i.prenom='Nicole' and i.nom = 'Kidman';

/* Question 14 */

SELECT COUNT(distinct j.num_film)
    from individu i, jouer j
            WHERE j.num_ind = i.num_ind
            and i.nom = 'Kidman' and i.prenom = 'Nicole';

/* Question 15 */

select MIN(pdate) from projection p, film f
    where  p.num_film = f.num_film
    and f.titre = 'Pulp Fiction';