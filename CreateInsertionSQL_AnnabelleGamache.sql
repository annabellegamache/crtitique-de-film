
/*========================================================================================= Création des tables*/
CREATE TABLE realisateur (
 ID int UNSIGNED NOT NULL AUTO_INCREMENT,
 Prenom varchar(50) NOT NULL,
 Nom varchar(50) NOT NULL,
 PRIMARY KEY (ID)
);

CREATE TABLE acteur (
 ID int UNSIGNED NOT NULL AUTO_INCREMENT,
 Prenom varchar(50) NOT NULL,
 Nom varchar(50) NOT NULL,
 PRIMARY KEY (ID)
);

CREATE TABLE producteur (
 ID int UNSIGNED NOT NULL AUTO_INCREMENT,
 Prenom varchar(50) NOT NULL,
 Nom varchar(50) NOT NULL,
 PRIMARY KEY (ID)
);

CREATE TABLE genre(
 ID tinyint UNSIGNED NOT NULL AUTO_INCREMENT,
 Nom varchar(50) NOT NULL,
 PRIMARY KEY (ID)
);

CREATE TABLE plateforme(
 ID tinyint UNSIGNED NOT NULL AUTO_INCREMENT,
 Nom varchar(50) NOT NULL,
 PRIMARY KEY (ID)
);

CREATE TABLE film(
   ID int UNSIGNED NOT NULL AUTO_INCREMENT,
   Titre varchar(50) NOT NULL,
   AnneeProduction smallint UNSIGNED NOT NULL,
   Synopsis text NOT NULL,
   Durée smallint UNSIGNED NOT NULL,
   Couleur tinyint(1),
   Idrealisateur int UNSIGNED,
   Idproducteur int UNSIGNED,
   Idgenre tinyint UNSIGNED,
   PRIMARY KEY(ID),
   FOREIGN KEY(Idrealisateur) REFERENCES realisateur(ID),
   FOREIGN KEY(Idproducteur) REFERENCES producteur(ID),
   FOREIGN KEY(Idgenre) REFERENCES genre(ID)
);

CREATE TABLE usager(
   ID int UNSIGNED NOT NULL AUTO_INCREMENT,
   Prenom varchar(50) NOT NULL,
   Nom varchar(50) NOT NULL,
   Nomusager varchar(50) NOT NULL UNIQUE,
   MotPasse varchar(50) NOT NULL UNIQUE,
   Courriel varchar(50) NOT NULL UNIQUE,
   Idfilm int UNSIGNED,
   PRIMARY KEY(ID),
   FOREIGN KEY(Idfilm) REFERENCES film(ID)
);

CREATE TABLE critique(
   ID int UNSIGNED NOT NULL AUTO_INCREMENT,
   Texte text NOT NULL,
   Datecritique date NOT NULL,
   NbEtoile decimal (2,1),
   Idusager int UNSIGNED,
   Idplateforme tinyint UNSIGNED,
   PRIMARY KEY(ID),
   FOREIGN KEY(Idusager) REFERENCES usager(ID),
   FOREIGN KEY(idplateforme) REFERENCES plateforme(ID)
);

CREATE TABLE acteur_film(
   Idacteur int UNSIGNED,
   Idfilm int UNSIGNED,
   Role varchar(50) NOT NULL,
   PRIMARY KEY(Idacteur, idfilm),
   FOREIGN KEY(Idacteur) REFERENCES acteur(ID),
   FOREIGN KEY(idfilm) REFERENCES film(ID)
);

CREATE TABLE critique_film(
   Idcritique int UNSIGNED,
   Idfilm int UNSIGNED,
   PRIMARY KEY(Idcritique, idfilm),
   FOREIGN KEY(Idcritique) REFERENCES critique(ID),
   FOREIGN KEY(Idfilm) REFERENCES film(ID)
   
);


/*insertion table realisateur*/
INSERT INTO realisateur VALUES (NULL, 'David', 'Fincher');
INSERT INTO realisateur VALUES (NULL, 'Frank', 'Darabont');
INSERT INTO realisateur VALUES (NULL, 'Sofia', 'Coppola');
INSERT INTO realisateur VALUES (NULL, 'Steven', 'Spielberg');

/*insertion table producteur*/
INSERT INTO producteur VALUES (NULL, 'Art', 'Linson'); 
INSERT INTO producteur VALUES (NULL, 'David', 'Valdes');
INSERT INTO producteur VALUES (NULL, 'Ross', 'Katz');

/*insertion table acteur*/
INSERT INTO acteur VALUES (NULL, 'Brad', 'Pitt');
INSERT INTO acteur VALUES (NULL, 'Tom', 'Hanks');
INSERT INTO acteur VALUES (NULL, 'Bill', 'Murray');

