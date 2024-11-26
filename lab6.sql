#1.1
SELECT AVG(waga) FROM kreatura WHERE rodzaj='wiking';
#1.2
SELECT rodzaj, AVG(waga), COUNT(*) FROM kreatura GROUP BY rodzaj;
#1.3
SELECT rodzaj, AVG(YEAR(NOW()) - YEAR(dataUr)) FROM kreatura GROUP BY rodzaj;

#2.1
SELECT rodzaj, SUM(waga * ilosc) FROM zasob GROUP BY rodzaj;
#2.2
SELECT nazwa, AVG(waga) FROM zasob WHERE ilosc >= 4 GROUP BY nazwa HAVING SUM(waga) > 10;
#2.3
SELECT rodzaj, COUNT(DISTINCT nazwa) FROM zasob GROUP BY rodzaj HAVING MIN(ilosc) > 1;

#3.1
SELECT nazwa, SUM(e.ilosc) FROM kreatura k INNER JOIN ekwipunek e ON k.idKreatury = e.idKreatury GROUP BY nazwa;
#3.2
SELECT k.nazwa, z.nazwa FROM kreatura k INNER JOIN ekwipunek e ON k.idKreatury = e.idKreatury INNER JOIN zasob z ON z.idZasobu = e.idZasobu;
#3.3
SELECT k.idKreatury, k.nazwa FROM kreatura k LEFT JOIN ekwipunek e ON k.idKreatury = e.idKreatury WHERE idEkwipunku IS NULL;

#4.1
SELECT k.nazwa, z.nazwa FROM kreatura k NATURAL JOIN ekwipunek e INNER JOIN zasob z ON z.idZasobu=e.idZasobu WHERE k.rodzaj='wiking' AND YEAR(k.dataUr) BETWEEN 1670 AND 1679;
#4.2
SELECT k.nazwa FROM kreatura k INNER JOIN ekwipunek e ON k.idKreatury = e.idKreatury INNER JOIN zasob z ON z.idZasobu = e.idZasobu WHERE z.rodzaj='jedzenie' ORDER BY dataUr DESC LIMIT 5;
#4.3
SELECT k1.nazwa, k2.nazwa FROM kreatura k1 INNER JOIN kreatura k2 ON k1.idKreatury = k2.idKreatury-5;

#5.1
SELECT k.rodzaj, AVG(z.waga) FROM kreatura k LEFT JOIN ekwipunek e ON k.idKreatury = e.idKreatury LEFT JOIN zasob z ON z.idZasobu = e.idZasobu WHERE k.rodzaj != 'malpa' OR k.rodzaj != 'waz' GROUP BY k.rodzaj HAVING SUM(e.ilosc) < 30;
#5.2
#SELECT FROM JOIN
SELECT FROM
#SELECT NAJML K
INNER JOIN
#SELECT NAJST K
ON y.rodzaj=o.rodzaj;
#ON RODZAJ