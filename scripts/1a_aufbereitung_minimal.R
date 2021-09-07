#
# Libraries laden ----
#

library(tidyverse)
library(widyr)

#
# Daten einlesen ----
#

persons <- read_csv("../data/People.csv")

# Kanteliste erstellen: 
# - separate_rows: je Vers eine Zeile 
person_edges <- persons %>% 
  select(personID,displayTitle,verses) %>% 
  separate_rows(verses,sep=",") 

# - pairwise_count: auszählen von den gemeinsam in Versen auftretenden Personen
person_edges <- person_edges %>% 
  pairwise_count(personID,verses) %>% 
  select(source=item1,target=item2,n)

# Knotenliste aus der Kantenliste erstellen
# - pivot_longer: Inhalte der Spalten source und target untereinander
#                 (Wide- zu Long-Format)
person_nodes <- person_edges %>% 
  pivot_longer(cols=c("source", "target"), values_to="id") %>% 
  distinct(id) 


# Knoten- und Kantenliste abspeichern
write_csv(person_edges, "../data/person_edges.csv")
write_csv(person_nodes, "../data/person_nodes.csv")
