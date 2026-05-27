--------------------------------------- PROCEDURA 1 --------------------------------------- 
CREATE OR REPLACE PROCEDURE zarejestruj_zwrot(p_id_egzemplarza BIGINT)
LANGUAGE plpgsql
AS $$
BEGIN
UPDATE transakcja_wypozyczenia
SET rzeczywisty_czas_zwrotu = CURRENT_TIMESTAMP
WHERE id_egzemplarza = p_id_egzemplarza 
	AND rzeczywisty_czas_zwrotu IS NULL;
END;
$$;

CALL zarejestruj_zwrot(2);

SELECT * FROM transakcja_wypozyczenia WHERE id_egzemplarza = 2;
--------------------------------------- PROCEDURA 2 --------------------------------------- 
CREATE OR REPLACE PROCEDURE aktualizuj_dane_kontaktowe(p_id_uzytkownika INT, p_email VARCHAR, p_nr_tel VARCHAR)
LANGUAGE plpgsql
AS $$
BEGIN
UPDATE uzytkownik_konto
SET 
	email = CASE WHEN p_email IS NOT NULL AND p_email != '' THEN p_email ELSE email END,
 	nr_tel = CASE WHEN p_nr_tel IS NOT NULL AND p_nr_tel != '' THEN p_nr_tel ELSE nr_tel END
WHERE id_uzytkownika = p_id_uzytkownika;
END;
$$;

CALL aktualizuj_dane_kontaktowe(1,'','0987654321');
CALL aktualizuj_dane_kontaktowe(1,NULL,'0987654320');

SELECT nr_tel, email FROM uzytkownik_konto WHERE id_uzytkownika = 1;
--------------------------------------- PROCEDURA 3 --------------------------------------- 
CREATE OR REPLACE PROCEDURE zmien_lokalizacje_egzemplarza(p_id_egzemplarza BIGINT, p_id_lokalizacji BIGINT)
LANGUAGE plpgsql
AS $$
BEGIN
UPDATE egzemplarz
SET id_lokalizacji = p_id_lokalizacji
WHERE id_egzemplarza = p_id_egzemplarza;
END;
$$;

CALL zmien_lokalizacje_egzemplarza(1,2);

SELECT id_egzemplarza, id_lokalizacji FROM egzemplarz WHERE id_egzemplarza = 1;
--------------------------------------- PROCEDURA 4 --------------------------------------- 
CREATE OR REPLACE PROCEDURE dodaj_wypozyczenie (p_id_egzemplarza BIGINT, p_id_uzytkownika INT)
LANGUAGE plpgsql
AS $$
DECLARE
	v_limit_dni SMALLINT;
BEGIN
	SELECT limit_dni INTO v_limit_dni
	FROM regula_wypozyczenia rw
	INNER JOIN egzemplarz e ON e.id_reguly = rw.id_reguly
	WHERE e.id_egzemplarza = p_id_egzemplarza;

	INSERT INTO transakcja_wypozyczenia(planowany_czas_zwrotu,id_egzemplarza,id_uzytkownika)
	VALUES(CURRENT_DATE + v_limit_dni,p_id_egzemplarza,p_id_uzytkownika);

END;
$$;

CALL dodaj_wypozyczenie(2,2);

SELECT * FROM transakcja_wypozyczenia;
--------------------------------------- PROCEDURA 5 --------------------------------------- 
CREATE OR REPLACE PROCEDURE dodaj_egzemplarz(p_id_egzemplarza BIGINT, p_id_reguly BIGINT,p_id_lokalizacji BIGINT,p_id_zasobu BIGINT,p_sygnatura BIGINT)
LANGUAGE plpgsql
AS $$
BEGIN
INSERT INTO egzemplarz (id_egzemplarza,id_reguly,id_lokalizacji,id_zasobu,sygnatura)
VALUES (p_id_egzemplarza,p_id_reguly,p_id_lokalizacji,p_id_zasobu,p_sygnatura);
END;
$$;

CALL dodaj_egzemplarz(11,2,2,1, '1234568');

SELECT * FROM egzemplarz ORDER BY id_egzemplarza DESC;
