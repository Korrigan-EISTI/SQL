/* EXERCICE 1 */

/* Question 5 */

UPDATE Client
    SET code_postal = 77305
    where adresse = '35 rue St Honore Fontainebleau';

SELECT * FROM Client;

/* Question 6 */

/*DELETE FROM produit 
    where libelle LIKE '%Cracotte%';*/

SELECT * FROM produit;

/* Question 7 */

--DELETE FROM Ligne_commande
    --WHERE no_commande = 1;

DELETE FROM commande 
    WHERE id_client = 2;

DELETE FROM Client
    where nom = 'Dupond'
    AND prenom = 'Francois';

SELECT * FROM Client;

/* EXERCICE 2 */

/* Question 1 */

SELECT stock FROM produit
    WHERE UPPER(libelle) LIKE UPPER('%Nectar%');

/* Question 2 */

SELECT * FROM client
    where UPPER(prenom) like UPPER('p%');

/* Question 3 */

SELECT * FROM client
    WHERE UPPER(prenom) not like UPPER('%e%');

/* Question 4 */

SELECT * FROM produit 
    ORDER BY prix DESC;

/* Question 5 */

SELECT libelle, stock*prix as total from produit;

/* Question 6 */

SELECT SUM(stock*prix) as total from produit;

/* Question 7 */

SELECT AvG (prix) as PRIX FROM produit;

SELECT AVG(stock*prix) as MOYENNE_Produit from produit;

/* Question 8 */

SELECT * from produit
    where prix = (SELECT MAX(prix) from produit);

/* Question 9 */

SELECT COUNT(*) from commande    
    where to_char(cdate, 'YYYY') = '2007';

/* Question 10 */

SELECT * from produit
    where prix = (SELECT prix from produit WHERE UPPER(libelle) LIKE UPPER('%Nectar de mangue%'));

/* Question 11 */

SELECT * from produit
    WHERE prix > (SELECT AvG (prix) FROM produit);
