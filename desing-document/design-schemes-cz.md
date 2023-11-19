# METRO 20XX - Stolní hra založená na METRU 2033-2035

note - [] = poznámka k diskuzi

# Lidi
## Postavy
* potřeba k sestavení karavany (ta má default velikost, větší za příplatek)
* classy
    * mají specifické schopnosti
        * -> vliv na eventy
        * -> + speciální, specifické (odborník na něco) [např. někdo by mohl na povrch v neovládnuté stanici?]
* verbování v hospodě + při zisku jednotky [=třeba 10 lidí] populace stanice
    * stalker - původní povolání/specializace neguje negativní vliv (bonus) lokace
    * voják/bojovník
    * inženýr/technik
    * zemědělec
    * zdravotník
    * kuchař
    * zaměstanec metra
    * obchodník
    * sensibil

## Populace
* počet v jednotkách [třeba po desítkách lidí]
* množstvím populace podmíněné některé budovy, aktivity?, hlídky, karavany, zaměstnání
* může už být v objevené stanici - získání ovládnutím
* potřebuje jídlo podle množství jednotek
* vzniká zvýšením kapacity ubytování + podmínění blahobytem?, jídlem?
* zaniká eventy? při ztrátě se zničí/degraduje ubytování podle množství

## Karavany
* sestavení z postav
* defaultní počet = ?
* účely
    * průzkum tunelu/stanice
    * mise ve stananici/tunelu
    * průzkum povrchu
    * lootění povrchu (potom cooldown)
    * transport zboží

# Budovy
* úrovně zlepšují parametry, budou pro ně stříbrné a zlaté rámečky
* některé dvoupatrové? (sklad)
* provázání funkcí a bonusů? (zaměření stanice - vojenská/hospodářská/tržní)
## Ubytování
* úrovně (stany, domky, zazděné průchody)
* generuje populaci
## Hospodářství
* živočisné / rostlinné
* generuje jídlo
* upgrade materiálem, lidmi, okolnostmi (bonusy) stanice/tunelu
## Dílny
* specializace -> nižší cena
* konzervárna, zbrojnice, výroba ochranného materiálu
## Generátor
* tři úrovně
    * basic - spotřebovává víc pracovní síly
    * vyšší - spotřebovává víc materiálu
    * speciální - podmíněná okolnostmi (bonusy) stanice (řeka/vítr/reaktor), menší spotřeba
* ovlivňuje blahobyt, počet stanů -> populace
* stojí materiál a pracovní sílu
# Vodárna
* úrovně (+ specifické rozšíření s řekou, rezervoarem atd)
* ovlivňuje blahobyt, počet stanů -> populace
* stojí materiál a pracovní sílu
# Medik
* přidává blahobty
* bonus pro stalkera (snížení negativního vlivu)
* bonus při bojích?
# Hospoda
* přidává blahobyt
* možnost směny zboží
* verbování postav
# Trh
* přidává blahobyt
* možnost směny zboží
* vyžaduje spřátelené stanice v okolí
# Knihovna
* blahobyt
# Modlitebna
# Sklad
* menší spotřeba materiálu?
# Kuchyň
* znásobí jídlo získané z hospodářství
# Základna stalkerů
* zmenšuje/nuluje cooldown výstupů
* bonusy pro stalkery?


# Bonusy
* i negativní
* u čeho se projevují a na co mají vliv
## Stanice
* voda (řeka / rezervoar)
    * ++ zdroj vody
    * ++ zdroj energie
    * -- riziko zatopení
* vítr na povrchu
    * ++ zdroj energie
    * -- rizikový výstup?
* povrch
    * farma / veletrh / les - bonus pro hospodářství
        * ++ semena / sazenice speciálních rostlin (lysohlávky, čaj, ...)
        * -- nebezpečí živočichů
    * armádní objekt - bonus pro dílny, základnu
        * ++ vždy přinesou náboj(e) (loot = bereš X karet, zbraň ber + suroviny)
        * ++ šance na extra zbraně / výbušniny / výstroj?
        * -- riziko výbuchu
        * -- riziko nepřátel (banditů)
    * stavebniny / staveniště
        * ++ materiál
        * -- riziko pádu
    * obchoďák
        * ++ jídlo, oblečení, civilní vybavení, gadgets
        * -- banditi / nepřátelé / živočichové
    * nádraží / depo - bonus pro dílny
        * ++ strojní materiál
        * ++ bonus pro transport, levnější drezína
        * -- banditi
    * klidné sousedství
        * žádný bonus, žádné hrozby
    * hnízdo mutentů
        * -- riziko
