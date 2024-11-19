#1.1
CREATE TABLE kreatura AS SELECT * FROM wikingowie.kreatura;
CREATE TABLE zasob AS SELECT * FROM wikingowie.zasob;
CREATE TABLE ekwipunek AS SELECT * FROM wikingowie.ekwipunek;
#1.2
SELECT * FROM zasob;
#1.3
SELECT * FROM zasob WHERE rodzaj='jedzenie';
#1.4
SELECT idZasobu, ilosc FROM ekwipunek WHERE idKreatury IN (1, 3, 5);

#2.1
SELECT * FROM kreatura WHERE rodzaj='wiedzma' AND udzwig > 50;
#2.2
SELECT * FROM zasob WHERE waga BETWEEN 2 AND 5;
#2.3
SELECT * FROM kreatura WHERE nazwa LIKE '%or%' AND udzwig BETWEEN 30 AND 70;

#3.1
SELECT * FROM zasob WHERE MONTH(dataPozyskania) IN (7, 8);
#3.2
SELECT * FROM zasob WHERE rodzaj IS NOT NULL ORDER BY waga ASC; 
#3.3
SELECT * FROM kreatura WHERE dataUr IS NOT NULL ORDER BY dataUr ASC LIMIT 5;

#4.1
SELECT DISTINCT rodzaj FROM zasob;
#4.2
SELECT CONCAT_WS(' ', nazwa, rodzaj) FROM kreatura WHERE rodzaj LIKE 'wi%';
#4.3
SELECT ilosc * waga FROM zasob AS calkowita_waga WHERE YEAR(dataPozyskania) BETWEEN 2000 AND 2007;

#5.1
SELECT waga * 0.7 AS netto, waga * 0.3 AS odpadki FROM zasob WHERE rodzaj = 'jedzenie';
#5.2
SELECT * FROM zasob WHERE rodzaj IS NULL;
#5.3
SELECT DISTINCT rodzaj FROM zasob WHERE rodzaj LIKE 'Ba%' OR rodzaj LIKE '%os' ORDER BY rodzaj DESC;