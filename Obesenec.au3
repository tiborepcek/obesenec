#cs
Obesenec 1.0 napísané v AutoIt 3
Autor: Tibor Repček
Web: https://tiborepcek.com/obesenec/
#ce

#NoTrayIcon
Opt("GUICloseOnESC", 0)

#pragma compile(ProductName, Obesenec)
#pragma compile(ProductVersion, 1.0)
#pragma compile(FileVersion, 1.0.0.0)
#pragma compile(CompanyName, 'tiborepcek.com')
#pragma compile(FileDescription, Odhaľovanie slova hláskou po hláske. Viac na https://tiborepcek.com/obesenec/)

#include <Array.au3>
#include <GUIConstantsEx.au3>
#include <StaticConstants.au3>

$nazov = "Obesenec"
$verzia = "1.0"
$sirkaOkna = 1280 ; @DesktopWidth
$vyskaOkna = 768 ; @DesktopHeight - 66
$sirkaTlacidla = 50
$vyskaTlacidla = 50
$odsadenieRiadkovAbecedyZlava = 20
$odsadenieRiadkovAbecedyZlavaNaVynulovanie = 20
$odsadenieRiadkovAbecedyZhora = 20
$medzeraMedziTlacidlami = 70
$velkostPismaTlacidla = 20
$sirkaPismena = 100
$vyskaPismena = 85
$odsadenieRiadkovPismenZlava = 20
$odsadenieRiadkovPismenZhora = 350
$medzeraMedziPismenami = 105
$velkostPismaPismena = 70
$sirkaLegendy = 150
$vyskaLegendy = 30
$odsadenieRiadkovLegendyZlava = 800
$odsadenieRiadkovLegendyZhora = 25
$medzeraMedziLegendami = 70
$velkostPismaLegendy = 20
$slovoCislo = 1
$suborSlova = @ScriptDir & "\slova.tsv"
$suborSlovo = @ScriptDir & "\slovo.ini"

; --- Grafické používateľské rozhranie (GUI) ---

