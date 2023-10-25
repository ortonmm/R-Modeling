#FasteR Lesson 16: Writing your own functions
##Name your command, and the command to create a function is function(arguments)
##function to be done
mgd <- function(x,d) mean(x[x > d])
mgd(Nile,1200)
##I think we did this previously so it's feeling like review

#Lesson 17: "For" loops
##In dataset Pima, some values are 0 and need to be coded as NA
pima <- read.csv('http://heather.cs.ucdavis.edu/FasteR/data/Pima.csv',header=TRUE)
pima$glucose[pima$glucose == 0] <- NA
##How can we make all of these NA for all columns?
##for(variable in range) function(i)
for (i in 1:9) print(sum(pima[,i] == 0))
##in other words:
i <- 1
print(sum(pima[,i] == 0))
i <- 2
print(sum(pima[,i] == 0))
i <- 3
print(sum(pima[,i] == 0))
i <- 4
print(sum(pima[,i] == 0))
i <- 5
print(sum(pima[,i] == 0))
i <- 6
print(sum(pima[,i] == 0))
i <- 7
print(sum(pima[,i] == 0))
i <- 8
print(sum(pima[,i] == 0))
i <- 9
print(sum(pima[,i] == 0))

##Which is the same as 
print(sum(pima[,1] == 0))
print(sum(pima[,2] == 0))
print(sum(pima[,3] == 0))
print(sum(pima[,4] == 0))
print(sum(pima[,5] == 0))
print(sum(pima[,6] == 0))
print(sum(pima[,7] == 0))
print(sum(pima[,8] == 0))
print(sum(pima[,9] == 0))

##Variable i is the index of the loop; can be any set of characters
##Need to explicitly say print() to get the result to show

#Lesson 18: Functions with blocks
##creating a function where d is dataframe to be worked on and cols specifies 
##the columns in which 0s are to be replaced
zerosToNAs <- function(d,cols)
  	{
  	   for (j in cols) {
    	      NArows <- which(d[,j] == 0)
            d[NArows,j] <- NA
      	   }
  	   d
    }
##Then make dataframe
d <- data.frame(x=c(1,0,3),y=c(0,0,13)) 
d
x  y
1 1  0
2 0  0
3 3 13
which(d[,2] == 0)
[1] 1 2  # ah yes; the 0 elements in column 2 are at indices 1 and 2
##Then use function on dataframe. d=dataframe=pima, cols=col numbers
pima <- zerosToNAs(pima,2:6)
pima
##Note this did not change pima itself; it changed d, which is a pima copy

#Lesson 20: If, Else, Ifelse
##0-9 is no college education
##13 is bachelors
load(url('https://github.com/matloff/fasteR/blob/master/data/prgeng.RData?raw=true'))
head(prgeng$educ,15)
as.numeric(prgeng$educ)
for (i in 1:nrow(prgeng)) {
      if (prgeng$educ[i] < 13) prgeng$educ[i] <- 12 
   }
head(pe$educ,15)
##I keep getting an error and i don't know why?? Error in if (prgeng$educ[i] < 13) prgeng$educ[i] <- 12 : 
missing value where TRUE/FALSE needed
In addition: Warning message:
  In Ops.factor(prgeng$educ[i], 13) : ‘<’ not meaningful for factors

##if (specific variable and specific condition) then name it 12
##can also do:
edu <- pe$educ
pe$educ <- ifelse(edu < 13,12,edu)

##ifelse can return a new vector
##Arguments ifelse(if certain condition, then this, otherwise this)



#Hands on R Section 11
##expand.grid gives every possible combination of the elements in n vectors

die <- c(1, 2, 3, 4, 5, 6)
rolls <- expand.grid(die, die)
rolls

rolls$value <- rolls$Var1 + rolls$Var2
head(rolls, 3)

prob <- c("1" = 1/8, "2" = 1/8, "3" = 1/8, "4" = 1/8, "5" = 1/8, "6" = 3/8)

prob

##subset Var1 and Var2 and get the probabilities associated with each individual
##vector
rolls$Var1

prob[rolls$Var1]
rolls$prob1 <- prob[rolls$Var1]
head(rolls, 3)
rolls$prob2 <- prob[rolls$Var2]

head(rolls, 3)

##Now, multiplying the probability of V1 by the probability of V2
##This gives the probability of that combination in the new prob column
rolls$prob <- rolls$prob1 * rolls$prob2
head(rolls, 3)
##Now find the expected average value of rolling two loaded dice
sum(rolls$value * rolls$prob)

##Goal: find the expected value of the slot machine prize
##Want to end up with a data set listing the outcomes of Var1 2 and 3, their 
##probs, and the prob of that combo, and the resulting prize
##Then sum the prizes, multiply by probability of occurring

#11.1: list the combos
wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")
combos<-expand.grid(wheel, wheel, wheel, stringsAsFactors = FALSE)

##Now find prob of each combo
get_symbols <- function() {
  wheel <- c("DD", "7", "BBB", "BB", "B", "C", "0")}
  sample(wheel, size = 3, replace = TRUE, 
         prob = c(0.03, 0.03, 0.06, 0.1, 0.25, 0.01, 0.52)
}
prob <- c("DD" = 0.03, "7" = 0.03, "BBB" = 0.06, 
          "BB" = 0.1, "B" = 0.25, "C" = 0.01, "0" = 0.52)
##Create a dataframe "combos" where each column is the probability of each Variable
combos$prob1 <- prob[combos$Var1]
combos$prob2 <- prob[combos$Var2]
combos$prob3 <- prob[combos$Var3]

head(combos, 3)

#11.4 Calculate probabilities for each combo
combos$prob <- combos$prob1 * combos$prob2 * combos$prob3

head(combos, 3)
##Check math; sum of probabilities should be 1
sum(combos$prob)
##Assign scores to each combination in combos
symbols <- c(combos[1, 1], combos[1, 2], combos[1, 3])
library(bnlearn)
score("symbols")

##Can't get score() to work for some reason so the rest is just notes on
##making loops
#for(variable in vector) {function that uses same variable}
#while loop reruns a chunk while a certain condition(logical test at the start of loop) remains true
#while(condition or logical test){code}
#if condition evaluates to false, while will finish the loop

#repeat loops
##can do within a function
###function(arguments){code
  #repeat {code if (condition) {break}}}











