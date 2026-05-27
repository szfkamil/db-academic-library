INSERT INTO Typ_Uzytkownika (ID_Typu, Nazwa, Limit_Wypozyczen) VALUES
(1, 'Student', 20), 
(2, 'Pracownik UG', 50), 
(3, 'Doktorant', 20), 
(4, 'Gość zewnętrzny', 3), 
(5, 'Uczeń', 5);

INSERT INTO Regula_Wypozyczenia (ID_Reguly, Nazwa_Reguly, Limit_Dni, Czy_Mozliwa_Prolongata) VALUES
(1, 'Wypożyczenie regularne', 30, TRUE),
(2, 'Brak wypożyczeń (Tylko na miejscu)', 0, FALSE),
(3, 'Wypożyczenie krótkoterminowe 3 dni', 3, FALSE),
(4, 'Wypożyczenie krótkoterminowe 5 dni', 5, FALSE),
(5, 'Wypożyczenie krótkoterminowe 7 dni', 7, FALSE);

INSERT INTO Lokalizacja_Fizyczna (ID_Lokalizacji, Nazwa_Oddzialu, Nazwa_Strefy, Pietro) VALUES
(1, 'Biblioteka Główna', 'Czytelnia I', 1), 
(2, 'Biblioteka Główna', 'Czytelnia II', 2),
(3, 'Biblioteka Główna', 'Czytelnia III', 3), 
(4, 'Biblioteka Ekonomiczna', 'Wypożyczalnia', 0),
(5, 'Biblioteka Prawna', 'Magazyn', -1), 
(6, 'Biblioteka Główna', 'Wypożyczalnia', 1),
(7, 'Biblioteka Humanistyczna', 'Czytelnia', 0), 
(8, 'Biblioteka Neofilologiczna', 'Wypożyczalnia', 2),
(9, 'Biblioteka Historii Kultury', 'Czytelnia', 0), 
(10, 'Biblioteka Ekonomiczna', 'Czytelnia', 1);

INSERT INTO Gatunek (ID_Gatunku, Nazwa_Gatunku) VALUES
(1, 'Powieść'), 
(2, 'Podręcznik'), 
(3, 'Opracowanie'), 
(4, 'Monografia'), 
(5, 'Słownik'),
(6, 'Czasopismo'), 
(7, 'Encyklopedia'), 
(8, 'Poradnik'), 
(9, 'Esej'), 
(10, 'Biografia');

INSERT INTO Klasyfikacja_UKD (ID_Klasyfikacji, Symbol, Opis) VALUES
(1, 'L.15.12.3', 'Literatura rosyjska'), 
(2, 'M.16.5', 'Matematyka ogólna i dyskretna'),
(3, 'M.16.9.4', 'Teoria grafów'), 
(4, 'I.10.1', 'Programowanie obiektowe'),
(5, 'H.05.2', 'Historia Polski XX w.'), 
(6, 'M.16.5.1', 'Matematyka stosowana'),
(7, 'L.15.10.6.3.2', 'Literatura polska'), 
(8, 'E.10.2', 'Mikroekonomia'),
(9, 'P.01.1', 'Prawo cywilne'), 
(10, 'I.10.2', 'Bazy danych');

INSERT INTO Temat_Haslo (ID_Tematu, Nazwa_Hasla) VALUES
(1, 'Zabójstwo'), 
(2, 'Logika matematyczna'), 
(3, 'Polska Służba Bezpieczeństwa -- historia'),
(4, 'Grafy'), 
(5, 'Rachunek prawdopodobieństwa'), 
(6, 'Bazy danych relacyjne'),
(7, 'Literatura piękna'), 
(8, 'Rodion Raskolnikow (postać fikcyjna)'), 
(9, 'Etyka'), 
(10, 'Optymalizacja');

