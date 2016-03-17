# Rendszermodellezés

[![Build Status](https://travis-ci.org/FTSRG/remo-jegyzet.svg?branch=master)](https://travis-ci.org/FTSRG/remo-jegyzet) [![PDF Status](https://www.sharelatex.com/github/repos/FTSRG/remo-jegyzet/builds/latest/badge.svg)](https://www.sharelatex.com/github/repos/FTSRG/remo-jegyzet/builds/latest/output.pdf)

A jegyzet elérhető a <http://docs.inf.mit.bme.hu/remo-jegyzet/> címen.

* A jegyzetet a [Travis CI szolgáltatás](https://travis-ci.org/FTSRG/remo-jegyzet) folyamatosan fordítja (continuous integration). A repository [`gh-pages`](https://github.com/FTSRG/remo-jegyzet/tree/gh-pages) branch-én található a legújabb változat (a Travis alapértelmezés szerint [nem buildeli](https://help.github.com/articles/troubleshooting-github-pages-build-failures/#working-with-continuous-integration-services) a `gh-pages` branchet).

## Fejlesztői útmutató

* A fő fájl a `rendszermodellezes.tex`, ami könyv (`report`) formátumban fordítja a jegyzetetet, címlappal, tartalomjegyzékkel ellátva.
* Az egyes anyagrészek fejezetei külön is fordíthatók cikk (`article`) formájában, pl. az "Állapot alapú modellezés" c. anyagrész fordításához az `allapot-alapu-modellezes.tex` fájlt kell fordítani. A fejezet szövege egy külön könyvtárban található `allapot-alapu-modellezes/allapot-alapu-modellezes-fejezet.tex` néven. Szintén itt találhatók a fejezethez tartozó egyéb állományok (képek, kódrészletek).
* A BibTeX fájlok a `bib/remo.bib` fájlban, a tárgymutató bejegyzései a `glossary-entries.tex` fájlban találhatók.

### Windows

* Fordításhoz: [MiKTeX](http://miktex.org/) [(mirror)](http://tug.ctan.org/systems/win32/miktex/setup/). A telepítéskor pipáljuk be, hogy a hiányzó csomagokat **on-the-fly** telepítse fel.
* Szerkesztéshez: [TeXstudio](http://texstudio.sourceforge.net/). Érdemes először a MiKTeX-et felrakni, utána a TeXstudiót.
* Előnézethez: [Sumatra PDF](http://www.sumatrapdfreader.org/free-pdf-reader.html)
* Tárgymutató generálásához:
    * Alapértelmezés szerint hiányolja a `tracklang` csomagot. Ennek javításához  a **Start menü** | **MiKTeX**-ben a **Package Manager** alkalmazásban fel kell rakni a hiányolt csomagot. Amennyiben az nem található a listában, akkor a **Repository** | **Synchronize**-ra kattintva frissíteni kell a csomagok listáját, utána feltelepíteni a `tracklang` csomagot és újrafordítani a dokumentumot.
* `mfirstuc.sty` hiba: `! LaTeX Error: File 'mfirstuc.sty' not found.` Megoldás: a MikTeX újratelepítése.
* `fontspec` hiba: némelyik MikTeX disztribúcióban rossz verziós `fontspec` csomag van, ezért előfordulhat, hogy a fordításkor errort kapunk. [Megoldás](http://tex.stackexchange.com/questions/257336/fontspec-kernel-property-unknown): a **Start menü** | **MikTeX** | **Update** alatt frissítsük az összes csomagunkat. Fontos, hogy elsőre nem mindig frissíti jól, győződjünk meg róla, hogy a `fontspec`-ből **2.4-es** verzió van fenn. (Remélhetőleg ez a hiba el fog tűnni egy új release-zel.)
* Tippek:
    * Első fordításkor fel kell még rakni pár csomagot, így az első fordítás kb. 5 perc lesz telepítéssel együtt.
    * Amennyiben a TeXstudioban az **Options** | **Configure TeXstudio** | **Commands** résznél nem lenne kitöltve a XeLaTeX, akkor tallózzuk ki neki a megfelelő exe fájlt. Ezt kiválasztva automatikusan kiegészíti azt a megfelelő paraméterekkel,
        * Elmentve és a beállításokat újra megnyitva ez kitölti a többit is.
        * Az **External PDF Viewer** ugyanitt állítható be: `"C:/Program Files (x86)/SumatraPDF/SumatraPDF.exe" %.pdf` Szintén a **Configure** dialógusablakban a **Build** menüpontban pedig válasszuk ki a következőket (alapértelmezés szerint legördülő menük vannak):
        * **Build & View**: **Compile & View**. Ha ezzel futtatunk, akkor frissíti a Sumatra-ban a megnyitott PDF fájlt, nem kell kézzel bezárni.
        * **PDF Viewer**: **External PDF Viewer**
    * Az **Options** | **Define Current Document as 'Master Document'** alatt be lehet állítani, hogy melyik legyen az aktuálisan fordított dokumentum.

### Linux

* Fordításhoz: `texlive-full`
* Szójegyzék generálásához: a `glossaries` csomagból a TeX Live 2014-ben túl régi változat van, amiben nem szerepel a `\makenoidxglossaries` parancs (v4.04-től van, ld. a [changelogban](http://tug.ctan.org/macros/latex/contrib/glossaries/CHANGES). A TeX Live csomagokat frissíteni egy külön [szkripttel](https://github.com/FTSRG/cheat-sheets/wiki/LaTeX#update-tex-live-on-ubuntu) lehet.
* Szerkesztéshez: `texstudio` (Az Ubuntu hivatalos package repository-jában egy 2013-as verzió van fenn, ezért érdemes PPA-ból telepíteni: `sudo add-apt-repository ppa:blahota/texstudio`, `sudo apt-get update`)
* Előnézethez: `evince` (más néven Document Viewer, a legtöbb rendszeren telepítve van)

### Opcionális: tárgymutató

**Az alábbi lépés opcionális.** Akkor érdemes elvégezni, ha a build időn szeretnénk gyorsítani vagy lokálisan szeretnénk a végleges tárgymutatót tartalmazó PDF-et legenerálni. A build szerveren mindenképpen helyesen generálódik a tárgymutató.

**A probléma:** a tárgymutatót alapértelmezés szerint `glossaries` csomag beépített eszköze rendezi. Ez sajnos meglehetősen lassú, valamint nem tudja megfelelően kezelni a magyar ékezetes karaktereket.
**A megoldás:** mindkét problémára megoldást kínál a Xindy (A Flexible Indexing System). A használatához hozzunk létre a repository könyvtárában egy üres állományt `use-xindy.tex` néven vagy használjuk erre a `use-xindy.sh` szkriptet. Ezután TeXstudióban fordítás után a **Tools** | **Glossary** paranccsal (F10) generálhatjuk le a megfelelő fájlokat. Ismételten fordítva a dokumentumot megkapjuk a tárgymutatót.

A Xindy használata Linux alatt nincs külön teendőnk, Windows alatt viszont igényel némi pluszmunkát:

* Telepítsünk egy Perl futtatókörnyezetet, pl. az [ActivePerlt](http://www.activestate.com/activeperl/downloads).
* A MikTeX **Package Manager** alkalmazásával telepítsük fel a **xindy** összes csomagját.
* Hozzunk létre egy batch állományt, ami meghívja a Perl futtatókörnyezetet a `xindy.pl` szkripttel. Egy ilyen példa állományt megtalálható a `scripts` könyvtárban `xindy.bat` néven. Ebben a `xindy.pl` elérési útvonalát módosítsuk a rendszerünknek megfelelően. Fontos, hogy az állomány nevét ne változassuk meg.
* A batch állományt helyezzük el a PATH-ra, pl. a `C:\Windows\system32` könyvtárba.
* A TeXstudióban a fent leírt módon tudjuk fordítani a dokumentumot.

### GYIK

* **Probléma:** Nem jelennek meg a képek a jegyzetben.
* **Megoldás:** A PDF 1.4 és a PDF 1.5 szabvány közötti eltérések okozhatják a problémát. Ha nem tudunk egyszerűen PDF 1.4-es fájlt előállítani (pl. a yEd-nél nincs erre opció), akkor workaroundként a `pdfcrop` alkalmazással körbevágva a képet 1.4-es PDF-et kapunk. Ahol erre szükség lehet, ott a `figures` könyvtárakban található egy `crop.sh` szkript. Ez a szkript az adott könyvtár *összes* PDF fájlját felülírja a körbevágott változattal.
 
