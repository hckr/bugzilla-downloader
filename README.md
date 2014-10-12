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
* `exporters` - klasa bazowa klas eksportujących i klasy pochodne eksportujące do poszczególnych formatów
* `tests` (w różnych folderach) - testy jednostkowe (głównie mają sens dla parserów)

Hello world!
---
Tutaj wypadałoby potem coś napisać o projekcie.

Instalacja
---
A tutaj coś o instalacji, a raczej uruchomieniu.

Wymagane zależności: Ruby >= 2.0.0, Qt4, pakiet kdebindings-qtruby (Arch) lub pokrewny (tylko Linux) (*Dla Minta, Ubuntu i podobnych popularnych dystrybucji będzie to `qtbindings` - M.W.*)

Instalacja potrzebnych gemów: `gem install nokogiri open-uri htmlentities` (+ `qtbindings` dla Windows)
(na końcu można dodać `--user-install`, wtedy pakiety są instalowane tylko dla aktualnego użytkownika)

Przydatne linki
---
https://www.ruby-lang.org/pl/

https://www.ruby-lang.org/pl/documentation/ruby-from-other-languages/

http://qt-project.org/downloads

http://www.slideshare.net/YnonPerek/qtruby

https://techbase.kde.org/Development/Languages/Ruby

http://www.nokogiri.org/tutorials/installing_nokogiri.html

http://en.wikibooks.org/wiki/Ruby_Programming/Unit_testing

[Qt Designer - tutorial cz. 1](https://www.youtube.com/watch?v=LYF0spYkXUs)

[Qt Designer - tutorial cz. 2](https://www.youtube.com/watch?v=E7Ud6FonsR4)


Mam nadzieję, ze niczego nie przeoczyłem, w razie czego Googlujcie błędy. ;)