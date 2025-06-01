SET DEFINE OFF;

 

DROP TABLE preparer CASCADE CONSTRAINTS;

 

DROP TABLE generer CASCADE CONSTRAINTS;

 

DROP TABLE client CASCADE CONSTRAINTS;

 



 

DROP TABLE chambre CASCADE CONSTRAINTS;

 

DROP TABLE reservation1 CASCADE CONSTRAINTS;

 

DROP TABLE service_supplementaire CASCADE CONSTRAINTS;

 

DROP TABLE employeee CASCADE CONSTRAINTS;

 

DROP TABLE paiement CASCADE CONSTRAINTS;

 

DROP TABLE facture CASCADE CONSTRAINTS;

 

DROP TABLE absence CASCADE CONSTRAINTS;

 

DROP TABLE retard CASCADE CONSTRAINTS;

 

DROP TABLE heure_supplementaires CASCADE CONSTRAINTS;

 


 

CREATE TABLE client (

 

    id_client        NUMBER PRIMARY KEY,

 

    nom              VARCHAR2(50),

 

    prenom           VARCHAR2(50),

 

    email            VARCHAR2(100),

 

    phone            VARCHAR2(20),

 

    adresse          VARCHAR2(150),

 

    statut_client    VARCHAR2(20)

 

);

 

 

CREATE TABLE chambre (

 

    id_cha           NUMBER PRIMARY KEY,

 

    type_chambre     VARCHAR2(30),

 

    capacite         NUMBER,

 

    prix_par_nuit    NUMBER(10,2),

 

    statut           VARCHAR2(20),

 

    equipement       VARCHAR2(100)

 

);

 

 

CREATE TABLE reservation1 (

  id_res        NUMBER PRIMARY KEY,

  id_client     NUMBER,
  id_cha     NUMBER,

  date_arrivee  DATE,

  date_depart   DATE,

  statut        VARCHAR2(20),

  demande_speciale VARCHAR2(200),

  CONSTRAINT fk_res_client FOREIGN KEY(id_client) REFERENCES client(id_client),

  CONSTRAINT fk_res_chambre FOREIGN KEY(id_cha) REFERENCES chambre(id_cha)
);

 



 

 

CREATE TABLE service_supplementaire (

 

    id_ser           NUMBER PRIMARY KEY,
    

    id_client     NUMBER,

    service_type     VARCHAR2(50),

 

    prix             NUMBER(10,2),

 

    date_presta      DATE,
    CONSTRAINT fk_res_serv FOREIGN KEY(id_client) REFERENCES client(id_client)
    

 

);

 

 

CREATE TABLE employeee (

 

    id_emp           NUMBER PRIMARY KEY,

 

    nom              VARCHAR2(50),

 

    prenom           VARCHAR2(50),

 

    poste            VARCHAR2(50),

 

    email            VARCHAR2(100),

 

    phone            VARCHAR2(20),

 

    adresse          VARCHAR2(150)

 

);

 

 

CREATE TABLE paiement (

 

    id_paiement      NUMBER PRIMARY KEY,

 

    montant          NUMBER(10,2),

 

   

 

    mode_paiement    VARCHAR2(30),

 

    statut_paiement  VARCHAR2(20),

 

    date_paiement    DATE

 

);

 

 

CREATE TABLE facture (

 

    id_facture       NUMBER PRIMARY KEY,

 

    date_emission    DATE,

 

    total            NUMBER(10,2),

 

    remise           NUMBER(5,2),

 

    service_facture  VARCHAR2(100)

 

);

 

 

CREATE TABLE absence (

 

    id_ab            NUMBER PRIMARY KEY,

 

    id_emp           NUMBER,

 

    date_debut       DATE,

 

    date_fin         DATE,

 

    justification    VARCHAR2(200),

 

    statut           VARCHAR2(20),

 

    CONSTRAINT fk_abs_emp FOREIGN KEY (id_emp) REFERENCES employeee(id_emp)

 

);

 

 

CREATE TABLE retard (

 

    id_retard        NUMBER PRIMARY KEY,

 

    id_emp           NUMBER,

 

    date_retard      DATE,

 

    heure_arrivee    DATE,

 

    justification    VARCHAR2(200),

 

    CONSTRAINT fk_retard_emp FOREIGN KEY (id_emp) REFERENCES employeee(id_emp)

 

);

 

 

CREATE TABLE heure_supplementaires (

    id_heure_sup      NUMBER PRIMARY KEY,

    id_emp            NUMBER,

    nb_heures         NUMBER(5,2),

    type_compensation VARCHAR2(50),

    CONSTRAINT fk_heure_emp_new FOREIGN KEY (id_emp) REFERENCES employeee(id_emp)

);

 

 



 

CREATE TABLE preparer (

 

    id_emp  NUMBER,

 

    id_cha  NUMBER,

 

    PRIMARY KEY (id_emp, id_cha),

 

    CONSTRAINT fk_preparer_emp FOREIGN KEY (id_emp) REFERENCES employeee(id_emp),

 

    CONSTRAINT fk_preparer_cha FOREIGN KEY (id_cha) REFERENCES chambre(id_cha)

 

);

 

CREATE TABLE generer (

 

    id_paiement  NUMBER,

 

    id_cha       NUMBER,

 

    PRIMARY KEY (id_paiement, id_cha),

 

    CONSTRAINT fk_generer_paiement FOREIGN KEY (id_paiement) REFERENCES paiement(id_paiement),

 

    CONSTRAINT fk_generer_chambre FOREIGN KEY (id_cha) REFERENCES chambre(id_cha)

 

);

INSERT ALL

  INTO client (id_client, nom, prenom, email, phone, adresse, statut_client) VALUES (1, 'Ben Ammar', 'Mohamed', 'mohamed.benammar@gmail.com', '20123456', '12 Rue Habib Bourguiba, Tunis', 'Actif')

  INTO client (id_client, nom, prenom, email, phone, adresse, statut_client) VALUES (2, 'Trabelsi', 'Fatma', 'fatma.trabelsi@gmail.com', '98112233', '45 Avenue de la Liberté, Sousse', 'Actif')

  INTO client (id_client, nom, prenom, email, phone, adresse, statut_client) VALUES (3, 'Sassi', 'Ali', 'ali.sassi@gmail.com', '22112233', '33 Rue du Jardin, Hammamet', 'Inactif')

  INTO client (id_client, nom, prenom, email, phone, adresse, statut_client) VALUES (4, 'Mansouri', 'Amina', 'amina.mansouri@gmail.com', '55112233', '78 Rue des Oranges, Djerba', 'Actif')

  INTO client (id_client, nom, prenom, email, phone, adresse, statut_client) VALUES (5, 'Bouzid', 'Hichem', 'hichem.bouzid@gmail.com', '27112233', '90 Avenue Farhat Hached, Sfax', 'Actif')

  INTO client (id_client, nom, prenom, email, phone, adresse, statut_client) VALUES (6, 'Gharbi', 'Leila', 'leila.gharbi@gmail.com', '96112233', '14 Rue de la Mosquée, Kairouan', 'Inactif')

  INTO client (id_client, nom, prenom, email, phone, adresse, statut_client) VALUES (7, 'Chaabane', 'Riadh', 'riadh.chaabane@gmail.com', '23112233', '56 Rue des Palmiers, Bizerte', 'Actif')

  INTO client (id_client, nom, prenom, email, phone, adresse, statut_client) VALUES (8, 'Ferjani', 'Salma', 'salma.ferjani@gmail.com', '98112234', '22 Avenue Habib Thameur, Gabès', 'Actif')

  INTO client (id_client, nom, prenom, email, phone, adresse, statut_client) VALUES (9, 'Jemai', 'Omar', 'omar.jemai@gmail.com', '27112234', '67 Rue de Carthage, Tunis', 'Inactif')

  INTO client (id_client, nom, prenom, email, phone, adresse, statut_client) VALUES (10, 'Labyedh', 'Nadia', 'nadia.labyedh@gmail.com', '55112234', '89 Rue de la Plage, Mahdia', 'Actif')

  INTO client (id_client, nom, prenom, email, phone, adresse, statut_client) VALUES (11, 'Mrad', 'Karim', 'karim.mrad@gmail.com', '20123457', '43 Avenue Taieb Mhiri, Monastir', 'VIP')

  INTO client (id_client, nom, prenom, email, phone, adresse, statut_client) VALUES (12, 'Saidi', 'Samira', 'samira.saidi@gmail.com', '98112235', '11 Rue de la République, Sousse', 'Inactif')

  INTO client (id_client, nom, prenom, email, phone, adresse, statut_client) VALUES (13, 'Haddad', 'Youssef', 'youssef.haddad@gmail.com', '22112234', '32 Rue des Oliviers, Nabeul', 'Actif')

  INTO client (id_client, nom, prenom, email, phone, adresse, statut_client) VALUES (14, 'Abid', 'Sonia', 'sonia.abid@gmail.com', '96112234', '76 Avenue des Martyrs, Zarzis', 'Actif')

  INTO client (id_client, nom, prenom, email, phone, adresse, statut_client) VALUES (15, 'Khemiri', 'Tarek', 'tarek.khemiri@gmail.com', '23112234', '54 Rue de la Gare, Béja', 'Inactif')

  INTO client (id_client, nom, prenom, email, phone, adresse, statut_client) VALUES (16, 'Ben Salah', 'Amira', 'amira.bensalah@gmail.com', '27112235', '88 Rue de la Médina, Tunis', 'Actif')

  INTO client (id_client, nom, prenom, email, phone, adresse, statut_client) VALUES (17, 'Guesmi', 'Adel', 'adel.guesmi@gmail.com', '55112235', '29 Avenue Habib Bourguiba, Sfax', 'Actif')

  INTO client (id_client, nom, prenom, email, phone, adresse, statut_client) VALUES (18, 'Ben Youssef', 'Houda', 'houda.benyoussef@gmail.com', '98112236', '63 Rue des Fleurs, Hammamet', 'Inactif')

  INTO client (id_client, nom, prenom, email, phone, adresse, statut_client) VALUES (19, 'Maalej', 'Wassim', 'wassim.maalej@gmail.com', '22112235', '17 Rue de la Corniche, Djerba', 'Actif')

  INTO client (id_client, nom, prenom, email, phone, adresse, statut_client) VALUES (20, 'Baccar', 'Rym', 'rym.baccar@gmail.com', '96112235', '41 Avenue des Jardins, Sousse', 'Actif')

