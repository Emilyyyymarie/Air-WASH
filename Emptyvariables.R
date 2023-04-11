#define

#ecolilogreductionvaluelist=seq(0,7.5,by=0.25) # or to 7.5 # to make log normal graph
#logreductionseq=seq(1,length(ecolilogreductionvaluelist),by=1)

#old ones not using
#ecolilevel= logspace(0,log(21200,base=10),n=15)
#waterqualityseq=seq(1,length(ecolilevel),by=1)
#waterqualityindex=seq(1,length(ecolilevel),by=1)
##plotwaterquality=c(0,10,100,1000)
#plotwaterqualityseq=seq(1,length(plotwaterquality),by=1)
#longlogreduction=seq(0,8,by=0.25)
#longlogreductionseq=seq(1,length(longlogreduction),by=1)

indexvalue =c()

RRriskmenvalue=c()
RRriskcookvalue=c()
RRriskchildvalue=c()

ecolilevel=c()

dailyenergyinput=c()
drinkingwateroneperson=c()
drinkingwateronepersonvolume=c()
drinkingwater=c()
ageatdeath=c()

#water stuff
totalwaterdeaths=c()
totalwaterDALYs=c()
ecoliDALYs=c()
cryptoDALYs=c()
rotaDALYs=c()
campoDALYs=c()
ecolideaths=c()
cryptodeaths=c()
rotadeaths=c()
campodeaths=c()


#infection function parameters
cryptokvalue=c()
cryptoratiovalue=c()
rotaalphavalue=c()
rotaNfiftyvalue=c()
rotaratiovalue=c()
campalphavalue=c()
campNfiftyvalue=c()
campratiovalue=c()

#air quality

heatvaluewood=c()
heatvaluepeanutpellet=c()
heatvaluewoodpellet=c()
heatvaluecharcoal=c()

efficiencycharcoal=c()
efficiencyLPG=c()

heatvalueLPG=c()

emissionfactorgkgsmokeywood=c()
emissionfactorgkgLPG=c() 

cleanstovenumber=c()
cleancooking=c()
cleanwaterheating=c()
cleanwatercooking=c()

LPGcooking=c()
LPGwaterheating=c()
LPGwatercooking=c()
LPGstovenumber=c()

Charcoalcooking=c()
Charcoalwaterheating=c()
Charcoalwatercooking=c()
Charcoalstovenumber=c()

Minimotocooking=c()
Minimotowaterheating=c()
Minimotowatercooking=c()
Minimotostovenumber=c()

Smokeycooking=c()
Smokeywaterheating=c()
Smokeywatercooking=c()
Smokeystovenumber=c()

Improvedcooking=c()
Improvedwaterheating=c()
Improvedwatercooking=c()
Improvedstovenumber=c()

print("water DALYs matrix")
#waterDALYplot=matrix(NA,nrow=length(plotwaterqualityseq),ncol=length(longlogreductionseq))
#ar <- array(someData, c(365, 6, 4))
#waterDALYplot=array(NA,c(length(numberseq),length(waterqualityindex),length(logreductionseq)))

#waterDALYplotavgsafe=c()
#waterDALYplotavgsafe=c()
#waterDALYplotavgsafe=c()
#waterDALYplotavglow=c()
#waterDALYplotavgmedium=c()
#waterDALYplotavghigh=c()
waterDALYsnoboiling=c()
waterDALYslabboiling=c()
waterDALYsgoodboiling=c()
waterDALYsineffectiveboiling=c()
waterDALYsmoderateboiling=c()
waterDALYsworseboiling=c()
waterDALYsbadzeroboiling=c()
waterDALYsnegativeboiling=c() 


waterDALYplotavg=c()
waterRotaplotavg=c()
waterCampplotavg=c()
waterCryptoplotavg=c()

#waterRotaDALYsmoderateboiling=matrix(NA,nrow=length(numberseq),ncol=length(ecolilevellength))
#waterCampDALYsmoderateboiling=matrix(NA,nrow=length(numberseq),ncol=length(ecolilevellength))
#waterCryptoDALYsmoderateboiling=matrix(NA,nrow=length(numberseq),ncol=length(ecolilevellength))
#waterecoliDALYsmoderateboiling=matrix(NA,nrow=length(numberseq),ncol=length(ecolilevellength))

#waterRotaDALYsnoboiling=matrix(NA,nrow=length(numberseq),ncol=length(ecolilevellength))
#waterCampDALYsnoboiling=matrix(NA,nrow=length(numberseq),ncol=length(ecolilevellength))
#waterCryptoDALYsnoboiling=matrix(NA,nrow=length(numberseq),ncol=length(ecolilevellength))
#waterecoliDALYsnoboiling=matrix(NA,nrow=length(numberseq),ncol=length(ecolilevellength))

#waterRotaDALYslabboiling=matrix(NA,nrow=length(numberseq),ncol=length(ecolilevellength))
#waterCampDALYslabboiling=matrix(NA,nrow=length(numberseq),ncol=length(ecolilevellength))
#waterCryptoDALYslabboiling=matrix(NA,nrow=length(numberseq),ncol=length(ecolilevellength))
#waterecoliDALYslabboiling=matrix(NA,nrow=length(numberseq),ncol=length(ecolilevellength))

