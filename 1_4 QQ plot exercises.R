#Q-Q plot
#Now we are using a data
#---------------------------
load("skew.RData")
#---------------
#That should be a 1000 x 9 data matrix
dim(dat)
class(dat)

#------------
#Using QQ-plots let's compare the distribution of each column
#to the matrix to a normal dist.
#Function qqnorm()
#USING DAT search for columns with skewed distribution.
#par sets graphical parameters. mfrow argument to create a plot of 3*3 plots
par(mfrow = c(3,3))
for (i in 1:9) {
  
}
par(mfrow = C(1,1))
##------
#Well I can't solve that problem. I don't even know how to graph.
#Let's try doing it from scratch.

###--------
###Doing histograms for dummies like me.
  #remember to have a vector of numbers to make your graph.
Hist(x)
  #That creates an ugly histogram.
  #Let's add some bins
bins <- seq(floor(min(x)),ceiling(max(x)))
hist(x,breaks=bins,xlab="x", ylab="y",main="Title goes here")
  #Now that looks pretty.
dev.off()
#That reset's all graphical parameters if we mess to much with plotting.
#Also deletes all plots. :[
##------

###Doing QQplots for dummies like me.
qqnorm(x)
qqline(x)
#That's just easy. the function is the Normal distribution by default.

#----
#Working with just one vector to understand everything.
V1 <- dat[,1]
binsV1 <- seq(floor(min(V1)),ceiling(max(V1)))
hist(dat[,1], breaks = binsV1)
qqnorm(V1)
qqline(V1)

##------
##Now let's try to join the puzzle
  ##Graph all the QQ plot graphs.
par(mfrow = c(3,3))
for (i in 1:9) {
  qqnorm(dat[,i], main=paste0("Norm Q-Q plot Vector="," ",i))
  qqline(dat[,i])
  }
par(mfrow = C(1,1))  
##Doing the print pdf / Size 10*16 / Landscape / preview

  ##Graph all the histograms
  ##Graph just one
hist(dat[,1],
     breaks=seq(floor(min(dat[,1])),ceiling(max(dat[,1]))),
     main=paste0("Histogram of vector"," ", "1"))

##Vector 4.
  ##U shape in QQplot
hist(dat[,4],
     breaks=seq(floor(min(dat[,4])),ceiling(max(dat[,4]))),
     main=paste0("Histogram of vector"," ", "4"))
  ##positive skew (a long tail to the right).

##Vector 9
  ##down shape in QQ plot.
hist(dat[,9],
     breaks=seq(floor(min(dat[,9])),ceiling(max(dat[,9]))),
     main=paste0("Histogram of vector"," ", "9"))
  ##negative skew (a long tail to the left)

##positive skew looks like an up-shaping curve in a qqnorm() plot,
##while negative skew looks like a down-shaping curve.
