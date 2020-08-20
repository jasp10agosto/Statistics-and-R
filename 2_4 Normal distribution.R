#Now its time for Normal distribution.
x <- unlist( read.csv("~/R/Statistics-and-R/femaleControlsPopulation.csv"))

# make averages5----
set.seed(1)
n <- 1000
averages5 <- vector("numeric",n)
for(i in 1:n){
  X <- sample(x,5)
  averages5[i] <- mean(X)
}

# make averages50----
set.seed(1)
n <- 1000
averages50 <- vector("numeric",n)
for(i in 1:n){
  X <- sample(x,50)
  averages50[i] <- mean(X)
}

#proportion between 23 and 25.
mean( averages50 < 25 & averages50 > 23)

##Using function pnorm()----
#Function pnorm() finds the proportion of observations below a cutoff X
#given a normal distribution with mean mu and std sigma with
#pnorm(x, mu, sigma) or pnorm((x-mu)/sigma)

#What are the proportion of observations between 23 and 25.
#Average is 23.9 and std 0.43?

pnorm(23,23.9,0.43)
pnorm(25,23.9,0.43)
pnorm(25,23.9,0.43) - pnorm(23,23.9,0.43)

#That's all.