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
'1522-02-05',
502
), 
(
default,
'Drozd',
'1000-01-01',
1024
),
(
default,
'Tesciowa',
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
#3.2
#3.3

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
#5.2
CREATE TABLE `statek` (
  nazwa_statku varchar(40) NOT NULL,
  rodzaj_statku enum('drakkar','galeon','kontenerowiec'),
  data_wodowania date,
  max_ladownosc int unsigned,
  PRIMARY KEY (nazwa_statku)
);
#5.3
#5.4
ALTER TABLE postac ADD funkcja VARCHAR(40);
#5.5
UPDATE postac SET funkcja='kapitan' WHERE id_postaci=1 OR id_postaci=5;
#5.6
ALTER TABLE postac ADD statek VARCHAR(40);
ALTER TABLE postac ADD FOREIGN KEY (statek) REFERENCES statek(nazwa_statku);
#5.7
UPDATE postac SET statek='statek bjorna' WHERE id_postaci BETWEEN 1 and 2;
UPDATE postac SET statek='statek bjorna' WHERE id_postaci BETWEEN 4 and 8;
#5.8
DELETE FROM izba WHERE nazwa_izby='spizarnia';
#5.9
DROP TABLE izba;

