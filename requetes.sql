--Voici le code SQL complet pour identifier les chambres générant le plus de revenus 
SELECT 
    c.id_cha AS "ID Chambre",
    c.type_chambre AS "Type de chambre",
    c.prix_par_nuit AS "Prix par nuit",
    SUM(NVL(p.montant, 0)) AS "Revenu des réservations",
    COUNT(DISTINCT r.id_res) AS "Nombre de réservations"
FROM 
    chambre c
LEFT JOIN 
    reservation1 r ON c.id_cha = r.id_cha
LEFT JOIN 
    generer g ON c.id_cha = g.id_cha  
LEFT JOIN 
    paiement p ON g.id_paiement = p.id_paiement
GROUP BY 
    c.id_cha, c.type_chambre, c.prix_par_nuit
ORDER BY 
    "Revenu des réservations" DESC  ;
    
--Top 5 des employés les plus ponctuels
SELECT * FROM (
    SELECT 
        e.nom,
        e.prenom,
        COUNT(r.id_retard) AS nombre_retards,
        RANK() OVER (ORDER BY COUNT(r.id_retard)) AS rang_retard
    FROM 
        employeee e
    LEFT JOIN 
        retard r ON e.id_emp = r.id_emp
    GROUP BY 
        e.nom, e.prenom
    ORDER BY 
        nombre_retards ASC
) 
WHERE rang_retard <= 5;


--Heures supplémentaires mensuelles par poste
SELECT 
    e.poste AS "Poste",
    COUNT(DISTINCT e.id_emp) AS "Nb_employes",
    SUM(hs.nb_heures) AS "Heures_sup",
    ROUND(AVG(hs.nb_heures), 2) AS "Moyenne",
    MAX(hs.nb_heures) AS "Max",
    MIN(hs.nb_heures) AS "Min"
FROM 
    employeee e
JOIN 
    heure_supplementaires hs ON e.id_emp = hs.id_emp
GROUP BY 
    e.poste
ORDER BY 
    "Heures_sup" DESC;


--l'historique complet d'un client VIP, incluant ses réservations, services utilisés et paiements 
SELECT 
    cl.id_client AS "ID Client",
    cl.nom || ' ' || cl.prenom AS "Client",
    cl.statut_client AS "Statut",
    r.id_res AS "N° Réservation",
    c.id_cha AS "N° Chambre",
    c.type_chambre AS "Type Chambre",
    r.date_arrivee AS "Date Arrivée",
    r.date_depart AS "Date Départ",
    p.montant AS "Montant Paié",
    p.mode_paiement AS "Mode Paiement",
    p.date_paiement AS "Date Paiement",
    (r.date_depart - r.date_arrivee) * c.prix_par_nuit AS "Total Séjour"
FROM 
    client cl
JOIN 
    reservation1 r ON cl.id_client = r.id_client
JOIN 
    chambre c ON r.id_cha = c.id_cha
LEFT JOIN 
    generer g ON g.id_cha = c.id_cha
LEFT JOIN 
    paiement p ON p.id_paiement = g.id_paiement
WHERE 
    cl.statut_client = 'VIP'
ORDER BY 
    cl.nom, cl.prenom, r.date_arrivee DESC;



--Requête filtrée par statut et affichage des informations nécessaires :
SELECT 
    c.id_cha,
    c.type_chambre,
    c.capacite,
    c.prix_par_nuit,
    c.statut AS statut_chambre,
    c.equipement
FROM 
    chambre c
WHERE 
    c.statut IN ('Disponible', 'Occupée', 'En nettoyage');

--Cette requête permet de lister toutes les chambres actuellement occupées (en temps réel) avec réservation confirmée.
SELECT 
    c.id_cha,
    c.type_chambre,
    c.capacite,
    c.prix_par_nuit,
    r.date_arrivee,
    r.date_depart,
    r.statut
FROM 
    chambre c
JOIN 
    reservation1 r ON c.id_cha = r.id_cha
WHERE 
    r.statut = 'confirmée'
    AND r.date_arrivee <= SYSDATE
    AND r.date_depart >= SYSDATE;


