DELIMITER //

CREATE FUNCTION generate_email(firstName VARCHAR(50), secondName VARCHAR(50))
RETURNS VARCHAR(100)
DETERMINISTIC
BEGIN
    RETURN CONCAT(LOWER(firstName), '.', LOWER(secondName), '@example.com');
END //

CREATE TRIGGER `emailCheck` BEFORE UPDATE ON `klienci` FOR EACH ROW BEGIN
IF new.Email NOT LIKE("%@%.%" ) THEN
SET new.Email = generate_email(new.Imie, new.Nazwisko);
END IF;
END //

DELIMITER ;

CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `PrzypisaniPracownicy` AS 
SELECT p.PracownikID, p.Imie, p.Stanowisko, s.SerwisID FROM pracownicy p
JOIN serwis s WHERE s.PracownikID = p.PracownikID;

ALTER ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `klientrezerwacje` AS 
SELECT k.KlientID, k.Imie, COUNT(r.RezerwacjaID) FROM klienci k
JOIN rezerwacje r WHERE r.KlientID = k.KlientID
GROUP BY k.KlientID;