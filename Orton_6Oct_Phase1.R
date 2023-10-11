#October 6th
##aggregate function allows you to compute summary stats for subsets of data
##Syntax:
### Data frame
aggregate(x,               # R object
          by,              # List of variables (grouping elements)
          FUN,             # Function to be applied for summary statistics
          ...,             # Additional arguments to be passed to FUN
          simplify = TRUE, # Whether to simplify results as much as possible or not
          drop = TRUE)     # Whether to drop unused combinations of grouping values or not.

# Formula
aggregate(formula,             # Input formula
          data,                # List or data frame where the variables are stored
          FUN,                 # Function to be applied for summary statistics
          ...,                 # Additional arguments to be passed to FUN
          subset,              # Observations to be used (optional)
          na.action = na.omit) # How to deal with NA values

# Time series
aggregate(x,                   # Time series object
          nfrequency = 1,      # Observations per unit of time (submultiple of x)
          FUN = sum,           # Function to be applied for summary statistics
          ndeltat = 1,         # Fraction between successive observations
          ts.eps = getOption("ts.eps"), # Tolerance to determine if 'nfrequency' is a submultiple of the frequency of x
          ...)                 # Additional arguments to be passed to FUN
##Examples
df<-chickwts
head(df)
###arguments needed are the numerical variable you want, the categorical, and 
###the function to be applied. Two equivalent ways.
group_mean<-aggregate(df$weight, list(df$feed), mean)
group_mean<-aggregate(weight ~ feed, data=df, mean)
group_mean
###Adjust the column names as follows
colnames(group_mean)<-c("Group","Mean")
group_mean

##Aggregate count
###First, find out the length of each variable. How many are in each group?
aggregate(chickwts$feed, by=list(chickwts$feed), FUN=length)
aggregate(weight ~ feed, data=chickwts,FUN=length)

##Aggregate quantile
###use a time series object of class xts 
set.seed(1)
library(lubridate)
Dates <- seq(dmy("01/01/2014"), dmy("01/01/2015"), by = "day")
Return <- rnorm(length(Dates))

# install.packages("xts")
library(xts)
tserie <- xts(Return, Dates)

head(tserie)

##Find the quantiles of certain parts of your data
dat <- aggregate(tserie ~ month(index(tserie)), FUN = quantile,
                 probs = c(0.05, 0.95))
colnames(dat)[1] <- "Month"
dat

##Aggregate by multiple columns in R
###Aggregate more than one variable
###Aggregate more than one categorical variable, more than one numerical 
###variable, or numerical and cat at the same time
##New cat variable call cat_var
set.seed(1)
cat_var <- sample(c("A", "B", "C"), nrow(df), replace = TRUE)
df_2 <- cbind(df, cat_var)
head(df_2)

##Aggregate the sums of each weight based on the type of feed and the cat_var
aggregate(df_2$weight, by = list(df_2$feed, df_2$cat_var), FUN = sum)

# Equivalent to:
aggregate(weight ~ feed + cat_var, data = df_2, FUN = sum)

##Create a numeric variable
set.seed(1)

num_var <- rnorm(nrow(df))

df_3 <- cbind(num_var, df)

head(df_3)
##two numeric variables, concatonate with cbind
##Get the mean of both the numeric variable and the weight based on feed type
aggregate(cbind(df_3$num_var, df_3$weight), list(df_3$feed), mean)






