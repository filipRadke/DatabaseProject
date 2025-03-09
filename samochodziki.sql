-- --------------------------------------------------------
-- Host:                         127.0.0.1
-- Wersja serwera:               11.4.4-MariaDB - mariadb.org binary distribution
-- Serwer OS:                    Win64
-- HeidiSQL Wersja:              12.8.0.6908
-- --------------------------------------------------------

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET NAMES utf8 */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


-- Zrzut struktury bazy danych samochodziki
CREATE DATABASE IF NOT EXISTS `samochodziki` /*!40100 DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci */;
USE `samochodziki`;

-- Zrzut struktury tabela samochodziki.czesci
CREATE TABLE IF NOT EXISTS `czesci` (
  `CzescID` int(11) NOT NULL AUTO_INCREMENT,
  `Nazwa` varchar(100) DEFAULT NULL,
  `Producent` varchar(100) DEFAULT NULL,
  `Cena` decimal(10,2) DEFAULT NULL,
  `IloscNaStanie` int(11) DEFAULT NULL,
  PRIMARY KEY (`CzescID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Eksport danych został odznaczony.

-- Zrzut struktury tabela samochodziki.klienci
CREATE TABLE IF NOT EXISTS `klienci` (
  `KlientID` int(11) NOT NULL AUTO_INCREMENT,
  `Imie` varchar(50) DEFAULT NULL,
  `Nazwisko` varchar(50) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Telefon` varchar(15) DEFAULT NULL,
  `Adres` varchar(200) DEFAULT NULL,
  PRIMARY KEY (`KlientID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Eksport danych został odznaczony.

-- Zrzut struktury tabela samochodziki.pojazdy
CREATE TABLE IF NOT EXISTS `samochody` (
  `PojazdID` int(11) NOT NULL AUTO_INCREMENT,
  `Marka` varchar(50) DEFAULT NULL,
  `Model` varchar(50) DEFAULT NULL,
  `RokProdukcji` year(4) DEFAULT NULL,
  `VIN` varchar(17) DEFAULT NULL,
  `Przebieg` int(11) DEFAULT NULL,
  `Kolor` varchar(30) DEFAULT NULL,
  `Cena` decimal(10,2) DEFAULT NULL,
  `Status` enum('Dostepny','Sprzedany','W naprawie','Zarezerwowany') DEFAULT NULL,
  PRIMARY KEY (`PojazdID`, `VIN`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;


ALTER TABLE `samochody`
DROP PRIMARY KEY,
ADD PRIMARY KEY (`PojazdID`),
ADD UNIQUE (`VIN`);


RENAME TABLE `samochody` TO `pojazdy`;


-- Eksport danych został odznaczony.

-- Zrzut struktury tabela samochodziki.pracownicy
CREATE TABLE IF NOT EXISTS `pracownicy` (
  `PracownikID` int(11) NOT NULL AUTO_INCREMENT,
  `Imie` varchar(50) DEFAULT NULL,
  `Nazwisko` varchar(50) DEFAULT NULL,
  `Stanowisko` varchar(100) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Telefon` varchar(15) DEFAULT NULL,
  `Dostepny` tinyint(1) DEFAULT NULL,
  PRIMARY KEY (`PracownikID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Eksport danych został odznaczony.

-- Zrzut struktury tabela samochodziki.rezerwacje
CREATE TABLE IF NOT EXISTS `rezerwacje` (
  `RezerwacjaID` int(11) NOT NULL AUTO_INCREMENT,
  `KlientID` int(11) DEFAULT NULL,
  `PojazdID` int(11) DEFAULT NULL,
  `DataRezerwacji` datetime DEFAULT NULL,
  `DataWygasniecia` datetime DEFAULT NULL,
  `Status` enum('Aktywna','Anulowana','Zrealizowana') DEFAULT NULL,
  PRIMARY KEY (`RezerwacjaID`),
  KEY `KlientID1` (`KlientID`),
  KEY `PojazdID1` (`PojazdID`),
  CONSTRAINT `KlientID1` FOREIGN KEY (`KlientID`) REFERENCES `klienci` (`KlientID`) on delete cascade,
  CONSTRAINT `PojazdID1` FOREIGN KEY (`PojazdID`) REFERENCES `pojazdy` (`PojazdID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Eksport danych został odznaczony.

-- Zrzut struktury tabela samochodziki.serwis
CREATE TABLE IF NOT EXISTS `serwis` (
  `SerwisID` int(11) NOT NULL AUTO_INCREMENT,
  `PojazdID` int(11) DEFAULT NULL,
  `PracownikID` int(11) DEFAULT NULL,
  `OpisProblemu` text DEFAULT NULL,
  `DataPrzyjecia` datetime DEFAULT NULL,
  `DataZakonczenia` datetime DEFAULT NULL,
  `Koszt` decimal(10,2) DEFAULT NULL,
  `Status` enum('W trakcie','Zakonczony','Anulowany') DEFAULT NULL,
  PRIMARY KEY (`SerwisID`),
  KEY `PojazdID2` (`PojazdID`),
  KEY `PracownikID` (`PracownikID`),
  CONSTRAINT `PracownikID` FOREIGN KEY (`PracownikID`) REFERENCES `pracownicy` (`PracownikID`),
  CONSTRAINT `PojazdID2` FOREIGN KEY (`PojazdID`) REFERENCES `pojazdy` (`PojazdID`) on delete cascade
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Eksport danych został odznaczony.

-- Zrzut struktury tabela samochodziki.serwisczesci
CREATE TABLE IF NOT EXISTS `serwisczesci` (
  `SerwiscCzescID` int(11) NOT NULL AUTO_INCREMENT,
  `SerwisID` int(11) DEFAULT NULL,
  `CzescID` int(11) DEFAULT NULL,
  `Ilosc` int(11) DEFAULT NULL,
  PRIMARY KEY (`SerwiscCzescID`),
  KEY `SerwisID` (`SerwisID`),
  KEY `CzescID` (`CzescID`),
  CONSTRAINT `SerwisID` FOREIGN KEY (`SerwisID`) REFERENCES `serwis` (`SerwisID`) on delete cascade,
  CONSTRAINT `CzescID` FOREIGN KEY (`CzescID`) REFERENCES `czesci` (`CzescID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- Eksport danych został odznaczony.

-- Zrzut struktury tabela samochodziki.transakcje
CREATE TABLE IF NOT EXISTS `transakcje` (
  `TransakcjaID` int(11) NOT NULL AUTO_INCREMENT,
  `KlientID` int(11) DEFAULT NULL,
  `PojazdID` int(11) DEFAULT NULL,
  `DataTransakcji` timestamp NULL DEFAULT current_timestamp(),
  `Kwota` decimal(10,2) DEFAULT NULL,
  `TypTransakcji` enum('Sprzedaż','Serwis','Rezerwacja') DEFAULT NULL,
  PRIMARY KEY (`TransakcjaID`),
  KEY `KlientID2` (`KlientID`),
  KEY `PojazdID3` (`PojazdID`),
  CONSTRAINT `KlientID2` FOREIGN KEY (`KlientID`) REFERENCES `klienci` (`KlientID`),
  CONSTRAINT `PojazdID3` FOREIGN KEY (`PojazdID`) REFERENCES `pojazdy` (`PojazdID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

CREATE TABLE IF NOT EXISTS `temporaryTable` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `Imie` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

Insert into temporaryTable ( Imie) values ('Jan');

truncate table temporaryTable;

DROP TABLE temporaryTable;

CREATE INDEX `idx_czescid` ON `czesci` (`CzescID`);
CREATE INDEX `idx_klientid` ON `klienci` (`KlientID`);
CREATE INDEX `idx_pojazdid` ON `pojazdy` (`PojazdID`);
CREATE INDEX `idx_pracownikid` ON `pracownicy` (`PracownikID`);
CREATE INDEX `idx_rezerwacjaid` ON `rezerwacje` (`RezerwacjaID`);
CREATE INDEX `idx_serwisid` ON `serwis` (`SerwisID`);
CREATE INDEX `idx_serwisczescid` ON `serwisczesci` (`SerwiscCzescID`);
CREATE INDEX `idx_transakcjaid` ON `transakcje` (`TransakcjaID`);

-- Eksport danych został odznaczony.

/*!40103 SET TIME_ZONE=IFNULL(@OLD_TIME_ZONE, 'system') */;
/*!40101 SET SQL_MODE=IFNULL(@OLD_SQL_MODE, '') */;
/*!40014 SET FOREIGN_KEY_CHECKS=IFNULL(@OLD_FOREIGN_KEY_CHECKS, 1) */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40111 SET SQL_NOTES=IFNULL(@OLD_SQL_NOTES, 1) */;