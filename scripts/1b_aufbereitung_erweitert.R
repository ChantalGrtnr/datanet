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
  filter(!is.na(verses)) %>% 
  separate_rows(verses,sep=",") 

# - pairwise_count: auszählen von den gemeinsam in Versen auftretenden Personen
# - filter: Nur Verbindungen beibehalten, die mindestens 2 mal auftreten
person_edges <- person_edges %>% 
  pairwise_count(personID,verses,upper=F) %>% 
  filter(n > 1) %>% 
  rename(source=item1,target=item2)


# Knotenliste aus der Kantenliste erstellen
# - pivot_longer: Inhalte der Spalten source und target untereinander
#                 (Wide- zu Long-Format)
# - left_join: weitere Daten aus der persons-Tabelle anfügen
person_nodes <- person_edges %>% 
  pivot_longer(cols=c("source", "target"), values_to="id") %>% 
  distinct(id) %>% 
  left_join(persons, by= c("id"="personID"))

# Spalten umbenennen und
# kennzeichnen, in welchem Evangelium eine Person auftritt
person_nodes <- person_nodes %>% 
  select(id, label=displayTitle, verses, `Disambiguation (temp)`, gender) %>% 
  mutate(matt = str_detect(verses, "Matt.*")) %>% 
  mutate(luke = str_detect(verses, "Luke.*")) %>% 
  mutate(mark = str_detect(verses, "Mark.*")) %>% 
  mutate(john = str_detect(verses, "John.*")) %>% 
  mutate(gospel = matt + luke + mark + john) %>% 
  distinct()


# Knoten- und Kantenliste abspeichern
write_csv(person_edges, "../data/person_edges.csv")
write_csv(person_nodes, "../data/person_nodes.csv")
