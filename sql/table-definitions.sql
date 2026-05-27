-- MODUŁY --
CREATE EXTENSION IF NOT EXISTS "uuid-ossp";

-- DEFINICJE TABEL -- 
CREATE TABLE Forma_Typ (
	ID_Formy BIGSERIAL,
	Nazwa_Formy VARCHAR(50),
	CONSTRAINT pk_Forma_Typ PRIMARY KEY (ID_Formy)
);

CREATE TABLE Klasyfikacja_UKD (
	ID_Klasyfikacji BIGSERIAL,
	Symbol VARCHAR(30),
	Opis TEXT,
	CONSTRAINT pk_Klasyfikacja_UKD PRIMARY KEY (ID_Klasyfikacji)
);


CREATE TABLE Gatunek (
	ID_Gatunku BIGSERIAL,
	Nazwa_Gatunku VARCHAR(30),
	CONSTRAINT pk_Gatunek PRIMARY KEY (ID_Gatunku)
);

CREATE TABLE Zasob_Bibliograficzny (
	ID_Zasobu BIGSERIAL,
	ID_Gatunku BIGINT,
	ID_Klasyfikacji BIGINT,
	Tytul_Glowny VARCHAR(100) NOT NULL,
	Tytul_ujednolicony VARCHAR(100),
	Rok_publikacji SMALLINT,
	Oznaczenie_Wydania VARCHAR(30),
	Opis_Fizyczny_Strony VARCHAR(50),
	Wymiar_cm DECIMAL(4,1),
	CONSTRAINT pk_Zasob_Bibliograficzny PRIMARY KEY (ID_Zasobu),
	CONSTRAINT fk_Zasob_Bibliograficzny_ID_Klasyfikacji FOREIGN KEY (ID_Klasyfikacji) REFERENCES Klasyfikacja_UKD (ID_Klasyfikacji) ON DELETE RESTRICT,
	CONSTRAINT fk_Zasob_Bibliograficzny_ID_Gatunku FOREIGN KEY (ID_Gatunku) REFERENCES Gatunek (ID_Gatunku) ON DELETE RESTRICT,
	CHECK (Rok_publikacji > 1000), -- Rok publikacji wydania Republiki Platona (powstałej ok. 380 p.n.e) nie jest równoważna roku stworzenia dzieła
	CHECK (Wymiar_cm > 0)
);

CREATE TABLE Identyfikator (
	ID_Identyfikatora SERIAL,
    ID_Zasobu BIGINT, 
	Typ VARCHAR(10),
	Wartosc VARCHAR(40),
	CONSTRAINT pk_Identyfikatora PRIMARY KEY (ID_Identyfikatora),
	CONSTRAINT fk_Identyfikatora_ID_Zasobu FOREIGN KEY (ID_Zasobu) REFERENCES Zasob_Bibliograficzny (ID_Zasobu) ON DELETE CASCADE
);

CREATE TABLE Tytul_Alternatywny (
	ID_Tytul_Alt BIGSERIAL,
	ID_Zasobu BIGINT,
	Typ VARCHAR(30),
	Wartosc VARCHAR(50),
	CONSTRAINT pk_Tytul_Alternatywny PRIMARY KEY (ID_Tytul_Alt),
	CONSTRAINT fk_Tytul_Alternatywny FOREIGN KEY (ID_Zasobu) REFERENCES Zasob_Bibliograficzny (ID_Zasobu) ON DELETE CASCADE
);

CREATE TABLE Uwaga_Bibliograficzna (
	ID_Uwagi BIGSERIAL,
	ID_Zasobu BIGINT,
	Tresc_Uwagi TEXT,
	CONSTRAINT pk_Uwaga_Bibliograficzna PRIMARY KEY (ID_Uwagi),
	CONSTRAINT fk_Uwaga_Bibliograficzna_ID_Zasobu FOREIGN KEY (ID_Zasobu) REFERENCES Zasob_Bibliograficzny (ID_Zasobu) ON DELETE CASCADE
);

