#October 24
par(mfrow=c(3,3))

oneplot<-function(lat, species){
species<-subset(alldata,spnm==species)
species
latrspecies<-round(species$DECDEG_BEGLAT)
latrspecies
unique(latrspecies)
logEXCATCHWT<-log(1+species[,"EXPCATCHWT"])
specieslog<-cbind(species, logEXCATCHWT)
specieslog2<-cbind(specieslog,latr)
head(specieslog2)
fallspecies<-subset(specieslog2,fall=="1")
springspecies<-subset(specieslog2, fall=="0")
head(fallspecies)
max(fallspecies[,"logEXCATCHWT"])

fallspecieslat<-fallspecies[fallspecies[,"latr"]==lat,]
springspecieslat<-springspecies[springspecies[,"latr"]==lat,]
#head(fallspecieslat)
#head(springspecieslat)

plot(fallspecieslat[,"GMT_YEAR"],fallspecieslat[,"logEXCATCHWT"], xlim=c(1967,2021), ylim=c(0,max(fallspecies[,"logEXCATCHWT"])), type="l", lwd=2, xlab="Year", ylab="Expected Catch Weight (log)")

lines(springspecieslat[,"GMT_YEAR"],springspecieslat[,"logEXCATCHWT"], col="2", type="l", lwd=2)
abline(v=2007.5,col=4,lty=2)}

##Do function for latitudes 36-44, species SPOTTED HAKE, RED HAKE, WHITE HAKE,
##HADDOCK, SILVER HAKE
oneplot(lat = 36 , species="SPOTTED HAKE")
oneplot(lat = 37 , species="SPOTTED HAKE")
oneplot(lat = 38 , species="SPOTTED HAKE")
oneplot(lat = 39 , species="SPOTTED HAKE")
oneplot(lat = 40 , species="SPOTTED HAKE")
oneplot(lat = 41 , species="SPOTTED HAKE")
oneplot(lat = 42 , species="SPOTTED HAKE")
oneplot(lat = 43 , species="SPOTTED HAKE")
oneplot(lat = 44 , species="SPOTTED HAKE")

oneplot(lat = 36 , species="RED HAKE")
oneplot(lat = 37 , species="RED HAKE")
oneplot(lat = 38 , species="RED HAKE")
oneplot(lat = 39 , species="RED HAKE")
oneplot(lat = 40 , species="RED HAKE")
oneplot(lat = 41 , species="RED HAKE")
oneplot(lat = 42 , species="RED HAKE")
oneplot(lat = 43 , species="RED HAKE")
oneplot(lat = 44 , species="RED HAKE")

oneplot(lat = 36 , species="WHITE HAKE")
oneplot(lat = 37 , species="WHITE HAKE")
oneplot(lat = 38 , species="WHITE HAKE")
oneplot(lat = 39 , species="WHITE HAKE")
oneplot(lat = 40 , species="WHITE HAKE")
oneplot(lat = 41 , species="WHITE HAKE")
oneplot(lat = 42 , species="WHITE HAKE")
oneplot(lat = 43 , species="WHITE HAKE")
oneplot(lat = 44 , species="WHITE HAKE")

oneplot(lat = 36 , species="SILVER HAKE")
oneplot(lat = 37 , species="SILVER HAKE")
oneplot(lat = 38 , species="SILVER HAKE")
oneplot(lat = 39 , species="SILVER HAKE")
oneplot(lat = 40 , species="SILVER HAKE")
oneplot(lat = 41 , species="SILVER HAKE")
oneplot(lat = 42 , species="SILVER HAKE")
oneplot(lat = 43 , species="SILVER HAKE")
oneplot(lat = 44 , species="SILVER HAKE")

oneplot(lat = 36 , species="HADDOCK")
oneplot(lat = 37 , species="HADDOCK")
oneplot(lat = 38 , species="HADDOCK")
oneplot(lat = 39 , species="HADDOCK")
oneplot(lat = 40 , species="HADDOCK")
oneplot(lat = 41 , species="HADDOCK")
oneplot(lat = 42 , species="HADDOCK")
oneplot(lat = 43 , species="HADDOCK")
oneplot(lat = 44 , species="HADDOCK")
