Bugzilla downloader
=========

Konwencje w kodzie
---
Proponuję następujące konwencje, jakby co, dopisujcie swoje:

* kodowanie UTF-8 (standard)
* wcięcia - dwie spacje (konwencja Rubiego)
* programowanie obiektowe (oczywiście :) )

Podział na moduły (klasy)
---
Oczywiście to kwestia do ustalenia. Tak więc rozpoczynam dyskusję, w razie czego modyfikujcie ten plik, wprowadzając swoje sugestie. W systemie kontroli wersji nic nie zginie, więc nie bójcie się zmian.

1. obsługa GUI
2. zapis do pliku (polecam format JSON)
3. parser(y) - być może osobne dla każdej postrony serwisu (ale dziedziczące po jednym bazowym), do użytku na zasadzie (kwestia do ustalenia):
```
UserInfoParser(435).email # obiekt robi całą brudną robotę i zwraca to, co chcemy, czyli email użytkownika

# lub

user_info = UserInfoParser(546)
puts user_info.name + ' - ' + user_info.email # yay!
```

Foldery
---
Jakoś musimy uporządkować kod w repozytorium, także tu piszmy, co znajduje się w którym folderze.

* `ui` - pliki (a właściwie jeden plik) Qt Designera oraz plik(i) wygenerowane przez `rbuic4` na podstawie pliku .ui (przejrzyjcie prezentację o QtRuby, link na grupie FB)
* `parsers` - klasa bazowa parsera i klasy pochodne parserów poszczególnych podstron

Hello world!
---
Tutaj wypadałoby potem coś napisać o projekcie.

Instalacja
---
A tutaj coś o instalacji, a raczej uruchomieniu.