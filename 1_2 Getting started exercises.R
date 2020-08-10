##install.packages("downloader")
##Downloader package must be installed
library(downloader)
##wait until it opens.
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleMiceWeights.csv"
filename <- "femaleMiceWeights.csv" 
download(url, destfile=filename)
##the data base now appears.
##Load the data on the environmet
female_mice <- read.csv("~/R/Statistics-and-R/raw_data/femaleMiceWeights.csv")
##