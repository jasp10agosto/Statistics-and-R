#Loading fresh new data
library(downloader)
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/babies.txt"
filename <- basename(url)
download(url, destfile=filename)
babies <- read.table("babies.txt", header=TRUE)
#Divide the data 
bwt.nonsmoke <- filter(babies, smoke==0) %>% select(bwt) %>% unlist 
bwt.smoke <- filter(babies, smoke==1) %>% select(bwt) %>% unlist
#Exploratory analysis
library(rafalib)
mean(bwt.nonsmoke)-mean(bwt.smoke)
popsd(bwt.nonsmoke)
popsd(bwt.smoke)

#sampling data from mothers.
set.seed(1)
dat.ns <- sample(bwt.nonsmoke,25)
dat.s <- sample(bwt.smoke,25)
t.test(dat.ns,dat.s)$statistic
?t.test

tval <- unlist(t.test(dat.ns,dat.s)$statistic)
tval
#Two tail test----- area under the curve
pval <- 1-(pnorm(abs(tval))-pnorm(-abs(tval)))
pval

pval == tval
1-2*pnorm(abs(tval)) == pval
1-2*pnorm(-abs(tval)) == pval
1-pnorm(-abs(tval)) == pval
2*pnorm(-abs(tval)) == pval
2*pnorm(-abs(tval))
