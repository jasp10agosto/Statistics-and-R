#standard error is when probability is involved. 
#As the sample becomes bigger the spread becomes smaller.
#Centered in the mean.
#The difference of two normals is other normal.

#Loading up the data -----
library(downloader) 
url <- "https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/mice_pheno.csv"
filename <- basename(url)
download(url, destfile=filename)
micedata <- na.omit( read.csv(filename) )

#proportion of numbers on one std?
pnorm(1)-pnorm(-1)
#proportion of numbers on two std?
pnorm(2)-pnorm(-2)
#proportion of numbers on three std?
pnorm(3)-pnorm(-3)

#males control diet----- 
y <- filter(micedata, Sex=="M" & Diet=="chow") %>% select(Bodyweight) %>% unlist
z <- (y - mean(y)) / popsd(y)
#proportion from one std-----
mean( abs(z) <=1)
#proportion from two std-----
mean( abs(z) <=2)
#proportion from three std----
mean( abs(z) <=3)

##QQplot
qqnorm(z)
abline(0,1)
#data is consistent that after 3 stds there are 99% of the data.

##Use of function replicate()------
y <- filter(dat, Sex=="M" & Diet=="chow") %>% select(Bodyweight) %>% unlist
set.seed(1)
avgs <- replicate(10000, mean( sample(y, 25)))
mypar(1,2)
hist(avgs)
qqnorm(avgs)
qqline(avgs)

##What is the average of ----
mean(avgs)
