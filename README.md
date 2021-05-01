# Obesenec

Odhaľovanie slova hláskou po hláske.

Skript [Obesenec.au3](https://github.com/tiborepcek/obesenec/blob/main/Obesenec.au3) načíta zo súboru [slova.tsv](https://github.com/tiborepcek/obesenec/blob/main/slova.tsv) slovo a vytvorí prázdne polia podľa počtu hlások v slove. Ku každému slovu je potrebné pridať aj krátku pomoc, vďaka ktorej by malo byť slovo ľahšie uhádnuteľné. Moderátor kliká na písmeno, ktoré hráči hádajú. Ak je hádané písmeno obsiahnuté v slove, zobrazí sa na všetkých svojich pozíciách a vyplní tak prázdne polia. Ak nie, písmeno už druhýkrát nie je možné použiť a háda sa ďalšie písmeno. Po vyplnení všetkých prázdnych polí hráči slovo uhádli a môžu pokračovať v hádaní ďalšieho slova.

V súbore [slova.tsv](https://github.com/tiborepcek/obesenec/blob/main/slova.tsv) sú zapísané slová a k nim krátka pomoc. Na každom riadku je zapísané jedno slovo a k nemu krátka pomoc. Slovo a krátka pomoc sú od seba oddelé znakom [tabulátor](https://cs.wikipedia.org/wiki/Tabulátor) takto:

```
slovo[tabulátor]krátka pomoc
```
