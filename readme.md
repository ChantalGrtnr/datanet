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

## 1 Grundbegriffe der Netzwerkanalyse
Elemente von Netzwerken: 
- *Knoten*: z.B. Akteure, Konzepte (Uni-, Bi-, Multimodal)
- *Kanten*: Beziehungen zwischen den Knoten (Uni-, Multiplex; gewichtet, gerichtet)

Ebenen von Netzwerken: *Gesamtnetzwerke*, *Teilnetzwerke* (u.a. Diade, Triade, Cliquen, Komponenten, Egonetzwerke), *einzelne Knoten und Kanten*

Maße zur Analyse von Netzwerken: 
- *Größe* (Wie viele Knoten hat das Netzwerk?) 
- *Dichte* (Wie viele Kanten sind realsiert?)
- *Reziprozität* (Wie viele Beziehungen sind wechselseitig?)
- *Komponenten* (Wie viele einzelne Teilnetzwerke umfasst das Gesamtnetzwerk?)
- *Durchschnittliche Entfernung* (Wie viele Schritte sind die Knoten voneinander weg?)
- *Zentralität* (Wie hierarchisch ist das Netzwerk?)

Maße zur Analyse von zentralen Knoten:
- *Degree* (Wie viele direkte Beziehungen hat ein Knoten?)
- *Betweenness* (Auf wie vielen kürzesten Verbindungen liegt ein Knoten?)
- *Closeness* (Wie nah ist ein Knoten zu allen aderen Knoten im Netzwerk?)

## 2 Netzwerkvisualisierung 

In Gephi: Open Source Software für die Analyse und Visualisierung von Graphen und Netzwerken.

Zu Beginn: Neues Projekt erstellen 

Daten einlesen im Arbeitsbereich "Data Laboratory" 
Unter ```Import Spreadsheet``` Knoten- und Kantenliste je separat einlesen und durch Dialogfenster klicken. Wichtig: am Ende "Append to existing Workspace" ankreuzen

Netzwerk gestalten im Arbeitsbereich "Overview"
- Layout: Gestaltungslayout, z.B. "ForceAtlas 2" auswählen und auf ```Run``` klicken. 
- Statistics: Maße zur Netzwerkanalyse durch ```Run```ermitteln.
- Grafische Gestaltung: unter "Appearance", z.B. Knoten einfärben und in ihrer Größe ändern. 
- Beschriftung: am unteren Rand Label einblenden und in ihrer Größe verändern

Netzwerkgrafik abspeichern im Arbeitsbereich "Preview"

## 3 Datenerhebung 

*to be added*

## 4 Einführung in R 

*to be added*

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

*to be added*