INSERT INTO Osoba_Tworca (ID_Tworcy, Imie, Nazwisko, Rok_Urodzenia, Rok_Smierci, Atrybut_Wyrozniajacy) VALUES
(1, 'Fiodor', 'Dostojewski', 1821, 1881, NULL), 
(2, 'Kenneth A.', 'Ross', 1936, NULL, 'Matematyk'),
(3, 'Jacek', 'Snopkiewicz', 1942, NULL, NULL), 
(4, 'Marian Antoni', 'Partyka', NULL, NULL, NULL),
(5, 'Wojciech', 'Guzicki', NULL, NULL, 'Tłumacz'), 
(6, 'Charles R. B.', 'Wright', NULL, NULL, NULL),
(7, 'Piotr', 'Zakrzewski', NULL, NULL, 'matematyk'), 
(8, 'Jacek M.', 'Wojciechowski', 1942, 2015, NULL),
(9, 'Krzysztof', 'Pieńkosz', NULL, NULL, NULL), 
(10, 'Michał', 'Rusinek', 1972, NULL, NULL);

INSERT INTO Rola_Tworcy (ID_Roli, Nazwa_Roli) VALUES
(1, 'Autor'), 
(2, 'Tłumaczenie'), 
(3, 'Redaktor'), 
(4, 'Ilustrator'), 
(5, 'Recenzent'),
(6, 'Współautor'), 
(7, 'Opracowanie'), 
(8, 'Projekt okładki'), 
(9, 'Wstęp'), 
(10, 'Komentarz');

INSERT INTO Wydawca (ID_Wydawcy, Nazwa_Wydawcy, Miasto) VALUES
(1, 'Świat Książki Wydawnictwo', 'Warszawa'), 
(2, 'Wydawnictwo Naukowe PWN', 'Warszawa'),
(3, 'Oficyna Wydawnicza RYTM', 'Warszawa'), 
(4, 'Oficyna Wydawnicza Politechniki Opolskiej', 'Opole'),
(5, 'Helion', 'Gliwice'), 
(6, 'Dressler Dublin Wydawca', 'Ożarów Mazowiecki'),
(7, 'Wydawnictwo Uniwersytetu Gdańskiego', 'Gdańsk'), 
(8, 'C.H. Beck', 'Warszawa'),
(9, 'Polskie Wydawnictwo Ekonomiczne', 'Warszawa'), 
(10, 'Znak', 'Kraków');

INSERT INTO Forma_Typ (ID_Formy, Nazwa_Formy) VALUES
(1, 'Książki'), 
(2, 'Proza'), 
(3, 'Publikacje dydaktyczne'), 
(4, 'Publikacje naukowe'), 
(5, 'Komiksy'),
(6, 'Czasopisma'), 
(7, 'Audiobooki'), 
(8, 'E-booki'), 
(9, 'Płyty CD/DVD'), 
(10, 'Zbiory specjalne');

INSERT INTO Jezyk (ID_Jezyka, Nazwa, Kod_ISO) VALUES
(1, 'polski', 'pl'), 
(2, 'angielski', 'en'), 
(3, 'niemiecki', 'de'), 
(4, 'rosyjski', 'ru'), 
(5, 'francuski', 'fr'),
(6, 'hiszpański', 'es'), 
(7, 'włoski', 'it'), 
(8, 'czeski', 'cs'), 
(9, 'ukraiński', 'uk'), 
(10, 'łaciński', 'la');

INSERT INTO Seria_Wydawnicza (ID_Serii, Tytul_Serii, ISSN_Serii) VALUES
(1, 'Studia i Monografie', '1429-6063'), 
(2, 'Klasyka Literatury', NULL),
(3, 'Informatyka Europejska', '1234-5678'), 
(4, 'Matematyka dla bystrzaków', NULL),
(5, 'Historia Najnowsza', '8765-4321'), 
(6, 'Studia i Monografie - Politechnika', '1429-6064'),
(7, 'Podręczniki Akademickie', NULL), 
(8, 'Biblioteka Prawnicza', '1111-2222'),
(9, 'Mistrzowie Prozy', NULL), 
(10, 'Nowe Technologie', '3333-4444');

INSERT INTO Dziedzina_Ujecie (ID_Dziedziny, Nazwa_Dziedziny) VALUES
(1, 'Inżynieria i technika'), 
(2, 'Matematyka'), 
(3, 'Nauki humanistyczne'), 
(4, 'Prawo'), 
(5, 'Medycyna'),
(6, 'Ekonomia i finanse'), 
(7, 'Informatyka'), 
(8, 'Literaturoznawstwo'), 
(9, 'Historia'), 
(10, 'Zarządzanie');

