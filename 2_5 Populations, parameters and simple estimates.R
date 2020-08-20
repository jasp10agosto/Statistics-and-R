##Function set.seed?
set.seed(1) 
##Throughout this book, we use random number generators. 
##This implies that many of the results presented can actually change 
##by chance, including the correct answer to problems. 
##One way to ensure that results do not change is by setting R’s 
##random number generation seed.

#Getting the data
library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- basename(url)
download(url, destfile=filename)
dat <- read.csv(filename)
#No missing values
dat <- na.omit( dat )

#Checking population average - Males and chow
library(dplyr)
z <- filter(dat, Sex=="M" & Diet=="chow") %>% select(Bodyweight) %>% unlist
mean(z)

#population std
library(rafalib)
popsd(z)

#Sample size 25 from z as Z
set.seed(1)
Z <-sample(z,25)
mean(Z)

#Average of males and hf
y <- filter(dat, Sex=="M" & Diet=="hf") %>% select(Bodyweight) %>% unlist
mean(y)
#population std
popsd(y)

#Sample size 25 from Y as Y
set.seed(1)
Y <-sample(y,25)
mean(Y)

#Absolute diference between (samplez - sampley) and (popZ-popY)
abs((mean(y)-mean(z))-(mean(Y)-mean(Z)))
abs( ( mean(y) - mean(z) ) - ( mean(Y) - mean(Z) ) )

#Now for females
fc <- filter(dat, Sex=="F" & Diet=="chow") %>% select(Bodyweight) %>% unlist
set.seed(2)
FC <- sample(fc,25)
fhf <- filter(dat, Sex=="F" & Diet=="hf") %>% select(Bodyweight) %>% unlist
set.seed(2)
FHF <- sample(fhf,25)
abs( ( mean(fhf) - mean(fc) ) - ( mean(FHF) - mean(FC) ) )

#sd for everything
popsd(fc)
popsd(fhf)
popsd(x)
popsd(y)