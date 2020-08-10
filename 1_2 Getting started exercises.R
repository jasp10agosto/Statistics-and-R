##install.packages("downloader")
##Downloader package must be installed
library(downloader)
##wait until it opens.
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/femaleMiceWeights.csv"
filename <- "femaleMiceWeights.csv" 
download(url, destfile=filename)
##the data base now appears.
##Load the data on the environment
female_mice <- read.csv("~/R/Statistics-and-R/raw_data/femaleMiceWeights.csv")
##Now lets start with the exercises.
##Column containing the weights.
female_mice$Bodyweight
##What is the entry in the 12th row and second column?
female_mice[12,2]
##[1] 26.25
##Use $ to extract the weight column and report the weight of the 
##mouse in the 11th row.
female_mice$Bodyweight[11]
##[1] 26.91
##How many mice are included in our dataset?
length(female_mice$Diet)
##View the data and determine what rows are associated with the 
##high fat or hf diet.
which(female_mice$Diet == "hf")
##Compute the average of these mice.
female_mice[,2][13:24]
mean(female_mice[,2][13:24])
##26.83417
##Understanding the sample() function
?sample
sample(female_mice[,2][13:24], 1)
#This function randomly samples data.
#Replace FALSE = data can't be repeated.
#Replace TRUE = data can be repeated.
##Document done! 