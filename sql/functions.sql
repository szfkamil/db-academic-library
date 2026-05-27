--------------------------------------- FUNKCJA 1 --------------------------------------- 
CREATE OR REPLACE FUNCTION aktualne_wypozyczenia (p_id_uzytkownika INT)
RETURNS INT
LANGUAGE plpgsql
AS $$
DECLARE
	v_wynik INT;
BEGIN
	SELECT COUNT(id_egzemplarza) INTO v_wynik
	FROM transakcja_wypozyczenia
	WHERE id_uzytkownika = p_id_uzytkownika AND rzeczywisty_czas_zwrotu IS NULL;
	RETURN v_wynik;
END;
$$;

SELECT aktualne_wypozyczenia(3);
--------------------------------------- FUNKCJA 2 --------------------------------------- 
CREATE OR REPLACE FUNCTION wypozyczenia_w_okresie(p_data_od DATE, p_data_do DATE)
RETURNS INT
LANGUAGE plpgsql
AS $$
DECLARE
	v_wynik INT;
BEGIN
	SELECT COUNT(id_transakcji) INTO v_wynik
	FROM transakcja_wypozyczenia
	WHERE CAST(czas_wypozyczenia AS DATE) BETWEEN p_data_od AND p_data_do;
	RETURN v_wynik;
END;
$$;

SELECT wypozyczenia_w_okresie('2000-01-01',CURRENT_DATE);
--------------------------------------- FUNKCJA 3 --------------------------------------- 
CREATE OR REPLACE FUNCTION dni_do_wygasniecia_konta (p_id_uzytkownika INT)
RETURNS SMALLINT
LANGUAGE plpgsql
AS $$
DECLARE
	v_wynik SMALLINT;
BEGIN
	SELECT (data_waznosci_konta - CURRENT_DATE) INTO v_wynik
	FROM uzytkownik_konto
	WHERE id_uzytkownika = p_id_uzytkownika;
	RETURN v_wynik;
END;
$$;

SELECT dni_do_wygasniecia_konta(1);
--------------------------------------- FUNKCJA 4 --------------------------------------- 
CREATE OR REPLACE FUNCTION popularnosc_autora (p_id_tworcy BIGINT)
RETURNS INT
LANGUAGE plpgsql
AS $$
DECLARE
	v_wynik INT;
BEGIN
	SELECT COUNT(tw.id_transakcji) INTO v_wynik
	FROM zasob_tworca zt
	LEFT JOIN egzemplarz e ON e.id_zasobu = zt.id_zasobu
	LEFT JOIN transakcja_wypozyczenia tw ON tw.id_egzemplarza = e.id_egzemplarza
	WHERE zt.id_tworcy = p_id_tworcy;
	RETURN v_wynik;
END;
$$;

SELECT popularnosc_autora(3);
--------------------------------------- FUNKCJA 5 --------------------------------------- 
CREATE OR REPLACE FUNCTION dostepne_egzemplarze_zasobu (p_id_zasobu BIGINT)
RETURNS INT
LANGUAGE plpgsql
AS $$
DECLARE
	v_wynik INT;
BEGIN

	SELECT COUNT(id_egzemplarza) INTO v_wynik
	FROM egzemplarz
	WHERE id_zasobu = p_id_zasobu 
		AND id_egzemplarza NOT IN (
			SELECT id_egzemplarza
			FROM transakcja_wypozyczenia
			WHERE rzeczywisty_czas_zwrotu IS NULL
		);
		
	RETURN v_wynik;
END;
$$;

SELECT dostepne_egzemplarze_zasobu(1);