CREATE TABLE Zasob_Forma (
	ID_Zasobu BIGINT,
	ID_Formy BIGINT,
	CONSTRAINT pk_Zasob_Forma PRIMARY KEY (ID_Zasobu, ID_Formy),
	CONSTRAINT fk_Zasob_Forma_ID_Zasobu FOREIGN KEY (ID_Zasobu) REFERENCES Zasob_Bibliograficzny (ID_Zasobu) ON DELETE CASCADE,
	CONSTRAINT fk_Zasob_Forma_ID_Formy FOREIGN KEY (ID_Formy) REFERENCES Forma_Typ (ID_Formy) ON DELETE RESTRICT
);



CREATE TABLE Jezyk (
	ID_Jezyka BIGSERIAL,
	Nazwa VARCHAR(30),
	KOD_ISO CHAR(2),
	CONSTRAINT pk_Jezyk PRIMARY KEY (ID_Jezyka)
);

CREATE TABLE Zasob_Jezyk (
	ID_Jezyka BIGINT,
	ID_Zasobu BIGINT,
	Typ_Jezyka VARCHAR(30),
	CONSTRAINT pk_Zasob_Jezyk PRIMARY KEY (ID_Jezyka, ID_Zasobu),
	CONSTRAINT fk_Zasob_Jezyk_ID_Jezyka FOREIGN KEY (ID_Jezyka) REFERENCES Jezyk (ID_Jezyka) ON DELETE RESTRICT,
	CONSTRAINT fk_Zasob_Jezyk_ID_Zasobu FOREIGN KEY (ID_Zasobu) REFERENCES Zasob_Bibliograficzny (ID_Zasobu) ON DELETE CASCADE
);

CREATE TABLE Wydawca (
	ID_Wydawcy BIGSERIAL,
	Nazwa_Wydawcy VARCHAR(100),
	Miasto VARCHAR(50),
	CONSTRAINT pk_Wydawca PRIMARY KEY (ID_Wydawcy)
);

CREATE TABLE Rola_Tworcy (
	ID_Roli BIGSERIAL,
	Nazwa_Roli VARCHAR(30),
	CONSTRAINT pk_Rola_Tworcy PRIMARY KEY (ID_Roli)
);

CREATE TABLE Temat_Haslo (
	ID_Tematu BIGSERIAL,
	Nazwa_Hasla VARCHAR(100),
	CONSTRAINT pk_Temat_Haslo PRIMARY KEY (ID_Tematu)
);

CREATE TABLE Osoba_Tworca (
	ID_Tworcy BIGSERIAL,
	Imie VARCHAR(100) NOT NULL,
	Nazwisko VARCHAR(100) NOT NULL,
	Rok_Urodzenia SMALLINT,
	Rok_Smierci SMALLINT,
	Atrybut_Wyrozniajacy VARCHAR(50),
	CONSTRAINT pk_Osoba_Tworca PRIMARY KEY (ID_Tworcy)
);

CREATE TABLE Zasob_Wydawca (
	ID_Zasobu BIGINT,
	ID_Wydawcy BIGINT,
	CONSTRAINT pk_Zasob_Wydawca PRIMARY KEY (ID_Zasobu, ID_Wydawcy),
	CONSTRAINT fk_Zasob_Wydawca_ID_Zasobu FOREIGN KEY (ID_Zasobu) REFERENCES Zasob_Bibliograficzny (ID_Zasobu) ON DELETE CASCADE,
	CONSTRAINT fk_Zasob_Wydawca_ID_Wydawcy FOREIGN KEY (ID_Wydawcy) REFERENCES Wydawca (ID_Wydawcy) ON DELETE RESTRICT
);
 
