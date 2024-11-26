DO $$
DECLARE
    etu_id VARCHAR(50);        -- Identifiant de l'étudiant
    matiere_id INTEGER;        -- Identifiant de la matière
    random_note NUMERIC(4,2);  -- Note aléatoire entre 0.00 et 20.00
    date_sem1 DATE := DATE '2023-01-15'; -- Date unique pour le semestre 1 (modifiable)
    date_sem2 DATE := DATE '2024-01-15'; -- Date unique pour le semestre 2 (modifiable)
BEGIN
    -- Boucle pour parcourir tous les étudiants
    FOR etu_id IN 
        SELECT 'ETU' || LPAD(generate_series(1, 100000)::TEXT, 7, '0')
    LOOP
        -- Insertion des notes pour les matières du semestre 1
        FOR matiere_id IN 
            SELECT idMatiere FROM Matieres WHERE idSemestre = 1
        LOOP
            -- Générer une note aléatoire entre 0.00 et 20.00
            random_note := round((random() * 20)::numeric, 2);

            -- Insérer dans la table resultat
            INSERT INTO resultat (ETU, idMatiere, notes, dateSession)
            VALUES (etu_id, matiere_id, random_note, date_sem1);
        END LOOP;

        -- Insertion des notes pour les matières du semestre 2
        FOR matiere_id IN 
            SELECT idMatiere FROM Matieres WHERE idSemestre = 2
        LOOP
            -- Générer une note aléatoire entre 0.00 et 20.00
            random_note := round((random() * 20)::numeric, 2);

            -- Insérer dans la table resultat
            INSERT INTO resultat (ETU, idMatiere, notes, dateSession)
            VALUES (etu_id, matiere_id, random_note, date_sem2);
        END LOOP;
    END LOOP;
END $$;

select * from resultat r where r.etu='ETU0000001' ; 