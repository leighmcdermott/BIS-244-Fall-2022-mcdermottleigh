# Assignment 4 Leigh McDermott

library("tidyverse")
DF = read_csv("WOT.csv")
DF_Final = filter(DF, Battles >= 4)

DF_Final$WR = as.numeric(gsub("%","",DF_Final$WR, fixed = TRUE))

p1 = ggplot(data = DF_Final, mapping = aes(x = reorder(Nation, WR, na.rm = TRUE), y = WR)) + 
  labs(x = "Nation Played", y = "Win Rate (WR)", title = "Stats By Nation Played") + geom_boxplot()

p2 = ggplot(data = DF_Final, mapping = aes(x = reorder(Class, WR, na.rm = TRUE), y = WR))+
  labs(x = "Type Played", y = "Win Rate (WR)", title = "Stats By Nation Played") + geom_boxplot()

library(patchwork)

p1+p2
