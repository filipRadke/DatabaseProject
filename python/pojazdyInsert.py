import random
import string

# Lista losowych marek, modeli, kolorów
marki = ["Toyota", "Volkswagen", "BMW", "Mercedes", "Audi", "Ford", "Renault", "Peugeot", "Opel", "Fiat"]
modele = ["Corolla", "Golf", "X5", "A4", "Passat", "Focus", "Clio", "308", "Astra", "Punto"]
kolory = ["Czarny", "Biały", "Srebrny", "Niebieski", "Czerwony", "Zielony", "Szary", "Beżowy", "Żółty", "Brązowy"]
statusy = ["Dostępny", "Sprzedany", "W naprawie", "Zarezerwowany"]

# Funkcja generująca losowy numer VIN
def generate_vin():
    return ''.join(random.choices(string.ascii_uppercase + string.digits, k=17))

# Funkcja do generowania skryptu SQL
def generate_sql_file(filename, rows):
    with open(filename, 'w') as file:
        # Generowanie danych dla tabeli
        for i in range(rows):
            marka = random.choice(marki)
            model = random.choice(modele)
            rok_produkcji = random.randint(1900, 2025)
            vin = generate_vin()  # Losowy numer VIN
            przebieg = random.randint(0, 300000)  # Losowy przebieg
            kolor = random.choice(kolory)  # Losowy kolor
            cena = round(random.uniform(10000, 200000), 2)  # Losowa cena
            status = random.choice(statusy)  # Losowy status

            # Wpis do tabeli
            file.write(f"INSERT INTO `pojazdy` (`Marka`, `Model`, `RokProdukcji`, `VIN`, `Przebieg`, `Kolor`, `Cena`, `Status`) "
                       f"VALUES ('{marka}', '{model}', {rok_produkcji}, '{vin}', {przebieg}, '{kolor}', {cena}, '{status}');\n")

# Wywołanie funkcji do stworzenia pliku SQL
generate_sql_file("pojazdy.sql", 2500)  # Generuje 2500 wierszy
