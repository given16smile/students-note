-- Insérer les options
INSERT INTO Options (idOptions, designation)
VALUES 
('INFO_DEV', 'Informatique Développement'),
('DESIGN', 'Design');


-- Insérer les semestres 1 à 10
DO $$
DECLARE
    i INTEGER;
BEGIN
    FOR i IN 1..10 LOOP
        INSERT INTO Semestre (libelle)
        VALUES ('Semestre ' || i);
    END LOOP;
END $$;

select * from semestre s ;

-- Insérer les matières du semestre 1
INSERT INTO Matieres (code, libelle, credits, idOptions, idSemestre)
VALUES 
('MTH102', 'Analyse mathématique', 4, 'INFO_DEV', 1),
('INF107', 'Informatique de Base', 3, 'INFO_DEV', 1),
('ORG101', 'Techniques de communication', 2, 'INFO_DEV', 1),
('INF101', 'Programmation procédurale', 4, 'INFO_DEV', 1),
('MTH101', 'Arithmétique et nombres', 3, 'INFO_DEV', 1),
('INF104', 'HTML et Introduction au Web', 3, 'INFO_DEV', 1);

-- Insérer les matières du semestre 2
INSERT INTO Matieres (code, libelle, credits, idOptions, idSemestre)
VALUES 
('INF105', 'Maintenance matériel et logiciel', 3, 'INFO_DEV', 2),
('INF102', 'Bases de données relationnelles', 4, 'INFO_DEV', 2),
('MTH103', 'Calcul Vectoriel et Matriciel', 3, 'INFO_DEV', 2),
('INF103', 'Bases administration système', 3, 'INFO_DEV', 2),
('INF106', 'Compléments de programmation', 4, 'INFO_DEV', 2),
('MTH105', 'Probabilité et Statistique', 3, 'INFO_DEV', 2);

select * from matieres m ;


