# Hestia 1.0.0 - Simulatie model gebouwde omgeving Nederland
![goddess-hestia_medium](https://github.com/RuudvandenWijngaart/VestaDV/assets/96182097/e2f3578d-6d44-4c40-853b-107187a1baa7)

PBL en TNO hebben de handen ineengeslagen voor de ontwikkeling van het innovatieve simulatiemodel Hestia, dat zich richt op de gebouwde omgeving. Hestia is een open source geografisch simulatiemodel dat alle woningen in Nederland modelleert, met als doel de effecten van beleid of andere invloeden te evalueren. Het model berekent naast de ontwikkeling van het gas-, elektriciteits- en warmteverbruik ook de kosten en baten van investeringen voor alle relevante actoren en vele andere aspecten gerelateerd aan de verduurzaming van woningen.

Voor ieder jaar (van 2000 tot 2050) modelleert Hestia de energetische kwaliteit van de woningvoorraad, en simuleert tot op individueel woningniveau – en de aparte bouwdelen – het investeringsgedrag van woningeigenaren. Dat investeringsgedrag is gebaseerd op realistische business cases en trends in genomen maatregelen. De scenario’s worden opgebouwd vanuit feitelijke data onder andere afkomstig uit de (3D) BAG, CBS en KNMI. Deze data worden jaarlijks gekalibreerd en geüpdatet.

## Installatie
<details>
<summary><b>GeoDMS software</b></summary>
<p>Open source Geographic Data & Model Software (GeoDMS) wordt actief ontwikkeld voor het maken van (geografisch expliciete) plannings ondersteunings systemen. Navigeer voor de installatie van GeoDMS naar de <a href="https://github.com/ObjectVision/GeoDMS/releases">releases</a> pagina van <a href="https://github.com/ObjectVision/GeoDMS">GeoDMS</a> en volg de installatie stappen.</p>
</details>
<details>
<summary><b>Brondata</b></summary>
<p>De brondata folder, SD51, voor Hestia staat onder versiebeheer van PBL, download informatie kan worden opgevraagt via medewerker@pbl.nl.</p>
</details>
<details>
<summary><b>Hestia</b></summary>
<p>
Het Hestia model staat onder Github versiebeheer op de PBL repository. Om het model lokaal binnen te halen raden wij twee mogelijkheden aan:

<b>1. git client</b>
- (optioneel) mocht uw systeem geen git client hebben, installeer deze bijvoorbeeld via https://gitforwindows.org/ voor een Windows command promt programma of https://tortoisegit.org/ voor een grafische git client. De volgende stappen zijn voor git via de command promt.
- navigeer via de command prompt naar de folder waar u Hestia lokaal wilt binnen halen
- clone Hestia lokaal: <code>git clone https://github.com/RuudvandenWijngaart/VestaDV.git</code>
- stap in de Hestia model folder: <code>cd Hestia</code>
- verander de huidige branch naar de gewenste branch <code>git switch HESTIA-v1.0.0</code>
  
<b>2. Directe Download</b>
- open de Github Hestia [hoofdpagina](https://github.com/RuudvandenWijngaart/VestaDV)
- verander de huidige branch naar de gewenste branch
- klik op de "Code" dropdown en kies "Download Zip"
- Pak het zip uit in de gewenste folder en (optioneel) pas de hoofdfoldernaam aan
- verander de huidige branch naar de gewenste branch <code>git switch Hestia-v1.0.0</code>
  </details>
  </p>
</details>

## Eerste gebruik
Als gebruiker heeft u, na het volgen van bovenstaande installatie stappen, lokaal beschikking over GeoDMS en zowel de broncode als de brondata van het Hestia model. De volgende stappen helpen u om een eerste modelrun aan te zetten:

<details>
<summary><b>GeoDMS en Hestia brondata</b></summary>
<p>
  
- Open de grafische interface van GeoDMS, <b>GeoDMSGui.exe</b>. 
- Open het Hestia model via: :open_file_folder: File :arrow_right: Open :arrow_right: [pad/naar/HESTIA/]/Runs/HestiaRun.dms.
- Zorg dat in Tools :arrow_right: Options :arrow_right: GUI de "Show Hidden Items" optie aan staat.
- Ga vervolgens naar Tools :arrow_right: Options :arrow_right: Configuration en voeg na %sourceDataDir%/ de uiteindelijke root van de HESTIA brondata folder toe, dus bijvoorbeeld %sourceDataDir%/SD51, of alternatief het volledige pad zonder placeholder.
</p>
</details>

<details>
<summary><b>(optioneel) Een tekst editor instellen </b></summary>
<p>
GeoDMS broncode is georganiseerd in :open_file_folder:.dms files. Optioneel is het mogelijk dat u als gebruiker het pad naar een editor in stelt zodat vanuit de GeoDMSGui treeview naar .dms broncode gesprongen kan worden. Het pad naar de editor is te vinden in Tools :arrow_right: Options :arrow_right: Advanced :arrow_right: DMS editor. Het DMS editor path ziet er standaard als volgt uit: "%env:ProgramFiles%\Notepad++\Notepad++.exe" "%F" -n%L. De 64-bit versie van Notepad++ is <a href="https://notepad-plus-plus.org/downloads/">hier</a> te downloaden. 
  
Na installatie kunt u controleren dat de installatie goed is gegaan door in de HESTIA configuratie te navigeren naar Invoer/StudieGebied en met rechter-muisknop het contextmenu te openen en vervolgens te klikken op "Edit Config Source" of alternatief na selectie van het StudieGebied item de snelkoppeling ctrl-e in te drukken. Als alles goed is komt nu Notepad++ op, op de locatie waar de  studiegebied invoer parameter is beschreven.  

</p>
</details>

<details>
<summary><b>Studiegebied instellen</b></summary>
<p>
  
- Het studiegebied is een van de invoer paremeters van het Hestia model. Deze parameter kan worden aangepast in de file [pad/naar/Hestia/]/Runs/HestiaRun.dms.
- U kunt naar deze file navigeren zoals beschreven onder het kopje <b>(optioneel) Een tekst editor instellen</b> of alternatief via de Windows OS file browser.
- Hestia is in staat heel Nederland door te rekenen met de juiste hardware. Voor een eerste run kunnen we het studiegebied het beste instellen op een aantal gemeenten
- Om dit te doen, comment de regel met parameter<string>   StudieGebied : ['NL']; door twee forward-slashes: //parameter<string>   StudieGebied : ['NL'];
- En haal de twee forward-slashes weg van de regel met 9 gemeenten als studiegebied parameter<string>   StudieGebied : ['GM0402,GM0344,GM1581,GM0439,GM0153,GM0599,GM0034,GM0050,GM0321'];
- (optioneel) U kunt ook uw eigen gemeente als studiegebied invoeren, voor een overzicht van gemeente codes gebruikt door HESTIA raadpleeg het volgende bestand in de brondata van Hestia: [pad/naar/brondata/Hestia]/hulpbestanden/buurt/20220728_CBS_buurt_2020.dbf, of alternatief open item /Geography/RegioIndelingen/Gemeente/GM_code in de GeoDMSGui en kies uit het rechter-muisknop context menu 'Tableview' of ctrl-d. 
- sla de file op en ga terug naar de GeoDMSGui.
- als het goed is geeft GeoDMS aan dat de configuratie aangepast is, klik op 'Yes'.
- bij het opvragen van het item /Invoer/StudieGebied (rechter-muisknop TableView of ctrl-d) zal het nieuwe studiegebied nu zichtbaar moeten zijn.
</p>
</details>

### Een eerste Hestia simulatie aanzetten
Nu GeoDMS bij de brondata kan en het studiegebied is geconfigureerd is het tijd voor een eerste modelrun. Navigeer in GeoDMSGui naar het item  /Resultaten/R1_2021/Generate/all en kies uit het rechter-muisknop context menu 'Tableview' of ctrl-d. GeoDMS gaat als het goed is rekenen. Onderin tellen de items af die nog moeten worden uitgerekend. Wanneer de resultaten klaar zijn, zal er 'Ready' staan in de TableView.
  
De resultaten worden onder het pad: Tools :arrow_right: Options :arrow_right: Advanced :arrow_right: LocalDataDir /HESTIA/Results/R1_2021/NL/... 
  
## Parameters aanpassen
Naast het studiegebied zijn er ook andere parameters die aangepast kunnen worden:
- eerste_jaar: het eerste jaar van de modelrun, te als item /eerste_jaar in GeoDMSGui of in HestiaRun.dms
- aantal_jaar: het aantal jaren waar de model run over rekent, te als item /aantal_jaar in GeoDMSGui of in HestiaRun.dms

## Veel voorkomende problemen
<details>
<summary><b>Te weinig geheugen</b></summary>
<p>
Hestia kan, zeker als het studiegebied op heel Nederland staat ingesteld, veel geheugen vragen van uw machine. Dit kan leiden tot een crash van GeoDMS tijdens een model run. Het is mogelijk dit op te lossen door het virtueel geheugen dat ter beschikking van het Windows OS uit te breiden. Volg hiervoor de instructies op de GeoDMS Wiki over het<a href="https://github.com/ObjectVision/GeoDMS/wiki/Virtual-memory"> virtueel geheugen uitbreiden</a>.
</p>
<p>
Een specifieke aanleiding voor een tekort aan geheugen kan zijn dat er in een zichtjaar een groot aantal woningen wordt geactiveerd door opgegeven beleid. Als een woning geactiveerd is, dan wordt voor deze woning een investeringsafweging gedaan en dit is geheugenintensief. Voor meer informatie over activatie, zie hoofdstuk 4 van het Functioneel Ontwerp. Mogelijke oplossingen voor deze aanleiding van een geheugentekort is het verspreiden van het beleid over meerdere zichtjaren, of het verkleinen van de groep woningen die door het beleid wordt geraakt.
</p>
</details>

## Meer informatie
In het Functioneel Ontwerp wordt de werking van Hestia tot in detail beschreven. Het Functioneel Ontwerp is als Word-document te vinden onder het pad: doc :arrow_right: PBL-2023-Functioneel-ontwerp-Hestia-1.0-5196. In hoofdstuk 3, Scenario, wordt verder ingegaan op mogelijke aanpassingen aan de scenarioinstellingen. Dit betreft onder andere klimaatscenario's, kostenontwikkelingcurves en beleid.