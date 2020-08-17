#Now we are using the dplyr to manipulate data
install.packages("dplyr")
#now lets run it
library(dplyr)
#
##Notes from the class
##
##Filter: Filters data based on criteria
##filter(data.frame, column=="yy")
##
##Select: Just shows a selection of the data
##select(data.frame, column)
##
##Unlist
##From data frames to list
##
##Working with pipes.
#Some instructions can be written as pipes %>%
## A %>% B
#What it's sent from A goes to function B.
##
#Exercises
##
##Get the data
library(downloader)
url="https://raw.githubusercontent.com/genomicsclass/dagdata/master/inst/extdata/msleep_ggplot2.csv"
filename <- basename(url)
download(url,filename)
##
##Get te data to R
msleep <- read.csv("~/R/Statistics-and-R/raw_data/msleep_ggplot2.csv")
##
#Read the class of the object
class(msleep)
##Use filter() to select only primates
primates <- filter(msleep, order=="Primates")
#
nrow(primates)
##Class of the filtered table?
class(primates)
#creates another data.frame. 
#
#Use select to extract the sleep total from the primates
filter(msleep, order=="Primates") %>% select(sleep_total) %>% class
#Creates other data.frame
#Calculate the mean
filter(msleep, order=="Primates") %>% select(sleep_total) %>% mean
#creates an error because mean works with vectos and not with data frames
filter(msleep, order=="Primates") %>% select(sleep_total) %>% unlist %>% mean
##
#Using the Sumarize function
summarise(msleep, avg=mean(filter(msleep, order=="Primates") %>% select(sleep_total) %>% unlist))
## DONE