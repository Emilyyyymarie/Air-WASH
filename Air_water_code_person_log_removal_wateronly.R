lognormalmean <- function(mean, stdev) {
  lognormalmean <- log((mean^2)/(stdev^2+mean^2)^0.5)
  return(lognormalmean)  
}

lognormalstdev <- function(mean,stdev) {
  lognormalstdev <-sqrt(log(1+((stdev^2)/(mean^2))))
  return(lognormalstdev)
}

source("countryspecificvariables.R")
source("CountryPopulation.R")
source("infectionfunctions.R") #water risk
source("IndoorAirPollution.R") #PM2.5 concentration
source("RelativeRisk.R") #air risk

backgroundconcentration= 12 #ug/m^3

womenexposureinput=0.742
menexposureinput=0.45
childrenexposureinput=0.628

#define sequence
numberlength=numberseq
ecolilogreductionvaluelist=seq(0,0.05,by=0.001)
logreductionseq=seq(1,length(ecolilogreductionvaluelist),by=1)
#ecolilevel= logspace(0,log(21200,base=10),n=15)#per 100 mL  c(0,1,10,11,50,80,100,101,150,200,300)#c(lake,well1,well2,well3,borehole,kiosk1,kiosk2,hh1,hh2) #old before switched distributions                  
#waterqualityseq=seq(1,length(ecolilevel),by=1) ## new

