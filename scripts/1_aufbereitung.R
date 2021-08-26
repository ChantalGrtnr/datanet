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
# - je Vers eine Zeile 
# - auszählen von den gemeinsam in Versen auftretenden Personen
# - filtern: Nur Verbindungen beibehalten, die mindestens 2 mal auftreten
person_verses <- persons %>% 
  filter(!is.na(verses)) %>% 
  separate_rows(verses,sep=",")

person_verses <- person_verses %>% 
  pairwise_count(personID,verses) %>% 
  filter(n > 1) %>% 
  rename(source=item1,target=item2)


# Knotenliste erstellen aus der Kantenliste
person_nodes <- person_verses %>% 
  pivot_longer(cols=c("source", "target"), values_to="id") %>% 
  distinct(id) %>% 
  #mutate(id = as.character(id)) %>% 
  left_join(persons, by= c("id"="personID"))

person_nodes <- person_nodes %>% 
  filter(!is.na(verses)) %>% 
  select(id, label=displayTitle, verses, `Disambiguation (temp)`, gender) %>% 
  mutate(matt = str_detect(verses, "Matt.*")) %>% 
  mutate(luke = str_detect(verses, "Luke.*")) %>% 
  mutate(mark = str_detect(verses, "Mark.*")) %>% 
  mutate(john = str_detect(verses, "John.*")) %>% 
  mutate(gospel = matt + luke + mark + john) %>% 
  distinct()



# Knoten- und Kantenliste abspeichern
write_csv(person_verses, "../data/person_verses_edges.csv")
write_csv(person_nodes, "../data/person_verses_nodes.csv")
