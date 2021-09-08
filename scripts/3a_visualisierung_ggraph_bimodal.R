#
# Libraries laden ----
#

library(tidyverse)
library(widyr)
library(writexl)
library(tidygraph)
library(ggraph)

#
# Daten einlesen ----
#

persons <- read_csv("../data/People.csv")


# Kanteliste erstellen: 
# - separate_rows: je Vers eine Zeile 
person_verses <- persons %>% 
  filter(!is.na(verses)) %>% 
  separate_rows(verses,sep=",")


#
# Bimodal ----
#

matt_bi <- person_verses %>% 
  filter(str_detect(verses,"^Matt\\.1\\.[123]$")) %>% 
  select(displayTitle,verses)


matt_edges <- matt_bi %>% 
  select(source=displayTitle,target=verses)

matt_nodes <- 
  bind_rows(
    select(matt_bi,id=displayTitle) %>% mutate(type="person"),
    select(matt_bi,id=verses) %>% mutate(type="verse")
    ) %>% 
  distinct() %>% 
  mutate(type = type=="person")

  
graph_bi <- tbl_graph(nodes=matt_nodes,edges = matt_edges, directed = TRUE)
graph_bi

ggraph(graph_bi, layout='igraph',algorithm="circle") + 
  geom_edge_link() + 
  geom_node_label(aes(label = id,fill=type)) + 
  scale_fill_manual(values=c("orange","lightblue"),guide=F) +
  coord_fixed() +
  expand_limits(x=2) +
  theme_void() 


#
# Unimodal
#

matt_uni <- matt_bi %>% 
  pairwise_count(displayTitle,verses) 
  

graph_uni <- tbl_graph(edges = matt_uni, directed = FALSE)

ggraph(graph_uni, layout='igraph',algorithm="circle") + 
  geom_edge_link() + 
  geom_node_label(aes(label = name),fill="lightblue") + 
  coord_fixed() +
  expand_limits(x=2) +
  theme_void()

