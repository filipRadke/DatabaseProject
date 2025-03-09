SELECT Imie, Nazwisko, Email
FROM klienci
WHERE KlientID IN (SELECT KlientID FROM rezerwacje WHERE Status = 'Aktywna');

WITH AkytwneRezerwacje AS (
    SELECT KlientID, COUNT(*) AS LiczbaRezerwacji
    FROM rezerwacje
    WHERE Status = 'Aktywna'
    GROUP BY KlientID
)
SELECT k.KlientID, k.Imie, ar.LiczbaRezerwacji
FROM klienci k
JOIN AkytwneRezerwacje ar ON k.KlientID = ar.KlientID
ORDER BY ar.LiczbaRezerwacji DESC;

SELECT Imie, Nazwisko, SUBSTRING(Email, 1, 5) AS EmailStart
FROM klienci;

SELECT KlientID, SUM(Kwota) AS TotalSpent
FROM transakcje
GROUP BY KlientID;

SELECT KlientID, AVG(Kwota) AS AverageSpent
FROM transakcje
GROUP BY KlientID
HAVING AVG(Kwota) > 500;

SELECT s.SerwisID, s.OpisProblemu, sc.TotalCzesci
FROM serwis s
JOIN (
    SELECT SerwisID, COUNT(*) AS TotalCzesci
    FROM serwisczesci
    GROUP BY SerwisID
) sc ON s.SerwisID = sc.SerwisID;

SELECT Email, SUBSTRING_INDEX(Email, '.', -1) AS Domain
FROM klienci;

SELECT *
FROM transakcje
WHERE Kwota > (SELECT AVG(Kwota) FROM transakcje);

SELECT 
    MIN(Kwota) AS SmallestTransaction,
    MAX(Kwota) AS BiggestTransaction
FROM transakcje;

SELECT CzescID, SUM(Ilosc) AS TotalUsed
FROM serwisczesci
GROUP BY CzescID
ORDER BY TotalUsed ASC
LIMIT 1;

SELECT CzescID, SUM(Ilosc) AS TotalUsed
FROM serwisczesci
GROUP BY CzescID
ORDER BY TotalUsed DESC
LIMIT 1;