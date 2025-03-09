from datetime import datetime, timedelta
import random

def losowa_data(start,end):
    start_date = datetime(start, 1, 1)
    end_date = datetime(end, 12, 31)
    random_date = start_date + timedelta(days=random.randint(0, (end_date - start_date).days))
    return (random_date).strftime("%Y-%m-%d")

statusy = ["Aktywna","Anulowana","Zrealizowana"]

def generate_sql_file(filename, rows):
    with open(filename, 'w') as file:
        for i in range(rows):
            klient_id = random.randint(1,2500)
            pojazd_id = random.randint(1,2500)
            data_rezerwacji = losowa_data(2020,2025)
            data_wygasniecia = losowa_data(2026,2030)
            status = random.choice(statusy)
            
            # Wpis do tabeli
            file.write(f"INSERT INTO rezerwacje (KlientID, PojazdID, DataRezerwacji, DataWygasniecia, Status) "
                              f"VALUES ({klient_id}, {pojazd_id}, '{data_rezerwacji}', '{data_wygasniecia}', '{status}');\n")

# Wywołanie funkcji do stworzenia pliku SQL
generate_sql_file("rezerwacje.sql", 2500)  # Generuje 2500 wierszy