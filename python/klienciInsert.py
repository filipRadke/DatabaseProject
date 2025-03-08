import random

# Lista losowych imion i nazwisk
imiona = ["Adam", "Maria", "Piotr", "Anna", "Krzysztof", "Ewa", "Tomasz", "Zofia", "Michal", "Jolanta", "Wojciech", "Olga", "Karol", "Monika", "Pawel", "Katarzyna", "Jakub", "Magdalena", "Robert", "Ewa"]
nazwiska = ["Kowalski", "Nowak", "Wisniewski", "Wojcik", "Kowalczyk", "Zielinski", "Szymanski", "Dabrowski", "Jankowski", "Kaminski", "Lewandowski", "Zajac", "Piotrowski", "Kwiatkowski", "Mazur", "Krol", "Wieczorek", "Nowacki", "Adamczak", "Pawlak"]

# Lista miast oraz ulic
miasta = ["Warszawa", "Krakow", "Wroclaw", "Gdansk", "Lodz", "Poznan", "Szczecin", "Lublin", "Katowice", "Bydgoszcz"]
ulice = ["ul. Warszawska", "ul. Krakowska", "ul. Pieciomorgowa", "ul. Gdanska", "ul. Lodzka", "ul. Poznanska", "ul. Wroclawska", "ul. Slowianska", "ul. Zielona", "ul. Gornicza"]

# Funkcja do generowania losowego numeru telefonu
def generate_phone_number():
    return f"+48 {random.randint(100, 999)} {random.randint(100, 999)} {random.randint(100, 999)}"

# Funkcja do generowania skryptu SQL
def generate_sql_file(filename, rows):
    with open(filename, 'w') as file:
        for i in range(rows):
            imie = random.choice(imiona)
            nazwisko = random.choice(nazwiska)
            email = f"{imie.lower()}.{nazwisko.lower()}@example.com"  # Email: imie.nazwisko@example.com
            telefon = generate_phone_number()  # Generowanie losowego numeru telefonu
            miasto = random.choice(miasta)  # Losowe miasto
            ulica = random.choice(ulice)  # Losowa ulica
            numer_mieszkania = random.randint(1, 100)  # Losowy numer mieszkania
            
            # Składanie adresu
            adres = f"{ulica} {numer_mieszkania}, {miasto}"
            
            # Wpis do tabeli
            file.write(f"INSERT INTO Klienci (Imie, Nazwisko, Email, Telefon, Adres) VALUES ('{imie}', '{nazwisko}', '{email}', '{telefon}', '{adres}');\n")

# Wywołanie funkcji do stworzenia pliku SQL
generate_sql_file("klienci.sql", 2500)
