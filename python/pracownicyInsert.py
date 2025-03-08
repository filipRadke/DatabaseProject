import random

# Lista losowych imion i nazwisk
imiona = ["Adam", "Maria", "Piotr", "Anna", "Krzysztof", "Ewa", "Tomasz", "Zofia", "Michal", "Jolanta", "Wojciech", "Olga", "Karol", "Monika", "Pawel", "Katarzyna", "Jakub", "Magdalena", "Robert", "Ewa"]
nazwiska = ["Kowalski", "Nowak", "Wisniewski", "Wojcik", "Kowalczyk", "Zielinski", "Szymanski", "Dabrowski", "Jankowski", "Kaminski", "Lewandowski", "Zajac", "Piotrowski", "Kwiatkowski", "Mazur", "Krol", "Wieczorek", "Nowacki", "Adamczak", "Pawlak"]

# Lista miast oraz ulic
stanowiska = ['Sprzedawca', 'Manager', 'Mechanik', 'Doradca klienta', 'Kierownik', 'Technik', 'Pracownik magazynu']

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
            stanowisko = random.choice(stanowiska)
            dostepny = random.randint(0,1)
            
            # Wpis do tabeli
            file.write(f"INSERT INTO `pracownicy` (`Imie`, `Nazwisko`, `Stanowisko`, `Email`, `Telefon`, `Dostepny`) " f"VALUES ('{imie}', '{nazwisko}', '{stanowisko}', '{email}', '{telefon}', {dostepny});\n")

# Wywołanie funkcji do stworzenia pliku SQL
generate_sql_file("pracownicy.sql", 1500)  # Generuje 50 wierszy
