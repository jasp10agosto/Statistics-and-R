#Mann-Whitney-Wilcoxon Test-----
##Its like the non parametric version of the T-test
#Ho = distributions are the same
#Ha = Distributions are diferent.

#Getting the data again.-----
data(ChickWeight)
glimpse(ChickWeight)

head(ChickWeight)
plot( ChickWeight$Time, ChickWeight$weight, col=ChickWeight$Diet)
#Using reshape
chick = reshape(ChickWeight, idvar=c("Chick","Diet"), timevar="Time",
                direction="wide")
head(chick)
chick = na.omit(chick)

#weight on day 4 with diets 1 and 4.
x = chick$weight.4[chick$Diet == 1]
y = chick$weight.4[chick$Diet == 4]

#t.test versus wilcox.test ------
t.test(x,y)
t.test(x,y)$p.value
wilcox.test(x,y)
t.test(x,y)$p.value
#the value is the same!

#Let's add some bias
t.test(c(x, 200), y)$p.value
wilcox.test(c(x,200),y,exact=FALSE)$p.value
wilcox.test(exact= FALSE, x,y)

##Downside of the test------
library(rafalib)
mypar(1,3)
boxplot(x,y)
boxplot(x,y+10)
boxplot(x,y+100)

t.test(x,y+10)$statistic - t.test(x,y+100)$statistic
wilcox.test(c(1,2,3),c(4,5,6))$p.value #the test fails when it is a small sample
wilcox.test(c(1,2,3),c(400,500,600))$p.value

