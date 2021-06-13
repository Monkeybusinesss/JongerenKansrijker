CREATE  DATABASE JongerenKansrijker;
USE JongerenKansrijker;

CREATE TABLE activiteit(
    avtiviteitscode INT AUTO_INCREMENT NOT NULL,
    activiteit VARCHAR(255) NOT NULL,
    PRIMARY KEY (avtiviteitscode)
);

CREATE TABLE medewerker(
    medewerker_ID INT AUTO_INCREMENT NOT NULL,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (medewerker_ID)
);

CREATE TABLE jongere(
    jongerecode INT AUTO_INCREMENT NOT NULL,
    roepnaam VARCHAR(255) NOT NULL,
    tussenvoegsel VARCHAR(255),
    achternaam VARCHAR(255) NOT NULL,
    inschrijfdatum DATE NOT NULL,
    PRIMARY KEY(jongerecode)
);

CREATE TABLE instituut(
    instituutscode INT AUTO_INCREMENT NOT NULL,
    instituut VARCHAR(255) NOT NULL,
    instituuttelefoon VARCHAR(255) NOT NULL,
    PRIMARY KEY (instituutscode)
);

CREATE TABLE jongereinstituut(
    jongere_instituutscode INT AUTO_INCREMENT NOT NULL,
    jongerecode INT NOT NULL,
    instituutscode INT NOT NULL,
    startdatum DATE NOT NULL,
    PRIMARY KEY (jongere_instituutscode),
    FOREIGN KEY (jongerecode) REFERENCES jongere(jongerecode),
    FOREIGN KEY (instituutscode) REFERENCES instituut(instituutscode)
);

CREATE TABLE jongereactiviteit(
    jongere_activiteitscode INT AUTO_INCREMENT NOT NULL,
    jongerecode INT NOT NULL,
    avtiviteitscode INT NOT NULL, 
    startdatum DATE NOT NULL,
    afgerond INT NOT NULL,
    PRIMARY KEY (jongere_activiteitscode),
    FOREIGN KEY (jongerecode) REFERENCES jongere(jongerecode),
    FOREIGN KEY (avtiviteitscode) REFERENCES activiteit(avtiviteitscode)
);