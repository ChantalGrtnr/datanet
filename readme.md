# Workshop Netzwerkanalyse

Dieses Repositorium enthält Übungsmaterialen zum Workshop. 

## Vorbereitung
Zur Vorbereitung laden Sie sich bitte zunächst das Repositorium herunter, indem Sie auf Code -> Download ZIP klicken. Und installieren Sie bitte folgende Software:

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
```

## Grundbegriffe der Netzwerkanalyse
Elemente von Netzwerken: 
- Knoten (Uni-, Bi-, Multimodal)
- Kanten (Uni-, Multiplex; gewichtet, gerichtet)

Maße zur Analyse von Netzwerken: 
- Größe (Wie viele Knoten hat das Netzwerk?) 
- Dichte (Wie viele Kanten sind realsiert?)

