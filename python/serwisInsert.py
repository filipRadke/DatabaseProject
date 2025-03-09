from datetime import datetime, timedelta
import random

def losowa_data(start,end):
    start_date = datetime(start, 1, 1)
    end_date = datetime(end, 12, 31)
    random_date = start_date + timedelta(days=random.randint(0, (end_date - start_date).days))
    return (random_date).strftime("%Y-%m-%d")

statusy = ["Aktywna","Anulowana","Zrealizowana"]

problemy = ['Wymiana opon','Naprawa silnika','Wymiana klockow hamulcowych','Usterka klimatyzacji','Sprawdzenie ukladu elektrycznego','Naprawa zawieszenia','Wymiana akumulatora','Regeneracja turbosprezarki','Wymiana oleju','Diagnostyka komputerowa']

def generate_sql_file(filename, rows):
    with open(filename, 'w') as file:
        for i in range(rows):
            pojazd_id = random.randint(1,2500)
            pracownik_id = random.randint(1,500)
            problem = random.choice(problemy)
            data_przyjecia = losowa_data(2020,2022)
            data_zakonczenia = losowa_data(2023,2024)
            koszt = random.randint(100,10000)
            status = random.choice(statusy)
            
            # Wpis do tabeli
            file.write(f"INSERT INTO serwis (PojazdID, PracownikID, OpisProblemu, DataPrzyjecia, DataZakonczenia, Koszt, Status) "
                              f"VALUES ({pojazd_id}, {pracownik_id}, '{problem}', '{data_przyjecia}', '{data_zakonczenia}', {koszt}, '{status}');\n")

# Wywołanie funkcji do stworzenia pliku SQL
generate_sql_file("serwis.sql", 1000)  # Generuje 2500 wierszy