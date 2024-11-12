#1.1
SELECT nazwa, wiek FROM postac WHERE rodzaj='wiking' AND NOT nazwa='Bjorn' ORDER BY wiek DESC;
DELETE FROM postac WHERE nazwa='wiking 5' OR nazwa='wiking 3';
#1.2
ALTER TABLE walizka DROP FOREIGN KEY walizka_ibfk_1;
ALTER TABLE przetwory DROP FOREIGN KEY przetwory_ibfk_1;
ALTER TABLE przetwory DROP FOREIGN KEY przetwory_ibfk_2;
ALTER TABLE postac MODIFY id_postaci INT;
ALTER TABLE postac DROP PRIMARY KEY;
ALTER TABLE postac DROP COLUMN id_postaci;

#2.1
ALTER TABLE postac ADD pesel CHAR(11) FIRST;
UPDATE postac SET pesel='12345678911' WHERE nazwa='Bjorn';
UPDATE postac SET pesel='32145698272' WHERE nazwa='Drozd';
UPDATE postac SET pesel='98230498328' WHERE nazwa='Tesciowa';
UPDATE postac SET pesel='90985708966' WHERE nazwa='wiking 1';
UPDATE postac SET pesel='02456793986' WHERE nazwa='wiking 2';
UPDATE postac SET pesel='01983570981' WHERE nazwa='wiking 4';
ALTER TABLE postac ADD PRIMARY KEY(pesel);

#2.2
ALTER TABLE postac MODIFY rodzaj ENUM('wiking', 'ptak', 'kobieta', 'syrena');

#2.3
INSERT INTO postac VALUES(
'58493790234',
'Gertruda Nieszczera',
'syrena',
'1001-02-02',
1023,
NULL,
NULL
);

#3.1
UPDATE postac SET statek='statek bjorna' WHERE nazwa LIKE '%a%';
#3.2
UPDATE statek SET max_ladownosc=max_ladownosc*0.7;
#3.3
UPDATE postac SET wiek = '1000' WHERE nazwa='Drozd' OR nazwa='Gertruda Nieszczera';
ALTER TABLE postac ADD CHECK(wiek<=1000);

#4.1
ALTER TABLE postac MODIFY rodzaj ENUM('wiking', 'ptak', 'kobieta', 'syrena', 'waz');
INSERT INTO postac VALUES(
'12389071823',
'Loko',
'waz',
'1234-12-12',
790,
NULL,
NULL
);
#4.2
CREATE TABLE marynaz LIKE postac;
INSERT INTO marynaz SELECT * FROM postac WHERE statek IS NOT NULL;
#4.3

#5.1
UPDATE postac SET statek=NULL;
TRUNCATE marynaz;
#5.2
DELETE FROM postac WHERE nazwa='wiking 2';
#5.3
ALTER TABLE postac DROP FOREIGN KEY postac_ibfk_1;
TRUNCATE statek;
#5.4
DROP table statek;
#5.5
CREATE TABLE zwierz(
id INT AUTO_INCREMENT PRIMARY KEY,
nazwa VARCHAR(40),
wiek INT
);
#5.6
SELECT nazwa, wiek FROM postac;
INSERT INTO zwierz VALUES(
default,
'Drozd',
1000
),
(
default,
'Loko',
790
);