SELECT * FROM dual;

 

 

INSERT ALL

  INTO client (id_client, nom, prenom, email, phone, adresse, statut_client) VALUES (21, 'Ben Hassen', 'Khalil', 'khalil.benhassen@gmail.com', '20123458', '15 Rue Ali Belhouane, Tunis', 'Actif')

  INTO client (id_client, nom, prenom, email, phone, adresse, statut_client) VALUES (22, 'Cherif', 'Mouna', 'mouna.cherif@gmail.com', '98112237', '28 Rue Ibn Khaldoun, Sousse', 'Actif')

  INTO client (id_client, nom, prenom, email, phone, adresse, statut_client) VALUES (23, 'Dhouib', 'Samir', 'samir.dhouib@gmail.com', '22112236', '9 Rue des Pins, Hammamet', 'Inactif')

  INTO client (id_client, nom, prenom, email, phone, adresse, statut_client) VALUES (24, 'El Matri', 'Nour', 'nour.elmatri@gmail.com', '55112236', '62 Avenue Habib Bourguiba, Djerba', 'Actif')

  INTO client (id_client, nom, prenom, email, phone, adresse, statut_client) VALUES (25, 'Frikha', 'Walid', 'walid.frikha@gmail.com', '27112236', '37 Rue de la République, Sfax', 'Actif')

 

SELECT 1 FROM DUAL;




INSERT ALL
  INTO chambre VALUES (1, 'Simple Standard', 1, 120.00, 'Libre', 'TV, Wi-Fi, Climatisation')
  INTO chambre VALUES (2, 'Double Deluxe', 2, 220.00, 'Occupé', 'TV écran plat, Mini-bar, Climatisation, Sèche-cheveux')
  INTO chambre VALUES (3, 'Suite Junior', 2, 350.00, 'Libre', 'TV LCD, Coin salon, Mini-bar, Climatisation')
  INTO chambre VALUES (4, 'Simple Vue Mer', 1, 180.00, 'Nettoyage', 'TV, Wi-Fi, Climatisation, Balcon')
  INTO chambre VALUES (5, 'Double Standard', 2, 200.00, 'Libre', 'TV, Wi-Fi, Climatisation')
  INTO chambre VALUES (6, 'Suite Présidentielle', 4, 800.00, 'Occupé', 'TV 55", Jacuzzi, Cuisinette, Service en chambre')
  INTO chambre VALUES (7, 'Simple Economique', 1, 90.00, 'Libre', 'Ventilateur, Wi-Fi')
  INTO chambre VALUES (8, 'Double Vue Jardin', 2, 240.00, 'Maintenance', 'TV, Climatisation, Balcon')
  INTO chambre VALUES (9, 'Triple Familiale', 3, 320.00, 'Libre', 'TV, Wi-Fi, Climatisation, Lit bébé sur demande')
  INTO chambre VALUES (10, 'Suite Exécutive', 2, 450.00, 'Libre', 'Bureau, TV écran plat, Mini-bar, Climatisation')
  INTO chambre VALUES (11, 'Simple Supérieure', 1, 150.00, 'Occupé', 'TV, Wi-Fi, Climatisation, Mini-frigo')
  INTO chambre VALUES (12, 'Double Connectée', 2, 280.00, 'Libre', 'Smart TV, Domotique, Climatisation')
  INTO chambre VALUES (13, 'Chambre Handicapée', 1, 130.00, 'Libre', 'Accès PMR, Salle de bain adaptée, TV')
  INTO chambre VALUES (14, 'Double Economique', 2, 160.00, 'Nettoyage', 'Ventilateur, Wi-Fi')
  INTO chambre VALUES (15, 'Suite Royale', 2, 950.00, 'Occupé', 'Service VIP, Jacuzzi, Terrasse privée')
  INTO chambre VALUES (16, 'Simple Standard', 1, 120.00, 'Libre', 'TV, Wi-Fi, Climatisation')
  INTO chambre VALUES (17, 'Double Deluxe', 2, 230.00, 'Libre', 'TV écran plat, Mini-bar, Climatisation')
  INTO chambre VALUES (18, 'Quadruple Familiale', 4, 400.00, 'Occupé', '2 lits doubles, TV, Climatisation')
  INTO chambre VALUES (19, 'Simple Vue Piscine', 1, 170.00, 'Libre', 'TV, Wi-Fi, Climatisation, Balcon')
  INTO chambre VALUES (20, 'Double Supérieure', 2, 260.00, 'Maintenance', 'TV, Mini-bar, Climatisation')
