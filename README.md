# DataBaseModeling

Projekt polegał na zamodelowaniu odpowiedniej bazy danych według danego scenariusza. Należało wykonać diagram ER (plik ERD.png), model relacyjny (plik RelationalModel.png) oraz skrypt SQL zawierający polecenia, który utworzy daną bazę danych (plik code.sql).

Scenariusz według, którego wykonałem projekt to: 

Serwis Aukcyjny

Baza danych przechowuje informacje o użytkownikach systemu aukcyjnego. Każdy użytkownik jest identyfikowany za pomocą loginu, posiada ponadto obowiązkowe atrybuty: imię i nazwisko, adres zamieszkania, adres e-mail, oraz nieobowiązkowe: numer konta, adres dostawy, telefon. Użytkownicy mogą, korzystając z systemu, wystawiać przedmioty. Każdy przedmiot otrzymuje indywidualny numer, a ponadto musi mieć podaną nazwę, kategorię, cenę wyjściową. Opcjonalny jest opis przedmiotu oraz cena zakupu. Każdy przedmiot jest wystawiany przez jednego użytkownika. W momencie wystawienia przedmiotu tworzona jest licytacja. Dla każdej licytacji pamiętamy jej unikalne id, datę rozpoczęcia i zakończenia oraz status (w trakcie, zakończona kupnem, zakończona bez kupna). Przedmiot musi być związany z przynajmniej jedną licytacją (ale może być wielokrotnie wystawiony na licytację); każda licytacja dotyczy jednego przedmiotu. W ramach licytacji mogą być składane oferty. Pamiętana jest data i godzina każdej oferty w ramach licytacji oraz kwota. Każda oferta składana jest przez jednego użytkownika. Użytkownik może złożyć wiele ofert w ramach licytacji. W bazie chcemy pamiętać ewentualnego zwycięzcę licytacji, który kupuje przedmiot. Dodatkowo, z każdym wystawionym przedmiotem związane są opcje dostawy. W bazie przechowywana jest lista możliwych opcji dostawy, każda opisana przez unikalne id, nazwę, firmę realizującą dostawę, oraz cenę. Każdy przedmiot musi mieć przypisaną przynajmniej jedną opcję dostawy. Każda opcja dostawy może być związana z wieloma przedmiotami.


## Contact
Created by [@HondaPL](https://hacia.students.wmi.amu.edu.pl/) 2020