CREATE TABLE Zasob_Tworca (
	ID_Roli BIGINT,
	ID_Tworcy BIGINT,
	ID_Zasobu BIGINT,
	CONSTRAINT pk_Zasob_Tworca PRIMARY KEY (ID_Roli, ID_Tworcy, ID_Zasobu),
	CONSTRAINT fk_Zasob_Tworca_ID_Roli FOREIGN KEY (ID_Roli) REFERENCES Rola_Tworcy (ID_Roli) ON DELETE RESTRICT,
    CONSTRAINT fk_Zasob_Tworca_ID_Tworcy FOREIGN KEY (ID_Tworcy) REFERENCES Osoba_Tworca (ID_Tworcy) ON DELETE RESTRICT,
    CONSTRAINT fk_Zasob_Tworca_ID_Zasobu FOREIGN KEY (ID_Zasobu) REFERENCES Zasob_Bibliograficzny (ID_Zasobu) ON DELETE CASCADE
);


CREATE TABLE Zasob_Temat (
	ID_Zasobu BIGINT,
	ID_Tematu BIGINT,
	CONSTRAINT pk_Zasob_Temat PRIMARY KEY (ID_Zasobu, ID_Tematu),
	CONSTRAINT fk_Zasob_Temat_ID_Zasobu FOREIGN KEY (ID_Zasobu) REFERENCES Zasob_Bibliograficzny (ID_Zasobu) ON DELETE CASCADE,
    CONSTRAINT fk_Zasob_Temat_ID_Tematu FOREIGN KEY (ID_Tematu) REFERENCES Temat_Haslo (ID_Tematu) ON DELETE RESTRICT
);


CREATE TABLE Seria_Wydawnicza (
	ID_Serii BIGSERIAL,
	Tytul_Serii VARCHAR(50),
	ISSN_Serii CHAR(9) UNIQUE,
	CONSTRAINT pk_Seria_Wydawnicza PRIMARY KEY (ID_Serii)    
);

CREATE TABLE Zasob_Seria (
	ID_Serii BIGINT,
	ID_Zasobu BIGINT,
	Numer_W_Serii VARCHAR(15),
	CONSTRAINT pk_Zasob_Seria PRIMARY KEY (ID_Serii,ID_Zasobu),
	CONSTRAINT fk_Zasob_Seria_ID_Serii FOREIGN KEY (ID_Serii) REFERENCES Seria_Wydawnicza (ID_Serii) ON DELETE RESTRICT,
	CONSTRAINT fk_Zasob_Seria_ID_Zasobu FOREIGN KEY (ID_Zasobu) REFERENCES Zasob_Bibliograficzny (ID_Zasobu) ON DELETE CASCADE
);            


CREATE TABLE Dziedzina_Ujecie (
	ID_Dziedziny BIGSERIAL,
	Nazwa_Dziedziny VARCHAR(30),
	CONSTRAINT pk_Dziedzina_Ujecie PRIMARY KEY (ID_Dziedziny)
);

CREATE TABLE Zasob_Dziedzina (
	ID_Zasobu BIGINT,
	ID_Dziedziny BIGINT,
	CONSTRAINT pk_Zasob_Dziedzina PRIMARY KEY (ID_Zasobu, ID_Dziedziny),
	CONSTRAINT fk_Zasob_Dziedzina_ID_Zasobu FOREIGN KEY (ID_Zasobu) REFERENCES Zasob_Bibliograficzny (ID_Zasobu) ON DELETE CASCADE,
	CONSTRAINT fk_Zasob_Dziedzina_ID_Dziedziny FOREIGN KEY (ID_Dziedziny) REFERENCES Dziedzina_Ujecie (ID_Dziedziny) ON DELETE RESTRICT
);

CREATE TABLE Lokalizacja_Fizyczna (
	ID_Lokalizacji BIGSERIAL,
	Nazwa_Oddzialu VARCHAR(100),
	Nazwa_Strefy VARCHAR(50),
	Pietro SMALLINT,
	CONSTRAINT pk_Lokalizacja_Fizyczna PRIMARY KEY (ID_Lokalizacji)
);