INSERT INTO Uzytkownik_Konto (ID_Uzytkownika, ID_Typu, Imie, Nazwisko, Data_Waznosci_Konta, Email, Nr_Tel) VALUES
(1, 1, 'Jan', 'Kowalski', '2027-04-20', 'jan.kowalski@ug.edu.pl', '123456789'),
(2, 2, 'Anna', 'Nowak', '2027-04-20', 'anna.nowak@ug.edu.pl', '987654321'),
(3, 1, 'Michał', 'Wiśniewski', '2027-01-15', 'michal.wisniewski@ug.edu.pl', '111222333'),
(4, 3, 'Zofia', 'Kaczmarek', '2027-10-10', 'zofia.kaczmarek@ug.edu.pl', '444555666'),
(5, 4, 'Tomasz', 'Zieliński', '2026-12-31', 'tomasz.zielinski@gmail.com', '777888999'),
(6, 5, 'Andrzej', 'Nowakowski', '2027-05-01', 'andrzej.nowakowski@ug.edu.pl', '555111222'),
(7, 1, 'Maria', 'Szymańska', '2027-05-01', 'maria.szymanska@ug.edu.pl', '555333444'),
(8, 1, 'Stanisław', 'Lewandowski', '2027-05-01', 'stanislaw.lewandowski@gmail.com', '555666777'),
(9, 5, 'Katarzyna', 'Wójcik', '2027-05-01', 'katarzyna.wojcik@pg.edu.pl', '555888999'),
(10, 4, 'Piotr', 'Kamiński', '2027-05-01', 'piotr.kaminski@gumed.edu.pl', '555000111');

INSERT INTO Zasob_Bibliograficzny (ID_Zasobu, ID_Gatunku, ID_Klasyfikacji, Tytul_Glowny, Tytul_ujednolicony, Rok_publikacji, Oznaczenie_Wydania, Opis_Fizyczny_Strony, Wymiar_cm) VALUES
(1, 1, 1, 'Zbrodnia i kara', NULL, 2023, NULL, '588, stron', 24.0),
(2, 2, 2, 'Matematyka dyskretna', 'Discrete mathematics (pol.)', 2005, 'Wyd. 5.', '899, s. : rys.', 24.0),
(3, 3, 3, 'Bezpieka', NULL, 2018, NULL, '517, strony : ilustracje', 25.0),
(4, 3, 3, 'Zastosowanie graficznych struktur...', NULL, 2018, 'Wyd. 2.', '211 stron : ilustracje, wykresy', 24.0),
(5, 2, 3, 'Grafy i sieci', NULL, 2013, 'Wydanie pierwsze.', 'X, 433 s. : il.', 24.0),
(6, 6, 7, 'Wiersze wybrane', NULL, 2010, 'Wyd. 1.', '120 s.', 20.0),
(7, 7, 10, 'Systemy baz danych', NULL, 2021, 'Wyd. 2.', '500 s. : il.', 24.5),
(8, 8, 6, 'Analiza matematyczna', NULL, 2015, NULL, '300 s.', 23.0),
(9, 9, 8, 'Mikroekonomia w praktyce', NULL, 2019, 'Wyd. 3.', '450 s.', 25.0),
(10, 7, 9, 'Prawo cywilne - zarys', NULL, 2022, 'Wyd. 4 zmienione.', '600 s.', 24.0);

INSERT INTO Egzemplarz (ID_Egzemplarza, ID_Reguly, ID_Lokalizacji, ID_Zasobu, Sygnatura) VALUES
(1, 2, 2, 1, '1131297'), 
(2, 1, 1, 3, '1058289'), 
(3, 2, 3, 2, '0215458'),
(4, 2, 3, 4, '1064538/1'), 
(5, 2, 3, 5, '0001234'), 
(6, 5, 6, 6, '1111111'),
(7, 3, 7, 7, '2222222'), 
(8, 4, 8, 8, '3333333'), 
(9, 1, 9, 9, '4444444'), 
(10, 5, 10, 10, '5555555');

