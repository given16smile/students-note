-- Création d'une table temporaire pour stocker les noms et prénoms français
CREATE TEMP TABLE temp_noms (
    nom VARCHAR(100),
    prenom VARCHAR(50)
);

-- Insérer 20 noms et prénoms français pour générer les données
INSERT INTO temp_noms (nom, prenom)
VALUES 
('Boulanger', 'Louis'),
('Dufresne', 'Caroline'),
('Garnier', 'Pierre'),
('Marchand', 'Sophie'),
('Lemoine', 'Lucie'),
('Sanchez', 'Marc'),
('Dumont', 'Valérie'),
('Fournier', 'Julien'),
('Clement', 'Marion'),
('Lemoine', 'Henri'),
('Vidal', 'Pauline'),
('Souris', 'Frédéric'),
('Robert', 'Camille'),
('Paquet', 'Georges'),
('Lemoine', 'Paul'),
('Arnaud', 'Estelle'),
('Pires', 'Lucien'),
('Tanguy', 'Viviane'),
('Bernier', 'Bastien'),
('Lemoine', 'Geneviève'),
('Fournier', 'David'),
('Clément', 'Catherine'),
('Gosse', 'Thierry'),
('Lemoine', 'Michel'),
('De La Rue', 'Lina'),
('Gauthier', 'Jean-Pierre'),
('Dupuis', 'Estelle'),
('Garnier', 'Juliette'),
('Simard', 'Pierre'),
('Deville', 'Mathilde'),
('Blanc', 'Frédéric'),
('Picard', 'Léa'),
('Gérard', 'Michel'),
('Besson', 'Luc'),
('Dumas', 'Florence'),
('Durand', 'Guillaume'),
('Benoit', 'Marie-Lou'),
('Nicolas', 'Daniel'),
('Perrot', 'Caroline'),
('Chauvin', 'Manuel'),
('Vasseur', 'Olivia'),
('Martin', 'Nadine'),
('Bertrand', 'Alain'),
('Chauvin', 'Sophie'),
('Meunier', 'Mélissa'),
('Lemoine', 'Christophe'),
('Robert', 'Damien'),
('Marques', 'Thierry'),
('Laurent', 'Françoise'),
('De La Rue', 'Raphaël'),
('Durand', 'Jean'),
('Martin', 'Marie'),
('Bernard', 'Lucie'),
('Petit', 'Paul'),
('Robert', 'Sophie'),
('Richard', 'Antoine'),
('Dubois', 'Claire'),
('Moreau', 'Julien'),
('Laurent', 'Emilie'),
('Simon', 'Charles'),
('Girard', 'Hélène'),
('Lemoine', 'Nicolas'),
('Garcia', 'Camille'),
('Rousseau', 'Alexandre'),
('Blanc', 'Chloé'),
('Henry', 'Mathieu'),
('Perrin', 'Isabelle'),
('Gauthier', 'Thomas'),
('Fontaine', 'Elise'),
('Chevalier', 'Alice');

-- Générer 100 000 étudiants avec des données aléatoires
DO $$
DECLARE 
    i INTEGER;
    random_nom VARCHAR(100);
    random_prenom VARCHAR(50);
    random_date DATE;
BEGIN
    -- Boucle pour insérer 500 000 étudiants
    FOR i IN 1..100000 LOOP
        -- Sélectionner un nom et un prénom aléatoire de la table temp_noms
        SELECT nom, prenom 
        INTO random_nom, random_prenom
        FROM temp_noms
        OFFSET floor(random() * 70) LIMIT 1;  -- 70 correspond au nombre de noms et prénoms dans temp_noms (20 + 50 supplémentaires)

        -- Générer une date de naissance aléatoire entre 1990 et 2005
        random_date := DATE '1990-01-01' + (random() * 5844)::INTEGER;

        -- Insérer dans la table Etudiant
        INSERT INTO Etudiant (ETU, nom, prenom, naissance)
        VALUES (
            'ETU' || LPAD(i::TEXT, 7, '0'),  -- Génération d'un identifiant unique (ETU00001, ETU00002, etc.)
            random_nom,
            random_prenom,
            random_date
        );
    END LOOP;
END $$;



select count(*)  FROM Etudiant LIMIT 20;