CREATE TABLE Regula_Wypozyczenia (
	ID_Reguly BIGSERIAL,
	Nazwa_Reguly VARCHAR(69),
	Limit_Dni SMALLINT,
	Czy_Mozliwa_Prolongata BOOL,
	CONSTRAINT pk_Regula_Wypozyczenia PRIMARY KEY (ID_Reguly),
	CHECK (Limit_Dni IN (0,3,5,7,30)) 
);

CREATE TABLE Typ_Uzytkownika (
	ID_Typu BIGSERIAL,
	Nazwa VARCHAR(50),
	Limit_Wypozyczen SMALLINT,
	CHECK (Limit_Wypozyczen > 0),
	CONSTRAINT pk_Typ_Uzytkownika PRIMARY KEY (ID_Typu)
);     
    
CREATE TABLE Egzemplarz (
	ID_Egzemplarza BIGSERIAL,
	ID_Reguly BIGINT,
	ID_Lokalizacji BIGINT,
	ID_Zasobu BIGINT,
	Sygnatura VARCHAR(15) NOT NULL,
	CONSTRAINT pk_Egzemplarza PRIMARY KEY (ID_Egzemplarza),
	CONSTRAINT fk_Egzemplarza_ID_Reguly FOREIGN KEY (ID_Reguly) REFERENCES Regula_Wypozyczenia (ID_Reguly),
	CONSTRAINT fk_Egzemplarza_ID_Lokalizacji FOREIGN KEY (ID_Lokalizacji) REFERENCES Lokalizacja_Fizyczna (ID_Lokalizacji),
	CONSTRAINT fk_Egzemplarza_ID_Zasobu FOREIGN KEY (ID_Zasobu) REFERENCES Zasob_Bibliograficzny (ID_Zasobu)
);

CREATE TABLE Uzytkownik_Konto (
	ID_Uzytkownika SERIAL,
	ID_Typu BIGINT,
	Imie VARCHAR(100),
	Nazwisko VARCHAR(100),
	Data_Waznosci_Konta DATE DEFAULT (CURRENT_DATE + INTERVAL '1 year'),
	Email VARCHAR(100),
	Nr_Tel VARCHAR(15),
	CONSTRAINT email_lub_tel_wymagany CHECK (
    (Email IS NOT NULL AND Email != '') 
    OR 
    (Nr_Tel IS NOT NULL AND Nr_Tel != '')
),
	CONSTRAINT pk_Uzytkownik_Konto PRIMARY KEY (ID_Uzytkownika),
	CONSTRAINT fk_Uzytkownik_Konto_ID_Typu FOREIGN KEY (ID_Typu) REFERENCES Typ_Uzytkownika (ID_Typu)
	
);

CREATE TABLE Transakcja_Wypozyczenia (
	ID_Transakcji UUID DEFAULT uuid_generate_v4(), -- generuje w locie unikalny identyfikator (UUID v4) za pomocą www.postgresql.org/docs/current/uuid-ossp.html
												   -- Powód biznesowy: konkurencja nie może oszacować liczby transakcji w systemie (co jest możliwe przy sekwencji AI o 1 w górę) 
                                                   -- CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
	ID_Egzemplarza BIGINT,
	ID_Uzytkownika INT,
	Czas_Wypozyczenia TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
	Planowany_Czas_Zwrotu DATE,
	Rzeczywisty_Czas_Zwrotu TIMESTAMP,
	CONSTRAINT pk_Transakcja_Wypozyczenia PRIMARY KEY (ID_Transakcji),
	CONSTRAINT fk_Transakcja_Wypozyczenia_ID_Egzemplarza FOREIGN KEY (ID_Egzemplarza) REFERENCES Egzemplarz (ID_Egzemplarza) ON DELETE SET NULL,
	CONSTRAINT fk_Transakcja_Wypozyczenia_ID_Uzytkownika FOREIGN KEY (ID_Uzytkownika) REFERENCES Uzytkownik_Konto (ID_Uzytkownika) ON DELETE SET NULL,
	CHECK (Planowany_Czas_Zwrotu >= DATE(Czas_Wypozyczenia))
);