-- Détection des départs aujourd'hui pour alerter le ménage :
SELECT 
    c.id_cha,
    c.type_chambre,
    c.capacite,
    c.prix_par_nuit,
    r.date_depart 
FROM 
    chambre c
JOIN 
    reservation1 r ON c.id_cha = r.id_cha
WHERE 
    r.statut = 'confirmée'
    AND r.date_depart = TO_DATE(:r_date_depart, 'YYYY-MM-DD');



--Voici le code SQL pour calculer le taux d'occupation par type de chambre :



--Voici le code SQL pour calculer le taux d'occupation par type de chambre :
SELECT 
    c.type_chambre AS "Type de chambre",
    COUNT(DISTINCT c.id_cha) AS "Nombre de chambres",
    SUM(r.date_depart - r.date_arrivee) AS "Jours occupés totaux",
    COUNT(r.id_res) AS "Nombre de réservations",
    ROUND(
        (SUM(r.date_depart - r.date_arrivee) / 
        (COUNT(DISTINCT c.id_cha) * 
        (SELECT MAX(date_depart) - MIN(date_arrivee) 
         FROM reservation1 
         WHERE date_arrivee >= ADD_MONTHS(SYSDATE, -12)))
        ) * 100, 2
    ) AS "Taux d'occupation (%)"
FROM 
    chambre c
LEFT JOIN 
    reservation1 r 
    ON c.id_cha = r.id_cha
    AND r.date_arrivee >= ADD_MONTHS(SYSDATE, -12)  
GROUP BY 
    c.type_chambre
ORDER BY 
    "Taux d'occupation (%)" DESC;





-- Elle révèle quels services vos clients préfèrent et combien ils dépensent, classés par statut
SELECT 
    cl.statut_client AS "Type de client",
    ss.service_type AS "Service",
    COUNT(ss.id_ser) AS "Nombre de demandes",
    SUM(ss.prix) AS "Revenu total",
    ROUND(COUNT(ss.id_ser) * 100.0 / SUM(COUNT(ss.id_ser)) OVER (PARTITION BY cl.statut_client), 2) AS "Pourcentage par type client"
FROM 
    client cl
JOIN 
    reservation1 r ON cl.id_client = r.id_client
JOIN 
    service_supplementaire ss ON cl.id_client = ss.id_client
GROUP BY 
    cl.statut_client, ss.service_type
ORDER BY 
    cl.statut_client, "Nombre de demandes" DESC;

-- mch mrgla Cette requête permet d'identifier les clients les plus fidèles de l'année précédente en comptant leurs réservations
SELECT 
    c.nom,
    c.prenom,
    c.adresse,
    COUNT(r.id_res) AS nombre_reservations
FROM 
    client c
JOIN 
    reservation1 r ON c.id_client = r.id_client
WHERE 
    r.date_arrivee BETWEEN TO_DATE(:r_date_debut, 'YYYY-MM-DD') AND TO_DATE(:r_date_fin, 'YYYY-MM-DD')
GROUP BY 
    c.nom, c.prenom, c.adresse
HAVING 
    COUNT(r.id_res) >= 2;



--lients avec séjours prolongés (> 10 jours) :
SELECT 
    c.nom,
    c.prenom,
    c.adresse,
    r.id_res,
    r.date_arrivee,
    r.date_depart,
    (r.date_depart - r.date_arrivee) AS duree_sejour
FROM 
    client c
JOIN 
    reservation1 r ON c.id_client = r.id_client
WHERE 
    (r.date_depart - r.date_arrivee) > 10;


