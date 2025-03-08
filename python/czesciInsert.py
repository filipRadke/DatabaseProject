import random

# Lista losowych nazw części samochodowych oraz producentów
czesci = ["Filtr powietrza", "Filtr oleju", "Wymiennik ciepla", "Swiece zaplonowe", "Zamek drzwi", "Amortyzator", "Pompa paliwa", "Klocki hamulcowe", "Tarcza hamulcowa", "Przewod hamulcowy", "Pasek rozrzadu", "Tlumik", "Akumulator", "Alternator", "Chlodnica", "Sprzeglo", "Wal korbowy", "Przewod chlodnicy", "Czujnik temperatury", "Przewod zaplonowy"]
producenci = ["Bosch", "Valeo", "SKF", "NGK", "Mahle", "Mann Filter", "Febi Bilstein", "Zimmermann", "Brembo", "TRW", "Delphi", "Monroe", "Lucas", "Sachs", "Hella", "Denso", "Varta", "Boge", "BOSCH", "Bilstein"]
marka = ["Toyota", "Volkswagen", "Ford", "BMW", "Mercedes", "Audi", "Chevrolet", "Honda", "Hyundai", "Nissan", "Kia", "Peugeot", "Fiat", "Renault", "Opel", "Mazda", "Subaru", "Land Rover", "Jeep", "Porsche"]

# Funkcja do generowania skryptu SQL
def generate_sql_file(filename, rows):
    with open(filename, 'w') as file:
        for i in range(rows):
            nazwa = random.choice(czesci) + " " + random.choice(marka)
            producent = random.choice(producenci)
            cena = round(random.uniform(10.0, 500.0), 2)  # Cena w przedziale 10.00 - 500.00
            ilosc_na_stanie = random.randint(1, 100)  # Ilość na stanie w przedziale 1-100
            
            # Wpis do tabeli
            file.write(f"INSERT INTO CzesciSamochodowe (Nazwa, Producent, Cena, IloscNaStanie) VALUES ('{nazwa}', '{producent}', {cena}, {ilosc_na_stanie});\n")

# Wywołanie funkcji do stworzenia pliku SQL
generate_sql_file("czesci_samochodowe.sql", 500)  # Generuje 50 wierszy
