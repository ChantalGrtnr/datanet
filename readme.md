# Workshop Netzwerkanalyse

Dieses Repositorium enthält Übungsmaterialen zum Workshop. 

## 0 Vorbereitung
Zur Vorbereitung installieren Sie bitte folgende Software. Laden Sie sich bitte kurz vor dem Workshop auch das Repositorium herunter, indem Sie auf Code -> Download ZIP klicken. 

**Gephi**
ist ein Programm, das für die Darstellung und Analyse umfangreicher Netzwerkdaten entwickelt wird. Laden Sie es von der Projektseite herunter und installieren Sie es auf Ihrem Computer: https://gephi.org/users/download/. Gephi ist in der Programmiergespräche Java geschrieben, deshalb benötigen Sie falls auf Ihrem Computer noch nicht vorhanden die Java Laufzeitumgebung, achten Sie darauf die 64Bit-Version herunterzuladen: https://www.java.com/de/download/.


**R**
ist eine Programmiersprache für statistische Auswertungen. Für die Arbeit mit R empfehlen wir die Entwicklungsumgebung RStudio. Um damit Netzwerkanalysen durchführen zu können, werden in R weitere Packages benötigt. Installieren Sie R, RStudio und die Packages:

- R: https://cran.r-project.org/
- RStudio Desktop: https://rstudio.com/products/rstudio/download/
- Packages: tidyverse, tidygraph, ggraph, widyr

Zur Installation der Packages öffnen Sie RStudio, kopieren folgenden Code in die Konsole (links bzw. links unten) und bestätigen mit Enter:
```
install.packages("tidyverse")
install.packages("tidygraph")
install.packages("ggraph")
install.packages("widyr")
install.packages("igraph")
install.packages("visNetwork")
```

Die Installation kann einige Zeit in Anspruch nehmen. In der Konsole können Sie den Fortschritt sehen. Dabei können Warnmeldungen angezeigt werden, die Sie im Moment nicht weiter beachten müssen.

## Ordner und Materialien
data: In diesem Ordner sind alle Dateien für die Netzwerkanalyse abgelegt:
- People.csv: Ausgangsdatensatz aus dem Knowledge-Graph Theographic. Quelle: https://github.com/robertrouse/theographic-bible-metadata
- person_edges.csv: Kantenliste (wird selbst erstellt)
- person_nodes.csv: Knotenliste (wird selbst erstellt)

scripts: Ordner mit allen R-Skripten für die Datenaufbereitung und -analyse
- 1_aufbereitung.R: Aufbereitung des Datensatzes zur Knoten- und Kantenliste
- 2_analyse.R: Analyse des Netzwerkes
- 3_visualisierung.R Visualisierung eines Egonetzwerkes in R 

docs: Ordner mit Texten zum Nachlesen
- Einführung in R
- Einführung in die Netzwerkanalyse
- Folien des Workshops

## 1 Grundbegriffe der Netzwerkanalyse
Elemente von Netzwerken: 
- *Knoten*: z.B. Akteure, Konzepte (Uni-, Bi-, Multimodal)
- *Kanten*: Beziehungen zwischen den Knoten (Uni-, Multiplex; gewichtet, gerichtet)

Ebenen von Netzwerken: *Gesamtnetzwerke*, *Teilnetzwerke* (u.a. Diade, Triade, Cliquen, Komponenten, Egonetzwerke), *einzelne Knoten und Kanten*

Maße zur Analyse von Netzwerken: 
- *Größe*: Wie viele Knoten hat das Netzwerk?
- *Dichte*: Wie viele Kanten sind realsiert?
- *Reziprozität*: Wie viele Beziehungen sind wechselseitig?
- *Komponenten*: Wie viele einzelne Teilnetzwerke umfasst das Gesamtnetzwerk?
- *Durchschnittliche Entfernung*: Wie viele Schritte sind die Knoten voneinander weg?
- *Zentralität*: Wie hierarchisch ist das Netzwerk?

Maße zur Analyse von zentralen Knoten:
- *Degree*: Wie viele direkte Beziehungen hat ein Knoten?
- *Betweenness*: Auf wie vielen kürzesten Verbindungen liegt ein Knoten?
- *Closeness*: Wie nah ist ein Knoten zu allen aderen Knoten im Netzwerk?


## 2 Datenerhebung 

- Selbst erheben zum Beispiel über Webcrawling, Social-Media-APIs, Wikidata mit Facepager: https://github.com/strohne/Facepager
- Sekundärdaten: zum Beispiel fertige Netzwerkdatensätze für Gephi: https://github.com/gephi/gephi/wiki/Datasets
- Gute Anlaufstelle: https://github.com/briatte/awesome-network-analysis


## 3 Netzwerkvisualisierung 

In Gephi: Open Source Software für die Analyse und Visualisierung von Graphen und Netzwerken.

1. Zu Beginn: Neues Projekt erstellen 

2. Daten einlesen im Arbeitsbereich "Data Laboratory":
Unter ```Import Spreadsheet``` Knoten- und Kantenliste je separat einlesen und durch Dialogfenster klicken. Wichtig: am Ende "Append to existing Workspace" ankreuzen

3. Netzwerk gestalten im Arbeitsbereich "Overview":
- Layout: Gestaltungslayout, z.B. "ForceAtlas 2" auswählen und auf ```Run``` klicken. 
- Statistics: Maße zur Netzwerkanalyse durch ```Run```ermitteln.
- Grafische Gestaltung: unter "Appearance", z.B. Knoten einfärben und in ihrer Größe ändern. 
- Beschriftung: am unteren Rand Label einblenden und in ihrer Größe verändern

4. Netzwerkgrafik abspeichern im Arbeitsbereich "Preview"

## 4 Einführung in R 

- Oberfläche von R
- Projekte und Dateien
- Befehle ausführen mit Strg+Enter / Command + Enter
- Packages laden
- Tidyverse
- Hilfefunktion (F1)
- Datensätze laden (read_csv) und abspeichern (write_csv)
- Dataframes und Tibbles
- Zuweisungsoperator und Pipe


Befehle:
- select
- filter
- mutate
- library
- read_csv
- separate_rows
- pairwise_count
- pivot_longer
- distinct
- write_csv

Siehe auch https://www.statmethods.net/

## 5 Netzwerkanalyse mit R

Pakete, die Funktionen für die Netzwerkanalyse bereitstellen: tidygraph, igraph, ggraph

Grundlegende Befehle zur Netzwerkanalyse: 
- ```tbl_graph()```: Erstellt ein Graph-Objekt aus der Knoten- und Kantenliste 
- ```graph.density()```: Gibt die Dichte des Netzwerkes an 
- ```average.path.length()```: Gibt die durchschnittliche Pfadlänge an
- ```no.clusters()```: Gibt die Anzahl der Komponenten an

Befehle zum Ermitteln von Zentralität:
- ```centrality_degree()```: Errechnet den Degree für die Knoten 


## 6 WikiData

- https://www.wikidata.org/wiki
- https://www.wikidata.org/wiki/Wikidata:Lists/List_of_biblical_characters


# Weiterführende Literatur

- Wasserman, S., & Faust, K. (1994). Social network analysis. Methods and applications. Cambridge: Cambridge Univ. Press.
- Jansen, Dorothea (2003): Einführung in die Netzwerkanalyse. Grundlagen, Methoden, Forschungsbeispiele. 2., erweiterte Auflage. Opladen: Leske+Budrich
