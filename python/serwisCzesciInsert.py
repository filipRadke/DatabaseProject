from datetime import datetime, timedelta
import random

def generate_sql_file(filename, rows):
    with open(filename, 'w') as file:
        for i in range(rows):
            serwis_id = random.randint(0,1000)
            czesc_id = random.randint(0,500)
            ilosc = random.randint(0,10)
            
            # Wpis do tabeli
            file.write(f"INSERT INTO serwisczesci (SerwisID,CzescID,Ilosc) " f"VALUES ({serwis_id}, {czesc_id}, {ilosc});\n")

# Wywołanie funkcji do stworzenia pliku SQL
generate_sql_file("serwisCzesci.sql", 1500)