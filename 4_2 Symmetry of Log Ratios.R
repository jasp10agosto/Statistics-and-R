#Getting the data----------
data(nym.2002, package="UsingR")
library(dplyr)
glimpse(nym.2002)

#Getting the time-------
time = sort(nym.2002$time)
mypar(1)
plot(time)

#fastest time / median time
min(time)/median(time)
#slowest time / median time
max(time)/median(time)

#Log trasformation
plot(time/median(time), ylim=c(1/4,4))
abline(h=c(1/2,1,2))

plot(log2(time/median(time)),ylim=c(-2,2))
abline(h=-1:1)
