drop table jouer cascade constraint;
drop table projection cascade constraint;
drop table film cascade constraint;
drop table individu cascade constraint;
drop table cinema cascade constraint; 

create table individu(
num_ind number constraint pk_individu primary key,
nom varchar2(30),
prenom varchar2(30));

create table film(
num_film number constraint pk_film primary key,
num_ind constraint fk_film references individu(num_ind),
titre varchar2(60),
genre varchar2(20),
annee number(4));

create table jouer(
num_ind constraint fk1_jouer references individu(num_ind),
num_film constraint fk2_jouer references film(num_film),
role varchar2(30),
constraint pk_jouer primary key (num_ind,num_film));

create table cinema(
num_cine number constraint pk_cinema primary key,
nom varchar2(30),
adresse varchar2(50));

create table projection(
num_cine constraint fk1_projection references cinema(num_cine),
num_film constraint fk2_projection references film(num_film),
pdate date,
constraint pk_projection primary key (num_cine,num_film,pdate));

insert into individu values(01,'Kidman','Nicole'); 
insert into individu values(02,'Bettany','Paul');
insert into individu values(03,'Watson','Emily'); 
insert into individu values(04,'Skarsgard','Stellan'); 
insert into individu values(05,'Travolta','John'); 
insert into individu values(06,'L. Jackson','Samuel'); 
insert into individu values(07,'Willis','Bruce');
insert into individu values(08,'Irons','Jeremy');
insert into individu values(09,'Spader','James');
insert into individu values(10,'Hunter','Holly'); 
insert into individu values(11,'Arquette','Rosanna'); 
insert into individu values(12,'Wayne','John');
insert into individu values(13,'von Trier','Lars'); 
insert into individu values(14,'Tarantino','Quentin'); 
insert into individu values(15,'Cronenberg','David'); 
insert into individu values(16,'Mazursky','Paul'); 
insert into individu values(17,'Jones','Grace');
insert into individu values(18,'Glen','John');

insert into film values(05,13,'Dogville','Drame',2002);
insert into film values(04,13,'Breaking the waves','Drame',1996);
insert into film values(03,14,'Pulp Fiction','Policier',1994);
insert into film values(02,15,'Faux-Semblants','Epouvante',1988);
insert into film values(01,15,'Crash','Drame',1996);
insert into film values(06,12,'Alamo','Western',1960);
insert into film values(07,18,'Dangereusement v�tre','Espionnage',1985);

insert into jouer values(01,05,'Grace');
insert into jouer values(02,05,'Tom Edison'); 
insert into jouer values(03,04,'Bess');
insert into jouer values(04,04,'Jan');
insert into jouer values(05,03,'Vincent Vega');
insert into jouer values(06,03,'Jules Winnfield');
insert into jouer values(07,03,'Butch Coolidge');
insert into jouer values(08,02,'Beverly "&" Elliot Mantle');
insert into jouer values(09,01,'James Ballard');
insert into jouer values(10,01,'Helen Remington');
insert into jouer values(11,01,'Gabrielle');
insert into jouer values(04,05,'Chuck');
insert into jouer values(16,07,'May Day');

insert into cinema values(02,'Le Fontenelle','78160 Marly-le-Roi');
insert into cinema values(01,'Le Renoir','13100 Aix-en-Provence');
insert into cinema values(03,'Gaumont Wilson','31000 Toulouse');
insert into cinema values(04,'Espace Cin�','93800 Epinay-sur-Seine');

alter session set NLS_DATE_FORMAT='DD/MM/YYYY';

insert into projection values(02,05,'01/05/2002');
insert into projection values(02,05,'02/05/2002');
insert into projection values(02,05,'03/05/2002');
insert into projection values(02,04,'02/12/1996');
insert into projection values(01,01,'07/05/1996');
insert into projection values(02,07,'09/05/1985');
insert into projection values(01,04,'02/08/1996');
insert into projection values(04,03,'08/04/1994');
insert into projection values(03,06,'02/12/1990');
insert into projection values(02,02,'25/09/1990');
insert into projection values(03,03,'05/11/1994');
insert into projection values(04,03,'06/11/1994');
insert into projection values(01,06,'05/07/1980');
insert into projection values(02,04,'02/09/1996');
insert into projection values(04,06,'01/08/2002');
insert into projection values(03,06,'09/11/1960');
insert into projection values(01,02,'12/03/1988');

commit;
