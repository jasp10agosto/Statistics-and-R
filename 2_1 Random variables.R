##Strat---
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleControlsPopulation.csv"
filename <- basename(url)
download(url, destfile=filename)
x <- unlist( read.csv(filename) )
## x is the entire population
x

##Average of X
mean(x)

#Seed of 1----
set.seed(1)
y <- sample(x,5)
abs( mean(y) - mean(x) )

#Seed of 5----
set.seed(5)
y <- sample(x,5)
abs( mean(y) - mean(x) )