--Adresse de tous les clients les plus fidèles (même en cas d'égalité) :

SELECT 
    c.id_client,
    c.nom,
    c.prenom,
    c.adresse,
    nb_reservations
FROM 
    client c
JOIN 
    (
        SELECT 
            id_client,
            COUNT(id_res) AS nb_reservations
        FROM 
            reservation1
        GROUP BY 
            id_client
    ) r ON c.id_client = r.id_client
WHERE 
    r.nb_reservations = (
        SELECT 
            MAX(nb_res)
        FROM 
            (
                SELECT 
                    COUNT(id_res) AS nb_res
                FROM 
                    reservation1
                GROUP BY 
                    id_client
            )
    );











-- Mettre à jour un client







UPDATE client
SET statut_client = 'Actif'
WHERE id_client IN (
    SELECT id_client
    FROM reservation1
    GROUP BY id_client
    HAVING COUNT(DISTINCT date_arrivee) >= 2
)
AND statut_client = 'Inactif';




-- Nom des clients avec leurs réservations
SELECT 
  c.nom, 
  c.prenom, 
  r.id_res, 
  r.date_arrivee, 
  r.date_depart,
  r.id_client
FROM 
  client c
JOIN 
  reservation1 r ON c.id_client = r.id_client
WHERE 
  r.id_client = :id_client;






--Lister les chambres non encore préparée
SELECT c.id_cha, c.type_chambre, c.statut
FROM chambre c
WHERE c.id_cha NOT IN (SELECT id_cha FROM preparer);




























SELECT id_cha, type_chambre, prix_par_nuit,
       RANK() OVER (ORDER BY prix_par_nuit DESC) AS classement
FROM chambre
where statut = 'Libre';






-- Nombre de jours pour chaque réservation
SELECT 
  r.id_res, 
  r.date_arrivee, 
  r.date_depart, 
  r.date_depart - r.date_arrivee AS nb_jours
FROM 
  reservation1 r
WHERE 
  r.id_client = :id_client;
 
















-- Remettre une justification pour un retard





-- Remettre une justification pour une absence





-- Heures supplémentaires par employé
SELECT e.nom, h.nb_heures, h.type_compensation
FROM employeee e
JOIN heure_supplementaires h ON e.id_emp = h.id_emp
where e.id_emp= :id_emp;





--mrgl
SELECT 
    c.id_client,
    c.nom || ' ' || c.prenom AS nom_client,
    SUM((r.date_depart - r.date_arrivee) * ch.prix_par_nuit) AS montant_nuit_total,
    NVL(SUM(ss.prix), 0) AS total_services,
    SUM((r.date_depart - r.date_arrivee) * ch.prix_par_nuit) + NVL(SUM(ss.prix), 0) AS montant_total_a_payer
FROM 
    client c
JOIN 
    reservation1 r ON c.id_client = r.id_client
JOIN 
    chambre ch ON r.id_cha = ch.id_cha
LEFT JOIN 
    service_supplementaire ss 
    ON ss.date_presta BETWEEN r.date_arrivee AND r.date_depart
WHERE 
    c.id_client = :id_client
GROUP BY 
    c.id_client, c.nom, c.prenom;
    
-- 


SELECT mode_paiement, ROUND(AVG(montant), 2) AS moyenne_montant

FROM paiement

GROUP BY mode_paiement;

--









--nbre de reservation par mois

SELECT TO_CHAR(date_arrivee, 'YYYY-MM') AS mois, COUNT(*) AS total_reservations

FROM reservation1

GROUP BY TO_CHAR(date_arrivee, 'YYYY-MM')

ORDER BY mois;

 

WITH paiements_par_client AS (

    SELECT c.id_client, c.nom, c.prenom, c.statut_client,

           SUM(p.montant) AS total_paye

    FROM client c

    JOIN reservation1 r ON c.id_client = r.id_client

    JOIN generer g ON r.id_cha = g.id_cha

    JOIN paiement p ON p.id_paiement = g.id_paiement

    GROUP BY c.id_client, c.nom, c.prenom, c.statut_client

),

moyennes_par_statut AS (

    SELECT statut_client, AVG(total_paye) AS moyenne_statut

    FROM paiements_par_client

    GROUP BY statut_client

)

SELECT ppc.*

FROM paiements_par_client ppc

JOIN moyennes_par_statut mps ON ppc.statut_client = mps.statut_client
WHERE ppc.total_paye > mps.moyenne_statut;

 

-- Répartition mensuelle des paiements avec évolution

SELECT TO_CHAR(date_paiement, 'YYYY-MM') AS mois,

       SUM(montant) AS total_mensuel,

       LAG(SUM(montant)) OVER (ORDER BY TO_CHAR(date_paiement, 'YYYY-MM')) AS mois_prec,

       SUM(montant) - LAG(SUM(montant)) OVER (ORDER BY TO_CHAR(date_paiement, 'YYYY-MM')) AS variation

FROM paiement

GROUP BY TO_CHAR(date_paiement, 'YYYY-MM')

ORDER BY mois;

--Évolution cumulative des paiements par jour

SELECT date_paiement,

       montant,

       SUM(montant) OVER (ORDER BY date_paiement) AS cumul_paiements

FROM paiement

WHERE statut_paiement = 'Payé';

 

--Chambres avec plus de réservations que la moyenne

SELECT id_cha, COUNT(*) AS nb_reservations

FROM reservation1

GROUP BY id_cha

HAVING COUNT(*) > (

  SELECT AVG(nb) FROM (

    SELECT COUNT(*) AS nb FROM reservation1 GROUP BY id_cha

  )

);

 

--Employés ayant effectué plus d'heures supplémentaires que la moyenne de leur poste

WITH heures_par_employe AS (

  SELECT e.id_emp, e.nom, e.poste, SUM(h.nb_heures) AS total_heures

  FROM employeee e

  JOIN heure_supplementaires h ON e.id_emp = h.id_emp

  GROUP BY e.id_emp, e.nom, e.poste

),

moyennes_par_poste AS (

  SELECT poste, AVG(total_heures) AS moyenne_poste

  FROM heures_par_employe

  GROUP BY poste

)

SELECT hpe.*

FROM heures_par_employe hpe

JOIN moyennes_par_poste mpp ON hpe.poste = mpp.poste

WHERE hpe.total_heures > mpp.moyenne_poste;

--Évolution mensuelle du nombre de réservations avec différence par rapport au mois précédent

WITH reservations_mensuelles AS (

  SELECT TO_CHAR(date_arrivee, 'YYYY-MM') AS mois, COUNT(*) AS total

  FROM reservation1

  GROUP BY TO_CHAR(date_arrivee, 'YYYY-MM')

)

SELECT mois, total,

       LAG(total) OVER (ORDER BY mois) AS mois_prec,

       total - LAG(total) OVER (ORDER BY mois) AS variation

FROM reservations_mensuelles;

--Employés qui préparent plus de chambres que la moyenne de leur poste

WITH chambres_preparees AS (

  SELECT e.id_emp, e.nom, e.poste, COUNT(p.id_cha) AS nb_preparees

  FROM employeee e

  JOIN preparer p ON e.id_emp = p.id_emp

  GROUP BY e.id_emp, e.nom, e.poste

),

moyennes_poste AS (

  SELECT poste, AVG(nb_preparees) AS moyenne

  FROM chambres_preparees

  GROUP BY poste

)

SELECT cp.*

FROM chambres_preparees cp

JOIN moyennes_poste mp ON cp.poste = mp.poste

WHERE cp.nb_preparees > mp.moyenne;

 

--calendrier + nombre de réservations par jour

 

VARIABLE d_debut VARCHAR2(10);

VARIABLE d_fin   VARCHAR2(10);

 

-- 2. Assigner les dates depuis SQL Developer

EXEC :d_debut := '2024-01-01';

EXEC :d_fin   := '2024-01-10';

 

-- 3. Requête : calendrier enrichi avec occupation réelle

SELECT

    cal.jour,

    COUNT(r.id_res) AS nb_reservations,

    CASE
        WHEN COUNT(r.id_res) > 0 THEN 'Occupé'

        ELSE 'Libre'

    END AS statut

FROM (

    SELECT TO_DATE(:d_debut,'YYYY-MM-DD') + (LEVEL - 1) AS jour

    FROM dual

    CONNECT BY LEVEL <= (

        TO_DATE(:d_fin,'YYYY-MM-DD') - TO_DATE(:d_debut,'YYYY-MM-DD')
    ) + 1

) cal

LEFT JOIN reservation1 r

    ON cal.jour BETWEEN r.date_arrivee AND r.date_depart
   AND r.statut = 'confirmée'
GROUP BY cal.jour
ORDER BY cal.jour;