install.packages("tidyverse")
library(tidyverse)

#load data file. R take folder location from its home directly despite of the folder where script sits 
# Becareful of the package used to load data
gapminder <- read_csv("raw_data/gapminder.csv")

#to check the head and tail of the dataframe
head(gapminder)
tail(gapminder, 20)

# to have a glipse of the dataframe
glimpse(gapminder)

# to check only one column
gapminder$country

#unique 
unique(gapminder$country)





#to read continents as a factor (to be used in stastics)
#value of each "factor" is a number in the backend.  
gapminder_factor <- read_csv("raw_data/gapminder.csv", col_types = cols(continent = col_factor()))

#storms is an inbuild dataset for tidyverse
View(storms)
dim(storms)

#category is an ordeal factor such as 0>1>2>3>4 but it doesnt have to be a number it could be "low mid and high" and so on

#select(data, arguments)
  #column names, 
  #column numbers
  #ranges
  #-sign to remove
  #start_with
  #end_with
  #contains etc 
select(gapminder, "country", "year")

#filter_rows
filter(gapminder, lifeExp > "60" & continent == "Asia" & year >= "1972")
filter(gapminder, continent %in% c("Africa", "Asia", "Europe"))

#add or remove new columns using mutate
#create a new column called gdp by multiplying gdpPercep by pop
mutate(gapminder, gdp = gdpPercap * pop)
#create a new column to calculate the polupations in millions
mutate(gapminder, popMillion = pop/10000)
mutate(gapminder, popMillion = log(pop))

#to pull string from value of a column to a new column (to pull variables from a sample name)
mutate(gapminder, country_abbr = str_sub(country, start = 1, end = 4))
#using "-" minus sign, it would start from the end of the string
mutate(gapminder, country_end_letter = str_sub(country, start = -1))


mutate(
  gapminder, lifeExp_days = lifeExp * 365,
  gdp_billion = (gdpPercap * pop)/1e9
)

#Offset functions -> lag()or lead() to coy values a row up or down
#cumsum(), 
summarise(gapminder, mean_pop = mean(pop), median_pop = median(pop))
summarise(gapminder_by_country, mean_LE = mean(lifeExp), median_LE = median(lifeExp))


