# Obesenec

Odhaľovanie slova hláskou po hláske.

Skript [Obesenec.au3](https://github.com/tiborepcek/obesenec/blob/main/Obesenec.au3) načíta zo súboru [slova.tsv](https://github.com/tiborepcek/obesenec/blob/main/slova.tsv) slovo a vytvorí prázdne polia podľa počtu hlások v slove. Ku každému slovu je potrebné pridať aj krátku pomoc, vďaka ktorej by malo byť slovo ľahšie uhádnuteľné. Moderátor kliká na písmeno, ktoré hráči hádajú. Ak je hádané písmeno obsiahnuté v slove, zobrazí sa na všetkých svojich pozíciách a vyplní tak prázdne polia. Ak nie, písmeno už druhýkrát nie je možné použiť a háda sa ďalšie písmeno. Po vyplnení všetkých prázdnych polí hráči slovo uhádli a môžu pokračovať v hádaní ďalšieho slova.

Ideálne je spustiť [aktuálnu verziu](https://github.com/tiborepcek/obesenec/releases/) na väčšej obrazovke (TV alebo projektor), aby hráči čo najlepšie videli písmená.

V súbore [slova.tsv](https://github.com/tiborepcek/obesenec/blob/main/slova.tsv) sú zapísané slová a k nim krátka pomoc. Na každom riadku je zapísané jedno slovo (najviac 12 hlások) a k nemu krátka pomoc. Slovo a krátka pomoc sú od seba oddelé znakom [tabulátor](https://cs.wikipedia.org/wiki/Tabulátor) takto:

```
slovo[tabulátor]krátka pomoc
```

Najbezpečnejšie je súbor [slova.tsv](https://github.com/tiborepcek/obesenec/blob/main/slova.tsv) prepísať vlastnými slovami s krátkou pomocou, aby ostalo zachované kódovanie súboru (UTF-8 Unicode with BOM). Na prepisovanie súboru [slova.tsv](https://github.com/tiborepcek/obesenec/blob/main/slova.tsv) odporúčam použiť textový editor [VSCodium](https://vscodium.com/#install), ktorý spustíte rovnako na Windowse, na MacOS alebo na Linuxe.

Takto vyzerá grafické rozhranie programu:

![Popis](https://github.com/tiborepcek/obesenec/blob/main/popis.png)

Tento program je napísaný v skriptovacom jazyku [AutoIt 3](https://www.autoitscript.com/) a primárne je určený pre operačný systém Windows. Funguje však cez [Wine](https://www.winehq.org/) v Linuxe aj v MacOS.
