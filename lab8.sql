#1
DELIMITER //
CREATE PROCEDURE sprawdz_wage(IN w INT, OUT newWaga INT)
BEGIN
	SET newWaga = w;
	IF w < 0
    THEN
		SET newWaga = 0;
	END IF;
END
//

CREATE TRIGGER sprawdz_wage_u
BEFORE UPDATE ON kreatura
FOR EACH ROW
BEGIN
	CALL sprawdz_wage(NEW.waga, @w);
	SET NEW.waga = @w;
END
//

CREATE TRIGGER sprawdz_wage_i
BEFORE INSERT ON kreatura
FOR EACH ROW
BEGIN
	CALL sprawdz_wage(NEW.waga, @w);
	SET NEW.waga = @w;
END
//
DELIMITER ;

#2
CREATE TABLE archiwum_wypraw LIKE wyprawa;
ALTER TABLE archiwum_wypraw MODIFY kierownik VARCHAR(100);

DELIMITER //
CREATE TRIGGER wyprawa_do_archiwum
BEFORE DELETE ON wyprawa
FOR EACH ROW
BEGIN
	INSERT INTO archiwum_wypraw (SELECT * FROM OLD);
END
//
DELIMITER ;

#3.1
DELIMITER //
CREATE PROCEDURE eliksir_sily(IN id INT)
BEGIN
	UPDATE kreatura SET udzwig = udzwig * 1.2 WHERE idKreatury=id;
END
//
#3.2
CREATE FUNCTION upper_alias(napis VARCHAR(999))
RETURNS VARCHAR(999)
BEGIN
	DECLARE res VARCHAR(999);
    SET res = UPPER(napis);
    RETURN res;
END
//
DELIMITER ;

#4.1
CREATE TABLE system_alarmowy (
	id_alarmu INT PRIMARY KEY,
    wiadomosc VARCHAR(100)
);
#4.2
DELIMITER //
CREATE TRIGGER alarm
AFTER INSERT ON wyprawa
FOR EACH ROW
BEGIN
	IF 'Tesciowa' IN(SELECT nazwa FROM uczestnicy u INNER JOIN kreatura k ON u.id_uczestnika=k.idKreatury WHERE u.id_wyprawy=NEW.id_wyprawy)
    THEN
    INSERT INTO system_alarmowy VALUES(
		default,
        'Teściowa nadchodzi !!!'
    );
    END IF;
END
//
DELIMITER ;

#5.1
DELIMITER //
CREATE PROCEDURE avg_sum_max(OUT a INT, s INT, m INT)
BEGIN
SELECT AVG(udzwig) INTO a FROM kreatura;
SELECT SUM(udzwig) INTO s FROM kreatura;
SELECT MAX(udzwig) INTO m FROM kreatura;
END
//
DELIMITER ;

#5.2
DELIMITER //
CREATE PROCEDURE select_sectors(IN id_wyprawy INT, OUT wspolrzedne VARCHAR(2), nazwa VARCHAR(200))
BEGIN
#posortowane etapy wyprawy
SELECT * FROM etapy_wyprawy WHERE idWyprawy=id_wyprawy ORDER BY kolejnosc;
# teraz reszta
END
DELIMITER ;