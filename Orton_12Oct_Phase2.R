#Oct. 12, Phase II
par(mfrow=c(3,3))
witch<-subset(alldata,spnm=="WITCH FLOUNDER")
witch
latrwitch<-round(witch$DECDEG_BEGLAT)
latrwitch
unique(latrwitch)
logEXCATCHWT<-log(1+witch[,"EXPCATCHWT"])
witchlog<-cbind(witch, logEXCATCHWT)
witchlog2<-cbind(witchlog,latr)
head(witchlog2)
fallwitch<-subset(witchlog2,fall=="1")
springwitch<-subset(witchlog2, fall=="0")
head(fallwitch)
max(fallwitch[,"logEXCATCHWT"])

lat<-44
fallwitchlat<-fallwitch[fallwitch[,"latr"]==lat,]
springwitchlat<-springwitch[springwitch[,"latr"]==lat,]
#head(fallwitchlat)
#head(springwitchlat)

plot(fallwitchlat[,"GMT_YEAR"],fallwitchlat[,"logEXCATCHWT"], xlim=c(1967,2021), ylim=c(0,3.127), type="l", lwd=2, xlab="Year", ylab="Expected Catch Weight (log)")
title("Latitude 44 Witch Flounder")

lines(springwitchlat[,"GMT_YEAR"],springwitchlat[,"logEXCATCHWT"], col="2", type="l", lwd=2)
abline(v=2007.5,col=4,lty=2)    