SELECT 1 FROM DUAL;
INSERT ALL

 

  INTO chambre (id_cha, type_chambre, capacite, prix_par_nuit, statut, equipement) VALUES (21, 'Suite Honeymoon', 2, 600.00, 'Libre', 'Lit king size, Jacuzzi, Décoration romantique')

  INTO chambre (id_cha, type_chambre, capacite, prix_par_nuit, statut, equipement) VALUES (22, 'Simple Standard', 1, 110.00, 'Occupé', 'TV, Wi-Fi')

  INTO chambre (id_cha, type_chambre, capacite, prix_par_nuit, statut, equipement) VALUES (23, 'Double Standard', 2, 190.00, 'Libre', 'TV, Wi-Fi, Climatisation')

  INTO chambre (id_cha, type_chambre, capacite, prix_par_nuit, statut, equipement) VALUES (24, 'Triple Economique', 3, 250.00, 'Nettoyage', 'Ventilateur, Wi-Fi')

  INTO chambre (id_cha, type_chambre, capacite, prix_par_nuit, statut, equipement) VALUES (25, 'Suite Business', 2, 500.00, 'Libre', 'Bureau spacieux, Imprimante, Wi-Fi haut débit')

  INTO chambre (id_cha, type_chambre, capacite, prix_par_nuit, statut, equipement) VALUES (26, 'Simple Deluxe', 1, 200.00, 'Occupé', 'TV écran plat, Mini-bar, Climatisation')

  INTO chambre (id_cha, type_chambre, capacite, prix_par_nuit, statut, equipement) VALUES (27, 'Double Vue Mer', 2, 300.00, 'Libre', 'Balcon, TV, Climatisation')

  INTO chambre (id_cha, type_chambre, capacite, prix_par_nuit, statut, equipement) VALUES (28, 'Chambre Adaptée', 1, 140.00, 'Maintenance', 'Accès PMR, Salle de bain adaptée')

  INTO chambre (id_cha, type_chambre, capacite, prix_par_nuit, statut, equipement) VALUES (29, 'Double Standard', 2, 180.00, 'Libre', 'TV, Wi-Fi')

  INTO chambre (id_cha, type_chambre, capacite, prix_par_nuit, statut, equipement) VALUES (30, 'Suite Familiale', 4, 420.00, 'Occupé', '2 chambres, TV, Cuisinette')

  INTO chambre (id_cha, type_chambre, capacite, prix_par_nuit, statut, equipement) VALUES (31, 'Simple Economique', 1, 85.00, 'Libre', 'Ventilateur')

  INTO chambre (id_cha, type_chambre, capacite, prix_par_nuit, statut, equipement) VALUES (32, 'Double Supérieure', 2, 270.00, 'Libre', 'TV écran plat, Mini-bar, Climatisation')

  INTO chambre (id_cha, type_chambre, capacite, prix_par_nuit, statut, equipement) VALUES (33, 'Triple Standard', 3, 290.00, 'Nettoyage', 'TV, Wi-Fi, Climatisation')

  INTO chambre (id_cha, type_chambre, capacite, prix_par_nuit, statut, equipement) VALUES (34, 'Suite Présidentielle', 2, 750.00, 'Occupé', 'Service 24/7, Jacuzzi, Vue panoramique')

  INTO chambre (id_cha, type_chambre, capacite, prix_par_nuit, statut, equipement) VALUES (35, 'Simple Vue Jardin', 1, 130.00, 'Libre', 'TV, Wi-Fi, Balcon')

  INTO chambre (id_cha, type_chambre, capacite, prix_par_nuit, statut, equipement) VALUES (36, 'Double Connectée', 2, 310.00, 'Maintenance', 'Smart TV, Domotique, Climatisation')

  INTO chambre (id_cha, type_chambre, capacite, prix_par_nuit, statut, equipement) VALUES (37, 'Chambre Handicapée', 1, 120.00, 'Libre', 'Accès PMR, TV')

  INTO chambre (id_cha, type_chambre, capacite, prix_par_nuit, statut, equipement) VALUES (38, 'Double Economique', 2, 150.00, 'Occupé', 'Ventilateur, Wi-Fi')

  INTO chambre (id_cha, type_chambre, capacite, prix_par_nuit, statut, equipement) VALUES (39, 'Suite Exécutive', 2, 480.00, 'Libre', 'Bureau, 2 TV, Mini-bar')

  INTO chambre (id_cha, type_chambre, capacite, prix_par_nuit, statut, equipement) VALUES (40, 'Simple Standard', 1, 100.00, 'Nettoyage', 'TV, Wi-Fi')

  INTO chambre (id_cha, type_chambre, capacite, prix_par_nuit, statut, equipement) VALUES (41, 'Double Deluxe', 2, 210.00, 'Libre', 'TV écran plat, Mini-bar')

  INTO chambre (id_cha, type_chambre, capacite, prix_par_nuit, statut, equipement) VALUES (42, 'Quadruple Familiale', 4, 380.00, 'Occupé', '2 lits doubles, TV, Climatisation')

  INTO chambre (id_cha, type_chambre, capacite, prix_par_nuit, statut, equipement) VALUES (43, 'Simple Vue Mer', 1, 160.00, 'Libre', 'TV, Balcon')

  INTO chambre (id_cha, type_chambre, capacite, prix_par_nuit, statut, equipement) VALUES (44, 'Double Supérieure', 2, 250.00, 'Maintenance', 'TV, Mini-bar, Climatisation')

  INTO chambre (id_cha, type_chambre, capacite, prix_par_nuit, statut, equipement) VALUES (45, 'Suite Honeymoon', 2, 650.00, 'Occupé', 'Jacuzzi, Décoration romantique')

  INTO chambre (id_cha, type_chambre, capacite, prix_par_nuit, statut, equipement) VALUES (46, 'Simple Standard', 1, 115.00, 'Libre', 'TV, Wi-Fi')

  INTO chambre (id_cha, type_chambre, capacite, prix_par_nuit, statut, equipement) VALUES (47, 'Double Standard', 2, 195.00, 'Nettoyage', 'TV, Climatisation')

  INTO chambre (id_cha, type_chambre, capacite, prix_par_nuit, statut, equipement) VALUES (48, 'Triple Economique', 3, 240.00, 'Libre', 'Ventilateur')

  INTO chambre (id_cha, type_chambre, capacite, prix_par_nuit, statut, equipement) VALUES (49, 'Suite Business', 2, 520.00, 'Occupé', 'Bureau, Imprimante')

  INTO chambre (id_cha, type_chambre, capacite, prix_par_nuit, statut, equipement) VALUES (50, 'Simple Deluxe', 1, 190.00, 'Libre', 'TV écran plat, Mini-bar')

SELECT * FROM dual;

INSERT ALL

  INTO employeee (id_emp, nom, prenom, poste, email, phone, adresse) VALUES (1, 'Ben Ammar', 'Mohamed', 'Réceptionniste', 'mohamed.benammar@hotel-dz.com', '20123456', '12 Rue Habib Bourguiba, Tunis')

  INTO employeee (id_emp, nom, prenom, poste, email, phone, adresse) VALUES (2, 'Trabelsi', 'Fatma', 'Femme de chambre', 'fatma.trabelsi@hotel-dz.com', '98112233', '45 Avenue de la Liberté, Sousse')

  INTO employeee (id_emp, nom, prenom, poste, email, phone, adresse) VALUES (3, 'Sassi', 'Ali', 'Chef de réception', 'ali.sassi@hotel-dz.com', '22112233', '33 Rue du Jardin, Hammamet')

  INTO employeee (id_emp, nom, prenom, poste, email, phone, adresse) VALUES (4, 'Mansouri', 'Amina', 'Gouvernante', 'amina.mansouri@hotel-dz.com', '55112233', '78 Rue des Oranges, Djerba')

  INTO employeee (id_emp, nom, prenom, poste, email, phone, adresse) VALUES (5, 'Bouzid', 'Hichem', 'Concierge', 'hichem.bouzid@hotel-dz.com', '27112233', '90 Avenue Farhat Hached, Sfax')

  INTO employeee (id_emp, nom, prenom, poste, email, phone, adresse) VALUES (6, 'Gharbi', 'Leila', 'Responsable RH', 'leila.gharbi@hotel-dz.com', '96112233', '14 Rue de la Mosquée, Kairouan')

  INTO employeee (id_emp, nom, prenom, poste, email, phone, adresse) VALUES (7, 'Chaabane', 'Riadh', 'Chef de cuisine', 'riadh.chaabane@hotel-dz.com', '23112233', '56 Rue des Palmiers, Bizerte')

  INTO employeee (id_emp, nom, prenom, poste, email, phone, adresse) VALUES (8, 'Ferjani', 'Salma', 'Serveuse restaurant', 'salma.ferjani@hotel-dz.com', '98112234', '22 Avenue Habib Thameur, Gabès')

  INTO employeee (id_emp, nom, prenom, poste, email, phone, adresse) VALUES (9, 'Jemai', 'Omar', 'Barman', 'omar.jemai@hotel-dz.com', '27112234', '67 Rue de Carthage, Tunis')

  INTO employeee (id_emp, nom, prenom, poste, email, phone, adresse) VALUES (10, 'Labyedh', 'Nadia', 'Responsable spa', 'nadia.labyedh@hotel-dz.com', '55112234', '89 Rue de la Plage, Mahdia')

  INTO employeee (id_emp, nom, prenom, poste, email, phone, adresse) VALUES (11, 'Mrad', 'Karim', 'Technicien maintenance', 'karim.mrad@hotel-dz.com', '20123457', '43 Avenue Taieb Mhiri, Monastir')

  INTO employeee (id_emp, nom, prenom, poste, email, phone, adresse) VALUES (12, 'Saidi', 'Samira', 'Comptable', 'samira.saidi@hotel-dz.com', '98112235', '11 Rue de la République, Sousse')

  INTO employeee (id_emp, nom, prenom, poste, email, phone, adresse) VALUES (13, 'Haddad', 'Youssef', 'Responsable sécurité', 'youssef.haddad@hotel-dz.com', '22112234', '32 Rue des Oliviers, Nabeul')

  INTO employeee (id_emp, nom, prenom, poste, email, phone, adresse) VALUES (14, 'Abid', 'Sonia', 'Directrice adjointe', 'sonia.abid@hotel-dz.com', '96112234', '76 Avenue des Martyrs, Zarzis')

  INTO employeee (id_emp, nom, prenom, poste, email, phone, adresse) VALUES (15, 'Khemiri', 'Tarek', 'Valet parking', 'tarek.khemiri@hotel-dz.com', '23112234', '54 Rue de la Gare, Béja')

  INTO employeee (id_emp, nom, prenom, poste, email, phone, adresse) VALUES (16, 'Ben Salah', 'Amira', 'Réceptionniste de nuit', 'amira.bensalah@hotel-dz.com', '27112235', '88 Rue de la Médina, Tunis')

  INTO employeee (id_emp, nom, prenom, poste, email, phone, adresse) VALUES (17, 'Guesmi', 'Adel', 'Chef pâtissier', 'adel.guesmi@hotel-dz.com', '55112235', '29 Avenue Habib Bourguiba, Sfax')

  INTO employeee (id_emp, nom, prenom, poste, email, phone, adresse) VALUES (18, 'Ben Youssef', 'Houda', 'Standardiste', 'houda.benyoussef@hotel-dz.com', '98112236', '63 Rue des Fleurs, Hammamet')

  INTO employeee (id_emp, nom, prenom, poste, email, phone, adresse) VALUES (19, 'Maalej', 'Wassim', 'Responsable IT', 'wassim.maalej@hotel-dz.com', '22112235', '17 Rue de la Corniche, Djerba')

  INTO employeee (id_emp, nom, prenom, poste, email, phone, adresse) VALUES (20, 'Baccar', 'Rym', 'Directrice commerciale', 'rym.baccar@hotel-dz.com', '96112235', '41 Avenue des Jardins, Sousse')

  INTO employeee (id_emp, nom, prenom, poste, email, phone, adresse) VALUES (21, 'Ben Hassen', 'Khalil', 'Bagagiste', 'khalil.benhassen@hotel-dz.com', '20123458', '15 Rue Ali Belhouane, Tunis')

  INTO employeee (id_emp, nom, prenom, poste, email, phone, adresse) VALUES (22, 'Cherif', 'Mouna', 'Femme de chambre', 'mouna.cherif@hotel-dz.com', '98112237', '28 Rue Ibn Khaldoun, Sousse')

  INTO employeee (id_emp, nom, prenom, poste, email, phone, adresse) VALUES (23, 'Dhouib', 'Samir', 'Chef de rang', 'samir.dhouib@hotel-dz.com', '22112236', '9 Rue des Hibiscus, Hammamet')

  INTO employeee (id_emp, nom, prenom, poste, email, phone, adresse) VALUES (24, 'El Matri', 'Nour', 'Responsable réservation', 'nour.elmatri@hotel-dz.com', '55112236', '62 Avenue Habib Bourguiba, Djerba')

  INTO employeee (id_emp, nom, prenom, poste, email, phone, adresse) VALUES (25, 'Frikha', 'Walid', 'Technicien piscine', 'walid.frikha@hotel-dz.com', '27112236', '37 Rue de la République, Sfax')

  INTO employeee (id_emp, nom, prenom, poste, email, phone, adresse) VALUES (26, 'Gannouni', 'Sana', 'Esthéticienne spa', 'sana.gannouni@hotel-dz.com', '96112236', '5 Rue de la Kasbah, Kairouan')

  INTO employeee (id_emp, nom, prenom, poste, email, phone, adresse) VALUES (27, 'Hamrouni', 'Taha', 'Agent d''entretien', 'taha.hamrouni@hotel-dz.com', '23112235', '81 Boulevard du 7 Novembre, Bizerte')

  INTO employeee (id_emp, nom, prenom, poste, email, phone, adresse) VALUES (28, 'Ibn Khaldoun', 'Rim', 'Responsable événementiel', 'rim.ibnkhaldoun@hotel-dz.com', '98112238', '44 Rue de la Plage, Gabès')

  INTO employeee (id_emp, nom, prenom, poste, email, phone, adresse) VALUES (29, 'Jaziri', 'Fares', 'Sommelier', 'fares.jaziri@hotel-dz.com', '27112237', '23 Rue de l''Indépendance, Tunis')

  INTO employeee (id_emp, nom, prenom, poste, email, phone, adresse) VALUES (30, 'Kouki', 'Hajer', 'Assistante de direction', 'hajer.kouki@hotel-dz.com', '55112237', '76 Rue de la Médina, Mahdia')

