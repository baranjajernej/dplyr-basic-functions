# load packages 

library(tidyverse)
library(gapminder)

# create an object ----
gp <- gapminder 

# select function ----
gp %>% 
  select(country, year, lifeExp)

# select function remove ----
gp %>% 
  select(-continent)

# filter function ----
gp %>% 
  filter(year == 1952)

# filter function - add filter ----
gp %>% 
  filter(year == 1952, country == "Croatia")

# filter function - add filter by multiple years ----
gp %>% 
  filter(year %in% c(1952, 1957), country == "Croatia")

# arrange function ----
gp %>% 
  arrange(pop)

# arrange function - descending order ----
gp %>% 
  arrange(desc(pop))

# distinct function - find unique elements of a given attribute 
gp %>% 
  distinct(continent)

# mutate function ----
gp %>% 
  mutate(totalGdp = pop * gdpPercap)

# transmute function - only new attribute is kept ----
gp %>% 
  transmute(totalGdp = pop * gdpPercap)

# rename function ----
gp %>% 
  rename(lifeExpectancy = lifeExp, population = pop)

# summarize function ----
gp %>% 
  summarize(meanLifeExp = mean(lifeExp))

# summarize function - chain other operations ----
gp %>% 
  filter(year == 2007) %>% 
  summarize(meanLifeExp = mean(lifeExp))

# group by function ----
gp %>% 
  group_by(continent) %>% 
  summarize(meanLifeExp = mean(lifeExp))

# group by function - group multiple columns ----
gp %>% 
  filter(year %in% c(2002, 2007)) %>% 
  group_by(continent, year) %>% 
  summarize(meanLifeExp = mean(lifeExp))

# if_else function ----
gp %>% 
  filter(year %in% c(2002, 2007)) %>% 
  group_by(continent, year) %>% 
  summarize(meanLifeExp = mean(lifeExp)) %>% 
  mutate(meanLifeExpOver70 = if_else(meanLifeExp > 70, "Y", "N"))
