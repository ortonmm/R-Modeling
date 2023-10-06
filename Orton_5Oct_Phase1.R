#FasteR Lesson 12
plot(Nile)
##When was the super low Nile flow year? Use which() and ask which Nile values 
##are less than 600
which(Nile<600)
which(Nile>1300)
##Other arguments with plot() can do plot(xvector, yvector)
plot(mtcars$wt,mtcars$mpg)
is.numeric(Nile)
class(Nile)
##ts is time series

#Lesson 14: Intro to Base R Graphics
load(url('https://github.com/matloff/fasteR/blob/master/data/prgeng.RData?raw=true'))
head(prgeng)
##Data info: educ is education level and occ is occupation
##Make a scatter plot
plot(prgeng$age,prgeng$wageinc)
##Produces too many data points. Can plot a random sample of 2,500 instead of 
##the given 20,000
indxs<-sample(1:nrow(prgeng), 2500)
prgeng2500<-prgeng[indxs,]
##nrow() gives the number of rows in the argument
##sample() takes a random sample. Give the vector/object and the number you want
##Could have also written as the following:
prgeng2500 <- prgeng[sample(1:nrow(prgeng),2500),]
##New plot:
plot(prgeng2500$age,prgeng2500$wageinc)
##Break down the plot by gender with color coding
##X is age, Y is wage, then give a color based on sex
plot(prgeng2500$age,prgeng2500$wageinc,col=prgeng2500$sex)
##Now, age on X, wage on Y, color based on sex, give x this label, give y this 
##label, and change the symbol size with cex=
plot(prgeng2500$age,prgeng2500$wageinc,col=as.factor(prgeng2500$sex),xlab='age',ylab='wage',cex=0.6)
plot(prgeng2500$age,prgeng2500$wageinc,col=as.factor(prgeng2500$sex),xlab='age',ylab='wage',cex=0.2)

#Lesson 15: More on base graphics
##Plot multiple histograms on the same graph and use R's density function to
##make a smoothed version of the histograms
##Use split function to split wage data based on sex
wageByGender <- split(prgeng$wageinc,prgeng$sex)
wageByGender
dm <- density(wageByGender[[1]])
##^ wageByGender[[1]] is the vector of men's wages
dw <- density(wageByGender[[2]])
##^wageByGender[[2]] is vector of women's wages
##density creates smoothed histograms, so the density Y axis is the equivalent of the 
##frequency
##plot women. 
plot(dw,col='red')
points(dm,cex=0.2)
##and add the men's points to the same plot with points()
##want to plot the women's data first because it's tallest and want the y axis 
##to work with that y axis. If did mens first womens would be cut off
##ggplot would adjust automatically

#Practice
PregNum<-as.numeric(prgeng2500$educ)
nocollege<-PregNum<10
wagebyeduc<-split(prgeng$wageinc,PregNum)
plot(prgeng2500$age,prgeng2500$wageinc,col=1+(PregNum>9),xlab='age',ylab='wage',cex=0.6)

#Activity 2
library(mgcv)
plot(prgeng2500$age,prgeng2500$wageinc)
smoothModel<-gam(prgeng2500$wageinc ~ s(prgeng2500$age))
##gam is general additive model
points(prgeng2500$age, smoothModel$fitted.values, col=2)
##spline is a type of function, the red line plotted

#Activity 3
#Install ggplot2 package. This is very popular for making plots. 
#But we need it because it comes with some fun example data.
install.packages("ggplot2")
library(ggplot2)
#Load datasets to plot. After running, you will have objects 
#called "msleep" and "EuStockMarkets" in your environment that you can work with.
data(msleep)
data(EuStockMarkets)
#Create a vector of dates when stock market recorded
stockTime=as.numeric(time(EuStockMarkets))
#For plotting: set graphing panel layout to be 2 plots y 2 plots. 
#See preceding exercises for explanation.
par(mfrow=c(2,2))
#For the first graph, you will need to use the function matplot. Google or enter ?matplot in R console
matplot(stockTime,EuStockMarkets,xlab="stockTime", ylab="EuStockMarkets", type="l", lty=1,lwd=5)

##Second graph
data(msleep)
plot(msleep$bodywt,msleep$brainwt, ylim=c(0,0.5), xlim=c(0,100), xlab="Body Weight, kg", ylab="Brain Weight, kg",
     col=4, pch=18) 
title('Body Weight vs Brain Weight \n Across Species') 
legend(x="topleft", legend="one mammal species", pch=18, col=4)

##Third Graph
plot(msleep$brainwt,msleep$sleep_total, xlab="Brain Weight, kg", ylab="Total sleep, hrs", col=3, pch=23, bg=3)


##Last Graph
logbrainweight<-log(msleep$brainwt)
plot(logbrainweight,msleep$sleep_total,xlab="log Brain Weight, kg", ylab="Total Sleep, hrs", pch=23, bg=2,col=2)
par(new=TRUE)
plot(x=log(msleep$brainwt),y=msleep$sleep_rem,pch=16,col=5,yaxt="n",xaxt="n",xlab="",ylab="")
axis(4)
legend("topright",c("Total sleep","REM sleep"),pch=16,col=c(2,5))

par(mfrow=c(2,2))
matplot(stockTime,EuStockMarkets,xlab="stockTime", ylab="EuStockMarkets", type="l", lty=1,lwd=5)
plot(msleep$bodywt,msleep$brainwt, ylim=c(0,0.5), xlim=c(0,100), xlab="Body Weight, kg", ylab="Brain Weight, kg",
     col=4, pch=18) 
title('Body Weight vs Brain Weight \n Across Species') 
legend(x="topleft", legend="one mammal species", pch=18, col=4)
plot(msleep$brainwt,msleep$sleep_total, xlab="Brain Weight, kg", ylab="Total sleep, hrs", col=3, pch=23, bg=3)
plot(logbrainweight,msleep$sleep_total,xlab="log Brain Weight, kg", ylab="Total Sleep, hrs", pch=23, bg=2,col=2)
par(new=TRUE)
plot(x=log(msleep$brainwt),y=msleep$sleep_rem,pch=16,col=5,yaxt="n",xaxt="n",xlab="",ylab="")
axis(4)
legend("topright",c("Total sleep","REM sleep"),pch=16,col=c(2,5))

#FasteR Lesson 16: Writing your own functions
##Previous activity:
sum(Nile>1200)
##Get the mean ofthose elements
gt1200 <- which(Nile > 1200)
nileSubsetGT1200 <- Nile[gt1200]
mean(nileSubsetGT1200)
##Compact version:
mean(Nile[Nile > 1200])
##If we wanted to do this a lot, can make a function of it.
mgd <- function(x,d) mean(x[x > d])
##How it works:
mgd(Nile,1200)
mgd(tg$len,10.2)
##Same as 
mean(tg$len[tg$len > 10.2])
##with functions, can ask for a specific return
mgd <- function(x,d) return(mean(x[x > d]))
##Save the function for later use. It will be saved in the indicated file. 
###save(mgd,file='mean_greater_than_d')
##Can run load('file name') to get the saved function back in your environment

##Another function, this one for finding the difference between the max and min
##values of object y
rng <- function(y) max(y) - min(y)
rng(Nile)