SELECT * FROM dual;


INSERT ALL
  INTO heure_supplementaires (id_heure_sup, id_emp, nb_heures, type_compensation) VALUES (1, 1, 5.5, 'Heures supplémentaires payées')
  INTO heure_supplementaires (id_heure_sup, id_emp, nb_heures, type_compensation) VALUES (2, 2, 3.0, 'Heures supplémentaires compensées par repos')
  INTO heure_supplementaires (id_heure_sup, id_emp, nb_heures, type_compensation) VALUES (3, 3, 4.5, 'Heures supplémentaires payées')
  INTO heure_supplementaires (id_heure_sup, id_emp, nb_heures, type_compensation) VALUES (4, 4, 2.5, 'Heures supplémentaires compensées par repos')
  INTO heure_supplementaires (id_heure_sup, id_emp, nb_heures, type_compensation) VALUES (5, 5, 6.0, 'Heures supplémentaires payées')
  INTO heure_supplementaires (id_heure_sup, id_emp, nb_heures, type_compensation) VALUES (6, 6, 7.0, 'Heures supplémentaires compensées par repos')
  INTO heure_supplementaires (id_heure_sup, id_emp, nb_heures, type_compensation) VALUES (7, 7, 8.0, 'Heures supplémentaires payées')
  INTO heure_supplementaires (id_heure_sup, id_emp, nb_heures, type_compensation) VALUES (8, 8, 4.0, 'Heures supplémentaires compensées par repos')
  INTO heure_supplementaires (id_heure_sup, id_emp, nb_heures, type_compensation) VALUES (9, 9, 3.5, 'Heures supplémentaires payées')
  INTO heure_supplementaires (id_heure_sup, id_emp, nb_heures, type_compensation) VALUES (10, 10, 6.0, 'Heures supplémentaires compensées par repos')
  INTO heure_supplementaires (id_heure_sup, id_emp, nb_heures, type_compensation) VALUES (11, 11, 4.0, 'Heures supplémentaires payées')
  INTO heure_supplementaires (id_heure_sup, id_emp, nb_heures, type_compensation) VALUES (12, 12, 3.0, 'Heures supplémentaires compensées par repos')
  INTO heure_supplementaires (id_heure_sup, id_emp, nb_heures, type_compensation) VALUES (13, 13, 2.5, 'Heures supplémentaires payées')
  INTO heure_supplementaires (id_heure_sup, id_emp, nb_heures, type_compensation) VALUES (14, 14, 6.5, 'Heures supplémentaires compensées par repos')
  INTO heure_supplementaires (id_heure_sup, id_emp, nb_heures, type_compensation) VALUES (15, 15, 5.0, 'Heures supplémentaires payées')
  INTO heure_supplementaires (id_heure_sup, id_emp, nb_heures, type_compensation) VALUES (16, 16, 4.5, 'Heures supplémentaires compensées par repos')
  INTO heure_supplementaires (id_heure_sup, id_emp, nb_heures, type_compensation) VALUES (17, 17, 7.0, 'Heures supplémentaires payées')
  INTO heure_supplementaires (id_heure_sup, id_emp, nb_heures, type_compensation) VALUES (18, 18, 5.5, 'Heures supplémentaires compensées par repos')
  INTO heure_supplementaires (id_heure_sup, id_emp, nb_heures, type_compensation) VALUES (19, 19, 4.0, 'Heures supplémentaires payées')
  INTO heure_supplementaires (id_heure_sup, id_emp, nb_heures, type_compensation) VALUES (20, 20, 6.5, 'Heures supplémentaires compensées par repos')
  INTO heure_supplementaires (id_heure_sup, id_emp, nb_heures, type_compensation) VALUES (21, 21, 5.0, 'Heures supplémentaires payées')
  INTO heure_supplementaires (id_heure_sup, id_emp, nb_heures, type_compensation) VALUES (22, 22, 4.5, 'Heures supplémentaires compensées par repos')
  INTO heure_supplementaires (id_heure_sup, id_emp, nb_heures, type_compensation) VALUES (23, 23, 3.5, 'Heures supplémentaires payées')
  INTO heure_supplementaires (id_heure_sup, id_emp, nb_heures, type_compensation) VALUES (24, 24, 2.0, 'Heures supplémentaires compensées par repos')
  INTO heure_supplementaires (id_heure_sup, id_emp, nb_heures, type_compensation) VALUES (25, 25, 3.0, 'Heures supplémentaires payées')