$gui = GUICreate($nazov & " " & $verzia, $sirkaOkna, $vyskaOkna)

	; --- ABECEDA ---
	$tlacidloA = GUICtrlCreateButton("A", $odsadenieRiadkovAbecedyZlava, $odsadenieRiadkovAbecedyZhora, $sirkaTlacidla, $vyskaTlacidla) ; prvý riadok abecedy
	GUICtrlSetFont(-1, $velkostPismaTlacidla)
	$tlacidloAd = GUICtrlCreateButton("Á", navysOdsadenieTlacidlaZlava(), -1, $sirkaTlacidla, $vyskaTlacidla)
	GUICtrlSetFont(-1, $velkostPismaTlacidla)
	$tlacidloAp = GUICtrlCreateButton("Ä", navysOdsadenieTlacidlaZlava(), -1, $sirkaTlacidla, $vyskaTlacidla)
	GUICtrlSetFont(-1, $velkostPismaTlacidla)
	$tlacidloB = GUICtrlCreateButton("B", navysOdsadenieTlacidlaZlava(), -1, $sirkaTlacidla, $vyskaTlacidla)
	GUICtrlSetFont(-1, $velkostPismaTlacidla)
	$tlacidloC = GUICtrlCreateButton("C", navysOdsadenieTlacidlaZlava(), -1, $sirkaTlacidla, $vyskaTlacidla)
	GUICtrlSetFont(-1, $velkostPismaTlacidla)
	$tlacidloCm = GUICtrlCreateButton("Č", navysOdsadenieTlacidlaZlava(), -1, $sirkaTlacidla, $vyskaTlacidla)
	GUICtrlSetFont(-1, $velkostPismaTlacidla)
	$tlacidloD = GUICtrlCreateButton("D", navysOdsadenieTlacidlaZlava(), -1, $sirkaTlacidla, $vyskaTlacidla)
	GUICtrlSetFont(-1, $velkostPismaTlacidla)
	$tlacidloDm = GUICtrlCreateButton("Ď", navysOdsadenieTlacidlaZlava(), -1, $sirkaTlacidla, $vyskaTlacidla)
	GUICtrlSetFont(-1, $velkostPismaTlacidla)
	$tlacidloE = GUICtrlCreateButton("E", navysOdsadenieTlacidlaZlava(), -1, $sirkaTlacidla, $vyskaTlacidla)
	GUICtrlSetFont(-1, $velkostPismaTlacidla)
	$tlacidloEd = GUICtrlCreateButton("É", navysOdsadenieTlacidlaZlava(), -1, $sirkaTlacidla, $vyskaTlacidla)
	GUICtrlSetFont(-1, $velkostPismaTlacidla)
	$tlacidloF = GUICtrlCreateButton("F", navysOdsadenieTlacidlaZlava(), -1, $sirkaTlacidla, $vyskaTlacidla)
	GUICtrlSetFont(-1, $velkostPismaTlacidla)
	$odsadenieRiadkovAbecedyZlava = $odsadenieRiadkovAbecedyZlavaNaVynulovanie ; druhý riadok abecedy
	$tlacidloG = GUICtrlCreateButton("G", $odsadenieRiadkovAbecedyZlava, $odsadenieRiadkovAbecedyZlava + $medzeraMedziTlacidlami, $sirkaTlacidla, $vyskaTlacidla)
	GUICtrlSetFont(-1, $velkostPismaTlacidla)
	$tlacidloH = GUICtrlCreateButton("H", navysOdsadenieTlacidlaZlava(), -1, $sirkaTlacidla, $vyskaTlacidla)
	GUICtrlSetFont(-1, $velkostPismaTlacidla)
	$tlacidloI = GUICtrlCreateButton("I", navysOdsadenieTlacidlaZlava(), -1, $sirkaTlacidla, $vyskaTlacidla)
	GUICtrlSetFont(-1, $velkostPismaTlacidla)
	$tlacidloId = GUICtrlCreateButton("Í", navysOdsadenieTlacidlaZlava(), -1, $sirkaTlacidla, $vyskaTlacidla)
	GUICtrlSetFont(-1, $velkostPismaTlacidla)
	$tlacidloJ = GUICtrlCreateButton("J", navysOdsadenieTlacidlaZlava(), -1, $sirkaTlacidla, $vyskaTlacidla)
	GUICtrlSetFont(-1, $velkostPismaTlacidla)
	$tlacidloK = GUICtrlCreateButton("K", navysOdsadenieTlacidlaZlava(), -1, $sirkaTlacidla, $vyskaTlacidla)
	GUICtrlSetFont(-1, $velkostPismaTlacidla)
	$tlacidloL = GUICtrlCreateButton("L", navysOdsadenieTlacidlaZlava(), -1, $sirkaTlacidla, $vyskaTlacidla)
	GUICtrlSetFont(-1, $velkostPismaTlacidla)
	$tlacidloLd = GUICtrlCreateButton("Ĺ", navysOdsadenieTlacidlaZlava(), -1, $sirkaTlacidla, $vyskaTlacidla)
	GUICtrlSetFont(-1, $velkostPismaTlacidla)
	$tlacidloLm = GUICtrlCreateButton("Ľ", navysOdsadenieTlacidlaZlava(), -1, $sirkaTlacidla, $vyskaTlacidla)
	GUICtrlSetFont(-1, $velkostPismaTlacidla)
	$tlacidloM = GUICtrlCreateButton("M", navysOdsadenieTlacidlaZlava(), -1, $sirkaTlacidla, $vyskaTlacidla)
	GUICtrlSetFont(-1, $velkostPismaTlacidla)
	$tlacidloN = GUICtrlCreateButton("N", navysOdsadenieTlacidlaZlava(), -1, $sirkaTlacidla, $vyskaTlacidla)
	GUICtrlSetFont(-1, $velkostPismaTlacidla)
	$odsadenieRiadkovAbecedyZlava = $odsadenieRiadkovAbecedyZlavaNaVynulovanie ; tretí riadok abecedy
	$tlacidloNm = GUICtrlCreateButton("Ň", $odsadenieRiadkovAbecedyZlava, $odsadenieRiadkovAbecedyZlava + $medzeraMedziTlacidlami * 2, $sirkaTlacidla, $vyskaTlacidla)
	GUICtrlSetFont(-1, $velkostPismaTlacidla)
	$tlacidloO = GUICtrlCreateButton("O", navysOdsadenieTlacidlaZlava(), -1, $sirkaTlacidla, $vyskaTlacidla)
	GUICtrlSetFont(-1, $velkostPismaTlacidla)
	$tlacidloOd = GUICtrlCreateButton("Ó", navysOdsadenieTlacidlaZlava(), -1, $sirkaTlacidla, $vyskaTlacidla)
	GUICtrlSetFont(-1, $velkostPismaTlacidla)
	$tlacidloOv = GUICtrlCreateButton("Ô", navysOdsadenieTlacidlaZlava(), -1, $sirkaTlacidla, $vyskaTlacidla)
	GUICtrlSetFont(-1, $velkostPismaTlacidla)
	$tlacidloP = GUICtrlCreateButton("P", navysOdsadenieTlacidlaZlava(), -1, $sirkaTlacidla, $vyskaTlacidla)
	GUICtrlSetFont(-1, $velkostPismaTlacidla)
	$tlacidloQ = GUICtrlCreateButton("Q", navysOdsadenieTlacidlaZlava(), -1, $sirkaTlacidla, $vyskaTlacidla)
	GUICtrlSetFont(-1, $velkostPismaTlacidla)
	$tlacidloR = GUICtrlCreateButton("R", navysOdsadenieTlacidlaZlava(), -1, $sirkaTlacidla, $vyskaTlacidla)
	GUICtrlSetFont(-1, $velkostPismaTlacidla)
	$tlacidloRd = GUICtrlCreateButton("Ŕ", navysOdsadenieTlacidlaZlava(), -1, $sirkaTlacidla, $vyskaTlacidla)
	GUICtrlSetFont(-1, $velkostPismaTlacidla)
	$tlacidloS = GUICtrlCreateButton("S", navysOdsadenieTlacidlaZlava(), -1, $sirkaTlacidla, $vyskaTlacidla)
	GUICtrlSetFont(-1, $velkostPismaTlacidla)
	$tlacidloSm = GUICtrlCreateButton("Š", navysOdsadenieTlacidlaZlava(), -1, $sirkaTlacidla, $vyskaTlacidla)
	GUICtrlSetFont(-1, $velkostPismaTlacidla)
	$tlacidloT = GUICtrlCreateButton("T", navysOdsadenieTlacidlaZlava(), -1, $sirkaTlacidla, $vyskaTlacidla)
	GUICtrlSetFont(-1, $velkostPismaTlacidla)
	$odsadenieRiadkovAbecedyZlava = $odsadenieRiadkovAbecedyZlavaNaVynulovanie ; štvrtý riadok abecedy
	$tlacidloTm = GUICtrlCreateButton("Ť", $odsadenieRiadkovAbecedyZlava, $odsadenieRiadkovAbecedyZlava + $medzeraMedziTlacidlami * 3, $sirkaTlacidla, $vyskaTlacidla)
	GUICtrlSetFont(-1, $velkostPismaTlacidla)
	$tlacidloU = GUICtrlCreateButton("U", navysOdsadenieTlacidlaZlava(), -1, $sirkaTlacidla, $vyskaTlacidla)
	GUICtrlSetFont(-1, $velkostPismaTlacidla)
	$tlacidloUd = GUICtrlCreateButton("Ú", navysOdsadenieTlacidlaZlava(), -1, $sirkaTlacidla, $vyskaTlacidla)
	GUICtrlSetFont(-1, $velkostPismaTlacidla)
	$tlacidloV = GUICtrlCreateButton("V", navysOdsadenieTlacidlaZlava(), -1, $sirkaTlacidla, $vyskaTlacidla)
	GUICtrlSetFont(-1, $velkostPismaTlacidla)
	$tlacidloW = GUICtrlCreateButton("W", navysOdsadenieTlacidlaZlava(), -1, $sirkaTlacidla, $vyskaTlacidla)
	GUICtrlSetFont(-1, $velkostPismaTlacidla)
	$tlacidloX = GUICtrlCreateButton("X", navysOdsadenieTlacidlaZlava(), -1, $sirkaTlacidla, $vyskaTlacidla)
	GUICtrlSetFont(-1, $velkostPismaTlacidla)
	$tlacidloY = GUICtrlCreateButton("Y", navysOdsadenieTlacidlaZlava(), -1, $sirkaTlacidla, $vyskaTlacidla)
	GUICtrlSetFont(-1, $velkostPismaTlacidla)
	$tlacidloYd = GUICtrlCreateButton("Ý", navysOdsadenieTlacidlaZlava(), -1, $sirkaTlacidla, $vyskaTlacidla)
	GUICtrlSetFont(-1, $velkostPismaTlacidla)
	$tlacidloZ = GUICtrlCreateButton("Z", navysOdsadenieTlacidlaZlava(), -1, $sirkaTlacidla, $vyskaTlacidla)
	GUICtrlSetFont(-1, $velkostPismaTlacidla)
	$tlacidloZm = GUICtrlCreateButton("Ž", navysOdsadenieTlacidlaZlava(), -1, $sirkaTlacidla, $vyskaTlacidla)
	GUICtrlSetFont(-1, $velkostPismaTlacidla)

	; --- LEGENDA ---
	GUICtrlCreateLabel("CH = C + H", $odsadenieRiadkovLegendyZlava, $odsadenieRiadkovLegendyZhora, $sirkaLegendy, $vyskaLegendy)
	GUICtrlSetFont(-1, $velkostPismaLegendy)
	GUICtrlCreateLabel("DZ = D + Z", -1, navysOdsadenieLegendyZhora(), $sirkaLegendy, $vyskaLegendy)
	GUICtrlSetFont(-1, $velkostPismaLegendy)
	GUICtrlCreateLabel("DŽ = D + Ž", -1, navysOdsadenieLegendyZhora(), $sirkaLegendy, $vyskaLegendy)
	GUICtrlSetFont(-1, $velkostPismaLegendy)


	; --- PRÁZDNE PÍSMENÁ ---
	; Slovo môže obsahovať najviac 12 písmen
	; Znak prázdneho písmena: □
	$pismeno1 = GUICtrlCreateLabel("", $odsadenieRiadkovPismenZlava, $odsadenieRiadkovPismenZhora, $sirkaPismena, $vyskaPismena, $SS_CENTER)
	GUICtrlSetFont(-1, 70)
	$pismeno2 = GUICtrlCreateLabel("", navysOdsadeniePismenaZlava(), -1, $sirkaPismena, $vyskaPismena, $SS_CENTER)
	GUICtrlSetFont(-1, 70)
	$pismeno3 = GUICtrlCreateLabel("", navysOdsadeniePismenaZlava(), -1, $sirkaPismena, $vyskaPismena, $SS_CENTER)
	GUICtrlSetFont(-1, 70)
	$pismeno4 = GUICtrlCreateLabel("", navysOdsadeniePismenaZlava(), -1, $sirkaPismena, $vyskaPismena, $SS_CENTER)
	GUICtrlSetFont(-1, 70)
	$pismeno5 = GUICtrlCreateLabel("", navysOdsadeniePismenaZlava(), -1, $sirkaPismena, $vyskaPismena, $SS_CENTER)
	GUICtrlSetFont(-1, 70)
	$pismeno6 = GUICtrlCreateLabel("", navysOdsadeniePismenaZlava(), -1, $sirkaPismena, $vyskaPismena, $SS_CENTER)
	GUICtrlSetFont(-1, 70)
	$pismeno7 = GUICtrlCreateLabel("", navysOdsadeniePismenaZlava(), -1, $sirkaPismena, $vyskaPismena, $SS_CENTER)
	GUICtrlSetFont(-1, 70)
	$pismeno8 = GUICtrlCreateLabel("", navysOdsadeniePismenaZlava(), -1, $sirkaPismena, $vyskaPismena, $SS_CENTER)
	GUICtrlSetFont(-1, 70)
	$pismeno9 = GUICtrlCreateLabel("", navysOdsadeniePismenaZlava(), -1, $sirkaPismena, $vyskaPismena, $SS_CENTER)
	GUICtrlSetFont(-1, 70)
	$pismeno10 = GUICtrlCreateLabel("", navysOdsadeniePismenaZlava(), -1, $sirkaPismena, $vyskaPismena, $SS_CENTER)
	GUICtrlSetFont(-1, 70)
	$pismeno11 = GUICtrlCreateLabel("", navysOdsadeniePismenaZlava(), -1, $sirkaPismena, $vyskaPismena, $SS_CENTER)
	GUICtrlSetFont(-1, 70)
	$pismeno12 = GUICtrlCreateLabel("", navysOdsadeniePismenaZlava(), -1, $sirkaPismena, $vyskaPismena, $SS_CENTER)
	GUICtrlSetFont(-1, 70)

    ; --- Úplne dole... ---

	$tlacidloPomocka = GUICtrlCreateButton("Pomôcka", 20, 520, 160, 50)
	GUICtrlSetFont(-1, 20)
	$tlacidloDalsieSlovo = GUICtrlCreateButton("Ďalšie slovo", 200, 520, 160, 50)
	GUICtrlSetFont(-1, 20)
	$aktualneSlovoPocetSlov = GUICtrlCreateLabel("", 380, 530, 250, 50)
	GUICtrlSetFont(-1, 20)
	$obsahPomocky = GUICtrlCreateLabel("", 20, 600, 1200, 70)
	GUICtrlSetFont(-1, 20)

	; --- SPRACOVANIE SLOVA ---

    spracujSlovo()
