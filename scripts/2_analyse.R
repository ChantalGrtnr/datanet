#
# Libraries ----
#

library(tidyverse)
library(tidygraph)
library(widyr)
library(igraph)

#
# Daten einlesen ----
#

person_edges <- read_csv("../data/person_edges.csv", col_types = cols(.default = "c"))
person_nodes <- read_csv("../data/person_nodes.csv", col_types = cols(.default = "c"))

#
# Graph-Objekt erstellen ----
#

persons_graph <- tbl_graph(person_nodes, person_edges, directed = FALSE)


# Graph-Objekt mit Eigenschaften anzeigen lassen
print(persons_graph)


#
# Netzwerkmaße auf Ebene des gesamten Netzwerkes ----
#

# Dichte berechnen
graph.density(persons_graph)

# Entfernungen ermittlen 
average.path.length(persons_graph)

# Anzahl der Komponenten 
no.clusters(persons_graph)


#
# Zentralität auf Ebene der Knoten ----
#

# Zentralitätsmaß Degree ermitteln

persons_graph <- persons_graph %>% 
  mutate(degree = centrality_degree()) 

# neue Nodes-Tabelle mit den ermittelten Zentralitätsmaßen 
person_nodes <- persons_graph %>%
  activate("nodes") %>%
  as_tibble() 

# Top-5 der Zentralsten Akteure nach dem Degree
# - arrange(): sortiert die angegebene Variable. Absteigend durch "-"
# - slice_head(): behält nur die top-n Zeilen
person_nodes %>% 
  arrange(-degree)


# Übung: Wer ist der:die zentralste Akteur:in in der Bibel?
# - Zentralste Akteur:innen nach den Zentralitätsmaßen 
#   Betweenness und Closeness ermitteln (siehe Hilfe zu centrality_degree)
# - Output vergleichen

