#Let's start
x <- unlist( read.csv("~/R/Statistics-and-R/femaleControlsPopulation.csv"))
##Set the seed at 1, 
##then using a for-loop take a random sample of 5 mice 1,000 times. 
##Save these averages.

##What proportion of these 1,000 averages are more than 1 gram 
##away from the average of x ?

set.seed(1)
n <- 1000
null <- vector("numeric",n)
for (i in 1:n) {
  Mice <- sample(x,5)
  null[i] <- mean(Mice)
}
##Let's se the simulation ----
hist(null)

##let's see the mean ----
mean(abs(null-mean(x))>1)

##Now 10,000 ----
set.seed(1)
n <- 10000
null <- vector("numeric",n)
for (i in 1:n) {
  Mice <- sample(x,5)
  null[i] <- mean(Mice)
}
##Let's se the simulation ----
hist(null)
##let's see the mean ----
mean(abs(null-mean(x))>1)

##Now sample of 50 and 1000 times----
set.seed(1)
n <- 1000
null <- vector("numeric",n)
for (i in 1:n) {
  Mice <- sample(x,50)
  null[i] <- mean(Mice)
}
##Let's se the simulation ----
hist(null)
##let's see the mean ----
mean(abs(null-mean(x))>1)