# Assignment 3 Leigh McDermott

library(here)
library(tidyverse)
library(dplyr)
counties2020 <- read_csv(here("covid-19-data", "us-counties-2020.csv"))
counties2021 <- read_csv(here("covid-19-data", "us-counties-2021.csv"))
counties2022 <- read_csv(here("covid-19-data", "us-counties-2022.csv"))
countiesRecent <- read_csv(here("covid-19-data", "us-counties-recent.csv"))
live <- read_csv(here("covid-19-data", "live", "us-counties.csv"))
Combined <- rbind(counties2020,counties2021, counties2022, countiesRecent, live)
pa_counties <- Combined %>% filter(state=="Pennsylvania")

lehigh <- pa_counties %>% filter(county=="Lehigh")



n <- length(lehigh$date)
lehigh$incr_cases <- 1

for (i in 2:n) {
  lehigh$incr_cases[i] <- lehigh$cases[i]-lehigh$cases[i-1]
}


lehigh <- distinct(lehigh, date, .keep_all = TRUE)
g <- ggplot(data = lehigh, mapping = aes(x = date,
                          y =incr_cases))
g + geom_line(color="blue")+
  labs(x = "Date", y = "New Cases Reported",
       title = "COVID-19 Cases Reported in Lehgih, PA")

