CREATE DATABASE your_car_your_way_app;

USE your_car_your_way_app;

DROP TABLE IF EXISTS `UTILISATEUR`;
CREATE TABLE `UTILISATEUR` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nom` VARCHAR(40),
  `prenom` VARCHAR(40),
  `date_de_naissance` DATE,
  `permis_de_conduire` VARCHAR(40),
  `date_delivrance_permis` DATE,
  `email` VARCHAR(255),
  `mot_de_passe` VARCHAR(255),
  `adresse_id` INT NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS `ADRESSE`;
CREATE TABLE `ADRESSE` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `adresse` VARCHAR(255),
  `code_postale` INT (11),
  `ville` VARCHAR(255)
);

DROP TABLE IF EXISTS `AGENCE_LOCATION`;
CREATE TABLE `AGENCE_LOCATION` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nom_agence` VARCHAR(50),
  `adresse_id` INT NOT NULL
);

DROP TABLE IF EXISTS `OFFRE_LOCATION`;
CREATE TABLE `OFFRE_LOCATION` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `ville_depart` VARCHAR(200),
  `ville_arrivee` VARCHAR(200),
  `date_depart` DATETIME,
  `date_arrivee` DATETIME,
  `categorie_vehicule_id` INT NOT NULL,
  `agence_location_id` INT NOT NULL,
  `tarif` FLOAT(2),
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);

DROP TABLE IF EXISTS `CATEGORIE_VEHICULE`;
CREATE TABLE `CATEGORIE_VEHICULE` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `nom_categorie` VARCHAR(50)
);

DROP TABLE IF EXISTS `VEHICULE`;
CREATE TABLE `VEHICULE` (
  id INT PRIMARY KEY AUTO_INCREMENT,
  `marque` VARCHAR(200),
  `modele` VARCHAR(200),
  `immatriculation` VARCHAR(40),
  `kilometrage` LONG,
  `type` VARCHAR(40),
  `conduite` VARCHAR(40),
  `carburant` VARCHAR(40),
  `categorie_vehicule_id` INT NOT NULL
);

DROP TABLE IF EXISTS `RESERVATION`;
CREATE TABLE `RESERVATION` (
  `id` INT PRIMARY KEY AUTO_INCREMENT,
  `date_enregistrement` DATETIME,
  `utilisateur_id` INT NOT NULL,
  `offre_location_id` INT NOT NULL,
  `created_at` TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
  `updated_at` DATETIME DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
);


ALTER TABLE `RESERVATION` ADD FOREIGN KEY (`utilisateur_id`) REFERENCES `UTILISATEUR` (`id`);
ALTER TABLE `RESERVATION` ADD FOREIGN KEY (`offre_location_id`) REFERENCES `OFFRE_LOCATION` (`id`);
ALTER TABLE `VEHICULE` ADD FOREIGN KEY (`categorie_vehicule_id`) REFERENCES `CATEGORIE_VEHICULE` (`id`);
ALTER TABLE `OFFRE_LOCATION` ADD FOREIGN KEY (`categorie_vehicule_id`) REFERENCES `CATEGORIE_VEHICULE` (`id`);
ALTER TABLE `OFFRE_LOCATION` ADD FOREIGN KEY (`agence_location_id`) REFERENCES `AGENCE_LOCATION` (`id`);
ALTER TABLE `AGENCE_LOCATION` ADD FOREIGN KEY (`adresse_id`) REFERENCES `ADRESSE` (`id`);
ALTER TABLE `UTILISATEUR` ADD FOREIGN KEY (`adresse_id`) REFERENCES `ADRESSE` (`id`);
