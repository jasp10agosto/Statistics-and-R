#Outliers affect sample average and standard deviation.
#Ourliers are mistakes.

#Median is the middle point of the data. 

#MAD - Median absolute deviation.
#Compute the median.
#Compute the distance of each point to the median.
#Compute the median of all deviations
#Multiply by 1.4826

#Spearman correlation.
#Correlates ranks. cor(x,y,method="spearman")

#all of these are called robust outliers. 

#function reshape()
data(ChickWeight)
glimpse(ChickWeight)

head(ChickWeight)
plot( ChickWeight$Time, ChickWeight$weight, col=ChickWeight$Diet)
#Using reshape
chick = reshape(ChickWeight, idvar=c("Chick","Diet"), timevar="Time",
                direction="wide")
head(chick)
chick = na.omit(chick)

#Ading an outlier in the data
chickout<-c(chick$weight.4,3000) # adding the outlier value of 3000
mean(chickout)/mean(chick$weight.4)

#Median
median(c(chick$weight.4, 3000))/median(chick$weight.4)

#For standard deviation
sd(c(chick$weight.4, 3000))/sd(chick$weight.4)

#Using the mad() function. 
mad(c(chick$weight.4,3000))/mad(chick$weight.4)
#It doesn't affect that value!

#spearman correlation
plot(chick$weight.4,chick$weight.21)
#Pearson correlation
cor(chick$weight.4,chick$weight.21)

#adding the outlier
plot(c(chick$weight.4,3000),c(chick$weight.21,3000))
cor(c(chick$weight.4,3000),c(chick$weight.21,3000))

#Measuring the effect
cor(c(chick$weight.4,3000),c(chick$weight.21,3000))/cor(chick$weight.4,chick$weight.21)
