#October 26 for loop
par(mfrow=c(3,3))
alldata<-NOAA_EcosystemData_10.6.2023
oneplot<-function(lat, species){
  species<-subset(alldata,spnm==species)
  latrspecies<-round(species$DECDEG_BEGLAT)
  logEXCATCHWT<-log(1+species[,"EXPCATCHWT"])
  specieslog<-cbind(species, logEXCATCHWT)
  specieslog2<-cbind(specieslog,latrspecies)
  fallspecies<-subset(specieslog2,fall=="1")
  springspecies<-subset(specieslog2, fall=="0")
  
  fallspecieslat<-fallspecies[fallspecies[,"latrspecies"]==lat,]
  springspecieslat<-springspecies[springspecies[,"latrspecies"]==lat,]
  
  plot(fallspecieslat[,"GMT_YEAR"],fallspecieslat[,"logEXCATCHWT"], xlim=c(1967,2021), ylim=c(0,max(fallspecies[,"logEXCATCHWT"])), type="l", lwd=2, xlab="Year", ylab="Expected Catch Weight (log)")
  
  lines(springspecieslat[,"GMT_YEAR"],springspecieslat[,"logEXCATCHWT"], col="2", type="l", lwd=2)
  abline(v=2007.5,col=4,lty=2)}

nineplot<-function(species){
  species<-subset(alldata,spnm==species)
  latrspecies<-round(species$DECDEG_BEGLAT)
  logEXCATCHWT<-log(1+species[,"EXPCATCHWT"])
  specieslog<-cbind(species, logEXCATCHWT)
  specieslog2<-cbind(specieslog,latrspecies)
  fallspecies<-subset(specieslog2,fall=="1")
  springspecies<-subset(specieslog2, fall=="0")
  
  fallspecieslat<-fallspecies[fallspecies[,"latrspecies"]==latitude,]
  springspecieslat<-springspecies[springspecies[,"latrspecies"]==latitude,]
  
  plot(fallspecieslat[,"GMT_YEAR"],fallspecieslat[,"logEXCATCHWT"], xlim=c(1967,2021), ylim=c(0,max(fallspecies[,"logEXCATCHWT"])), type="l", lwd=2, xlab="Year", ylab="Expected Catch Weight (log)")
  
  lines(springspecieslat[,"GMT_YEAR"],springspecieslat[,"logEXCATCHWT"], col="2", type="l", lwd=2)
  abline(v=2007.5,col=4,lty=2)}

##Do function for latitudes 36-44, species SPOTTED HAKE, RED HAKE, WHITE HAKE,
##HADDOCK, SILVER HAKE
for(latitude in 36:44){nineplot("SILVER HAKE")}

