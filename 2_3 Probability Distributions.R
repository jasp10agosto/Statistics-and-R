#How to present information as a summary.
#Efective. Summarize the data.
install.packages("gapminder")
##
library(gapminder)
data(gapminder)
head(gapminder)

class(gapminder)
library(dplyr)
####
x <- filter(gapminder, year=="1952") %>% select(lifeExp) %>% unlist
hist(x)
head(x)
##### What is the proportion of countries in 1952 that have a life 
####  expectancy less than or equal to 40?
mean( x <= 40)

####What is the proportion of countries in 1952 that have a 
####life expectancy between 40 and 60 years?
mean( x <= 60)- mean( x <= 40) 

####Proportion in a range of years.
plot(ecdf(x))

