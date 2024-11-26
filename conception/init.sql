-- Désactiver temporairement les contraintes de clés étrangères
ALTER TABLE Matieres DROP CONSTRAINT IF EXISTS matieres_idoption_fkey;
ALTER TABLE Matieres DROP CONSTRAINT IF EXISTS matieres_idsemestre_fkey;
ALTER TABLE Inscription DROP CONSTRAINT IF EXISTS inscription_etu_fkey;
ALTER TABLE Inscription DROP CONSTRAINT IF EXISTS inscription_idoption_fkey;
ALTER TABLE Inscription DROP CONSTRAINT IF EXISTS inscription_idsemestre_fkey;
ALTER TABLE resultat DROP CONSTRAINT IF EXISTS resultat_etu_fkey;
ALTER TABLE resultat DROP CONSTRAINT IF EXISTS resultat_idmatiere_fkey;

-- Supprimer les tables dans l'ordre inverse de leurs dépendances
DROP TABLE IF EXISTS resultat CASCADE;
DROP TABLE IF EXISTS Inscription CASCADE;
DROP TABLE IF EXISTS Matieres CASCADE;
DROP TABLE IF EXISTS Semestre CASCADE;
DROP TABLE IF EXISTS Options CASCADE;
DROP TABLE IF EXISTS Etudiant CASCADE;

-- Réinitialiser les séquences des colonnes SERIAL
DO $$
DECLARE
    seq RECORD;
BEGIN
    FOR seq IN
        SELECT c.relname AS sequence_name
        FROM pg_class c
        JOIN pg_namespace n ON n.oid = c.relnamespace
        WHERE c.relkind = 'S' AND n.nspname = 'public'
    LOOP
        EXECUTE 'ALTER SEQUENCE ' || seq.sequence_name || ' RESTART WITH 1';
    END LOOP;
END $$;