GUISetState(@SW_SHOW)

While 1
	Switch GUIGetMsg()
		Case $GUI_EVENT_CLOSE
			ExitLoop
		Case $tlacidloA
			GUICtrlSetState($tlacidloA, $GUI_DISABLE)
			overPismeno("A")
		Case $tlacidloAd
			GUICtrlSetState($tlacidloAd, $GUI_DISABLE)
			overPismeno("Á")
		Case $tlacidloAp
			GUICtrlSetState($tlacidloAp, $GUI_DISABLE)
			overPismeno("Ä")
		Case $tlacidloB
			GUICtrlSetState($tlacidloB, $GUI_DISABLE)
			overPismeno("B")
		Case $tlacidloC
			GUICtrlSetState($tlacidloC, $GUI_DISABLE)
			overPismeno("C")
		Case $tlacidloCm
			GUICtrlSetState($tlacidloCm, $GUI_DISABLE)
			overPismeno("Č")
		Case $tlacidloD
			GUICtrlSetState($tlacidloD, $GUI_DISABLE)
			overPismeno("D")
		Case $tlacidloDm
			GUICtrlSetState($tlacidloDm, $GUI_DISABLE)
			overPismeno("Ď")
		Case $tlacidloE
			GUICtrlSetState($tlacidloE, $GUI_DISABLE)
			overPismeno("E")
		Case $tlacidloEd
			GUICtrlSetState($tlacidloEd, $GUI_DISABLE)
			overPismeno("É")
		Case $tlacidloF
			GUICtrlSetState($tlacidloF, $GUI_DISABLE)
			overPismeno("F")
		Case $tlacidloG
			GUICtrlSetState($tlacidloG, $GUI_DISABLE)
			overPismeno("G")
		Case $tlacidloH
			GUICtrlSetState($tlacidloH, $GUI_DISABLE)
			overPismeno("H")
		Case $tlacidloI
			GUICtrlSetState($tlacidloI, $GUI_DISABLE)
			overPismeno("I")
		Case $tlacidloId
			GUICtrlSetState($tlacidloId, $GUI_DISABLE)
			overPismeno("Í")
		Case $tlacidloJ
			GUICtrlSetState($tlacidloJ, $GUI_DISABLE)
			overPismeno("J")
		Case $tlacidloK
			GUICtrlSetState($tlacidloK, $GUI_DISABLE)
			overPismeno("K")
		Case $tlacidloL
			GUICtrlSetState($tlacidloL, $GUI_DISABLE)
			overPismeno("L")
		Case $tlacidloLd
			GUICtrlSetState($tlacidloLd, $GUI_DISABLE)
			overPismeno("Ĺ")
		Case $tlacidloLm
			GUICtrlSetState($tlacidloLm, $GUI_DISABLE)
			overPismeno("Ľ")
		Case $tlacidloM
			GUICtrlSetState($tlacidloM, $GUI_DISABLE)
			overPismeno("M")
		Case $tlacidloN
			GUICtrlSetState($tlacidloN, $GUI_DISABLE)
			overPismeno("N")
		Case $tlacidloNm
			GUICtrlSetState($tlacidloNm, $GUI_DISABLE)
			overPismeno("Ň")
		Case $tlacidloO
			GUICtrlSetState($tlacidloO, $GUI_DISABLE)
			overPismeno("O")
		Case $tlacidloOd
			GUICtrlSetState($tlacidloOd, $GUI_DISABLE)
			overPismeno("Ó")
		Case $tlacidloOv
			GUICtrlSetState($tlacidloOv, $GUI_DISABLE)
			overPismeno("Ô")
		Case $tlacidloP
			GUICtrlSetState($tlacidloP, $GUI_DISABLE)
			overPismeno("P")
		Case $tlacidloQ
			GUICtrlSetState($tlacidloQ, $GUI_DISABLE)
			overPismeno("Q")
		Case $tlacidloR
			GUICtrlSetState($tlacidloR, $GUI_DISABLE)
			overPismeno("R")
		Case $tlacidloRd
			GUICtrlSetState($tlacidloRd, $GUI_DISABLE)
			overPismeno("Ŕ")
		Case $tlacidloS
			GUICtrlSetState($tlacidloS, $GUI_DISABLE)
			overPismeno("S")
		Case $tlacidloSm
			GUICtrlSetState($tlacidloSm, $GUI_DISABLE)
			overPismeno("Š")
		Case $tlacidloT
			GUICtrlSetState($tlacidloT, $GUI_DISABLE)
			overPismeno("T")
		Case $tlacidloTm
			GUICtrlSetState($tlacidloTm, $GUI_DISABLE)
			overPismeno("Ť")
		Case $tlacidloU
			GUICtrlSetState($tlacidloU, $GUI_DISABLE)
			overPismeno("U")
		Case $tlacidloUd
			GUICtrlSetState($tlacidloUd, $GUI_DISABLE)
			overPismeno("Ú")
		Case $tlacidloV
			GUICtrlSetState($tlacidloV, $GUI_DISABLE)
			overPismeno("V")
		Case $tlacidloW
			GUICtrlSetState($tlacidloW, $GUI_DISABLE)
			overPismeno("W")
		Case $tlacidloX
			GUICtrlSetState($tlacidloX, $GUI_DISABLE)
			overPismeno("X")
		Case $tlacidloY
			GUICtrlSetState($tlacidloY, $GUI_DISABLE)
			overPismeno("Y")
		Case $tlacidloYd
			GUICtrlSetState($tlacidloYd, $GUI_DISABLE)
			overPismeno("Ý")
		Case $tlacidloZ
			GUICtrlSetState($tlacidloZ, $GUI_DISABLE)
			overPismeno("Z")
		Case $tlacidloZm
			GUICtrlSetState($tlacidloZm, $GUI_DISABLE)
			overPismeno("Ž")
		Case $tlacidloDalsieSlovo
			$slovoCislo = $slovoCislo + 1
			spracujSlovo()
		Case $tlacidloPomocka
			GUICtrlSetState($tlacidloPomocka, $GUI_DISABLE)
			$suborSlovaPomockaRiadok = FileReadLine($suborSlova, $slovoCislo)
			$suborSlovaPomockaRiadokCast = StringSplit($suborSlovaPomockaRiadok, Chr(9))
			GUICtrlSetData($obsahPomocky, $suborSlovaPomockaRiadokCast[2])
	EndSwitch
