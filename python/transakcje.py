from datetime import datetime, timedelta
import random

typy = ['Sprzedaz','Serwis','Rezerwacja']

def generate_sql_file(filename, rows):
    with open(filename, 'w') as file:
        for i in range(rows):
            klient_id = random.randint(1,2500)
            pojazd_id = random.randint(1,2500)
            kwota = random.randint(100,10000)
            typ = random.choice(typy)
            
            # Wpis do tabeli
            file.write(f"INSERT INTO transakcje (KlientID,PojazdID,Kwota,TypTransakcji) " f"VALUES ({klient_id}, {pojazd_id}, {kwota}, '{typ}');\n")

# Wywołanie funkcji do stworzenia pliku SQL
generate_sql_file("transakcje.sql", 3000)