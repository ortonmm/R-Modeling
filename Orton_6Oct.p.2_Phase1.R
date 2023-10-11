#Activity 2 Oct. 6 2023
##Load data set
NOAA_EcosystemData_10.6.2023 <- read.csv("~/Downloads/NOAA_EcosystemData_10-6-2023.csv", header=TRUE)
View(NOAA_EcosystemData_10.6.2023)
##Name it
alldata<-NOAA_EcosystemData_10.6.2023
#x is some matrix, names of columns of matrix that you're aggregating, what you're aggregating by 
##FUN= some function, mean of x without na values
serialAgg=function (x, AggCats, AggTarg = NULL, FUN = function(x) mean(x, na.rm = TRUE)){
  if (is.null(AggTarg)) {
    if (is.numeric(AggCats)) 
      AggTarg = (1:ncol(x))[-AggCats]
    if (is.character(AggCats)) 
      AggTarg = colnames(x)[!colnames(x) %in% AggCats]
  }
  Numbers = prod(apply(t(t(x[, AggCats])), 2, is.numeric))
  ncat = length(AggCats)
  if (ncat == 1) 
    Cats = as.character(x[, AggCats])
  else Cats = codify(x[, AggCats])
  agged = as.matrix(aggregate(x[, AggTarg], by = list(Cats), FUN = FUN))
  if (ncat > 1) 
    agged = cbind(matrix(unlist(strsplit(agged[, 1], 
                                         "_")), ncol = ncat, byrow = TRUE), matrix(agged[, 
                                                                                         -1], ncol = ncol(agged) - 1))
  if (Numbers) 
    agged = t(apply(agged, 1, as.numeric))
  colnames(agged) = colnames(cbind(x[, c(AggCats[1], AggCats)], 
                                   x[, c(AggTarg, AggTarg[1])]))[c(1, 3:(ncol(agged) + 1))]
  agged
}
codify=function (x, cols = 1:ncol(x), sep = "_") 
  as.matrix(cbind(Index = apply(x[, cols], 1, paste0, collapse = sep),  x[, -cols]))

##Activity 4: species chosen is butterfish
butter<-subset(alldata,spnm=="BUTTERFISH")
butter

##aggregate species density (EXPCATCHNUM) and biomass (EXPCATCHWT) by year
meanbutterbyyr<-serialAgg(butter,AggCats="GMT_YEAR", AggTarg = c("EXPCATCHNUM", "EXPCATCHWT"))
meanbutterbyyr

##Plot this information
##Density
plot(meanbutterbyyr[,"GMT_YEAR"],meanbutterbyyr[,"EXPCATCHNUM"], type="l", xlab="Year", ylab="Mean Butterfish Caught")
title("Average Butterfish Caught Each Year")
##Biomass
plot(meanbutterbyyr[,"GMT_YEAR"], meanbutterbyyr[,"EXPCATCHWT"], type="l", xlab="Year", ylab="Biomass")
title("Butterfish Average Biomass Over Time")

#Activity 5
latr<-round(butter$DECDEG_BEGLAT)
latr
unique(latr)
butter$latr=latr
head(butter)
YrSpaceWt<-serialAgg(butter,AggCats=c("GMT_YEAR", "latr"), AggTarg = "EXPCATCHWT")
head(YrSpaceWt)
pop35<-YrSpaceWt[YrSpaceWt[,"latr"]==35,]
plot(pop35[,"GMT_YEAR"],pop35[,"EXPCATCHWT"], type="l", xlab="Year", ylab="Biomass")
title("Biomass of Butterfish Over Time at Thirty Five Lat")