SELECT * FROM dual;
--ghalt
INSERT ALL
    INTO service_supplementaire (id_ser, id_client, service_type, prix, date_presta) VALUES (1, 1, 'Petit Déjeuner', 15.00, TO_DATE('2024-01-01','YYYY-MM-DD'))
    INTO service_supplementaire (id_ser, id_client, service_type, prix, date_presta) VALUES (2, 2, 'Massage', 60.00, TO_DATE('2024-01-02','YYYY-MM-DD'))
    INTO service_supplementaire (id_ser, id_client, service_type, prix, date_presta) VALUES (3, 3, 'Spa', 45.00, TO_DATE('2024-01-03','YYYY-MM-DD'))
    INTO service_supplementaire (id_ser, id_client, service_type, prix, date_presta) VALUES (4, 4, 'Blanchisserie', 20.00, TO_DATE('2024-01-04','YYYY-MM-DD'))
    INTO service_supplementaire (id_ser, id_client, service_type, prix, date_presta) VALUES (5, 5, 'Wi-Fi Premium', 10.00, TO_DATE('2024-01-05','YYYY-MM-DD'))
    INTO service_supplementaire (id_ser, id_client, service_type, prix, date_presta) VALUES (6, 6, 'Parking', 8.00, TO_DATE('2024-01-06','YYYY-MM-DD'))
    INTO service_supplementaire (id_ser, id_client, service_type, prix, date_presta) VALUES (7, 7, 'Room Service', 25.00, TO_DATE('2024-01-07','YYYY-MM-DD'))
    INTO service_supplementaire (id_ser, id_client, service_type, prix, date_presta) VALUES (8, 8, 'Minibar', 18.50, TO_DATE('2024-01-08','YYYY-MM-DD'))
    INTO service_supplementaire (id_ser, id_client, service_type, prix, date_presta) VALUES (9, 9, 'Service Réveil', 5.00, TO_DATE('2024-01-09','YYYY-MM-DD'))
    INTO service_supplementaire (id_ser, id_client, service_type, prix, date_presta) VALUES (10, 10, 'Netflix Premium', 12.00, TO_DATE('2024-01-10','YYYY-MM-DD'))
    INTO service_supplementaire (id_ser, id_client, service_type, prix, date_presta) VALUES (11, 11, 'Petit Déjeuner Deluxe', 20.00, TO_DATE('2024-01-11','YYYY-MM-DD'))
    INTO service_supplementaire (id_ser, id_client, service_type, prix, date_presta) VALUES (12, 12, 'Massage Relax', 70.00, TO_DATE('2024-01-12','YYYY-MM-DD'))
    INTO service_supplementaire (id_ser, id_client, service_type, prix, date_presta) VALUES (13, 13, 'Salle de sport', 10.00, TO_DATE('2024-01-13','YYYY-MM-DD'))
    INTO service_supplementaire (id_ser, id_client, service_type, prix, date_presta) VALUES (14, 14, 'Dîner', 35.00, TO_DATE('2024-01-14','YYYY-MM-DD'))
    INTO service_supplementaire (id_ser, id_client, service_type, prix, date_presta) VALUES (15, 15, 'Cours de yoga', 22.00, TO_DATE('2024-01-15','YYYY-MM-DD'))
    INTO service_supplementaire (id_ser, id_client, service_type, prix, date_presta) VALUES (16, 16, 'Transfert aéroport', 40.00, TO_DATE('2024-01-16','YYYY-MM-DD'))
    INTO service_supplementaire (id_ser, id_client, service_type, prix, date_presta) VALUES (17, 17, 'Chef privé', 90.00, TO_DATE('2024-01-17','YYYY-MM-DD'))
    INTO service_supplementaire (id_ser, id_client, service_type, prix, date_presta) VALUES (18, 18, 'Sauna', 25.00, TO_DATE('2024-01-18','YYYY-MM-DD'))
    INTO service_supplementaire (id_ser, id_client, service_type, prix, date_presta) VALUES (19, 19, 'Cours de natation', 18.00, TO_DATE('2024-01-19','YYYY-MM-DD'))
    INTO service_supplementaire (id_ser, id_client, service_type, prix, date_presta) VALUES (20, 20, 'Jeux Vidéo', 14.00, TO_DATE('2024-01-20','YYYY-MM-DD'))
SELECT 1 FROM dual;

-- ghalt
INSERT ALL
  INTO paiement VALUES (1, 120.50, 'Carte', 'Payé', TO_DATE('2024-01-01','YYYY-MM-DD'))
  INTO paiement VALUES (2, 85.00, 'Espèces', 'Payé', TO_DATE('2024-01-02','YYYY-MM-DD'))
  INTO paiement VALUES (3, 200.00, 'Virement', 'En attente', TO_DATE('2024-01-03','YYYY-MM-DD'))
  INTO paiement VALUES (4, 300.00, 'Carte', 'Payé', TO_DATE('2024-01-04','YYYY-MM-DD'))
  INTO paiement VALUES (5, 450.50, 'Carte', 'Annulé', TO_DATE('2024-01-05','YYYY-MM-DD'))
  INTO paiement VALUES (6, 99.99, 'Paypal', 'Payé', TO_DATE('2024-01-06','YYYY-MM-DD'))
  INTO paiement VALUES (7, 150.75, 'Carte', 'Payé', TO_DATE('2024-01-07','YYYY-MM-DD'))
  INTO paiement VALUES (8, 60.00, 'Espèces', 'En attente', TO_DATE('2024-01-08','YYYY-MM-DD'))
  INTO paiement VALUES (9, 135.25, 'Virement', 'Payé', TO_DATE('2024-01-09','YYYY-MM-DD'))
  INTO paiement VALUES (10, 75.00, 'Carte', 'Payé', TO_DATE('2024-01-10','YYYY-MM-DD'))
  INTO paiement VALUES (11, 190.00, 'Carte', 'Payé', TO_DATE('2024-01-11','YYYY-MM-DD'))
  INTO paiement VALUES (12, 240.00, 'Paypal', 'Payé', TO_DATE('2024-01-12','YYYY-MM-DD'))
  INTO paiement VALUES (13, 310.00, 'Espèces', 'Payé', TO_DATE('2024-01-13','YYYY-MM-DD'))
  INTO paiement VALUES (14, 55.00, 'Carte', 'En attente', TO_DATE('2024-01-14','YYYY-MM-DD'))
  INTO paiement VALUES (15, 105.00, 'Virement', 'Payé', TO_DATE('2024-01-15','YYYY-MM-DD'))
  INTO paiement VALUES (16, 89.00, 'Carte', 'Payé', TO_DATE('2024-01-16','YYYY-MM-DD'))
  INTO paiement VALUES (17, 199.99, 'Carte', 'Payé', TO_DATE('2024-01-17','YYYY-MM-DD'))
  INTO paiement VALUES (18, 123.45, 'Carte', 'Annulé', TO_DATE('2024-01-18','YYYY-MM-DD'))
  INTO paiement VALUES (19, 345.67, 'Carte', 'Payé', TO_DATE('2024-01-19','YYYY-MM-DD'))
  INTO paiement VALUES (20, 222.00, 'Espèces', 'Payé', TO_DATE('2024-01-20','YYYY-MM-DD'))
SELECT 1 FROM DUAL;


INSERT ALL
    INTO facture VALUES (1, TO_DATE('2024-01-01','YYYY-MM-DD'), 150.00, 10.00, 'Petit Déjeuner, Spa')
    INTO facture VALUES (2, TO_DATE('2024-01-02','YYYY-MM-DD'), 200.00, 15.00, 'Massage, Parking')
    INTO facture VALUES (3, TO_DATE('2024-01-03','YYYY-MM-DD'), 180.00, 0.00, 'Room Service')
    INTO facture VALUES (4, TO_DATE('2024-01-04','YYYY-MM-DD'), 90.00, 5.00, 'Wi-Fi Premium')
    INTO facture VALUES (5, TO_DATE('2024-01-05','YYYY-MM-DD'), 300.00, 25.00, 'Minibar, Dîner')
    INTO facture VALUES (6, TO_DATE('2024-01-06','YYYY-MM-DD'), 220.00, 12.00, 'Massage Relax')
    INTO facture VALUES (7, TO_DATE('2024-01-07','YYYY-MM-DD'), 130.00, 5.00, 'Service Réveil')
    INTO facture VALUES (8, TO_DATE('2024-01-08','YYYY-MM-DD'), 250.00, 0.00, 'Chef privé')
    INTO facture VALUES (9, TO_DATE('2024-01-09','YYYY-MM-DD'), 100.00, 10.00, 'Netflix Premium')
    INTO facture VALUES (10, TO_DATE('2024-01-10','YYYY-MM-DD'), 350.00, 20.00, 'Cours de yoga, Sauna')
    INTO facture VALUES (11, TO_DATE('2024-01-11','YYYY-MM-DD'), 110.00, 5.00, 'Blanchisserie')
    INTO facture VALUES (12, TO_DATE('2024-01-12','YYYY-MM-DD'), 160.00, 10.00, 'Massage')
    INTO facture VALUES (13, TO_DATE('2024-01-13','YYYY-MM-DD'), 190.00, 15.00, 'Service Réveil, Parking')
    INTO facture VALUES (14, TO_DATE('2024-01-14','YYYY-MM-DD'), 210.00, 0.00, 'Wi-Fi Premium')
    INTO facture VALUES (15, TO_DATE('2024-01-15','YYYY-MM-DD'), 175.00, 20.00, 'Spa, Massage')
    INTO facture VALUES (16, TO_DATE('2024-01-16','YYYY-MM-DD'), 280.00, 10.00, 'Cours de natation')
    INTO facture VALUES (17, TO_DATE('2024-01-17','YYYY-MM-DD'), 320.00, 30.00, 'Transfert aéroport')
    INTO facture VALUES (18, TO_DATE('2024-01-18','YYYY-MM-DD'), 90.00, 0.00, 'Petit Déjeuner Deluxe')
    INTO facture VALUES (19, TO_DATE('2024-01-19','YYYY-MM-DD'), 250.00, 20.00, 'Room Service')
    INTO facture VALUES (20, TO_DATE('2024-01-20','YYYY-MM-DD'), 310.00, 15.00, 'Netflix Premium, Spa')
