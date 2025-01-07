#1
SELECT imie, nazwisko, YEAR(data_urodzenia) FROM pracownik;
#2
SELECT imie, nazwisko, YEAR(now()) - YEAR(data_urodzenia) FROM pracownik;
#3
SELECT d.nazwa, count(p.id_pracownika) FROM pracownik p RIGHT JOIN dzial d ON p.dzial=d.id_dzialu GROUP BY d.nazwa;
#4
SELECT k.nazwa_kategori, count(id_towaru) FROM towar t RIGHT JOIN kategoria k ON t.kategoria=k.id_kategori GROUP BY k.nazwa_kategori;
#5
SELECT k.nazwa_kategori, group_concat(t.nazwa_towaru) FROM towar t RIGHT JOIN kategoria k ON t.kategoria=k.id_kategori GROUP BY k.nazwa_kategori;
#6
SELECT round(avg(pensja), 2) FROM pracownik;
#7
SELECT avg(pensja) FROM pracownik WHERE YEAR(now()) - YEAR(data_zatrudnienia) >= 5;
#8.1
# zrealizowane = 5, to pozwala uniknąc poczwórnego joina, a ilosć statusów zamowienia nie będzie się czesto zmieniac (być może nawet nigdy)
SELECT t.nazwa_towaru FROM zamowienie z INNER JOIN pozycja_zamowienia p ON z.id_zamowienia=p.zamowienie INNER JOIN towar t ON p.towar=t.id_towaru 
WHERE z.status_zamowienia = 5 
GROUP BY t.nazwa_towaru ORDER BY count(id_towaru) DESC LIMIT 10;
#8.2
SELECT t.nazwa_towaru FROM zamowienie z INNER JOIN pozycja_zamowienia p ON z.id_zamowienia=p.zamowienie INNER JOIN towar t ON p.towar=t.id_towaru
WHERE z.status_zamowienia = 5 
GROUP BY t.nazwa_towaru ORDER BY SUM(id_towaru) DESC LIMIT 10;
#9
SELECT z.numer_zamowienia, SUM(p.cena * p.ilosc) FROM zamowienie z INNER JOIN pozycja_zamowienia p ON z.id_zamowienia=p.zamowienie
WHERE YEAR(z.data_zamowienia) = 2017 AND MONTH(z.data_zamowienia) BETWEEN 1 AND 3
GROUP BY z.numer_zamowienia;
#10
SELECT p.imie, p.nazwisko, SUM(pz.cena * pz.ilosc) FROM pracownik p INNER JOIN zamowienie z ON z.pracownik_id_pracownika=p.id_pracownika INNER JOIN pozycja_zamowienia pz ON pz.zamowienie=z.id_zamowienia
GROUP BY p.id_pracownika;
#11
SELECT d.nazwa, MIN(p.pensja), MAX(p.pensja), AVG(p.pensja) FROM dzial d INNER JOIN pracownik p ON p.dzial=d.id_dzialu GROUP BY d.nazwa;
#12
SELECT k.pelna_nazwa, SUM(p.cena * p.ilosc) FROM klient k INNER JOIN zamowienie z ON z.klient=k.id_klienta INNER JOIN pozycja_zamowienia p ON p.zamowienie = z.id_zamowienia GROUP BY k.pelna_nazwa;
#13
SELECT YEAR(z.data_zamowienia), SUM(p.cena * p.ilosc) FROM zamowienie z INNER JOIN pozycja_zamowienia p ON z.id_zamowienia=p.zamowienie GROUP BY YEAR(z.data_zamowienia);
#14
SELECT SUM(p.cena * p.ilosc) FROM zamowienie z INNER JOIN pozycja_zamowienia p WHERE z.status_zamowienia = 6;
#15
SELECT a.miejscowosc, COUNT(z.id_zamowienia), SUM(pz.cena * pz.ilosc)
FROM adres_klienta a INNER JOIN klient k ON a.klient=k.id_klienta INNER JOIN zamowienie z ON z.klient=k.id_klienta INNER JOIN pozycja_zamowienia pz ON pz.zamowienie=z.id_zamowienia GROUP BY a.miejscowosc;

#################
#Przychód
SELECT SUM(ilosc * )
#Wydatki

#16
#17

#18
SELECT k.nazwa_kategori, SUM(t.cena_zakupu * s.ilosc) FROM stan_magazynowy s INNER JOIN towar t ON s.towar=t.id_towaru INNER JOIN kategoria k ON t.kategoria=k.id_kategori GROUP BY k.nazwa_kategori;
#19
SELECT sub.m2 AS 'Miesiąc', sub.c AS 'Liczba pracowników' FROM (SELECT MONTH(data_urodzenia) as 'm', MONTHNAME(data_urodzenia) AS 'm2', COUNT(id_pracownika) AS 'c' FROM pracownik GROUP BY MONTH(data_urodzenia), monthname(data_urodzenia) ORDER BY MONTH(data_urodzenia) ASC) as sub;
#20
SELECT imie, nazwisko, pensja * TIMESTAMPDIFF(month, data_zatrudnienia, now()) FROM pracownik;