/*insertion table genre*/
INSERT INTO genre VALUES (NULL, 'suspense');
INSERT INTO genre VALUES (NULL, 'drame');
INSERT INTO genre VALUES (NULL, 'action');
INSERT INTO genre VALUES (NULL, 'science-fiction');

/*insertion table plateforme*/
INSERT INTO plateforme VALUES (NULL, 'Netflix');
INSERT INTO plateforme VALUES (NULL, 'Blu-Ray');
INSERT INTO plateforme VALUES (NULL, 'Cinéma');
INSERT INTO plateforme VALUES (NULL, 'Crave');

/*insertion table film*/
INSERT INTO film VALUES (NULL, 'Fight Club', 1999, 'Le film commence par un saut en avant montrant le personnage principal à qui on a enfoncé un pistolet dans la bouche et dont on entend la voix en monologue intérieur qui se remémore comment il en est arrivé là.', 139, 1, 1, 1, 1);

INSERT INTO film VALUES (NULL, 'La ligne verte', '1999', 'En 1996, Paul Edgecomb, un ancien gardien-chef dun pénitencier dans les années 1930, entreprend décrire ses mémoires. Il revient sur laffaire de John Coffey, ce grand Noir au regard absent, condamné à mort pour le viol et le meurtre de deux fillettes, qui défraya la chronique de 1935.', 188, 1, 2, 2, 2);

INSERT INTO film VALUES (NULL, 'Lost in Translation,', '2003', 'Le film raconte lhistoire de Elliott, un petit garçon solitaire qui se lie damitié avec un extraterrestre abandonné sur Terre. Avec son frère et sa sœur, Elliott va le recueillir puis laider à reprendre contact avec ses congénères, tout en essayant de le garder caché de leur mère et du gouvernement américain.', 115, 1, 3, 3, 3);

INSERT INTO film VALUES (NULL, 'E.T,', '1982', 'Bob Harris, acteur américain prenant de lâge et à la carrière instable, arrive à Tokyo au Japon, afin dy tourner une publicité pour un whisky de la marque Suntory, contrat quil a accepté en partie pour largent et en partie pour fuir son épouse. Incapable de sadapter au décalage horaire et à la situation présente, il passe le plus clair de son temps dans lhôtel de luxe où il réside, un gratte-ciel dominant la ville. Pendant ce temps, Charlotte, une jeune femme récemment diplômée de luniversité venue à Tokyo afin dy accompagner John, son mari, un photographe de célébrités, sennuie et se sent seule, incertaine à propos de son avenir et de ses sentiments envers lhomme quelle a épousé.', 102, 1, 4, 2, 4);


/*insertion table usager*/
INSERT INTO usager VALUES (NULL, 'Annabelle', 'Gamache', 'AnnaGamache', '345!ghurME', 'annabellegamache@gmail.com', 1);
INSERT INTO usager VALUES (NULL, 'Denis', 'Lalonde', 'DenisLalonde', '199#$ijnER', 'denislalomde1660@gmail.com', 2);
INSERT INTO usager VALUES (NULL, 'Ian', 'Bernier', 'IanBernier', 'ib34%jou34', 'ianbernier@gmail.com', 2);
INSERT INTO usager VALUES (NULL, 'Guillaume', 'Harvey', 'GuiHarvey', 'igh34!e!di34', 'gharvey@cmaisonneuve.qc.ca', 4);

/*insertion table Critque*/
INSERT INTO critique VALUES (NULL, 'Un film culte avec Brad Pitt et Edward Norton qui sont tous deux vraiment excellents. La mise en scène de David Fincher est impeccable. Atmosphère pressante, noire mais en même temps réaliste. La violence est ultra présente et de manière assez crue.', '2001-06-14', 4.5, 1, 3);
INSERT INTO critique VALUES (NULL, 'Un très bon film dramatique . Il a un très bon scénario et bonne écoute malgré ces 3 heures. Ce film est aussi très émouvant et très beau, en plus les acteurs jouent vraiment très bien et les décors sont magnifique.', '2014-08-16', 4, 2, 2);
INSERT INTO critique VALUES (NULL, 'Je ne comprends pas ce film. Lost in Translation est ennuyeux et terriblement lent. Les deux personnages sennuient, et on ressent la même chose en suivant leurs aventures loin pas du tout  palpitantes ou belles', '2012-05-11', 2.5, 2, 2);


/*insertion table acteur_film*/
INSERT INTO acteur_film VALUES (1, 1, 'Le narrateur');
INSERT INTO acteur_film VALUES (2, 2, 'Paul Edgecomb');
INSERT INTO acteur_film VALUES (3, 3, 'Bob Harri');


/*insertion table critique_film*/
INSERT INTO critique_film  VALUES (1, 1);
INSERT INTO critique_film  VALUES (2, 2);
INSERT INTO critique_film  VALUES (3, 3);