SELECT 1 FROM dual;


INSERT ALL
    INTO chambre VALUES (101, 'Simple', 1, 50.00, 'Disponible', 'TV, Wi-Fi')
    INTO chambre VALUES (102, 'Double', 2, 80.00, 'Occupée', 'TV, Wi-Fi, Clim')
    INTO chambre VALUES (103, 'Suite', 4, 150.00, 'Disponible', 'Jacuzzi, TV, Wi-Fi')
    INTO chambre VALUES (104, 'Deluxe', 3, 120.00, 'Réservée', 'Clim, TV, Wi-Fi')
    INTO chambre VALUES (105, 'Simple', 1, 45.00, 'Disponible', 'TV')
    INTO chambre VALUES (106, 'Double', 2, 85.00, 'Disponible', 'TV, Wi-Fi, MiniBar')
    INTO chambre VALUES (107, 'Triple', 3, 100.00, 'Occupée', 'TV, Wi-Fi')
    INTO chambre VALUES (108, 'Suite', 4, 160.00, 'Disponible', 'Jacuzzi, TV, Clim')
    INTO chambre VALUES (109, 'Simple', 1, 55.00, 'Disponible', 'TV, Wi-Fi')
    INTO chambre VALUES (110, 'Double', 2, 75.00, 'Disponible', 'TV, Wi-Fi')
SELECT 1 FROM dual;

INSERT ALL
    INTO employeee VALUES (500, 'Durand', 'Paul', 'Femme de chambre', 'paul.durand@hotel.com', '0600000001', 'Rue A, Paris')
    INTO employeee VALUES (501, 'Lemoine', 'Claire', 'Réceptionniste', 'claire.lemoine@hotel.com', '0600000002', 'Rue B, Paris')
    INTO employeee VALUES (502, 'Martin', 'Luc', 'Serveur', 'luc.martin@hotel.com', '0600000003', 'Rue C, Lyon')
    INTO employeee VALUES (503, 'Bernard', 'Chloé', 'Chef', 'chloe.bernard@hotel.com', '0600000004', 'Rue D, Lyon')
    INTO employeee VALUES (504, 'Morel', 'Max', 'Sécurité', 'max.morel@hotel.com', '0600000005', 'Rue E, Marseille')
    INTO employeee VALUES (505, 'Petit', 'Anna', 'Manager', 'anna.petit@hotel.com', '0600000006', 'Rue F, Nice')
    INTO employeee VALUES (506, 'Garcia', 'Leo', 'Femme de chambre', 'leo.garcia@hotel.com', '0600000007', 'Rue G, Bordeaux')
    INTO employeee VALUES (507, 'Roux', 'Sophie', 'Réceptionniste', 'sophie.roux@hotel.com', '0600000008', 'Rue H, Toulouse')
    INTO employeee VALUES (508, 'Lambert', 'Hugo', 'Serveur', 'hugo.lambert@hotel.com', '0600000009', 'Rue I, Strasbourg')
    INTO employeee VALUES (509, 'Fournier', 'Emma', 'Chef', 'emma.fournier@hotel.com', '0600000010', 'Rue J, Nantes')
SELECT 1 FROM dual;

 

INSERT ALL
    INTO preparer VALUES (1, 101)
    INTO preparer VALUES (2, 102)
    INTO preparer VALUES (3, 103)
    INTO preparer VALUES (4, 104)
    INTO preparer VALUES (5, 105)
    INTO preparer VALUES (1, 106)
    INTO preparer VALUES (2, 107)
    INTO preparer VALUES (3, 108)
    INTO preparer VALUES (4, 109)
    INTO preparer VALUES (5, 110)
    INTO preparer VALUES (6, 101)
    INTO preparer VALUES (7, 102)
    INTO preparer VALUES (8, 103)
    INTO preparer VALUES (9, 104)
    INTO preparer VALUES (10, 105)
SELECT 1 FROM dual;

 

INSERT ALL
  INTO generer VALUES (1, 1)
  INTO generer VALUES (2, 2)
  INTO generer VALUES (3, 3)
  INTO generer VALUES (4, 4)
  INTO generer VALUES (5, 5)
  INTO generer VALUES (6, 6)
  INTO generer VALUES (7, 7)
  INTO generer VALUES (8, 8)
  INTO generer VALUES (9, 9)
  INTO generer VALUES (10, 10)
  INTO generer VALUES (11, 11)
  INTO generer VALUES (12, 12)
  INTO generer VALUES (13, 13)
  INTO generer VALUES (14, 14)
  INTO generer VALUES (15, 15)
  INTO generer VALUES (16, 16)
  INTO generer VALUES (17, 17)
  INTO generer VALUES (18, 18)
  INTO generer VALUES (19, 19)
  INTO generer VALUES (20, 20)