WEnd

Func spracujSlovo()
   ; Vymaž a znovu vytvor INI súbor
   FileDelete($suborSlovo)
   $suborSlovoVytvor = FileOpen($suborSlovo, 33)
   FileClose($suborSlovoVytvor)
   ; Všetky tlačidlá abecedy nastaví ako aktívne (klikateľné), takže ak boli $GUI_DISABLE, teraz budú $GUI_ENABLE
   For $konkretneTlacidlo = $tlacidloA To $tlacidloZm
	  GUICtrlSetState($konkretneTlacidlo, $GUI_ENABLE)
   Next
   ; Všetky písmená slova zmení na prázdne
   For $cifra = 1 To 12
	  GUICtrlSetData(Eval("pismeno" & $cifra), "")
   Next
   ; Všetky písmená slova načíta z TSV súboru a zapíše do INI súboru
   $suborSlovaPole = FileReadToArray($suborSlova)
   $suborSlovaText = _ArrayToString($suborSlovaPole, "@CRLF")
   $suborSlovaTextRiadok = StringSplit($suborSlovaText, "@CRLF", 1)
   $suborSlovaTextRiadokCast = StringSplit($suborSlovaTextRiadok[$slovoCislo], Chr(9))
   $pocetPismen = StringLen($suborSlovaTextRiadokCast[1])
   For $pismenoCislo = 1 To $pocetPismen
	  IniWrite($suborSlovo, "slovo", $pismenoCislo, StringMid($suborSlovaTextRiadokCast[1], $pismenoCislo, 1)) ;zapíš poradové číslo písmena v slove a písmeno k nemu prislúchajúce
   Next
   ; Všetky písmená slova načíta z INI súboru a zapíše do GUI
   For $pismenoCislo = 1 To $pocetPismen
	  $pismenoNacitane = IniRead($suborSlovo, "slovo", $pismenoCislo, "NF")
	  If $pismenoNacitane = "NF" Or Asc($pismenoNacitane) = 0 Then
		 GUICtrlSetData(Eval("pismeno" & $pismenoCislo), "")
	  Else
		 GUICtrlSetData(Eval("pismeno" & $pismenoCislo), "□")
	  EndIf
   Next
   GUICtrlSetData($aktualneSlovoPocetSlov, $slovoCislo & "/" & $suborSlovaTextRiadok[0] & " (písmen: " & $pocetPismen & ")")
   If $slovoCislo = $suborSlovaTextRiadok[0] Then GUICtrlSetState($tlacidloDalsieSlovo, $GUI_DISABLE)
   GUICtrlSetData($obsahPomocky, "")
   GUICtrlSetState($tlacidloPomocka, $GUI_ENABLE)
