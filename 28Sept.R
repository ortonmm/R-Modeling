#FasteR Lesson 2
## adding two numbers
1+1

## using sample dataset nile, finding the mean (Nile is the argument, and 
##mean is the function) 
mean(Nile)
##print function means print the result of ()
print(mean(Nile))
##Call up dataset Nile and tell me the data points in it. Nile is a vector.
Nile
## find the length of the vector
length(Nile)
##create a histogram of the Nile vector
hist(Nile)
##Specify the number of bins you have in the histogram with breaks
hist(Nile,breaks=20)
##get help with ?function
?hist
##get an individual data point from the vector
Nile[2]
## c concatenate function builds a vector
Nile[c(2,5,6)]
## c consecutive numbers gives you a vector from x to y
Nile[2:4]
##get the mean flow from 1951-1971
mean(Nile[81:100])
##Assign these objects the name n81100 and then find the mean and standard
##standard deviation
n81100<- Nile[81:100]
mean(n81100)
sd(n81100)
##Ask for specific data points of n81100. The element number will be correlated
##to the number it is in that specific object
n81100[1]
Nile[81]
##length gives the number of elements in the vector
length(Nile)
##Your turn: find the mean flow from 1945-1960
mean(Nile[74:89])
##Find length of n81100
length(n81100)

#Hands on R Project 1
##ctrl + c is to cancel a command that is processing in R
##Exercise 2.1: 
7+2
9*3
27-6
21/3
##2.2 Objects
##Create a vector 1-6
1:6
##Name your vector 1-6 and make it an object, and manipulate it
a<-1
a
a+2
##Create the die object
die<-1:6
die
##Ask R what names are already being used and it will generate a list of names
##This can also be seen in the environment pane
ls()
##Subtract 1 from each element 
die-1
##Divide each element within die by 2
die/2
##Multiply each element in die by its corresponding element in die
die * die
##If one vector is shorter than the other, R will repeat the shorter vector 
##until it is as long as the other vector and then do the operation. It will 
##give an error if the shorter vector does not divide evenly into the longer one
1:2
1:4
die
die + 1:2
die + 1:4
##How to get normal matrix multiplication: use %*% for inner multiplication and 
##%o% for outer multiplication. Inner multiplication is multiply element 1 of 
##vector 1 by element 1 of vector 2, element 2 by element 2, etc. Then add all 
##those numbers
die %*% die
die %o% die
##Transpose a matrix with t
##Find matrix determinant with det
##Round a number and take the factorial; these are functions
round(3.1415)
factorial(3)
##The argument is the data within the function. R works from innermost function
##to outermost
mean(1:6)
mean(die)
round(mean(die))
##sample takes a sample of the specified size from the elements of x using either with or without replacement.
##Usage: sample(x, size, replace = FALSE, prob = NULL)
##Give me two numbers between 1 and 4
sample(x = 1:4, size = 2)
##So to roll the die:
sample(x = die, size = 1)
##Find the arguments a function uses with args
args(round)
##If it gives a value for the argument, that is the default and it can change
round(3.1415, digits=2)
##sample command automatically samples without replacement
##To simulate an actual pair of dice, must sample with replacement
##This command is sample(X, size, replace=TRUE)
sample(die, size = 2, replace = TRUE)
##Once a set of results is saved to a specific name, it won't be recalculated by 
##recalling the name
##2.4 Write your own functions
##Functions have a name, a body of code, and a set of arguments
##1) call function() {}
my_function<-function() {}
##2) create your name, say it's a function, give it the code. Line breaks
##do not matter for R
roll <- function() {
  die <- 1:6
  dice <- sample(die, size = 2, replace = TRUE)
  sum(dice)
}
##3) Call up your function name with ()
roll()
##Calling roll without the () will just give the code within the function named 
##roll (the body)
##2.5 Arguments
##You're trying to make a function called roll2 but have not said what bones is
roll2 <- function() {
  dice <- sample(bones, size = 2, replace = TRUE)
  sum(dice)
}
roll2()
##Reword the roll2 function
roll2 <- function(bones) {
  dice <- sample(bones, size = 2, replace = TRUE)
  sum(dice)
}
##Putting function(bones) now allows you to call up roll2 and tell it what bones
##is in order to, in this case, supply a different X value each time you roll.
##In this case it's like rolling dice with different numbers of sides.
roll2(bones = 1:4)
roll2(bones = 1:6)
roll2(1:20)
##Can also give bones a default value by saying function(bones=1:6)
roll2 <- function(bones = 1:6) {
  dice <- sample(bones, size = 2, replace = TRUE)
  sum(dice)
}
##With the default value, can still give alternative values as previously shown
##Summary: the name<- function (supplying arguments if needed based on body of 
##function = give it the default values) {The body aka the code R will run when 
##this function is called up and be sure to make the last line of code the thing 
##you want R to return!}
##can also create a function with Code>Extract Function in menu bar