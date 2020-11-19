DROP TABLE IF EXISTS Wysyłka;
DROP TABLE IF EXISTS Dostawa;
DROP TABLE IF EXISTS Oferta;
DROP TABLE IF EXISTS Licytacja;
DROP TABLE IF EXISTS Przedmiot;
DROP TABLE IF EXISTS Użytkownik;

CREATE TABLE Dostawa(
    id                          VARCHAR(10),
    nazwa                       VARCHAR(20) NOT NULL,
    firma_realizujaca_dostawe   VARCHAR(20) NOT NULL,
    cena                        MONEY NOT NULL,
    CONSTRAINT pk_dostawy PRIMARY KEY (id)
);

CREATE TABLE Użytkownik (
    login                VARCHAR(30),
    imię                 VARCHAR(20) NOT NULL,
    nazwisko             VARCHAR(20) NOT NULL,
    adres_zamieszkania   VARCHAR(50) NOT NULL,
    adres_email          VARCHAR(40) NOT NULL,
    numer_konta          BIGINT,
    adres_dostawy        VARCHAR(50),
    telefon              BIGINT,
    CONSTRAINT pk_użytkownik PRIMARY KEY (login)
);

CREATE TABLE Przedmiot (
    numer              VARCHAR(10),
    nazwa              VARCHAR(40) NOT NULL,
    kategoria          VARCHAR(20) NOT NULL,
    cena_wyjściowa     MONEY NOT NULL,
    opis               VARCHAR(200),
    cena_zakupu        MONEY,
    Użytkownik_login   VARCHAR(30),
    CONSTRAINT pk_przedmiot PRIMARY KEY (numer),
    CONSTRAINT fk_przedmiot FOREIGN KEY (Użytkownik_login) REFERENCES Użytkownik ( login )
);

CREATE TABLE Licytacja (
    id                 VARCHAR(10),
    data_rozpoczęcia   DATETIME NOT NULL,
    data_zakończenia   DATETIME NOT NULL,
    status             VARCHAR(20) NOT NULL,
    Przedmiot_numer    VARCHAR(10) NOT NULL,
    Użytkownik_login   VARCHAR(30),
    CONSTRAINT pk_licytacja PRIMARY KEY (id),
    CONSTRAINT fk_licytacja1 FOREIGN KEY (Przedmiot_numer) REFERENCES Przedmiot (numer),
    CONSTRAINT fk_licytacja2 FOREIGN KEY (Użytkownik_login) REFERENCES Użytkownik (login)
);

CREATE TABLE Oferta (
    data_i_godzina     DATETIME,
    kwota              MONEY NOT NULL,
    Licytacja_id       VARCHAR(10),
    Użytkownik_login   VARCHAR(30) NOT NULL,
    CONSTRAINT fk_oferta1 FOREIGN KEY (Licytacja_id) REFERENCES Licytacja (id),
    CONSTRAINT fk_oferta2 FOREIGN KEY (Użytkownik_login) REFERENCES Użytkownik (login),
    PRIMARY KEY ( data_i_godzina,  Użytkownik_login)
);

CREATE TABLE Wysyłka (
    Dostawa_id        VARCHAR(10),
    Przedmiot_numer   VARCHAR(10),
    CONSTRAINT fk_wysylka1 FOREIGN KEY (Dostawa_id) REFERENCES Dostawa (id),
    CONSTRAINT fk_wysylka2 FOREIGN KEY (Przedmiot_numer) REFERENCES Przedmiot (numer),
    PRIMARY KEY ( Dostawa_id, Przedmiot_numer )
);

INSERT INTO Użytkownik VALUES
('Macca', 'Paul', 'McCartney', '251 Menlove Avenue Liverpool', 'macca@yahoo.com', 2963824462, '251 Menlove Avenue Liverpool', null),
('Lennie', 'John', 'Lennon', '20 Forthlin Road Liverpool', 'lennie@gmail.com', 8462738105, '20 Forthlin Road Liverpool', null ),
('Harry', 'George', 'Harrison', '12 Arnold Grove Liverpool', 'harry@abbeystudio.com', 2132176427,'12 Arnold Grove Liverpool', null),
('Ringo', 'Richard', 'Starkey', '9 Madryn Street Liverpool', 'ringo@gmail.com', 9453916283, '9 Madryn Street Liverpool', null);

INSERT INTO Przedmiot VALUES
('1', 'gitara basowa', 'instrumenty', 1000, 'Używana gitara basowa dobrej jakości', 3000, 'Macca'),
('2', 'order Imperium Brytyjskiego', 'nagrody', 500, 'Nieużywany. Dostałem od Królowej, ale nie potrzebuję', 2000, 'Lennie'),
('3', 'sitar', 'instrumenty', 300, 'Chłopacy po nagraniach do "sgt peppers lonely hearts club band " kazali mi sprzedać sitar', 2500, 'Harry'),
('4', 'rower', 'sport', 200, 'Rower używany podczas nagrania "Help". Teraz chłopacy pozwolili mi napisać piosenkę do albumu, więc nie będę już chyba musiał jeżdzić na rowerze w tle',650, 'Ringo');

INSERT INTO Dostawa VALUES
('1', 'DPD', 'DPD', 10),
('2', 'Inpost', 'Inpost', 8),
('3', 'Odbiór własny', '', 0);

INSERT INTO Wysyłka VALUES
('1','1'),
('3','1'),
('2','2'),
('3','2'),
('3','3'),
('3','4');

INSERT INTO Licytacja VALUES
('1', '09-05-2020', '11-05-2020', 'w trakcie', '1', null),
('2', '01-05-2020', '12-05-2020', 'w trakcie', '2', null),
('3', '02-05-2020', '11-05-2020', 'zakończona kupnem', '3', 'Ringo'),
('4', '10-05-2020', '11-05-2020', 'zakończona bez kupna', '4', null)

INSERT INTO Oferta VALUES
('10-05-2020 19:50:00', 1700, '1', 'Harry'),
('10-05-2020 21:50:00', 2000, '1', 'Ringo'),
('10-05-2020 11:50:00', 1500, '2', 'Harry'),
('10-05-2020 12:30:00', 2400, '3', 'Macca');

SELECT * FROM Użytkownik;
SELECT * FROM Wysyłka;
SELECT * FROM Przedmiot;
SELECT * FROM Oferta;
SELECT * FROM Dostawa;
SELECT * FROM Licytacja;

