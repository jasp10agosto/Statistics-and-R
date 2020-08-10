#Let's start by doing the documentation of my work
###Create a vector and calculate the mean:
##Vector
X <- c(2.23,3.45,1.87,2.11,7.33,18.34,19.23)
##Check the object
X
##Calculate the mean
mean(X)
###Use a loop for a sum
## 5525 
##Cars data set is in R. Find the class of this data set.
class(cars)
##[1] "data.frame"
##Rows in cars data set.
row(cars)
tail(cars)
##Name of the second column of cars
###dist
##The way to extract the columns of a matrix/data.frame is using []
##cars[,2] shows the second column
cars[,2]
mean(cars[,2])
###42.98
##Using the function which()
##Which row of cars has a distance of 85?
which(cars$dist == 85)
##it is the row 50!
###[1] 50
##if we just leave which(cars == 85) the output will be 100
##that's because we didn't specified the column and it is the 
##100th data.
###That's all for now! 
###It's a rainy night let's keep doing this.
