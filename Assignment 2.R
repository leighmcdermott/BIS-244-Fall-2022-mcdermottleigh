#Assignment 2 Leigh McDermott
library(dplyr)
library(here)
library(tidyverse)

State <- read_csv(here("covid-19-data","us-states.csv")) 

Pens <- filter(State, state== "Pennsylvania")

n <- length(Pens$date)
Pens$incr_cases <- 1