#waterRotaDALYsgoodboiling=matrix(NA,nrow=length(numberseq),ncol=length(ecolilevellength))
#waterCampDALYsgoodboiling=matrix(NA,nrow=length(numberseq),ncol=length(ecolilevellength))
#waterCryptoDALYsgoodboiling=matrix(NA,nrow=length(numberseq),ncol=length(ecolilevellength))
#waterecoliDALYsgoodboiling=matrix(NA,nrow=length(numberseq),ncol=length(ecolilevellength))

#waterRotaDALYsworseboiling=matrix(NA,nrow=length(numberseq),ncol=length(ecolilevellength))
#waterCampDALYsworseboiling=matrix(NA,nrow=length(numberseq),ncol=length(ecolilevellength))
#waterCryptoDALYsworseboiling=matrix(NA,nrow=length(numberseq),ncol=length(ecolilevellength))
#waterecoliDALYsworseboiling=matrix(NA,nrow=length(numberseq),ncol=length(ecolilevellength))

#waterRotaDALYsnegativeboiling=matrix(NA,nrow=length(numberseq),ncol=length(ecolilevellength))
#waterCampDALYsnegativeboiling=matrix(NA,nrow=length(numberseq),ncol=length(ecolilevellength))
#waterCryptoDALYsnegativeboiling=matrix(NA,nrow=length(numberseq),ncol=length(ecolilevellength))
#waterecoliDALYsnegativeboiling=matrix(NA,nrow=length(numberseq),ncol=length(ecolilevellength))

#waterRotaDALYsineffectiveboiling=matrix(NA,nrow=length(numberseq),ncol=length(ecolilevellength))
#waterCampDALYsineffectiveboiling=matrix(NA,nrow=length(numberseq),ncol=length(ecolilevellength))
#waterCryptoDALYsineffectiveboiling=matrix(NA,nrow=length(numberseq),ncol=length(ecolilevellength))
#waterecoliDALYsineffectiveboiling=matrix(NA,nrow=length(numberseq),ncol=length(ecolilevellength))

#waterRotaDALYsbadzeroboiling=matrix(NA,nrow=length(numberseq),ncol=length(ecolilevellength))
#waterCampDALYsbadzeroboiling=matrix(NA,nrow=length(numberseq),ncol=length(ecolilevellength))
#waterCryptoDALYsbadzeroboiling=matrix(NA,nrow=length(numberseq),ncol=length(ecolilevellength))
#waterecoliDALYsbadzeroboiling=matrix(NA,nrow=length(numberseq),ncol=length(ecolilevellength))

deltacookheatminimotoDALYs=c()
deltaheatminimotoDALYs=c()

deltaheatCleanDALYs=c()
deltacookheatCleanDALYs=c()
deltacookheatsmokeyDALYs=c()
deltaheatcharcoalDALYs=c()
deltaheatsmokeyDALYs=c()
deltacookheatimprovedDALYs=c()
deltaheatimprovedDALYs=c()
deltacookheatLPGDALYs=c()
deltaheatLPGDALYs=c()
deltacookheatcharcoalDALYs=c()
cookingsmokeyDALYs=c()
waterheatingsmokeyDALYs=c() 
watercookingsmokeyDALYs=c()

cookingimprovedDALYs=c()
waterheatingimprovedDALYs=c() 
watercookingimprovedDALYs=c()

cookingminimotoDALYs=c()
waterheatingminimotoDALYs=c() 
watercookingminimotoDALYs=c()

cookingCleanDALYs=c()
waterheatingCleanDALYs=c()
watercookingCleanDALYs=c()

cookingLPGDALYs=c()
waterheatingLPGDALYs=c()
watercookingLPGDALYs=c()

cookingcharcoalDALYs=c()
waterheatingcharcoalDALYs=c()
watercookingcharcoalDALYs=c()


meannoboiling=c()

meanlabboiling=c()
meangoodboiling=c()
meanineffectiveboiling=c()
meanmoderateboiling=c()
meanworseboiling=c()
meanbadzeroboiling=c()
meannegativeboiling=c()

sdlabboiling=c()
sdgoodboiling=c()
sdineffectiveboiling=c()
sdmoderateboiling=c()
sdworseboiling=c()
sdbadzeroboiling=c()
sdnegativeboiling=c()
sdnoboiling=c()


meanminimotocookingDALYs=c()
meanminimotowaterheatingDALYs=c()
meanminimotowatercookingDALYs=c()

meansmokeycookingDALYs=c()
meansmokeywaterheatingDALYs=c()
meansmokeywatercookingDALYs=c()

meanimprovedcookingDALYs=c()
meanimprovedwaterheatingDALYs=c()
meanimprovedwatercookingDALYs=c()

meanLPGcookingDALYs=c()
meanLPGwaterheatingDALYs=c()
meanLPGwatercookingDALYs=c()

meancharcoalcookingDALYs=c()
meancharcoalwaterheatingDALYs=c()
meancharcoalwatercookingDALYs=c()

