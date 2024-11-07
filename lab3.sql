#1.1
CREATE TABLE postac (
  id_postaci int NOT NULL AUTO_INCREMENT,
  nazwa varchar(40),
  rodzaj enum('wiking','ptak','kobieta'),
  data_ur date,
  wiek int unsigned,
  PRIMARY KEY (id_postaci)
);

#1.2
INSERT INTO postac VALUES (
default,
'Bjorn',
'wiking',
'1522-02-05',
502
), 
(
default,
'Drozd',
'ptak',
'1000-01-01',
1024
),
(
default,
'Tesciowa',
'kobieta',
'1490-02-11',
534
);

#1.3
UPDATE postac SET wiek=88 WHERE id_postaci=3;

#2.1
CREATE TABLE walizka (
  id_walizki int NOT NULL AUTO_INCREMENT,
  pojemnosc int unsigned,
  kolor enum('rozowy','czerwony','teczowy','zolty'),
  id_wlasciciela int,
  PRIMARY KEY (id_walizki),
  FOREIGN KEY (id_wlasciciela) REFERENCES postac (id_postaci) ON DELETE CASCADE
);

#2.2
ALTER TABLE walizka ALTER kolor SET DEFAULT 'rozowy';

#2.3
INSERT INTO walizka VALUES(
default,
10,
'zolty',
1
), 
(
default,
8,
default,
3
);

#3.1
CREATE TABLE izba(
adres_budynku VARCHAR(40) NOT NULL,
nazwa_izby VARCHAR(40) NOT NULL,
metraz INT UNSIGNED,
wlasciciel INT,
PRIMARY KEY(adres_budynku, nazwa_izby),
FOREIGN KEY(wlasciciel) REFERENCES postac(id_postaci) ON DELETE SET NULL
);

#3.2
ALTER TABLE izba ADD kolor VARCHAR(40) DEFAULT 'czarny';

#3.3
INSERT INTO izba VALUES(
'spizarniana 1',
'spizarnia',
8,
1,
default
);

#4.1
CREATE TABLE przetwory (
  id_przetworu int NOT NULL AUTO_INCREMENT,
  rok_produkcji smallint DEFAULT '1654',
  id_wykonawcy int,
  zawartosc varchar(100),
  dodatek varchar(40) DEFAULT 'papryczka_chili',
  id_konsumenta int,
  PRIMARY KEY (id_przetworu),
  FOREIGN KEY (id_wykonawcy) REFERENCES postac (id_postaci),
  FOREIGN KEY (id_konsumenta) REFERENCES postac (id_postaci)
);

#4.2
INSERT INTO przetwory VALUES (
default,
default,
1,
'tak',
default,
3
);

#5.1
INSERT INTO postac VALUES
(
default,
'wiking 1',
'wiking',
'1432-03-06',
592
),
(
'wiking 2',
'wiking',
'1643-07-05',
381
),
(
'wiking 3',
'wiking',
'1677-04-04',
347
),
(
'wiking 4',
'wiking',
'1540-02-01',
484
),
(
'wiking 5',
'wiking',
'1380-05-07',
704
);

#5.2
CREATE TABLE statek (
  nazwa_statku varchar(40) NOT NULL,
  rodzaj_statku enum('drakkar','galeon','kontenerowiec'),
  data_wodowania date,
  max_ladownosc int unsigned,
  PRIMARY KEY (nazwa_statku)
);

#5.3
INSERT INTO statek VALUES
(
'statek bjorna',
'drakkar',
'1555-04-12',
8022
),
(
'statek wkinga 2',
'drakkar',
'1662-03-01',
650
);


#5.4
ALTER TABLE postac ADD funkcja VARCHAR(40);

#5.5
UPDATE postac SET funkcja='kapitan' WHERE id_postaci=1 OR id_postaci=5;

#5.6
ALTER TABLE postac ADD statek VARCHAR(40);
ALTER TABLE postac ADD FOREIGN KEY (statek) REFERENCES statek(nazwa_statku);

#5.7
UPDATE postac SET statek='statek bjorna' WHERE rodzaj='wiking' OR rodzaj='ptak';

#5.8
DELETE FROM izba WHERE nazwa_izby='spizarnia';

#5.9
DROP TABLE izba;