INSERT INTO Transakcja_Wypozyczenia (ID_Egzemplarza, ID_Uzytkownika, Czas_Wypozyczenia, Planowany_Czas_Zwrotu, Rzeczywisty_Czas_Zwrotu) VALUES
(1, 1, '2026-04-10 10:00:00', '2026-04-13', '2026-04-12 12:30:00'),
(2, 2, '2026-04-15 09:15:00', '2026-05-15', NULL),
(3, 3, '2026-04-20 14:00:00', '2026-04-23', NULL),
(4, 4, '2026-03-01 11:00:00', '2026-03-04', '2026-03-03 16:45:00'),
(5, 5, '2026-02-15 13:20:00', '2026-02-18', '2026-02-17 09:10:00'),
(6, 6, '2026-05-01 10:00:00', '2026-05-31', NULL),
(7, 7, '2026-05-02 11:00:00', '2026-05-09', NULL),
(8, 8, '2026-04-20 12:00:00', '2026-05-20', '2026-05-05 10:00:00'),
(9, 9, '2026-05-05 13:00:00', '2026-05-05', '2026-05-05 18:00:00'),
(10, 10, '2026-05-06 14:00:00', '2026-05-09', NULL);

INSERT INTO Tytul_Alternatywny (ID_Tytul_Alt, ID_Zasobu, Typ, Wartosc) VALUES
(1, 1, 'Tytuł oryginału', 'Prestuplenie i nakazanie, 1866'),
(2, 2, 'Tytuł oryginału', 'Discrete mathematics, 1992'),
(3, 3, 'Tytuł równoległy', 'Secret Police'),
(4, 4, 'Skrót', 'ZGS'),
(5, 5, 'Tytuł oryginału', 'Graphs and Networks'),
(6, 6, 'Podtytuł', 'Poezje'),
(7, 7, 'Tytuł ang.', 'Database Systems'),
(8, 8, 'Skrót', 'AM'),
(9, 9, 'Tytuł ang.', 'Microeconomics'),
(10, 10, 'Skrót', 'PC');

INSERT INTO Uwaga_Bibliograficzna (ID_Uwagi, ID_Zasobu, Tresc_Uwagi) VALUES
(1, 1, 'Drugie miejsce wydania na podstawie e-ISBN.'), 
(2, 2, 'Indeks.'),
(3, 3, 'Ilustracje na wyklejkach.'), 
(4, 4, 'Bibliografia, netografia przy rozdziałach.'),
(5, 5, 'Dla studentów kierunków ścisłych.'), 
(6, 6, 'Dedykacja autora.'),
(7, 7, 'Dołączona płyta CD.'), 
(8, 8, 'Zawiera wzory.'),
(9, 9, 'Zaktualizowana o nowe przepisy.'), 
(10, 10, 'Stan prawny na 2022 rok.');

INSERT INTO Identyfikator (ID_Identyfikatora, ID_Zasobu, Typ, Wartosc) VALUES
(1, 1, 'ISBN', '9788382894806'), 
(2, 2, 'ISBN', '8301143800'), 
(3, 2, 'OCLC', '(OCoLC)749853906'),
(4, 3, 'ISBN', '9788373997844'), 
(5, 4, 'ISBN', '9788366033108'), 
(6, 6, 'ISBN', '9788300000001'),
(7, 7, 'ISBN', '9788300000002'), 
(8, 8, 'ISBN', '9788300000003'), 
(9, 9, 'ISBN', '9788300000004'),
(10, 10, 'ISBN', '9788300000005');

INSERT INTO Zasob_Temat (ID_Zasobu, ID_Tematu) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 4),
(6, 7), (7, 6), (8, 2), (9, 10), (10, 9);

INSERT INTO Zasob_Tworca (ID_Roli, ID_Tworcy, ID_Zasobu) VALUES
(1, 1, 1), (1, 2, 2), (2, 5, 2), (1, 3, 3), (1, 4, 4),
(1, 10, 6), (1, 6, 7), (1, 7, 8), (1, 8, 9), (1, 9, 10);

INSERT INTO Zasob_Wydawca (ID_Zasobu, ID_Wydawcy) VALUES
(1, 1), (2, 2), (3, 3), (4, 4), (5, 2),
(6, 10), (7, 8), (8, 7), (9, 9), (10, 8);

INSERT INTO Zasob_Forma (ID_Zasobu, ID_Formy) VALUES
(1, 1), (1, 2), (2, 1), (2, 3), (3, 1),
(6, 1), (7, 3), (8, 4), (9, 3), (10, 1);