source("Emptyvariables.R") #update
for (i in numberseq)
{
cryptokvalue[i]=sample(rlnorm(numberlength,lognormalmean((3.44*10^-1),(2.02)),lognormalstdev((3.44*10^-1),(2.02))),1)
cryptoratiovalue[i]=sample(rlnorm(numberlength,lognormalmean((1.13*10^-6),(9.26*10^-6)),lognormalstdev((1.13*10^-6),(9.26*10^-6))),1)
rotaalphavalue[i]=sample(rlnorm(numberlength,lognormalmean((2.48*10^-1),(1.46*10^-1)),lognormalstdev((2.48*10^-1),(1.46*10^-1))),1)
rotaNfiftyvalue[i]=sample(rlnorm(numberlength,lognormalmean(8.16,6.65),lognormalstdev(8.16,6.65)),1)
rotaratiovalue[i]=sample(rlnorm(numberlength,lognormalmean((8.79*10^-7),(1.77*10^-6))),lognormalstdev((8.79*10^-7),(1.77*10^-6)),1)
campalphavalue[i]= sample(rlnorm(numberlength,lognormalmean((1.51*10^-1),(5.90*10^-1)),lognormalstdev((1.51*10^-1),(5.90*10^-1))),1) #0.1
campNfiftyvalue[i]=sample(rlnorm(numberlength,lognormalmean((1.69*10^3),(2.78*10^3)),lognormalstdev((1.69*10^3),(2.78*10^3))),1)
campratiovalue[i]=sample(rlnorm(numberlength,lognormalmean((8.89*10^-3),(1.33)),lognormalstdev((8.89*10^-3),(1.33))),1)

if (waterqualitylevel == "safe"){
    ecolilevel[i]=0
  }
if (waterqualitylevel == "low"){
    ecolilevel[i]=sample(runif(numberseq, min = 1, max = 10),1)
  }
if (waterqualitylevel == "medium"){
    ecolilevel[i]=sample(runif(numberseq, min = 11, max = 100),1)
  }
if (waterqualitylevel == "high"){
    ecolilevel[i]=sample(runif(numberseq, min = 101, max = 1000),1) 
  }

ageatdeath[i]=countryageperson()
dailyenergyinput[i]=sample(rlnorm(1000,lognormalmean(11,(0.5*11)),lognormalstdev(11,(0.5*11))),1) #megajoules-delivered for cooking


#Drinking water from "Water consumption patterns and factors contributing to water consumption in arsenic affected population of rural West Bengal, India"
#Hossain et. al 2013
drinkingwateroneperson[i]= sample(rlnorm(numberlength,lognormalmean(3.12*1000,1.17*1000),lognormalstdev(3.12*1000,1.17*1000)),1) 
#use the one person average for air quality

#use below for calculating risk from drinking water
if (personofinterest=="child"){
  drinkingwateronepersonvolume[i]= sample(rlnorm(numberlength,lognormalmean(2.14*1000,0.78*1000),lognormalstdev(2.14*1000,0.78*1000)),1) #values from above paper
}
if (personofinterest=="adult"){
drinkingwateronepersonvolume[i]= sample(rlnorm(numberlength,lognormalmean(3.49*1000,1.07*1000),lognormalstdev(3.49*1000,1.07*1000)),1) #values from paper in bangladesh
}

airexchange=sample(rlnorm(numberlength,lognormalmean(25,0.6*25),lognormalstdev(25,0.6*25)),1)/60
volume=sample(rlnorm(numberlength,lognormalmean(30,0.5*30),lognormalstdev(30,0.5*30)),1) # volume of kitchen

waterDALYsnoboiling[i]=waterDALYs(drinkingwateronepersonvolume[i],ecolilevel[i],0,inputpopulation,ageatdeath[i],cryptokvalue[i],cryptoratiovalue[i],rotaalphavalue[i],rotaNfiftyvalue[i],rotaratiovalue[i],campalphavalue[i],campNfiftyvalue[i],campratiovalue[i])
waterDALYslabboiling[i]=waterDALYs(drinkingwateronepersonvolume[i],ecolilevel[i],6,inputpopulation,ageatdeath[i],cryptokvalue[i],cryptoratiovalue[i],rotaalphavalue[i],rotaNfiftyvalue[i],rotaratiovalue[i],campalphavalue[i],campNfiftyvalue[i],campratiovalue[i])
waterDALYsgoodboiling[i]=waterDALYs(drinkingwateronepersonvolume[i],ecolilevel[i],2,inputpopulation,ageatdeath[i],cryptokvalue[i],cryptoratiovalue[i],rotaalphavalue[i],rotaNfiftyvalue[i],rotaratiovalue[i],campalphavalue[i],campNfiftyvalue[i],campratiovalue[i])
waterDALYsineffectiveboiling[i]=waterDALYs(drinkingwateronepersonvolume[i],ecolilevel[i],1.5,inputpopulation,ageatdeath[i],cryptokvalue[i],cryptoratiovalue[i],rotaalphavalue[i],rotaNfiftyvalue[i],rotaratiovalue[i],campalphavalue[i],campNfiftyvalue[i],campratiovalue[i])
waterDALYsmoderateboiling[i]=waterDALYs(drinkingwateronepersonvolume[i],ecolilevel[i],1.8,inputpopulation,ageatdeath[i],cryptokvalue[i],cryptoratiovalue[i],rotaalphavalue[i],rotaNfiftyvalue[i],rotaratiovalue[i],campalphavalue[i],campNfiftyvalue[i],campratiovalue[i])
waterDALYsworseboiling[i]=waterDALYs(drinkingwateronepersonvolume[i],ecolilevel[i],0.464,inputpopulation,ageatdeath[i],cryptokvalue[i],cryptoratiovalue[i],rotaalphavalue[i],rotaNfiftyvalue[i],rotaratiovalue[i],campalphavalue[i],campNfiftyvalue[i],campratiovalue[i])
waterDALYsbadzeroboiling[i]=waterDALYs(drinkingwateronepersonvolume[i],ecolilevel[i],0.048,inputpopulation,ageatdeath[i],cryptokvalue[i],cryptoratiovalue[i],rotaalphavalue[i],rotaNfiftyvalue[i],rotaratiovalue[i],campalphavalue[i],campNfiftyvalue[i],campratiovalue[i])
waterDALYsnegativeboiling[i]=waterDALYs(drinkingwateronepersonvolume[i],ecolilevel[i],-0.208,inputpopulation,ageatdeath[i],cryptokvalue[i],cryptoratiovalue[i],rotaalphavalue[i],rotaNfiftyvalue[i],rotaratiovalue[i],campalphavalue[i],campNfiftyvalue[i],campratiovalue[i])
########################from old code

#water boiling
waterDALYsnoboilingdiff[i]=waterDALYsnoboiling[i]-waterDALYsnoboiling[i]
waterDALYslabboilingdiff[i]=waterDALYslabboiling[i]-waterDALYsnoboiling[i]
waterDALYsgoodboilingdiff[i]=waterDALYsgoodboiling[i]-waterDALYsnoboiling[i]
waterDALYsineffectiveboilingdiff[i]=waterDALYsineffectiveboiling[i]-waterDALYsnoboiling[i]
waterDALYsmoderateboilingdiff[i]=waterDALYsmoderateboiling[i]-waterDALYsnoboiling[i]
waterDALYsworseboilingdiff[i]=waterDALYsworseboiling[i]-waterDALYsnoboiling[i]
waterDALYsbadzeroboilingdiff[i]=waterDALYsbadzeroboiling[i]-waterDALYsnoboiling[i]
waterDALYsnegativeboilingdiff[i]=waterDALYsnegativeboiling[i]-waterDALYsnoboiling[i]


  
  
  #############################################################################################################################

for (a in logreductionseq)
{
  waterDALYlogplot[i,a]= waterDALYs(drinkingwateroneperson[i],ecolilevel[i],ecolilogreductionvaluelist[a],inputpopulation,ageatdeath[i],cryptokvalue[i],cryptoratiovalue[i],rotaalphavalue[i],rotaNfiftyvalue[i],rotaratiovalue[i],campalphavalue[i],campNfiftyvalue[i],campratiovalue[i])         
  waterRotaDALYsresults[i,a]=waterrotaDALYs(drinkingwateronepersonvolume[i],ecolilevel[i],ecolilogreductionvaluelist[a],inputpopulation,ageatdeath[i],rotaalphavalue[i],rotaNfiftyvalue[i],rotaratiovalue[i])
  waterCampDALYsresults[i,a]=watercampDALYs(drinkingwateronepersonvolume[i],ecolilevel[i],ecolilogreductionvaluelist[a],inputpopulation,ageatdeath[i],campalphavalue[i],campNfiftyvalue[i],campratiovalue[i])
  waterCryptoDALYsresults[i,a]=watercryptoDALYs(drinkingwateronepersonvolume[i],ecolilevel[i],ecolilogreductionvaluelist[a],inputpopulation,ageatdeath[i],cryptokvalue[i],cryptoratiovalue[i])
    
  }
}

