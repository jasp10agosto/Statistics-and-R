#Lets start again.
#Download the data
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/babies.txt"
filename <- basename(url)
download(url, destfile=filename)
#Import the data
babies <- read.table("babies.txt", header=TRUE)
#filter the data
library(dplyr)

bwt.nonsmoke <- filter(babies, smoke==0) %>% select(bwt) %>% unlist 
bwt.smoke <- filter(babies, smoke==1) %>% select(bwt) %>% unlist
#generate a random sample of 10.
N=10
set.seed(1)
nonsmokers <- sample(bwt.nonsmoke , N)
smokers <- sample(bwt.smoke , N)
obs <- mean(smokers) - mean(nonsmokers)
obs
#random shuffle
dat <- c(smokers,nonsmokers)
shuffle <- sample( dat )
smokersstar <- shuffle[1:N]
nonsmokersstar <- shuffle[(N+1):(2*N)]
mean(smokersstar)-mean(nonsmokersstar)
#random 1000 times
set.seed(1)
null <- replicate(1000, {
  shuffle <- sample( dat )
  smokersstar <- shuffle[1:N]
  nonsmokersstar <- shuffle[(N+1):(2*N)]
  mean(smokersstar)-mean(nonsmokersstar)
})
( sum( abs(null) >= abs(obs)) +1 ) / ( length(null)+1 ) 
#Differences in median
N=10
set.seed(1)
nonsmokers <- sample(bwt.nonsmoke , N)
smokers <- sample(bwt.smoke , N)
obs <- median(smokers) - median(nonsmokers)

set.seed(1)
null <- replicate(1000, {
  shuffle <- sample( dat )
  smokersstar <- shuffle[1:N]
  nonsmokersstar <- shuffle[(N+1):(2*N)]
  median(smokersstar)-median(nonsmokersstar)
})
( sum( abs(null) >= abs(obs)) +1 ) / ( length(null)+1 ) 