* stavba stanice + vestavěné featury
    * oblouky
        * ++ levnější vyšší úroveň ubytování
        * -- menší kapacita
    * plocha
        * ++ větší kapacita
        * -- náročnější na energii (až 2. úroveň generátoru dává bonusy etc.)
    * přestupní
        * ++ mega kapacita
        * -- těžší ovládnutí (mise)
    * nemocnice
        * ++ levný medik
    * generátor
        * ++ generátor začíná na 2. lvl (ale potřeba splnit požadavky)
    * vodárna
        * ++ rovnou 2. lvl včetně požadavků
    * sklady
        * ++ materiál
        * ++ prostor
## Tunel
* teplo
    * ++ zemědělství
    * -- obyvatelnost
* vítr
    * ++ zdroj energie
    * -- obyvatelnost / hospodářství
* stavba
    * -- nefunkční ventilace - zamoření, potřeba spravit/zničit
* sektářský vlak / opuštěná souprava
* tlakové dveře
    * potřeba 2. lvl generátor k používání
    * ochrana před danger v tunelu, nepřátelským sousedem


```mermaid
timeline
    title Stanice
    section první vstup s karavanou
        vyhledat odpovídající kartu stanice a povrchu : odhalit kartu stanice : karta povrchu zůstává skrytá (na rubu cena průzkumu)
        
        karta stanice - lokace : odhalí obrázek : odhalí velikost -> umístit správný dílek stanice : odhalí stav -> umístit případné žetony na dílek (rubble = hod kostkou pro množství) : odhalí nutný počet bodů vlivu pro ovládnutí : odhalí bonusy stanice

        karta stanice - mise a průzkum : určí hlavní misi stanice (souvislost se stavem, místem, etc.) (splnění = velký vliv) : určí vyloučené mission karty (typy/konkrétní?) : určí počet obecných mission karet -> nalíznout (+ vyměnit vyloučené) : určí přidanou cenu misí před splněním hlavní : určí přidanou cenu / odložení průzkumu povrchu před splněním hlavní : určí podmínky průchodu (jestli možný, co stojí)

        (optional) karta stanice - ambush : přepadení obyvateli/mutanty / okamžitý event -> požadavky na karavanu

    section neovládnutá stanice
        získávání vlivu : hlavní mise (za danou cenu a podmínky) : mise z karet (před splněním hlavní za svoji + bonusovou cenu) : po splnění požadovaného vlivu ovládnutí

        průzkum povrchu : za cenu uvedenou na kartě povrchu pokud možné (karta stanice může průzkum vyloučit nebo podmínit ovládnutím) : odhalit kartu povrchu (obrázek, popis lokace, bonusy)

        průchod do dalšího tunelu : pokud možný, za danu cenu (viz karta stanice), vliv postav v karavaně na cenu průchodu : průchod dalšího tunelu bez průzkumu

    section ovládnutá stanice
        stavění hlídek do příslušných políček v tunelu

        odstraňování a přidávání žetonů ve stanici : dané ceny pro typy rubble/budov (vliv bonusů stanice, postav na místě, připojení ke spřáteleným stanicím)

        průzkum a budování v tunelu : pouze bližší polovina : odhalení kapacity bočních místností (umístit správný dílek), chodeb etc. (viz tunel)

        vyslání stalkera na povrch : povrch musí být prozkoumaný (odhalená karta povrchu) : cena podle karty povrchu : na povrch jde postava (-> vliv vlastností) : zisk zdrojů podle parametrů na kartě povrchu (+ pozitivní bonusy) : rizika podle parametrů na kartě povrchu (- negativní bonusy)
```
```mermaid
timeline
    title Tunel
    section průchod tunelem
        neprozkoumaný tunel : hod kostkami (danger, event, délka) : I. (pokud zde zatím žádný není) nic / typ nebezpečí (danger type) / zával [nastavit pravděpodobnosti, zával výjimečně] [myšlenka je, že chodit neprozkoumaným tunelem je nebezpečné, pokud tam ještě není známý danger, může se teprve nějaký projevit] : II. tunel event - s nějakou pravděpodobností tunel event karta (pozitivní i negativní) (nalezené zásoby / štěně / přepadení / plyn / ...), vlastnosti eventu se můžou kombinovat s danger (značka na kartě) -> vynaložit effort -> zisk (pozitivní/negativní), damage : III. (jen při vstupu) délka tunelu (dokud tunel není prozkoumaný, časová anomalie? nebo jen s nějakou pravděpodobností) - ovlivní kolikrát se děje event

        prozkoumaný tunel : tolik kroků, kolik je daná délka [jo?] : v každém kole event?

    section průzkum tunelu
        průzkum tunelu : karavanou, postupně tři pozice přiléhající ovládnuté stanici : event průzkum tunelu (možná událost + lokace) : propojovací šachta ( a) o x polí / b) do specifického tunelu) / volná pozice pro hlídku / místnost (parametry, mise, bonusy) / blokace? (nelze hlídka) / vzduchotěsné tveře (ochrana tunelu, stanice)

    section obsazení
        obsazení : potřeba vlastnit přiléhající stanici (pro bližší polovinu tunelu) : plnění misí, stavění hlídek, využívání pozic (průmysl, zemědělství)

```

