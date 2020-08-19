##Boxplot
Boxplot(data)
##pretty straightforward 
##Using the function split
  ##split divides the data in the vector x into the groups defined by f.
  #g <- split(x$title1-numbers, x$title2-categories)
  #creates two vectors cat 1 and its data and so on.
## Function works like this
boxplot(split(InsectSprays$count, InsectSprays$spray))
##
##Which spray seems the most effective (has the lowest median count)?
##C has the lowest mean.

##getting the data------
library(dplyr)
data(nym.2002, package="UsingR")

##Doing the boxplots----
boxplot(split(nym.2002$time, nym.2002$gender))
#boxplot(time~gender, nym.2002)

##Doing the histograms---
##Female
filter(nym.2002, gender=="Female") %>% select(time) %>% unlist %>% 
  hist(main="Female")

##Male
filter(nym.2002, gender=="Male") %>% select(time) %>% unlist %>% 
  hist(main="Male")

##Calculating the means---
#Mean of male
filter(nym.2002, gender=="Male") %>% select(time) %>% unlist %>% mean
#Mean of female
filter(nym.2002, gender=="Female") %>% select(time) %>% unlist %>% mean

##QQplots?---
#Male
qqnorm(filter(nym.2002, gender=="Male") %>% select(time) %>% unlist,main="Male")
qqline(filter(nym.2002, gender=="Male") %>% select(time) %>% unlist,main="Male")

#Female
qqnorm(filter(nym.2002, gender=="Female") %>% select(time) %>% unlist,main="Female")
qqline(filter(nym.2002, gender=="Female") %>% select(time) %>% unlist,main="Female")

##Medians---
aggregate( time~gender,  median, data=nym.2002)
