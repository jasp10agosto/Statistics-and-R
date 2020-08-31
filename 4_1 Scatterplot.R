#Getting the data----------
data(nym.2002, package="UsingR")
library(dplyr)
glimpse(nym.2002)

#Dataframes for males and females ----
#males
Males <- filter(nym.2002, gender=="Male")
Females <- filter(nym.2002, gender=="Female")

#Correlations
cor(Males$age,Males$time)
cor(Females$age,Females$time)

#looking at the data -----
library(rafalib)
mypar(2,2)
plot(Females$age, Females$time)
plot(Males$age, Males$time)
group <- floor(Females$age/5) * 5
boxplot(Females$time~group)
group <- floor(Males$age/5) * 5
boxplot(Males$time~group)
