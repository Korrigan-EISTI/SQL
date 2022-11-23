DROP TABLE ligne_commande  cascade constraint; 
DROP TABLE commande cascade constraint ; 
DROP TABLE client  cascade constraint ; 
DROP TABLE produit cascade constraint ; 

CREATE TABLE client( -- Creation de table 
id NUMBER CONSTRAINT pk_client PRIMARY KEY, 
nom VARCHAR2(30), 
prenom VARCHAR2(30), 
adresse VARCHAR2(60), 
code_postal NUMBER(5) CHECK(code_postal BETWEEN 00001 AND 99999) 
); 

CREATE TABLE commande( -- Creation de table 
no_commande NUMBER CONSTRAINT pk_commande PRIMARY KEY, 
cdate DATE DEFAULT SYSDATE, 
id_client CONSTRAINT fk_commande REFERENCES client(id) 
); 

CREATE TABLE produit( -- Cr�ation de table 
id NUMBER CONSTRAINT pk_produit PRIMARY KEY, 
libelle VARCHAR2(30), 
stock NUMBER(10), 
prix NUMBER(6,2) CHECK (prix > 0) 
); 

CREATE TABLE ligne_commande( -- Cr�ation de table 
id NUMBER CONSTRAINT pk_ligne PRIMARY KEY, 
no_commande CONSTRAINT fk1_ligne REFERENCES commande(no_commande), 
no_ligne_commande NUMBER CONSTRAINT no_ligne NOT NULL, 
id_produit CONSTRAINT fk2_ligne REFERENCES produit(id), 
quantite NUMBER, 
CONSTRAINT unique_ligne UNIQUE(no_commande, no_ligne_commande) 
); 

-- inserrer des lignes
INSERT INTO Client VALUES (3,'Dupond', 'Pierre', '35 rue St Honore Fontainebleau', 77300) ; 
INSERT INTO Client VALUES (2, 'Dupond', 'Francois', '35 rue St Honore Fontainebleau', 77300) ; 
INSERT INTO produit VALUES (1, 'Evian 2lx6', 4000, 2.99); 
INSERT INTO produit VALUES (2, 'Lu Cracotte Framboise', 800, 3.99); 
INSERT INTO produit VALUES (3, 'Nectar de Mangue', 4000, 2); 
INSERT INTO produit VALUES (4, 'Contrex', 0, 2);  


