CREATE TABLE Etudiant(
   ETU VARCHAR(50) ,
   nom VARCHAR(100) ,
   prenom VARCHAR(50) ,
   naissance DATE,
   PRIMARY KEY(ETU)
);

CREATE TABLE Options(
   idOptions VARCHAR(50) ,
   designation VARCHAR(50) ,
   PRIMARY KEY(idOptions)
);

CREATE TABLE Semestre(
   idSemestre SERIAL,
   libelle VARCHAR(50) ,
   PRIMARY KEY(idSemestre)
);

CREATE TABLE Matieres(
   idMatiere SERIAL,
   code VARCHAR(50) ,
   libelle VARCHAR(200) ,
   credits INTEGER,
   idOptions VARCHAR(50)  NOT NULL,
   idSemestre INTEGER NOT NULL,
   PRIMARY KEY(idMatiere),
   UNIQUE(code),
   FOREIGN KEY(idOptions) REFERENCES Options(idOptions),
   FOREIGN KEY(idSemestre) REFERENCES Semestre(idSemestre)
);

CREATE TABLE resultat(
   ETU VARCHAR(50) ,
   idMatiere INTEGER,
   notes NUMERIC(4,2)  ,
   dateSession DATE,
   PRIMARY KEY(ETU, idMatiere),
   FOREIGN KEY(ETU) REFERENCES Etudiant(ETU),
   FOREIGN KEY(idMatiere) REFERENCES Matieres(idMatiere)
);

CREATE TABLE Inscription(
   ETU VARCHAR(50) ,
   idOptions VARCHAR(50) ,
   idSemestre INTEGER,
   daty VARCHAR(50)  NOT NULL,
   PRIMARY KEY(ETU, idOptions, idSemestre),
   FOREIGN KEY(ETU) REFERENCES Etudiant(ETU),
   FOREIGN KEY(idOptions) REFERENCES Options(idOptions),
   FOREIGN KEY(idSemestre) REFERENCES Semestre(idSemestre)
);
