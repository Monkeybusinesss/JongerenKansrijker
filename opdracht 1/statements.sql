CREATE  DATABASE JongerenKansrijker;
USE JongerenKansrijker;

CREATE TABLE activiteit(
    actiecode INT AUTO_INCREMENT NOT NULL,
    activiteit VARCHAR(255),
    PRIMARY KEY (actiecode)
);

CREATE TABLE medewerker(
    medewerker_ID INT AUTO_INCREMENT NOT NULL,
    username VARCHAR(255) NOT NULL UNIQUE,
    password VARCHAR(255) NOT NULL,
    PRIMARY KEY (medewerker_ID)
);

CREATE TABLE jongere(
    jongerecode INT AUTO_INCREMENT NOT NULL,
    roepnaam VARCHAR(255),
    tussenvoegsel VARCHAR(255),
    achternaam VARCHAR(255),
    inschrijfdatum DATE,
    PRIMARY KEY(jongerecode)
);

CREATE TABLE instituut(
    instituutscode INT AUTO_INCREMENT NOT NULL,
    instituut VARCHAR(255),
    instituuttelefoon VARCHAR(255) UNIQUE,
    PRIMARY KEY (instituutscode)
);

CREATE TABLE jongereinstituut(
    jongere_instituutscode INT AUTO_INCREMENT NOT NULL,
    jongerecode INT,
    instituutscode INT,
    startdatum DATE,
    PRIMARY KEY (jongere_instituutscode),
    FOREIGN KEY (jongerecode) REFERENCES jongere(jongerecode),
    FOREIGN KEY (instituutscode) REFERENCES instituut(instituutscode)
);

CREATE TABLE jongereactiviteit(
    jongere_activiteitscode INT AUTO_INCREMENT NOT NULL,
    jongerecode INT,
    actiecode INT, 
    startdatum DATE,
    afgerond INT,
    PRIMARY KEY (jongere_activiteitscode),
    FOREIGN KEY (jongerecode) REFERENCES jongere(jongerecode),
    FOREIGN KEY (actiecode) REFERENCES activiteit(actiecode)
);