#
# Libraries ----
#
library(visNetwork)
library(igraph)
library(tidyverse)

#
# Daten einlesen ----
#

person_edges <- read_csv("../data/person_edges.csv", col_types = cols(.default = "c"))
person_nodes <- read_csv("../data/person_nodes.csv", col_types = cols(.default = "c"))

#
# Daten aufbereiten ----
#

# Ego-Netzwerk um Gott

god_id <- filter(person_nodes, label == "God")

ego_edges <- person_edges %>% 
  filter(source == god_id$id | target == god_id$id)
  
ego_nodes <- ego_edges %>% 
  pivot_longer(cols=c("source", "target"), values_to="id") %>% 
  distinct(id) %>% 
  left_join(person_nodes, by="id")


# Kanten umformatieren für visNetwork
ego_edges <- ego_edges %>% 
  rename(from = source, to = target)


#
# Netzwerkgrafik erstellen ----
# Formatierungen, z.B.: 
# - Knoten stabilisieren über "fixed"
# - gravitationalConstant = -20000
visNetwork(ego_nodes, ego_edges, width = "100%")%>% 
  visConfigure(enabled = T)