#write differences to csv

print("writing")
###########################
write.csv(waterDALYsnoboilingdiff,file.path(currentresultspath,paste("waterDALYsnoboilingdiff",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
write.csv(waterDALYslabboilingdiff,file.path(currentresultspath,paste("waterDALYslabboilingdiff",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
write.csv(waterDALYsgoodboilingdiff,file.path(currentresultspath,paste("waterDALYsgoodboilingdiff",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
write.csv(waterDALYsineffectiveboilingdiff,file.path(currentresultspath,paste("ineffectiveboilingdiff",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
write.csv(waterDALYsmoderateboilingdiff,file.path(currentresultspath,paste("waterDALYsmoderateboilingdiff",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
write.csv(waterDALYsworseboilingdiff,file.path(currentresultspath,paste("waterDALYsworseboilingdiff",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
write.csv(waterDALYsbadzeroboilingdiff,file.path(currentresultspath,paste("waterDALYsbadzeroboilingdiff",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
write.csv(waterDALYsnegativeboilingdiff,file.path(currentresultspath,paste("waterDALYsnegativeboilingdiff",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
print("Finish writing")

write.csv(waterDALYsnoboiling,file.path(currentresultspath,paste("waterDALYsnoboilingvalues",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
write.csv(waterDALYslabboiling,file.path(currentresultspath,paste("waterDALYslabboilingvalues",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
write.csv(waterDALYsgoodboiling,file.path(currentresultspath,paste("waterDALYsgoodboilingvalues",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
write.csv(waterDALYsineffectiveboiling,file.path(currentresultspath,paste("waterDALYsineffectiveboilingvalues",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
write.csv(waterDALYsmoderateboiling,file.path(currentresultspath,paste("waterDALYsmoderateboilingvalues",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
write.csv(waterDALYsworseboiling,file.path(currentresultspath,paste("waterDALYsworseboilingvalues",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
write.csv(waterDALYsbadzeroboiling,file.path(currentresultspath,paste("waterDALYsbadzeroboilingvalues",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
write.csv(waterDALYsnegativeboiling,file.path(currentresultspath,paste("waterDALYsnegativeboilingvalues",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)



##########################################################################

meannoboiling=round(mean(waterDALYsnoboiling),digits=2)
meanlabboiling=round(mean(waterDALYslabboiling),digits=2)
meangoodboiling=round(mean(waterDALYsgoodboiling),digits=2)
meanineffectiveboiling=round(mean(waterDALYsineffectiveboiling),digits=2)
meanmoderateboiling=round(mean(waterDALYsmoderateboiling),digits=2)
meanworseboiling=round(mean(waterDALYsworseboiling),digits=2)
meanbadzeroboiling=round(mean(waterDALYsbadzeroboiling),digits=2)
meannegativeboiling=round(mean(waterDALYsnegativeboiling),digits=2)

meanlabboilingdiff=round(mean(waterDALYslabboilingdiff),digits=2)
meangoodboilingdiff=round(mean(waterDALYsgoodboilingdiff),digits=2)
meanineffectiveboilingdiff=round(mean(waterDALYsineffectiveboilingdiff),digits=2)
meanmoderateboilingdiff=round(mean(waterDALYsmoderateboilingdiff),digits=2)
meanworseboilingdiff=round(mean(waterDALYsworseboilingdiff),digits=2)
meanbadzeroboilingdiff=round(mean(waterDALYsbadzeroboilingdiff),digits=2)
meannegativeboilingdiff=round(mean(waterDALYsnegativeboilingdiff),digits=2)

print("finish taking averages")
sdlabboiling=round(sd(waterDALYslabboiling),digits=2)
sdgoodboiling=round(sd(waterDALYsgoodboiling),digits=2)
sdineffectiveboiling=round(sd(waterDALYsineffectiveboiling),digits=2)
sdmoderateboiling=round(sd(waterDALYsmoderateboiling),digits=2)
sdworseboiling=round(sd(waterDALYsworseboiling),digits=2)
sdbadzeroboiling=round(sd(waterDALYsbadzeroboiling),digits=2)
sdnegativeboiling=round(sd(waterDALYsnegativeboiling),digits=2)
sdnoboiling=round(sd(waterDALYsnoboiling),digits=2)

sdlabboilingdiff=round(sd(waterDALYslabboilingdiff),digits=2)
sdgoodboilingdiff=round(sd(waterDALYsgoodboilingdiff),digits=2)
sdineffectiveboilingdiff=round(sd(waterDALYsineffectiveboilingdiff),digits=2)
sdmoderateboilingdiff=round(sd(waterDALYsmoderateboilingdiff),digits=2)
sdworseboilingdiff=round(sd(waterDALYsworseboilingdiff),digits=2)
sdbadzeroboilingdiff=round(sd(waterDALYsbadzeroboilingdiff),digits=2)
sdnegativeboilingdiff=round(sd(waterDALYsnegativeboilingdiff),digits=2)
sdnoboilingdiff=round(sd(waterDALYsnoboilingdiff),digits=2)

print("finish taking standard deviations")



print("start log reduction sequence")
for (a in logreductionseq)
  {
waterDALYplotavg[a]=mean(waterDALYlogplot[,a])
waterRotaplotavg[a]=mean(waterRotaDALYsresults[,a])
waterCampplotavg[a]=mean(waterCampDALYsresults[,a])
waterCryptoplotavg[a]=mean(waterCryptoDALYsresults[,a])

}
print("finish log reduction sequence")



print("write water summary")

watersummary<-cbind(meannoboiling,meanlabboiling,meangoodboiling,meanineffectiveboiling,
                        meanmoderateboiling,meanworseboiling,meanbadzeroboiling,meannegativeboiling)

watersummarydiff<-cbind(meanlabboilingdiff,meangoodboilingdiff,meanineffectiveboilingdiff,
                    meanmoderateboilingdiff,meanworseboilingdiff,meanbadzeroboilingdiff,meannegativeboilingdiff)


write.csv(watersummary,file.path(currentresultspath,paste("waterDALYsdata",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
write.csv(watersummarydiff,file.path(currentresultspath,paste("waterDALYsdiffdata",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)

watersummarysd=cbind(sdnoboiling,sdlabboiling,sdgoodboiling,sdineffectiveboiling,
                       sdmoderateboiling,sdworseboiling,sdbadzeroboiling,sdnegativeboiling)

watersummarydiffsd=cbind(sdlabboilingdiff,sdgoodboilingdiff,sdineffectiveboilingdiff,
                     sdmoderateboilingdiff,sdworseboilingdiff,sdbadzeroboilingdiff,sdnegativeboilingdiff)

write.csv(watersummarysd,file.path(currentresultspath,paste("waterDALYsdatasd",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
write.csv(watersummarydiffsd,file.path(currentresultspath,paste("waterDALYsdatadiffsd",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)

##updated code below

watersummary<-cbind(ecolilevel,meannoboiling,meanlabboiling,meangoodboiling,meanineffectiveboiling,
                    meanmoderateboiling,meanworseboiling,meanbadzeroboiling,meannegativeboiling)
write.csv(watersummary,file.path(currentresultspath,paste("waterDALYsdata",country,personofinterest,".csv",sep="")),row.names=FALSE)

watersummarysd=cbind(ecolilevel,sdnoboiling,sdlabboiling,sdgoodboiling,sdineffectiveboiling,
                     sdmoderateboiling,sdworseboiling,sdbadzeroboiling,sdnegativeboiling)

write.csv(watersummarysd,file.path(currentresultspath,paste("waterDALYsdatasd",country,personofinterest,".csv",sep="")),row.names=FALSE)
#####################################


###############################################################################################
print("more writing")
write.csv(ecolilogreductionvaluelist,file.path(currentresultspath,paste("logreductionsequenceboiling",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
print("write ecoli log reduction")
write.csv(waterDALYplotavg,file.path(currentresultspath,paste("waterDALYplotavg_boiling",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
logplotdata <- data.frame(
  ecolilogreductionvaluelist,waterDALYplotavg
)
write.csv(logplotdata,file.path(currentresultspath,paste("waterDALYplotavg_boiling_logremoval",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
print("write water DALYs plot")
#
#write.csv(logreductionseq,waterDALYplotavg,file.path(currentresultspath,paste("logreductionsequenceboiling",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
print("write check")
#temperarily comment out below******
#write.csv(logreductionseq,waterRotaplotavg,file.path(currentresultspath,paste("logreductionsequenceboiling_Rota",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
print("write water rota plot avg")
#*#write.csv(logreductionseq,waterCampplotavg,file.path(currentresultspath,paste("logreductionsequenceboiling_Camp",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
print("write water camp plot avg")
#*#write.csv(logreductionseq,waterCryptoplotavg,file.path(currentresultspath,paste("logreductionsequenceboiling_crypto",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
print("finish writing")
closeAllConnections()

