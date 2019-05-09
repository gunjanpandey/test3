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
