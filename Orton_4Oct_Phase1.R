#Lesson 4: More on Vectors
sum(c(5,12,13))
##How many times was the nile greater than 1200?
sum(Nile > 1200)
##How does that work?
x <- c(5,12,13)
x
x > 8
sum(x > 8)
##R recycles the number 8 to be the same length as the vector.
##R treats true = 1 false = 0; so sum() gives the number of TRUEs
##What if you want to know which years the Nile had a flow above 1200? This wil
##say which elements had a flow >1200
which(Nile > 1200)
which1200 <- which(Nile > 1200)
which1200
length(which1200)
##This gives another way to see how many years are above 1200 by using the 
##length. Can then get the exact values still using:
which1200 <- which(Nile > 1200)
Nile[which1200]
##Or just ask for the data points altogether by indexing with the parameters we 
##want
Nile[Nile > 1200]
##Ask for a vector without the first element, then without the first and fourth
x <- c(5,12,13,8)
x[-1]
x[c(-1,-4)]

#Lesson 5: Data Frames
?ToothGrowth
head(ToothGrowth)
##Columns are length, supplement, and dosage
tg<-ToothGrowth
mean(tg$len)
##Get a specific element in row 3 column 1
tg[3,1]
##Get third element in the length vector
tg$len[3]
##For any data frame d, can extract d[rows we want, columns we want]
##Either by name or number^, or leave the section blank if you want all of them
z <- tg[2:5,c(1,3)]
z
y <- tg[ ,c(1,3)]
##R requires all data frame columns to be the same length. Find length with nrow
nrow(tg)
##Alternatively ask for length(specific variable) and make sure they match
##Create your own data frames with data.frame(column1,column2,etc)
x <- c(5,12,13)
y <- c('abc','de','z')
d <- data.frame(x,y)
d

y <- c('abc','de','z')
y[2]

#Lesson 6: R Factor Class
##Classes are numeric, character
##Ask for class with class()
class(tg)
class(tg$supp)
##Ask for levels (categories available)
levels(tg$supp)

#Lesson 7: Extracting Rows/Columns from Data Frames
##extract vector elements like this
> which1200 <- which(Nile > 1200)
> Nile[which1200]
[1] 1210 1230 1370 1210 1250 1260 1220
##extract data frame rows or columns as follows
whichOJ <- which(tg$supp == 'OJ')
whichVC <- which(tg$supp == 'VC')
mean(tg[whichOJ,1])
[1] 20.66333
mean(tg[whichVC,1])
##^here tg[whichVC,1] says to restrict attention to OJ rows, and only column 1
##quicker version:
tgoj <- tg[tg$supp == 'OJ',]
tgvc <- tg[tg$supp == 'VC',]
mean(tgoj$len)
[1] 20.66333
mean(tgvc$len)
[1] 16.96333

#Lesson 8: More examples of extracting rows and columns
##Often want to extract based on more than one condition
##Ex) we want to know OJ and length less than 8.8
##Can use & meaning logical and operation:
tg[tg$supp=='OJ' & tg$len < 8.8,]
##Ex) we want to know all cases where length is greater than 28 OR dose was 1.0
##Use | for or
w<-tg[tg$len > 28 | tg$dose == 1.0,]
head(w)
##To get how many cases satisfy a certain condition, use nrow
nrow(w)
##Extract columns
##Ex) only want tooth length and dose
lendose <- tg[,c(1,3)]
head(lendose)
##^ specify column with numbers or individual column names concatinated
##Can also use logical operators with vectors

#Lesson 11: The R List Class
##split() function allows you to split a vector into groups based on certain
##parameters
mtmpg<-mtcars$mpg
##Ex) want to split above into 4 cylinder, 6 cylinder, and 8 cylinder vectors. 
##Could do following for each
mt4<-mtmpg[mtcars$cyl == 4]
##OR use split(vector, based on values of this variable)
mtl <- split(mtmpg,mtcars$cyl)
mtl
##mtl is an object of R class list, and contains three vectors. Access 
##individual vectors with $ or [[]]
mtl$`4`
mtl[[1]]
head(mtcars$cyl)
##Lists are good for mixing data types together
l <- list(a = c(2,5), b = 'sky')
l
##Can give $a and $b different names
names(mtl) <- c('four','six','eight')
mtl
##What if we want MPG for the third car in the 6 cylinder category?
mtl[[2]][3]
##Or
mtl$six[3]
##mtl[[2]] is a vector, and we want the third element of that vector
##Dataframes are lists




