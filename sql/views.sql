--------------------------------------- WIDOK 1 --------------------------------------- 
CREATE VIEW czytelnik_raport AS
SELECT
	uk.id_uzytkownika,
	uk.nazwisko,
	uk.imie,
	COUNT(tw.id_transakcji) as liczba
FROM uzytkownik_konto uk
LEFT JOIN transakcja_wypozyczenia tw ON tw.id_uzytkownika = uk.id_uzytkownika
GROUP BY
	uk.id_uzytkownika,
	uk.nazwisko,
	uk.imie;

SELECT
	id_uzytkownika,
	nazwisko,
	imie,
	liczba
FROM czytelnik_raport
WHERE liczba > (SELECT AVG(liczba) FROM czytelnik_raport)
ORDER BY
	nazwisko,
	imie;
--------------------------------------- WIDOK 2 --------------------------------------- 
CREATE VIEW zasob_raport AS
SELECT
	zb.id_zasobu,
	zb.tytul_glowny,
	zb.rok_publikacji,
	COUNT(tw.id_transakcji) as liczba
FROM zasob_bibliograficzny zb
LEFT JOIN egzemplarz e ON e.id_zasobu = zb.id_zasobu
LEFT JOIN transakcja_wypozyczenia tw ON tw.id_egzemplarza = e.id_egzemplarza
GROUP BY
	zb.id_zasobu,
	zb.tytul_glowny,
	zb.rok_publikacji;

SELECT 
	id_zasobu,
	tytul_glowny,
	rok_publikacji
FROM zasob_raport
WHERE liczba = (SELECT MAX(liczba) FROM zasob_raport)
ORDER BY tytul_glowny;