```mermaid
timeline
    title Průběh kola
    section akce během kola (omezená "iniciativa")
        akce s karavanou : povrch : tunel : mise

        akce ve stanicích a tunelech : budování/bourání : akce budov : stavění hlídek na volných pozicích

        politika : vedení stanic : ideologie

```










# OLD
# TODO: 
pojmenování pro vliv

# komponenty a mechaniky

```mermaid
---
title: STANICE
---
classDiagram
    note "note"

    stanice <|-- karta_stanice
    note for karta_stanice "karta stanice\n - obrázek, popis, stav\n - odhalení při dosažení stanice karavanou"

    stanice <|-- karta_povrchu
    note for karta_povrchu "karta povrchu stanice\n - obrázek, popis, vlastnosti, možnosti\n - odhalení při provedení průzkumu povrchu karavanou"

    stanice <|-- Zebra
    stanice : +String gender
    stanice : defaultně 8-10 políček
    stanice: +isMammal()
    stanice: +mate()


    class karta_stanice{
        určí počet políček stanice záslepkami
        voda() zatopení všech políček
        lidi() množství populace [0 - ?]
        rubble() hod kostkou, počet políček rubble
        tvorové() typ, nebezpečnost, využitelnost
        bonus() ne/výhoda stanice [rozložení ne/vhodné pro něco / radioaktivita / jiné nebezpečí / funkční dveře na povrch ]
    }

    class karta_povrchu{
        potenciál pro rozšíření, zatím jen parametricky:
        loot_potencial() jaký typ lootu se tu dá najít, s jakou frekvencí
        bonus() ne/výhoda místa [blízký obchoďák / vojenská základna atd. / blízko hnízda mutantů ]
    }

    class Zebra{
        +bool is_wild
        +run()
    }
```

```mermaid
---
note: entity a složitosti
---
journey
    title první vstup s karavanou, zjistím:
    section karta stanice
      - znám obrázek (vizuál): 5: Hráč
      - znám velikost (počet políček, umístit záslepky): 3: Hráč
      - znám stav (ten může taky zaplnit některá políčka, omezit výběr misí): 3: Hráč
      - znám přidanou hodnotu stanice a přidanou cenu misí ve stanici (do splnění hlavní mise): 5: Hráč
      
      - znám počet misí (a jaké jsou vyloučené): 5: Hráč      
      - znám hlavní misi stanice (může souviset se stavem, přidanou hodnotou) (splnění dá hodně vlivu, není nutné): 5: Hráč
      - znám potřebný vliv pro ovládnutí: 5: Hráč

      určí jestli můžu projít dál a co mě to stojí: 5: Hráč # TODO: tady? nebo random?
    section mise (hlavní + karty)
        vezmu si karty misí (jejich plněním získávám vliv): 4: Hráč
    section karta průzkumu povrchu
        zatím skrytá: 0: Hráč

```

```mermaid
---
note: entity a složitosti
---
journey
    title situace, události, timeline
    section vstoupím s karavanou
      - beru kartu stanice: 5: Hráč
      - upravím dílek stanice: 3: Hráč
      - naberu karty misí: 3: Hráč
    section nemám zájem
      - nesmí být znemožněno kartou stanice nebo stavem: 1: Hráč, Karavana
      - platím cenu (vliv postav v karavaně, stavu stanice): 1: Hráč, Karavana
    section mám zájem, získávám vliv
      - plním mise (EVENT): 1: Hráč, Karavana, Populace
      - plněním misí získávám vliv a dodatečné info (random karta) - buff pro mne a stanici: 1: Hráč
      - plním hlavní misi stanice (EVENT): 1: Hráč, Karavana, Populace
    section prozkoumávám povrch
      - nesmí být znemožněno kartou stanice nebo stavem: 1: Hráč, Karavana
      - platím cenu (vliv postav v karavaně, stavu stanice, vlivu na stanici???) -> odhalení karty povrchu (EVENT): 1: Hráč, Karavana
    section ovládl jsem stanici
      - můžu nasadit hlídy do tunelů: 1: Hráč, Populace
      - můžu upravovat stanici (stavba/bourání, žetony): 1: Hráč, Populace
      - můžu poslat stalkera (parametry/požadavky viz karta povrchu): 1: Hráč, Postava
      - můžu prozkoumávat a budovat v blízké polovině tunelu (odhalit kapacitu bočních chodeb, zaslepit zbytek - hod kostkou): 1: Hráč, Populace

```