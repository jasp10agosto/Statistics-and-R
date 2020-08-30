#Loading the data again
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/babies.txt"
filename <- basename(url)
download(url, destfile=filename)
babies <- read.table("babies.txt", header=TRUE)

#split the datasets again
library(dplyr)
bwt.nonsmoke <- filter(babies, smoke==0) %>% select(bwt) %>% unlist 
bwt.smoke <- filter(babies, smoke==1) %>% select(bwt) %>% unlist

#descriptive data population
library(rafalib)
mean(bwt.nonsmoke)-mean(bwt.smoke)
popsd(bwt.nonsmoke)
popsd(bwt.smoke)

#confidence intervals
N <- 25
set.seed(1)
dat.ns <- sample(bwt.nonsmoke, N) 
dat.s <- sample(bwt.smoke, N) 
qt(0.995,2*N-2)*sqrt( sd( dat.ns)^2/N + sd( dat.s)^2/N )

#Error I and II
set.seed(1)
N <- 5
set.seed(1)
dat.ns <- sample(bwt.nonsmoke, N) 
dat.s <- sample(bwt.smoke, N)
t.test(dat.ns,dat.s)