meanCleancookingDALYs=c()
meanCleanwaterheatingDALYs=c()
meanCleanwatercookingDALYs=c()

#SD

sdminimotocookingDALYs=c()
sdminimotowaterheatingDALYs=c()
sdminimotowatercookingDALYs=c()

sdsmokeycookingDALYs=c()
sdsmokeywaterheatingDALYs=c()
sdsmokeywatercookingDALYs=c()

sdimprovedcookingDALYs=c()
sdimprovedwaterheatingDALYs=c()
sdimprovedwatercookingDALYs=c()

sdLPGcookingDALYs=c()
sdLPGwaterheatingDALYs=c()
sdLPGwatercookingDALYs=c()

sdcharcoalcookingDALYs=c()
sdcharcoalwaterheatingDALYs=c()
sdcharcoalwatercookingDALYs=c()

sdCleancookingDALYs=c()
sdCleanwaterheatingDALYs=c()
sdCleanwatercookingDALYs=c()

###
totalDALYsnoboilingminimoto=c()
totalDALYslabboilingminimoto=c()
totalDALYsgoodboilingminimoto=c()
totalDALYsineffectiveboilingminimoto=c()
totalDALYsmoderateboilingminimoto=c()
totalDALYsworseboilingminimoto=c()
totalDALYsbadzeroboilingminimoto=c()

#smoky wood

totalDALYsnoboilingsmokey=c()
totalDALYslabboilingsmokey=c()
totalDALYsgoodboilingsmokey=c()
totalDALYsineffectiveboilingsmokey=c()
totalDALYsmoderateboilingsmokey=c()
totalDALYsworseboilingsmokey=c()
totalDALYbadzeroboilingsmokey=c()

#improved wood
totalDALYsnoboilingimproved=c()
totalDALYslabboilingimproved=c()
totalDALYsgoodboilingimproved=c()
totalDALYsineffectiveboilingimproved=c()
totalDALYsmoderateboilingimproved=c()
totalDALYsworseboilingimproved=c()
totalDalysbadzeroboilingimproved=c()

totalDALYsnoboilingLPG=c()
totalDALYslabboilingLPG=c()
totalDALYsgoodboilingLPG=c()
totalDALYsineffectiveboilingLPG=c()
totalDALYsmoderateboilingLPG=c()
totalDALYsworseboilingLPG=c()
totalDALYsbadzeroboilingLPG=c()

totalDALYsnoboilingcharcoal=c()
totalDALYslabboilingcharcoal=c()
totalDALYsgoodboilingcharcoal=c()
totalDALYsineffectiveboilingcharcoal=c()
totalDALYsmoderateboilingcharcoal=c()
totalDALYsworseboilingcharcoal=c()
totalDALYsbadzeroboilingcharcoal=c()

waterDALYsnoboilingdiff=c()
waterDALYslabboilingdiff=c()
waterDALYsgoodboilingdiff=c()
waterDALYsineffectiveboilingdiff=c()
waterDALYsmoderateboilingdiff=c()
waterDALYsworseboilingdiff=c()
waterDALYsbadzeroboilingdiff=c()
waterDALYsnegativeboilingdiff=c()

watersummary<- array(NA, dim=c(20,9))
watersummarysd<- array(NA, dim=c(20,9))
#PMsummary<-array(0,dim=c(1,18))
#PMsummarysd<-array(0,dim=c(20,19))
totalDALYsmatrixminimoto<-array(NA,dim=c(20,8))
totalDALYsmatrixsmokey<-array(NA,dim=c(20,8))
totalDALYsmatriximproved<-array(NA,dim=c(20,8))







#waterDALYresults <- array(rep(NA, length(numberseq)*length(logreductionseq)*length(waterqualityseqlength)), dim=c(length(numberseq), length(logreductionseq), length(waterqualityseqlength)))

#cryptodoseresults<- array(rep(NA, length(numberseq)*length(logreductionseq)*length(waterqualityseqlength)), dim=c(length(numberseq), length(logreductionseq), length(waterqualityseqlength)))
waterRotaDALYsresults <-array(NA,dim=c(length(numberseq),length(logreductionseq)))
waterCampDALYsresults <-array(NA,dim=c(length(numberseq),length(logreductionseq)))
waterCryptoDALYsresults <-array(NA,dim=c(length(numberseq),length(logreductionseq)))
waterDALYlogplot<-array(NA,dim=c(length(numberseq),length(logreductionseq)))


#waterDALYaverage<-array(NA, dim=c(length(logreductionseq),length(waterqualityseqlength)))
#cryptodoseaverage<-array(NA, dim=c(length(logreductionseq),length(waterqualityseqlength)))
#waterRotaaverage<-array(NA, dim=c(length(logreductionseq),length(waterqualityseqlength)))
#waterCampaverage<-array(NA, dim=c(length(logreductionseq),length(waterqualityseqlength)))
#waterCryptoaverage<-array(NA, dim=c(length(logreductionseq),length(waterqualityseqlength)))
#waterecoliaverage<-array(NA, dim=c(length(logreductionseq),length(waterqualityseqlength)))