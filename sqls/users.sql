--user admin
CREATE USER 'admin'@'%' IDENTIFIED BY 'admin123';
GRANT ALL PRIVILEGES ON *.* TO 'admin'@'%' WITH GRANT OPTION;
-- user manager
CREATE USER 'manager'@'%' IDENTIFIED BY 'manager123';
GRANT SELECT ON `samochodziki`.`PrzypisaniPracownicy` TO 'manager'@'%';
GRANT SELECT ON `samochodziki`.`klientrezerwacje` TO 'manager'@'%';
GRANT SELECT ON `samochodziki`.`klienci` TO 'manager'@'%';
GRANT SELECT ON `samochodziki`.`rezerwacje` TO 'manager'@'%';
GRANT ALL PRIVILEGES ON `samochodziki`.`serwis` TO 'manager'@'%';
-- user mechanik
CREATE USER 'mechanik'@'%' IDENTIFIED BY 'mechanik123';
GRANT SELECT, UPDATE ON `samochodziki`.`serwis` TO 'mechanik'@'%';
GRANT SELECT, INSERT, UPDATE, DELETE ON `samochodziki`.`serwisczesci` TO 'mechanik'@'%';
GRANT ALL PRIVILEGES ON ON `samochodziki`.`czesci` TO 'mechanik'@'%';
-- user ksiegowa
CREATE USER 'ksiegowa'@'%' IDENTIFIED BY 'ksiegowa123';
GRANT SELECT, INSERT, UPDATE, DELETE ON `samochodziki`.`transakcje` TO 'ksiegowa'@'%';
-- user klient
CREATE USER 'klient'@'%' IDENTIFIED BY 'klient123';
GRANT SELECT, UPDATE ON `samochodziki`.`rezerwacje` TO 'klient'@'%';
GRANT SELECT, UPDATE ON `samochodziki`.`transakcje` TO 'klient'@'%';
-- user janusz
CREATE USER 'janusz'@'%' IDENTIFIED BY 'janusz123';

FLUSH PRIVILEGES;