SELECT 1 FROM DUAL;
INSERT ALL
  INTO reservation1 VALUES (1, 1, 1, TO_DATE('2025-06-01','YYYY-MM-DD'), TO_DATE('2025-08-14','YYYY-MM-DD'), 'confirmée', 'Vue sur mer')
  INTO reservation1 VALUES (2, 1, 102, TO_DATE('2025-06-10','YYYY-MM-DD'), TO_DATE('2025-06-15','YYYY-MM-DD'), 'annulée', 'Lit bébé')
  INTO reservation1 VALUES (3, 1, 103, TO_DATE('2025-07-01','YYYY-MM-DD'), TO_DATE('2025-07-10','YYYY-MM-DD'), 'confirmée', '')
  INTO reservation1 VALUES (4, 1, 104, TO_DATE('2025-08-01','YYYY-MM-DD'), TO_DATE('2025-08-07','YYYY-MM-DD'), 'en attente', '')
  INTO reservation1 VALUES (5, 1, 105, TO_DATE('2025-09-05','YYYY-MM-DD'), TO_DATE('2025-09-10','YYYY-MM-DD'), 'check-in', 'Allergie au gluten')
  INTO reservation1 VALUES (6, 1, 106, TO_DATE('2025-07-15','YYYY-MM-DD'), TO_DATE('2025-07-20','YYYY-MM-DD'), 'check-out', '')
  INTO reservation1 VALUES (7, 7, 107, TO_DATE('2024-10-01','YYYY-MM-DD'), TO_DATE('2024-10-04','YYYY-MM-DD'), 'confirmée', '')
  INTO reservation1 VALUES (8, 8, 108, TO_DATE('2024-10-10','YYYY-MM-DD'), TO_DATE('2024-10-12','YYYY-MM-DD'), 'en attente', '')
  INTO reservation1 VALUES (9, 9, 109, TO_DATE('2024-11-15','YYYY-MM-DD'), TO_DATE('2024-11-20','YYYY-MM-DD'), 'confirmée', 'Fauteuil roulant')
  INTO reservation1 VALUES (10, 10, 110, TO_DATE('2024-12-01','YYYY-MM-DD'), TO_DATE('2024-12-10','YYYY-MM-DD'), 'confirmée', '')

  INTO reservation1 VALUES (11, 11, 101, TO_DATE('2024-12-15','YYYY-MM-DD'), TO_DATE('2024-12-20','YYYY-MM-DD'), 'annulée', '')
  INTO reservation1 VALUES (12, 12, 102, TO_DATE('2025-01-05','YYYY-MM-DD'), TO_DATE('2025-01-10','YYYY-MM-DD'), 'confirmée', 'Petit déjeuner végan')
  INTO reservation1 VALUES (13, 13, 103, TO_DATE('2025-02-01','YYYY-MM-DD'), TO_DATE('2025-02-06','YYYY-MM-DD'), 'check-in', '')
  INTO reservation1 VALUES (14, 14, 104, TO_DATE('2025-03-01','YYYY-MM-DD'), TO_DATE('2025-03-07','YYYY-MM-DD'), 'confirmée', '')
  INTO reservation1 VALUES (15, 15, 105, TO_DATE('2025-04-10','YYYY-MM-DD'), TO_DATE('2025-04-15','YYYY-MM-DD'), 'en attente', 'Fleurs dans la chambre')
  INTO reservation1 VALUES (16, 16, 106, TO_DATE('2025-05-01','YYYY-MM-DD'), TO_DATE('2025-05-05','YYYY-MM-DD'), 'confirmée', '')
  INTO reservation1 VALUES (17, 17, 107, TO_DATE('2025-05-10','YYYY-MM-DD'), TO_DATE('2025-05-15','YYYY-MM-DD'), 'annulée', '')
  INTO reservation1 VALUES (18, 18, 108, TO_DATE('2025-06-01','YYYY-MM-DD'), TO_DATE('2025-06-10','YYYY-MM-DD'), 'confirmée', 'Lit king size')
  INTO reservation1 VALUES (19, 19, 109, TO_DATE('2025-06-15','YYYY-MM-DD'), TO_DATE('2025-06-20','YYYY-MM-DD'), 'en attente', '')
  INTO reservation1 VALUES (20, 20, 110, TO_DATE('2025-07-01','YYYY-MM-DD'), TO_DATE('2025-07-05','YYYY-MM-DD'), 'confirmée', '')

  INTO reservation1 VALUES (21, 1, 101, TO_DATE('2025-07-10','YYYY-MM-DD'), TO_DATE('2025-07-15','YYYY-MM-DD'), 'check-out', '')
  INTO reservation1 VALUES (22, 2, 102, TO_DATE('2025-08-01','YYYY-MM-DD'), TO_DATE('2025-08-05','YYYY-MM-DD'), 'confirmée', 'Accès PMR')
  INTO reservation1 VALUES (23, 3, 103, TO_DATE('2025-08-10','YYYY-MM-DD'), TO_DATE('2025-08-15','YYYY-MM-DD'), 'annulée', '')
  INTO reservation1 VALUES (24, 4, 9, TO_DATE('2025-03-20','YYYY-MM-DD'), TO_DATE('2025-05-14','YYYY-MM-DD'), 'confirmée', '')
  INTO reservation1 VALUES (25, 5, 105, TO_DATE('2025-09-01','YYYY-MM-DD'), TO_DATE('2025-09-05','YYYY-MM-DD'), 'en attente', '')
  INTO reservation1 VALUES (26, 6, 106, TO_DATE('2025-09-10','YYYY-MM-DD'), TO_DATE('2025-09-15','YYYY-MM-DD'), 'check-in', '')
  INTO reservation1 VALUES (27, 7, 107, TO_DATE('2025-10-01','YYYY-MM-DD'), TO_DATE('2025-10-05','YYYY-MM-DD'), 'confirmée', '')
  INTO reservation1 VALUES (28, 8, 108, TO_DATE('2025-10-10','YYYY-MM-DD'), TO_DATE('2025-10-15','YYYY-MM-DD'), 'confirmée', '')
  INTO reservation1 VALUES (29, 9, 109, TO_DATE('2025-11-01','YYYY-MM-DD'), TO_DATE('2025-11-05','YYYY-MM-DD'), 'en attente', '')
  INTO reservation1 VALUES (30, 10, 110, TO_DATE('2025-11-10','YYYY-MM-DD'), TO_DATE('2025-11-15','YYYY-MM-DD'), 'annulée', 'Repas sans arachides')

  INTO reservation1 VALUES (31, 11, 101, TO_DATE('2025-12-01','YYYY-MM-DD'), TO_DATE('2025-12-05','YYYY-MM-DD'), 'confirmée', '')
  INTO reservation1 VALUES (32, 12, 102, TO_DATE('2025-12-10','YYYY-MM-DD'), TO_DATE('2025-12-15','YYYY-MM-DD'), 'confirmée', 'Vue panoramique')
  INTO reservation1 VALUES (33, 13, 103, TO_DATE('2025-12-20','YYYY-MM-DD'), TO_DATE('2025-12-25','YYYY-MM-DD'), 'check-in', '')
  INTO reservation1 VALUES (34, 14, 104, TO_DATE('2026-01-01','YYYY-MM-DD'), TO_DATE('2026-01-07','YYYY-MM-DD'), 'en attente', '')
  INTO reservation1 VALUES (35, 15, 105, TO_DATE('2026-01-10','YYYY-MM-DD'), TO_DATE('2026-01-15','YYYY-MM-DD'), 'confirmée', '')
  INTO reservation1 VALUES (36, 16, 106, TO_DATE('2026-02-01','YYYY-MM-DD'), TO_DATE('2026-02-05','YYYY-MM-DD'), 'annulée', '')
  INTO reservation1 VALUES (37, 17, 107, TO_DATE('2025-04-10','YYYY-MM-DD'), TO_DATE('2025-08-15','YYYY-MM-DD'), 'confirmée', '')
  INTO reservation1 VALUES (38, 18, 108, TO_DATE('2026-03-01','YYYY-MM-DD'), TO_DATE('2026-03-05','YYYY-MM-DD'), 'confirmée', '')
  INTO reservation1 VALUES (39, 19, 109, TO_DATE('2026-03-10','YYYY-MM-DD'), TO_DATE('2026-03-15','YYYY-MM-DD'), 'en attente', '')
  INTO reservation1 VALUES (40, 20, 110, TO_DATE('2026-04-01','YYYY-MM-DD'), TO_DATE('2025-05-13','YYYY-MM-DD'), 'check-out', 'Chambre silencieuse')

  INTO reservation1 VALUES (41, 1, 101, TO_DATE('2026-04-10','YYYY-MM-DD'), TO_DATE('2025-05-13','YYYY-MM-DD'), 'confirmée', '')
  INTO reservation1 VALUES (42, 2, 102, TO_DATE('2026-05-01','YYYY-MM-DD'), TO_DATE('2026-05-05','YYYY-MM-DD'), 'en attente', '')
  INTO reservation1 VALUES (43, 3, 103, TO_DATE('2026-05-10','YYYY-MM-DD'), TO_DATE('2026-05-15','YYYY-MM-DD'), 'confirmée', '')
  INTO reservation1 VALUES (44, 4, 104, TO_DATE('2026-06-01','YYYY-MM-DD'), TO_DATE('2026-06-05','YYYY-MM-DD'), 'annulée', '')
  INTO reservation1 VALUES (45, 5, 105, TO_DATE('2026-06-10','YYYY-MM-DD'), TO_DATE('2026-06-15','YYYY-MM-DD'), 'confirmée', '')
  INTO reservation1 VALUES (46, 6, 106, TO_DATE('2026-07-01','YYYY-MM-DD'), TO_DATE('2026-07-05','YYYY-MM-DD'), 'check-in', '')
  INTO reservation1 VALUES (47, 7, 107, TO_DATE('2026-07-10','YYYY-MM-DD'), TO_DATE('2025-05-13','YYYY-MM-DD'), 'confirmée', '')
  INTO reservation1 VALUES (48, 8, 108, TO_DATE('2026-08-01','YYYY-MM-DD'), TO_DATE('2026-08-05','YYYY-MM-DD'), 'en attente', '')
  INTO reservation1 VALUES (49, 9, 109, TO_DATE('2026-08-10','YYYY-MM-DD'), TO_DATE('2026-08-15','YYYY-MM-DD'), 'annulée', '')
  INTO reservation1 VALUES (50, 10, 110, TO_DATE('2025-05-01','YYYY-MM-DD'), TO_DATE('2025-05-14','YYYY-MM-DD'), 'confirmée', '')
SELECT * FROM dual;

