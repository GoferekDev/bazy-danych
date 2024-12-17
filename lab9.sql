#1.1
SELECT nazwisko FROM pracownik ORDER BY nazwisko ASC;

#1.2
SELECT imie, nazwisko, pensja FROM pracownik WHERE YEAR(data_urodzenia) > 1979;

#1.3
SELECT * FROM pracownik WHERE pensja BETWEEN 3500 AND 5000;

#1.4
SELECT * FROM towar t INNER JOIN stan_magazynowy s ON t.id_towaru=s.towar WHERE s.ilosc > 10;

#1.5
SELECT * FROM towar WHERE nazwa_towaru LIKE 'A%' OR 'B%' OR 'C%';

#1.6
SELECT * FROM klient WHERE czy_firma = 0;

#1.7
SELECT * FROM zamowienie ORDER BY data_zamowienia DESC LIMIT 10;

#1.8
SELECT * FROM pracownik ORDER BY pensja ASC LIMIT 5;

#1.9
SELECT * FROM towar WHERE nazwa_towaru NOT LIKE '%a%' ORDER BY cena_zakupu DESC LIMIT 10;

#1.10
SELECT * FROM towar t INNER JOIN stan_magazynowy s ON t.id_towaru=s.towar INNER JOIN jednostka_miary j ON s.jm=j.id_jednostki WHERE j.nazwa='szt' ORDER BY t.nazwa_towaru ASC, t.cena_zakupu DESC;

#1.11
CREATE TABLE towary_powyzej_100 AS SELECT * FROM __firma_zti.towar WHERE cena_zakupu > 100;

#1.12
CREATE TABLE pracownik_50_plus LIKE __firma_zti.pracownik;
INSERT INTO pracownik_50_plus SELECT * FROM __firma_zti.pracownik p WHERE YEAR(NOW()) - YEAR(p.data_urodzenia) >= 50;


#2.1
SELECT p.imie, p.nazwisko, d.nazwa FROM pracownik p INNER JOIN dzial d ON p.dzial=d.id_dzialu;

#2.2
SELECT t.nazwa_towaru, k.nazwa_kategori, s.ilosc FROM towar t INNER JOIN kategoria k ON t.kategoria=k.id_kategori INNER JOIN stan_magazynowy s ON t.id_towaru=s.towar ORDER BY s.ilosc DESC;

#2.3
SELECT * FROM zamowienie z INNER JOIN status_zamowienia s ON z.status_zamowienia=s.id_statusu_zamowienia WHERE s.nazwa_statusu_zamowienia='anulowane';

#2.4
SELECT * FROM klient k INNER JOIN adres_klienta a ON k.id_klienta=a.klient WHERE a.miejscowosc='Olsztyn';

#2.5
SELECT j.nazwa FROM jednostka_miary j LEFT JOIN stan_magazynowy s ON j.id_jednostki=s.jm WHERE s.jm IS NULL;

#2.6
SELECT z.numer_zamowienia, t.nazwa_towaru, p.ilosc, p.cena FROM zamowienie z INNER JOIN pozycja_zamowienia p ON p.zamowienie=z.id_zamowienia INNER JOIN towar t ON p.towar=t.id_towaru WHERE YEAR(z.data_zamowienia)=2018;

#2.7
CREATE TABLE towary_full_info(
nazwa_towaru VARCHAR(255),
cena_zakupu DECIMAL(7,2),
kategoria VARCHAR(255),
ilosc DECIMAL(7,2),
jednosta_miaryjednostka_miary VARCHAR(45)
);

#2.8
SELECT p.* FROM zamowienie z INNER JOIN pozycja_zamowienia p ON z.id_zamowienia=p.zamowienie ORDER BY z.data_zamowienia ASC LIMIT 5;

#2.9
SELECT * FROM zamowienie z INNER JOIN status_zamowienia s ON z.status_zamowienia=s.id_statusu_zamowienia WHERE NOT s.nazwa_statusu_zamowienia='zrealizowane';

#2.10
SELECT kod FROM adres_klienta WHERE kod NOT REGEXP "[0-9]{2}-[0-9]{3}";