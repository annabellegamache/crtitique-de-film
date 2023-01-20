/*1. Une requête pour trouver le nombre de films qui ont été produits par un producteur dont vous connaissez l’identifiant
(ID) entre les années 1990 et 2000.*/
SELECT COUNT(*) AS NbFilm
FROM film
WHERE IdProducteur = 1 AND AnneeProduction > 1990 AND AnneeProduction < 2000;



/*2. Une requête pour trouver tous les producteurs qui ont produit un film de science-fiction en couleur, sans répétition.*/
SELECT CONCAT(p.Prenom, ' ', p.Nom) NomCompletProducteur
FROM producteur p
JOIN film f ON f.IdProducteur = p.ID
JOIN genre g ON f.idGenre = g.ID
WHERE g.Nom = 'science-fiction' AND f.Couleur = 1
GROUP BY p.ID;




/*3. Une requête pour trouver le titre de tous les films qui n’ont pas été réalisés entre 2000 et 2010 dans lesquels joue un acteur dont vous connaissez le prénom et le nom de famille. Vous devez aussi afficher le nom du ou des rôle(s) qu’il y
jouait.*/
SELECT f.Titre, af.Role, f.AnneeProduction 
FROM film f
JOIN acteur_film af ON af.IdFilm = f.ID
JOIN acteur a ON af.IdActeur = a.ID
WHERE (f.AnneeProduction < 2000 OR f.AnneeProduction > 2010) AND a.Prenom='Brad' AND a.Nom = 'Pitt';



/*4. Une requête pour trouver tous les textes et les notes des critiques rédigées en 2021 d’un film dont vous connaissez le titre.*/
SELECT c.Texte, c.NbEtoile, c.DateCritique
FROM critique c
JOIN critique_film cf ON cf.IdCritique = c.ID
JOIN film f ON cf.IdFilm = f.ID
WHERE YEAR(c.DateCritique) = '2021' AND f.Titre = 'Fight Club';



/*5. Une requête pour affichez le titre de tous les films et les textes de toutes les critiques de chacun des films accompagné du nom de l’usager qui a rédigé la critique et du nom du réalisateur du film. Il faut aussi afficher les films pour lesquels il n’y a aucune critique de rédigée.*/
SELECT f.Titre, c.Texte AS CritiqueTxt, u.NomUsager, CONCAT(r.Prenom, ' ', r.Nom) AS NomCompletReal
FROM film f
LEFT OUTER JOIN critique_film cf ON cf.IdFilm = f.ID
LEFT OUTER JOIN critique c ON cf.IdCritique= c.ID
LEFT OUTER JOIN usager u ON c.idUsager = u.ID
JOIN realisateur r ON f.IdRealisateur = r.ID


/*6. Une requête qui affiche le nombre de critiques rédigées par chaque usager qui a rédigé plus de 2 critiques. Le résultat sera le prénom et le nom de l’usager, son courriel, suivi du nombre de critiques qu’il a rédigées.*/
SELECT u.Prenom, u.Nom, u.Courriel, COUNT(*) AS NbCritique  
FROM critique c
JOIN usager u ON u.ID = c.idUsager
GROUP BY c.idUsager
HAVING NbCritique > 2



/*7. Une requête pour trouver la note maximale que chacun des films a reçu, accompagné du titre et de l’année de ces films, ainsi que du nom du producteur du film et le nom du genre du film. Les films qui n’ont pas reçu de notes doivent être inclus dans votre requête.*/
SELECT MAX(c.NbEtoile), f.Titre, f.AnneeProduction, CONCAT(p.Prenom, ' ',p.Nom) AS NomProdComplet, g.Nom AS GenreFilm
FROM film f
LEFT OUTER JOIN critique_film cf ON cf.IdFilm = f.ID
JOIN critique c ON c.ID = cf.idCritique
JOIN producteur p ON p.ID = f.idProducteur
JOIN genre g ON g.ID = f.idGenre
GROUP BY f.ID



/*8. Une requête pour trouver le titre de chacun des films vus sur la plateforme Crave ainsi que le nombre de notes qu’il a
reçues. Seulement les critiques du film mentionnant qu’il a été vu sur Crave seront comptées.*/
SELECT f.titre, c.NbEtoile, p.Nom as PlateForme
FROM film f
LEFT OUTER JOIN critique_film cf ON cf.IdFilm = f.ID
JOIN critique c ON c.ID = cf.idCritique
JOIN usager u ON u.ID = c.idUsager
JOIN plateforme p ON p.ID = c.idPlateforme
WHERE p.Nom = 'Crave';



/*9. Une requête pour trouver le titre et la moyenne des notes de tous les films de science-fiction qui ont été critiqués au
moins 2 fois en 2020, ordonnée par ordre descendant de moyenne.*/
SELECT f.titre, AVG(c.NbEtoile) AS MoyNote, g.Nom AS Genre, COUNT(cf.idCritique) AS NbCritique
FROM film f
LEFT OUTER JOIN critique_film cf ON cf.IdFilm = f.ID
JOIN critique c ON c.ID = cf.idCritique
JOIN genre g  ON g.ID = f.idGenre
WHERE YEAR(c.DateCritique) = 2020 AND g.Nom = 'science-fiction'
GROUP BY f.ID
HAVING COUNT(cf.idCritique) >= 2
ORDER BY AVG(c.NbEtoile) DESC;


/*10.Une requête pour trouver la moyenne des notes accordées par l’usager Guillaume Harvey aux films réalisés par Steven
Spielberg.*/
SELECT AVG(c.NbEtoile) AS MoyNote
FROM film f
JOIN critique_film cf ON cf.IdFilm = f.ID
JOIN  critique c ON c.ID = cf.idCritique
JOIN usager u ON u.ID = c.idUsager
JOIN realisateur r ON r.ID = f.IdRealisateur
WHERE r.Prenom = 'Steven' AND r.Nom = 'Spielberg' AND u.Prenom = 'Guillaume' AND u.Nom = 'Harvey'