EndFunc

Func overPismeno($pismenoNaOverenie)
	$pismenaSlova = IniReadSection($suborSlovo, "slovo")
    For $poradoveCisloPismena = 1 To $pismenaSlova[0][0]
	   If $pismenoNaOverenie = $pismenaSlova[$poradoveCisloPismena][1] Then
		  GUICtrlSetData(Eval("pismeno" & $poradoveCisloPismena), $pismenaSlova[$poradoveCisloPismena][1])
		  ContinueLoop
	   EndIf
    Next
EndFunc

Func navysOdsadenieTlacidlaZlava()
	$odsadenieRiadkovAbecedyZlava = $odsadenieRiadkovAbecedyZlava + $medzeraMedziTlacidlami
	Return $odsadenieRiadkovAbecedyZlava
EndFunc

Func navysOdsadenieLegendyZhora()
	$odsadenieRiadkovLegendyZhora = $odsadenieRiadkovLegendyZhora + $medzeraMedziLegendami
	Return $odsadenieRiadkovLegendyZhora
EndFunc

Func navysOdsadeniePismenaZlava()
	$odsadenieRiadkovPismenZlava = $odsadenieRiadkovPismenZlava + $medzeraMedziPismenami
	Return $odsadenieRiadkovPismenZlava
EndFunc