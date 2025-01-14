#1
CREATE TABLE student (
id_studenta INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
imie VARCHAR(100) NOT NULL,
nazwisko VARCHAR(100) NOT NULL,
rok_studiow INT UNSIGNED,
data_urodzenia DATE
);
#2
CREATE TABLE kierunek(
id_kierunku INT UNSIGNED PRIMARY KEY AUTO_INCREMENT,
nazwa_kierunku VARCHAR(200) NOT NULL
);
#3
CREATE TABLE student_na_kierunku(
student INT UNSIGNED,
kierunek INT UNSIGNED,
PRIMARY KEY(student, kierunek),
FOREIGN KEY (student) REFERENCES student(id_studenta),
FOREIGN KEY (kierunek) REFERENCES kierunek(id_kierunku)
);
#4
CREATE TABLE przedmiot(
id_przedmiotu INT PRIMARY KEY AUTO_INCREMENT,
nazwa_przedmiotu VARCHAR(200) NOT NULL,
opis LONGTEXT
);
#5
CREATE TABLE kierunek_has_przedmioty(
kierunek INT UNSIGNED,
przedmiot INT,
obowiazkowy BOOL DEFAULT 1,
PRIMARY KEY(kierunek, przedmiot),
FOREIGN KEY (kierunek) REFERENCES kierunek(id_kierunku),
FOREIGN KEY (przedmiot) REFERENCES przedmiot(id_przedmiotu)
);
#6
INSERT INTO student (imie, nazwisko, rok_studiow, data_urodzenia) VALUES
(
'Student1',
'Dontcare',
1,
'2005-07-12'
),
(
'Student2',
'Beznazwisk',
2,
'2003-03-06'
),
(
'Student3',
'Redacted',
2,
'2004-12-01'
),
(
'Student3',
'Nowak',
3,
'2000-06-19'
);

INSERT INTO kierunek (nazwa_kierunku) VALUES
(
'Drzwi w teori i praktyce'
),
(
'Turystyka teoretyczna'
);

INSERT INTO student_na_kierunku VALUES
(1,2),
(2,1),
(3,2),
(4,1);

INSERT INTO przedmiot (nazwa_przedmiotu, opis) VALUES
(
'Budowa i dzialanie zawiasow',
NULL
),
(
'Historia bram',
NULL
),
(
'Zaawansowany google maps',
NULL
),
(
'Miejsca nieistniejace',
NULL
);

INSERT INTO kierunek_has_przedmioty VALUES
(1, 1, 1),
(1, 2, 0),
(2, 3, 1),
(2, 4, 0);
#7
ALTER TABLE przedmiot MODIFY COLUMN opis VARCHAR(10000);
ALTER TABLE przedmiot ALTER opis SET DEFAULT 'Brak opisu';
#8
ALTER TABLE student ADD COLUMN indeks INT UNSIGNED NOT NULL;
UPDATE student SET indeks=123321 WHERE id_studenta=1;
UPDATE student SET indeks=312464 WHERE id_studenta=2;
UPDATE student SET indeks=789123 WHERE id_studenta=3;
UPDATE student SET indeks=643781 WHERE id_studenta=4;

ALTER TABLE student_na_kierunku DROP FOREIGN KEY student_na_kierunku_ibfk_1;
ALTER TABLE student MODIFY COLUMN id_studenta INT UNSIGNED;
ALTER TABLE student DROP PRIMARY KEY;
ALTER TABLE student ADD PRIMARY KEY (indeks);
#9
ALTER TABLE kierunek_has_przedmioty ADD COLUMN semestr VARCHAR(5) CHECK (semestr REGEXP '[0-9]{4}[A-Z]');
ALTER TABLE kierunek_has_przedmioty ADD COLUMN rok_studiow INT UNSIGNED NOT NULL;
UPDATE kierunek_has_przedmioty SET rok_studiow=1;
#10
SELECT s.indeks, s.imie, s.nazwisko, kp.semestr, p.nazwa_przedmiotu FROM student s INNER JOIN student_na_kierunku sk ON s.id_studenta=sk.student INNER JOIN kierunek k ON sk.kierunek=k.id_kierunku INNER JOIN kierunek_has_przedmioty kp ON k.id_kierunku=kp.kierunek INNER JOIN przedmiot p ON kp.przedmiot=p.id_przedmiotu;