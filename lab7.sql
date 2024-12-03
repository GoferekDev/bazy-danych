#1.1
CREATE TABLE uczestnicy AS SELECT * FROM wikingowie.uczestnicy;
CREATE TABLE etapy_wyprawy AS SELECT * FROM wikingowie.etapy_wyprawy;
CREATE TABLE wyprawa AS SELECT * FROM wikingowie.wyprawa;
CREATE TABLE sektor AS SELECT * FROM wikingowie.sektor;
#1.2
SELECT nazwa FROM uczestnicy u RIGHT JOIN kreatura k ON u.id_uczestnika=k.idKreatury WHERE id_wyprawy IS NULL;
#1.3
SELECT w.nazwa, SUM(e.ilosc) FROM wyprawa w
INNER JOIN uczestnicy u ON w.id_wyprawy=u.id_wyprawy
INNER JOIN kreatura k ON u.id_uczestnika=k.idKreatury
INNER JOIN ekwipunek e ON k.idKreatury=e.idKreatury
GROUP BY w.nazwa;

#2.1
SELECT w.nazwa, count(k.nazwa), 
group_concat(k.nazwa SEPARATOR '|') as liczba_uczestnikow
FROM wyprawa w
INNER JOIN uczestnicy u ON w.id_wyprawy=u.id_wyprawy 
INNER JOIN kreatura k ON k.idKreatury=u.id_uczestnika 
GROUP BY w.nazwa;
#2.2
SELECT w.nazwa, k.nazwa, s.nazwa FROM wyprawa w
INNER JOIN etapy_wyprawy e ON w.id_wyprawy=e.idWyprawy
INNER JOIN sektor s ON e.sektor=s.id_sektora
INNER JOIN kreatura k ON w.kierownik = k.idKreatury
ORDER BY w.nazwa, e.kolejnosc;

#3.1
SELECT s.nazwa, COUNT(e.idEtapu) FROM sektor s LEFT JOIN etapy_wyprawy e ON e.sektor=s.id_sektora GROUP BY s.nazwa;
#3.2
SELECT k.nazwa, COUNT(u.id_wyprawy), if(COUNT(u.id_wyprawy)>0, 'brał udział w wyprawie', 'nie brał udziału w wyprawie') FROM kreatura k LEFT JOIN uczestnicy u ON k.idKreatury=u.id_uczestnika GROUP BY k.nazwa;

#4.1
SELECT w.nazwa, SUM(LENGTH(e.dziennik)) AS suma_znak FROM wyprawa w INNER JOIN etapy_wyprawy e ON w.id_wyprawy=e.idWyprawy GROUP BY w.nazwa HAVING suma_znak<400;
#4.2
SELECT SUM(z.waga*e.ilosc)/COUNT(DISTINCT(u.id_uczestnika)) FROM uczestnicy u INNER JOIN kreatura k ON u.id_uczestnika=k.idKreatury
INNER JOIN ekwipunek e ON k.idKreatury=e.idKreatury
INNER JOIN zasob z ON e.idZasobu=z.idZasobu
GROUP BY u.id_wyprawy;

#5
SELECT k.nazwa, datediff(w.data_zakonczenia, k.dataUr) FROM kreatura k
INNER JOIN uczestnicy u ON k.idKreatury=u.id_uczestnika
INNER JOIN wyprawa w ON u.id_wyprawy=w.id_wyprawy GROUP BY w.id_wyprawy;