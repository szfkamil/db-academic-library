--------------------------------------- TRIGGER 1 --------------------------------------- 
CREATE TABLE egzemplarz_archiwum (
	id_egzemplarza BIGINT,
	id_zasobu BIGINT,
	sygnatura VARCHAR(15),
	data_usuniecia DATE,
	uzytkownik VARCHAR
);

ALTER TABLE egzemplarz_archiwum
ALTER COLUMN data_usuniecia SET DEFAULT CURRENT_DATE;

CREATE OR REPLACE FUNCTION archiwizuj_egzemplarz ()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS $$
BEGIN
	INSERT INTO egzemplarz_archiwum (id_egzemplarza,id_zasobu,sygnatura,uzytkownik)
	VALUES(OLD.id_egzemplarza,OLD.id_zasobu, OLD.sygnatura, CURRENT_USER);
	RETURN OLD;
END;
$$;

CREATE OR REPLACE TRIGGER usuniecie_egzemplarza
AFTER DELETE ON egzemplarz
FOR EACH ROW
EXECUTE FUNCTION archiwizuj_egzemplarz();

SELECT * FROM egzemplarz;

DELETE FROM egzemplarz WHERE id_egzemplarza = 12;

SELECT * FROM egzemplarz_archiwum;

--------------------------------------- TRIGGER 2 --------------------------------------- 
CREATE OR REPLACE FUNCTION skrocenie_waznosci()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS $$
BEGIN
	IF NEW.data_waznosci_konta < OLD.data_waznosci_konta THEN
		RAISE EXCEPTION 'Nowa data ważności konta nie może być wcześniejsza niż dotychczasowa.';
	END IF;
	RETURN NEW;
END;
$$;

CREATE OR REPLACE TRIGGER blokuj_skrocenie_waznosci
BEFORE UPDATE ON uzytkownik_konto
FOR EACH ROW
EXECUTE FUNCTION skrocenie_waznosci();

SELECT * FROM uzytkownik_konto;

UPDATE uzytkownik_konto 
SET data_waznosci_konta = CURRENT_DATE
WHERE id_uzytkownika = 9;
--------------------------------------- TRIGGER 3 ---------------------------------------
CREATE OR REPLACE FUNCTION usun_pusty_zasob()
RETURNS TRIGGER
LANGUAGE PLPGSQL
AS $$
DECLARE
	v_wynik INT;
BEGIN
	SELECT COUNT(id_egzemplarza) INTO v_wynik
	FROM egzemplarz
	WHERE id_zasobu = OLD.id_zasobu;

	IF v_wynik = 0 THEN 
	DELETE FROM zasob_bibliograficzny
	WHERE id_zasobu = OLD.id_zasobu;
	END IF;
	RETURN OLD;
END;
$$;

CREATE TRIGGER trg_usun_pusty_zasob
AFTER DELETE ON egzemplarz
FOR EACH ROW EXECUTE FUNCTION usun_pusty_zasob();

DELETE FROM egzemplarz 
WHERE id_egzemplarza = 3;
SELECT * FROM zasob_bibliograficzny WHERE id_zasobu = 2;
