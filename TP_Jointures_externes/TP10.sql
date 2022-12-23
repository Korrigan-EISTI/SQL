/* Exercice 1 */

SELECT num_ind, count(num_film)
    from jouer
        group by num_ind;

/* EXERCICE 2 */

SELECT nom, prenom, count(num_film)
    from jouer j, individu i
        where j.num_ind = i.num_ind
            group by i.num_ind, nom, prenom;

/* EXERCICE 3 */

SELECT nom, prenom, count(num_film)
    from jouer j, individu i
        where j.num_ind = i.num_ind
            group by i.num_ind, nom, prenom
                having COUNT(num_film)>1;

/* EXERCICE 4 */

SELECT nom, prenom, COUNT(num_film) as TAB_Jouer
    from individu i
        LEFT JOIN Jouer j 
            ON j.num_ind = i.num_ind
                GROUP BY i.num_ind, nom, prenom
                    ORDER BY COUNT(j.num_film) DESC;

/* EXERCICE 5 */

SELECT nom, MIN(pdate) 
    from cinema c, projection p 
        where p.num_cine = c.num_cine
            group by c.num_cine, nom
                ORDER by MIN(pdate);

/* EXERCICE 6 */

SELECT nom, prenom
    from individu i, jouer j 
        where i.num_ind = j.num_ind
            GROUP BY i.num_ind, nom, prenom
                HAVING COUNT(distinct(j.num_film)) = (SELECT COUNT(*) from film);

/* EXERCICE 7 */

SELECT nom, prenom
    from individu i, jouer j 
        where i.num_ind = j.num_ind
            GROUP BY i.num_ind, nom, prenom
                HAVING COUNT(distinct(j.num_film)) > (SELECT AVG(COUNT(DISTINCT(num_film))) 
                    from individu a, jouer j 
                        where j.num_ind = a.num_ind
                            group by a.num_ind);
    