#Assignment 2 Leigh McDermott

library(dplyr)
library(here)
library(tidyverse)

State <- read_csv(here("covid-19-data","us-states.csv")) 

Pens <- filter(State, state== "Pennsylvania")

n <- length(Pens$date)
Pens$incr_cases <- 1

for (i in 2:n) {
  Pens$incr_cases[i] <- (Pens$cases[i]-Pens$cases[i-1])
}

Pens$incr_deaths <- 0

for (i in 2:n) {
  Pens$incr_deaths[i] <- (Pens$deaths[i]-Pens$deaths[i-1]) 
}

checker <- sd(Pens$incr_cases,na.rm = FALSE)