INSERT INTO Zasob_Jezyk (ID_Jezyka, ID_Zasobu, Typ_Jezyka) VALUES
(1, 1, 'polski'), (1, 2, 'polski'), (1, 3, 'polski'), (1, 4, 'polski'), (1, 5, 'polski'),
(1, 6, 'polski'), (2, 7, 'angielski'), (1, 8, 'polski'), (1, 9, 'polski'), (1, 10, 'polski');

INSERT INTO Zasob_Seria (ID_Serii, ID_Zasobu, Numer_W_Serii) VALUES
(1, 4, 'z. 482'), (2, 1, 'Tom 1'), (4, 2, 'Vol 5'), (5, 3, NULL), (3, 5, 'No 2'),
(9, 6, NULL), (10, 7, 'Nr 1'), (7, 8, 'Tom 2'), (7, 9, 'Tom 3'), (8, 10, 'Zeszyt 4');

INSERT INTO Zasob_Dziedzina (ID_Zasobu, ID_Dziedziny) VALUES
(4, 1), (2, 2), (1, 3), (3, 4), (5, 2),
(6, 8), (7, 7), (8, 2), (9, 6), (10, 4);

-- OPERACJE DML ABY UNIKNĄĆ ANOMALII --
UPDATE transakcja_wypozyczenia
SET rzeczywisty_czas_zwrotu = planowany_czas_zwrotu - 1
WHERE rzeczywisty_czas_zwrotu IS NULL;

-- Aktualizacja sekwencji dla słowników i encji pomocniczych
SELECT setval('forma_typ_id_formy_seq', (SELECT MAX(ID_Formy) FROM Forma_Typ));
SELECT setval('klasyfikacja_ukd_id_klasyfikacji_seq', (SELECT MAX(ID_Klasyfikacji) FROM Klasyfikacja_UKD));
SELECT setval('gatunek_id_gatunku_seq', (SELECT MAX(ID_Gatunku) FROM Gatunek));
SELECT setval('jezyk_id_jezyka_seq', (SELECT MAX(ID_Jezyka) FROM Jezyk));
SELECT setval('wydawca_id_wydawcy_seq', (SELECT MAX(ID_Wydawcy) FROM Wydawca));
SELECT setval('rola_tworcy_id_roli_seq', (SELECT MAX(ID_Roli) FROM Rola_Tworcy));
SELECT setval('temat_haslo_id_tematu_seq', (SELECT MAX(ID_Tematu) FROM Temat_Haslo));
SELECT setval('osoba_tworca_id_tworcy_seq', (SELECT MAX(ID_Tworcy) FROM Osoba_Tworca));
SELECT setval('seria_wydawnicza_id_serii_seq', (SELECT MAX(ID_Serii) FROM Seria_Wydawnicza));
SELECT setval('dziedzina_ujecie_id_dziedziny_seq', (SELECT MAX(ID_Dziedziny) FROM Dziedzina_Ujecie));
SELECT setval('lokalizacja_fizyczna_id_lokalizacji_seq', (SELECT MAX(ID_Lokalizacji) FROM Lokalizacja_Fizyczna));
SELECT setval('regula_wypozyczenia_id_reguly_seq', (SELECT MAX(ID_Reguly) FROM Regula_Wypozyczenia));
SELECT setval('typ_uzytkownika_id_typu_seq', (SELECT MAX(ID_Typu) FROM Typ_Uzytkownika));

-- Aktualizacja sekwencji dla głównych encji zasobów i egzemplarzy
SELECT setval('zasob_bibliograficzny_id_zasobu_seq', (SELECT MAX(ID_Zasobu) FROM Zasob_Bibliograficzny));
SELECT setval('identyfikator_id_identyfikatora_seq', (SELECT MAX(ID_Identyfikatora) FROM Identyfikator));
SELECT setval('tytul_alternatywny_id_tytul_alt_seq', (SELECT MAX(ID_Tytul_Alt) FROM Tytul_Alternatywny));
SELECT setval('uwaga_bibliograficzna_id_uwagi_seq', (SELECT MAX(ID_Uwagi) FROM Uwaga_Bibliograficzna));
SELECT setval('egzemplarz_id_egzemplarza_seq', (SELECT MAX(ID_Egzemplarza) FROM Egzemplarz));

-- Aktualizacja sekwencji dla czytelników
SELECT setval('uzytkownik_konto_id_uzytkownika_seq', (SELECT MAX(ID_Uzytkownika) FROM Uzytkownik_Konto));
