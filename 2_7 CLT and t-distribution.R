#Getting all the data.-----
library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleMiceWeights.csv"
filename <- "femaleMiceWeights.csv"
if(!file.exists("femaleMiceWeights.csv")) download(url,destfile=filename)
dat <- read.csv(filename)

###Starting -----
##Dice game ----
set.seed(1)
n <- 100
x <- sample(1:6, n, replace = TRUE)
x
mean(x)
mean(x==6)
1/6

##Simulation
set.seed(1)
n <- 100
sides <- 6
p <- 1/sides
zs <- replicate(10000,{
  x <- sample(1:sides,n,replace=TRUE)
  (mean(x==6) - p) / sqrt(p*(1-p)/n)
}) 
qqnorm(zs)
abline(0,1)#confirm it's well approximated with normal distribution
mean(abs(zs) > 2)

#Other experiments to CLT to kick in
ps <- c(0.5,0.5,0.01,0.01)
ns <- c(5,30,30,100)
library(rafalib)
mypar(4,2)
for(i in 1:4){
  p <- ps[i]
  sides <- 1/p
  n <- ns[i]
  zs <- replicate(10000,{
    x <- sample(1:sides,n,replace=TRUE)
    (mean(x==1) - p) / sqrt(p*(1-p)/n)
  }) 
  hist(zs,nclass=7)
  qqnorm(zs)
  abline(0,1)
}

##Working with te data------
library(dplyr)
X <- filter(female_mice, Diet=="chow") %>% select(Bodyweight) %>% unlist
Y <- filter(female_mice, Diet=="hf") %>% select(Bodyweight) %>% unlist

mean(X)
##X bar follows a normal distribution with mean Mux and std of sigmaX/root(12) 
##where sigmax is the population standard deviation.

#population standar deviation?-----
sd(X)
##Sample STD
##pop std is library(rafalib) then popsd()

#Xbar is off from 2 grams from muX
2 * ( 1-pnorm(2/sd(X) * sqrt(12) ) )
#Two tails. inside pnorm is the value of Z stadistic.

#Null hypothesis muX = muY
#Then muX - muY has a mean of 0
#standar error is SE(mux - muy) = Root(stdY^2/12 + stdX^2/12)
SE <- sqrt(sd(X)^2/12 + sd(Y)^2/12)
SE
sqrt( var(X)/12 + var(Y)/12)

##T stat.-----
( mean(Y) - mean(X) ) / sqrt( var(X)/12 + var(Y)/12)
##or t.test(Y,X)$stat
t.test(X,Y)

## Student t distribution - function pt() ----
1 - pt(3,df=3)
1 - pt(3,df=15)
1 - pt(3,df=30)
1 - pnorm(3)
# p value
Z <- ( mean(Y) - mean(X) ) / sqrt( var(X)/12 + var(Y)/12)
2*( 1-pnorm(Z))

mypar(2,1)
qqnorm(X)
qqnorm(Y)

t.test(X,Y)
t.test(X,Y)$p.value