INSERT ALL
  INTO absence (id_ab, id_emp, date_debut, date_fin, justification, statut) VALUES (1, 3, TO_DATE('2023-01-10', 'YYYY-MM-DD'), TO_DATE('2023-01-12', 'YYYY-MM-DD'), 'Grippe avec certificat médical', 'Approuvé')
  INTO absence (id_ab, id_emp, date_debut, date_fin, justification, statut) VALUES (2, 7, TO_DATE('2023-02-15', 'YYYY-MM-DD'), TO_DATE('2023-02-16', 'YYYY-MM-DD'), 'Formation professionnelle', 'Approuvé')
  INTO absence (id_ab, id_emp, date_debut, date_fin, justification, statut) VALUES (3, 12, TO_DATE('2023-03-05', 'YYYY-MM-DD'), TO_DATE('2023-03-08', 'YYYY-MM-DD'), 'Problèmes familiaux', 'En attente')
  INTO absence (id_ab, id_emp, date_debut, date_fin, justification, statut) VALUES (4, 5, TO_DATE('2023-04-20', 'YYYY-MM-DD'), TO_DATE('2023-04-21', 'YYYY-MM-DD'), 'Congé sans solde', 'Approuvé')
  INTO absence (id_ab, id_emp, date_debut, date_fin, justification, statut) VALUES (5, 9, TO_DATE('2023-05-12', 'YYYY-MM-DD'), TO_DATE('2023-05-15', 'YYYY-MM-DD'), 'Maladie sans certificat', 'Rejeté')
  INTO absence (id_ab, id_emp, date_debut, date_fin, justification, statut) VALUES (6, 14, TO_DATE('2023-06-01', 'YYYY-MM-DD'), TO_DATE('2023-06-10', 'YYYY-MM-DD'), 'Congé annuel', 'Approuvé')
  INTO absence (id_ab, id_emp, date_debut, date_fin, justification, statut) VALUES (7, 2, TO_DATE('2023-07-07', 'YYYY-MM-DD'), TO_DATE('2023-07-07', 'YYYY-MM-DD'), 'Rendez-vous médical', 'Approuvé')
  INTO absence (id_ab, id_emp, date_debut, date_fin, justification, statut) VALUES (8, 19, TO_DATE('2023-08-22', 'YYYY-MM-DD'), TO_DATE('2023-08-25', 'YYYY-MM-DD'), 'Problèmes techniques à domicile', 'En attente')
  INTO absence (id_ab, id_emp, date_debut, date_fin, justification, statut) VALUES (9, 21, TO_DATE('2023-09-14', 'YYYY-MM-DD'), TO_DATE('2023-09-14', 'YYYY-MM-DD'), 'Absence non justifiée', 'Rejeté')
  INTO absence (id_ab, id_emp, date_debut, date_fin, justification, statut) VALUES (10, 25, TO_DATE('2023-10-30', 'YYYY-MM-DD'), TO_DATE('2023-11-02', 'YYYY-MM-DD'), 'Mariage d''un frère', 'Approuvé')
  INTO absence (id_ab, id_emp, date_debut, date_fin, justification, statut) VALUES (11, 8, TO_DATE('2023-11-15', 'YYYY-MM-DD'), TO_DATE('2023-11-16', 'YYYY-MM-DD'), 'Congé de maternité', 'Approuvé')
  INTO absence (id_ab, id_emp, date_debut, date_fin, justification, statut) VALUES (12, 17, TO_DATE('2023-12-05', 'YYYY-MM-DD'), TO_DATE('2023-12-06', 'YYYY-MM-DD'), 'Formation pâtisserie', 'Approuvé')
  INTO absence (id_ab, id_emp, date_debut, date_fin, justification, statut) VALUES (13, 4, TO_DATE('2024-01-18', 'YYYY-MM-DD'), TO_DATE('2024-01-20', 'YYYY-MM-DD'), 'Problèmes de transport', 'En attente')
  INTO absence (id_ab, id_emp, date_debut, date_fin, justification, statut) VALUES (14, 10, TO_DATE('2024-02-22', 'YYYY-MM-DD'), TO_DATE('2024-02-23', 'YYYY-MM-DD'), 'Congé maladie', 'Approuvé')
  INTO absence (id_ab, id_emp, date_debut, date_fin, justification, statut) VALUES (15, 27, TO_DATE('2024-03-10', 'YYYY-MM-DD'), TO_DATE('2024-03-12', 'YYYY-MM-DD'), 'Décès dans la famille', 'Approuvé')
SELECT * FROM dual;


INSERT INTO retard (id_retard, id_emp, date_retard, heure_arrivee, justification) VALUES (1, 1, TO_DATE('2025-05-05', 'YYYY-MM-DD'), TO_DATE('2025-05-05 08:45', 'YYYY-MM-DD HH24:MI'), 'Trafic intense');
INSERT INTO retard (id_retard, id_emp, date_retard, heure_arrivee, justification) VALUES (2, 3, TO_DATE('2025-05-03', 'YYYY-MM-DD'), TO_DATE('2025-05-03 09:15', 'YYYY-MM-DD HH24:MI'), 'Panne de voiture');
INSERT INTO retard (id_retard, id_emp, date_retard, heure_arrivee, justification) VALUES (3, 5, TO_DATE('2025-05-02', 'YYYY-MM-DD'), TO_DATE('2025-05-02 08:50', 'YYYY-MM-DD HH24:MI'), 'Sans justification');
INSERT INTO retard (id_retard, id_emp, date_retard, heure_arrivee, justification) VALUES (4, 7, TO_DATE('2025-05-01', 'YYYY-MM-DD'), TO_DATE('2025-05-01 09:05', 'YYYY-MM-DD HH24:MI'), 'Problème de transport');
INSERT INTO retard (id_retard, id_emp, date_retard, heure_arrivee, justification) VALUES (5, 9, TO_DATE('2025-05-06', 'YYYY-MM-DD'), TO_DATE('2025-05-06 08:55', 'YYYY-MM-DD HH24:MI'), 'Retard de train');
INSERT INTO retard (id_retard, id_emp, date_retard, heure_arrivee, justification) VALUES (6, 11, TO_DATE('2025-05-07', 'YYYY-MM-DD'), TO_DATE('2025-05-07 09:10', 'YYYY-MM-DD HH24:MI'), NULL);
INSERT INTO retard (id_retard, id_emp, date_retard, heure_arrivee, justification) VALUES (7, 13, TO_DATE('2025-05-08', 'YYYY-MM-DD'), TO_DATE('2025-05-08 09:00', 'YYYY-MM-DD HH24:MI'), 'Problème familial');
INSERT INTO retard (id_retard, id_emp, date_retard, heure_arrivee, justification) VALUES (8, 15, TO_DATE('2025-05-09', 'YYYY-MM-DD'), TO_DATE('2025-05-09 09:30', 'YYYY-MM-DD HH24:MI'), 'Maladie');
INSERT INTO retard (id_retard, id_emp, date_retard, heure_arrivee, justification) VALUES (9, 17, TO_DATE('2025-05-10', 'YYYY-MM-DD'), TO_DATE('2025-05-10 08:40', 'YYYY-MM-DD HH24:MI'), 'Circulation bloquée');
INSERT INTO retard (id_retard, id_emp, date_retard, heure_arrivee, justification) VALUES (10, 19, TO_DATE('2025-05-11', 'YYYY-MM-DD'), TO_DATE('2025-05-11 09:20', 'YYYY-MM-DD HH24:MI'), 'Accident sur la route');
INSERT INTO retard (id_retard, id_emp, date_retard, heure_arrivee, justification) VALUES (11, 21, TO_DATE('2025-05-12', 'YYYY-MM-DD'), TO_DATE('2025-05-12 09:05', 'YYYY-MM-DD HH24:MI'), NULL);
INSERT INTO retard (id_retard, id_emp, date_retard, heure_arrivee, justification) VALUES (12, 23, TO_DATE('2025-05-13', 'YYYY-MM-DD'), TO_DATE('2025-05-13 09:00', 'YYYY-MM-DD HH24:MI'), 'Difficultés personnelles');
INSERT INTO retard (id_retard, id_emp, date_retard, heure_arrivee, justification) VALUES (13, 25, TO_DATE('2025-05-14', 'YYYY-MM-DD'), TO_DATE('2025-05-14 09:10', 'YYYY-MM-DD HH24:MI'), 'Panne mécanique');
INSERT INTO retard (id_retard, id_emp, date_retard, heure_arrivee, justification) VALUES (14, 27, TO_DATE('2025-05-15', 'YYYY-MM-DD'), TO_DATE('2025-05-15 08:50', 'YYYY-MM-DD HH24:MI'), 'Embouteillage');
INSERT INTO retard (id_retard, id_emp, date_retard, heure_arrivee, justification) VALUES (15, 29, TO_DATE('2025-05-16', 'YYYY-MM-DD'), TO_DATE('2025-05-16 09:25', 'YYYY-MM-DD HH24:MI'), 'Bus en panne');

COMMIT;

