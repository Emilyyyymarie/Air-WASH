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
ecolilogreductionvaluelist=seq(0,7.5,by=0.1)
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

## Air Pollution

# Wood
heatvaluewood[i]=sample(rtriangle(numberlength,13.5, 15.883,14.780),1) 

emissionfactorgkgsmokeywood[i]=sample(rlnorm(numberlength,lognormalmean(7.1,1.3),lognormalstdev(7.1,1.3)),1)
stovepowerMJhourwood = 7.05 
efficiencywood =0.148
Smokeyconcentration=PM2.5concentration(heatvaluewood[i],emissionfactorgkgsmokeywood[i],stovepowerMJhourwood,efficiencywood,airexchange,volume,drinkingwateroneperson[i],dailyenergyinput[i],backgroundconcentration)  


#Improved Wood
#still uses above value for heating value of wood
emissionfactorgkgimproved=3.6
stovepowerMJhourimproved = 4.02 
efficiencyimproved =0.20
Improvedconcentration=PM2.5concentration(heatvaluewood[i],emissionfactorgkgimproved,stovepowerMJhourimproved,efficiencyimproved,airexchange,volume,drinkingwateroneperson[i],dailyenergyinput[i],backgroundconcentration)  

#pellet
heatvaluepeanutpellet[i]=sample(rlnorm(1000,lognormalmean((16.1),(0.18)),lognormalstdev((16.1),(0.18))),1) 
emissionfactorgkgMinimoto=0.079
stovepowerMJhourMinimoto = 11
efficiencyMinimoto =0.379
Minimotoconcentration=PM2.5concentration(heatvaluepeanutpellet[i],emissionfactorgkgMinimoto,stovepowerMJhourMinimoto,efficiencyMinimoto,airexchange,volume,drinkingwateroneperson[i],dailyenergyinput[i],backgroundconcentration)  


#charcoal
heatvaluecharcoal=35.9 
emissionfactorgkgcharcoal=0.47#
stovepowerMJhourcharcoal = 21.8
efficiencycharcoalsingle=0.2330
charcoalconcentration=PM2.5concentration(heatvaluecharcoal,emissionfactorgkgcharcoal,stovepowerMJhourcharcoal,efficiencycharcoalsingle,airexchange,volume,drinkingwateroneperson[i],dailyenergyinput[i],backgroundconcentration)  

#LPG
heatvalueLPG=45.780 
emissionfactorgkgLPG[i]=sample(rlnorm(1000,lognormalmean((0.053),(0.04)),lognormalstdev((0.053),(0.04))),1)
stovepowerMJhourLPG = 5.504
efficiencyLPGsingle=sample(rlnorm(numberlength,lognormalmean(0.544,0.15),lognormalstdev(0.544,0.15)),1)#1# sample(rnorm(numberlength,0.544,0.15),1)#decimal percent #.40#.148 #+/- 1.8 for cookstoves #McCracken and Smith 1998
LPGconcentration=PM2.5concentration(heatvalueLPG,emissionfactorgkgLPG[i],stovepowerMJhourLPG,efficiencyLPGsingle,airexchange,volume,drinkingwateroneperson[i],dailyenergyinput[i],backgroundconcentration)  

#clean cooking, electric
cleancooking[i]=backgroundconcentration #sample(rtriangle(1000,7, 95,26),1)
cleanwaterheating[i]=backgroundconcentration#= 12sample(rtriangle(1000,7, 95,26),1)
cleanwatercooking[i]=backgroundconcentration#= 12sample(rtriangle(1000,7, 95,26),1)
cleanstovenumber[i]=1 #fix 

#print("Charcoal")
Charcoalcooking[i]= charcoalconcentration[1]
Charcoalwaterheating[i]=charcoalconcentration[2]
Charcoalwatercooking[i]=charcoalconcentration[3]
Charcoalstovenumber[i]=charcoalconcentration[4]

#print("LPG")
LPGcooking[i]= LPGconcentration[1]
LPGwaterheating[i]=LPGconcentration[2]
LPGwatercooking[i]=LPGconcentration[3]
LPGstovenumber[i]=LPGconcentration[4]

#print("Minimoto")
Minimotocooking[i]= Minimotoconcentration[1]
Minimotowaterheating[i]=Minimotoconcentration[2]
Minimotowatercooking[i]=Minimotoconcentration[3]
Minimotostovenumber[i]=Minimotoconcentration[4]

#print("Smokey")
Smokeycooking[i]= Smokeyconcentration[1]
Smokeywaterheating[i]=Smokeyconcentration[2]
Smokeywatercooking[i]=Smokeyconcentration[3]
Smokeystovenumber[i]=Smokeyconcentration[4]

#print("Improved")
Improvedcooking[i]= Improvedconcentration[1]
Improvedwaterheating[i]=Improvedconcentration[2]
Improvedwatercooking[i]=Improvedconcentration[3]
Improvedstovenumber[i]=Improvedconcentration[4]

#print("calculate DALYs")
cookingminimotoDALYs[i]=totalairDALYs(Minimotocooking[i],inputpopulation,womenexposureinput,menexposureinput,childrenexposureinput,backgroundconcentration) 
waterheatingminimotoDALYs[i]=totalairDALYs(Minimotowaterheating[i],inputpopulation,womenexposureinput,menexposureinput,childrenexposureinput,backgroundconcentration) 
watercookingminimotoDALYs[i]=totalairDALYs(Minimotowatercooking[i],inputpopulation,womenexposureinput,menexposureinput,childrenexposureinput,backgroundconcentration) 
deltacookheatminimotoDALYs[i]=watercookingminimotoDALYs[i]-cookingminimotoDALYs[i]
deltaheatminimotoDALYs[i]=waterheatingminimotoDALYs[i]-cookingminimotoDALYs[i] #because clean is the same as ambient


cookingCleanDALYs[i]=totalairDALYs(cleancooking[i],inputpopulation,womenexposureinput,menexposureinput,childrenexposureinput,backgroundconcentration) 
waterheatingCleanDALYs[i]=totalairDALYs(cleanwaterheating[i],inputpopulation,womenexposureinput,menexposureinput,childrenexposureinput,backgroundconcentration) 
watercookingCleanDALYs[i]=totalairDALYs(cleanwatercooking[i],inputpopulation,womenexposureinput,menexposureinput,childrenexposureinput,backgroundconcentration) 
deltacookheatCleanDALYs[i]=watercookingCleanDALYs[i]-cookingCleanDALYs[i]
deltaheatCleanDALYs[i]=waterheatingCleanDALYs[i]-cookingCleanDALYs[i] #because clean is the same as ambient
#deltaheatCleanDALYs[i]=waterheatingCleanDALYs[i]-cookingCleanDALYs[i]

cookingsmokeyDALYs[i]=totalairDALYs(Smokeycooking[i],inputpopulation,womenexposureinput,menexposureinput,childrenexposureinput,backgroundconcentration) 
waterheatingsmokeyDALYs[i]=totalairDALYs(Smokeywaterheating[i],inputpopulation,womenexposureinput,menexposureinput,childrenexposureinput,backgroundconcentration) 
watercookingsmokeyDALYs[i]=totalairDALYs(Smokeywatercooking[i],inputpopulation,womenexposureinput,menexposureinput,childrenexposureinput,backgroundconcentration) 
deltacookheatsmokeyDALYs[i]=watercookingsmokeyDALYs[i]-cookingsmokeyDALYs[i]
deltaheatsmokeyDALYs[i]=waterheatingsmokeyDALYs[i]-cookingsmokeyDALYs[i] #because clean is the same as ambient

#Improved DALYs

cookingimprovedDALYs[i]=totalairDALYs(Improvedcooking[i],inputpopulation,womenexposureinput,menexposureinput,childrenexposureinput,backgroundconcentration) 
waterheatingimprovedDALYs[i]=totalairDALYs(Improvedwaterheating[i],inputpopulation,womenexposureinput,menexposureinput,childrenexposureinput,backgroundconcentration) 
watercookingimprovedDALYs[i]=totalairDALYs(Improvedwatercooking[i],inputpopulation,womenexposureinput,menexposureinput,childrenexposureinput,backgroundconcentration)
deltacookheatimprovedDALYs[i]=watercookingimprovedDALYs[i]-cookingimprovedDALYs[i]
deltaheatimprovedDALYs[i]=waterheatingimprovedDALYs[i]-cookingimprovedDALYs[i] #because clean is the same as ambient

##LPG DALYs

cookingLPGDALYs[i]=totalairDALYs(LPGcooking[i],inputpopulation,womenexposureinput,menexposureinput,childrenexposureinput,backgroundconcentration) 
waterheatingLPGDALYs[i]=totalairDALYs(LPGwaterheating[i],inputpopulation,womenexposureinput,menexposureinput,childrenexposureinput,backgroundconcentration) 
watercookingLPGDALYs[i]=totalairDALYs(LPGwatercooking[i],inputpopulation,womenexposureinput,menexposureinput,childrenexposureinput,backgroundconcentration)
deltacookheatLPGDALYs[i]=watercookingLPGDALYs[i]-cookingLPGDALYs[i]
deltaheatLPGDALYs[i]=waterheatingLPGDALYs[i]-cookingLPGDALYs[i] #because clean is the same as ambient

##
##Charcoal DALYs

cookingcharcoalDALYs[i]=totalairDALYs(Charcoalcooking[i],inputpopulation,womenexposureinput,menexposureinput,childrenexposureinput,backgroundconcentration) 
waterheatingcharcoalDALYs[i]=totalairDALYs(Charcoalwaterheating[i],inputpopulation,womenexposureinput,menexposureinput,childrenexposureinput,backgroundconcentration) 
watercookingcharcoalDALYs[i]=totalairDALYs(Charcoalwatercooking[i],inputpopulation,womenexposureinput,menexposureinput,childrenexposureinput,backgroundconcentration)
deltacookheatcharcoalDALYs[i]=watercookingcharcoalDALYs[i]-cookingcharcoalDALYs[i]
deltaheatcharcoalDALYs[i]=waterheatingcharcoalDALYs[i]-cookingCleanDALYs[i] #because clean is the same as ambient

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

#charcoal
write.csv(cookingcharcoalDALYs,file.path(currentresultspath,paste("cookingcharcoalDALYs",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
write.csv(waterheatingcharcoalDALYs,file.path(currentresultspath,paste("waterheatingcharcoalDALYs",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
write.csv(watercookingcharcoalDALYs,file.path(currentresultspath,paste("watercookingcharcoalDALYs",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
write.csv(deltacookheatcharcoalDALYs,file.path(currentresultspath,paste("deltacookheatcharcoalDALYs",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
write.csv(deltaheatcharcoalDALYs,file.path(currentresultspath,paste("deltaheatcharcoalDALYs",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)

#improved
write.csv(cookingimprovedDALYs,file.path(currentresultspath,paste("cookingimprovedDALYs",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
write.csv(waterheatingimprovedDALYs,file.path(currentresultspath,paste("waterheatingimprovedDALYs",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
write.csv(watercookingimprovedDALYs,file.path(currentresultspath,paste("watercookingimprovedDALYs",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
write.csv(deltacookheatimprovedDALYs,file.path(currentresultspath,paste("deltacookheatimprovedDALYs",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
write.csv(deltaheatimprovedDALYs,file.path(currentresultspath,paste("deltaheatimprovedDALYs",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)

#LPG
write.csv(cookingLPGDALYs,file.path(currentresultspath,paste("cookingLPGDALYs",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
write.csv(waterheatingLPGDALYs,file.path(currentresultspath,paste("waterheatingLPGDALYs",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
write.csv(watercookingLPGDALYs,file.path(currentresultspath,paste("watercookingLPGDALYs",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
write.csv(deltacookheatLPGDALYs,file.path(currentresultspath,paste("deltacookheatLPGDALYs",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
write.csv(deltaheatLPGDALYs,file.path(currentresultspath,paste("deltaheatLPGDALYs",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)

#Clean
write.csv(cookingCleanDALYs,file.path(currentresultspath,paste("cookingCleanDALYs",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
write.csv(waterheatingCleanDALYs,file.path(currentresultspath,paste("waterheatingCleanDALYs",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
write.csv(watercookingCleanDALYs,file.path(currentresultspath,paste("watercookingCleanDALYs",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
write.csv(deltacookheatCleanDALYs,file.path(currentresultspath,paste("deltacookheatCleanDALYs",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
write.csv(deltaheatCleanDALYs,file.path(currentresultspath,paste("deltaheatCleanDALYs",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)

#Minimoto
write.csv(cookingminimotoDALYs,file.path(currentresultspath,paste("cookingminimotoDALYs",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
write.csv(waterheatingminimotoDALYs,file.path(currentresultspath,paste("waterheatingminimotoDALYs",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
write.csv(watercookingminimotoDALYs,file.path(currentresultspath,paste("watercookingminimotoDALYs",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
write.csv(deltacookheatminimotoDALYs,file.path(currentresultspath,paste("deltacookheatminimotoDALYs",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
write.csv(deltaheatminimotoDALYs,file.path(currentresultspath,paste("deltaheatminimotoDALYs",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)

print("Finish writing")



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

avgminimotocooking=mean(Minimotocooking)
avgminimotowatercooking=mean(Minimotowatercooking)
avgminimotowaterheating =mean(Minimotowaterheating)
avgminimotostovenumber=mean(Minimotostovenumber)
avgminimotoheatcookdelta=mean(deltacookheatminimotoDALYs)
avgminimotoheatdelta=mean(deltaheatminimotoDALYs)

avgimprovedcooking=mean(Improvedcooking)
avgimprovedwatercooking=mean(Improvedwatercooking)
avgimprovedwaterheating=mean(Improvedwaterheating)
avgimprovedstovenumber=mean(Improvedstovenumber)
avgimprovedheatcookdelta=mean(deltacookheatimprovedDALYs)
avgimprovedheatdelta=mean(deltaheatimprovedDALYs)

avgsmokeycooking=mean(Smokeycooking)
avgsmokeywatercooking=mean(Smokeywatercooking)
avgsmokeywaterheating=mean(Smokeywaterheating)
avgsmokeystovenumber=mean(Smokeystovenumber)
avgsmokeyheatcookdelta=mean(deltacookheatsmokeyDALYs)
avgsmokeyheatdelta=mean(deltaheatsmokeyDALYs)

avgLPGcooking=mean(LPGcooking)
avgLPGwatercooking=mean(LPGwatercooking)
avgLPGwaterheating=mean(LPGwaterheating)
avgLPGstovenumber=mean(LPGstovenumber)
avgLPGheatcookdelta=mean(deltacookheatLPGDALYs)
avgLPGheatdelta=mean(deltaheatLPGDALYs)

avgCharcoalcooking=mean(Charcoalcooking)
avgCharcoalwatercooking=mean(Charcoalwatercooking)
avgCharcoalwaterheating=mean(Charcoalwaterheating)
avgCharcoalstovenumber=mean(Charcoalstovenumber)
avgCharcoalheatcookdelta=mean(deltacookheatcharcoalDALYs)
avgCharcoalheatdelta=mean(deltaheatcharcoalDALYs)

avgcleancooking=mean(cleancooking)
avgcleanwatercooking=mean(cleanwatercooking)
avgcleanwaterheating=mean(cleanwaterheating)
avgcleanstovenumber=mean(cleanstovenumber)
avgcleanheatcookdelta=mean(deltacookheatCleanDALYs)
avgCleanheatdelta=mean(deltaheatCleanDALYs)

sdminimotocooking=sd(Minimotocooking)
sdminimotowatercooking=sd(Minimotowatercooking)
sdminimotowaterheating =sd(Minimotowaterheating)
sdminimotostovenumber=sd(Minimotostovenumber)
sdminimotoheatcookdelta=sd(deltacookheatminimotoDALYs)
sdminimotoheatdelta=sd(deltaheatminimotoDALYs)

sdimprovedcooking=sd(Improvedcooking)
sdimprovedwatercooking=sd(Improvedwatercooking)
sdimprovedwaterheating=sd(Improvedwaterheating)
sdimprovedstovenumber=sd(Improvedstovenumber)
sdimprovedheatcookdelta=sd(deltacookheatimprovedDALYs)
sdimprovedheatdelta=sd(deltaheatimprovedDALYs)

sdsmokeycooking=sd(Smokeycooking)
sdsmokeywatercooking=sd(Smokeywatercooking)
sdsmokeywaterheating=sd(Smokeywaterheating)
sdsmokeystovenumber=sd(Smokeystovenumber)
sdsmokeyheatcookdelta=sd(deltacookheatsmokeyDALYs)
sdsmokeyheatdelta=sd(deltaheatsmokeyDALYs)

sdLPGcooking=sd(LPGcooking)
sdLPGwatercooking=sd(LPGwatercooking)
sdLPGwaterheating=sd(LPGwaterheating)
sdLPGstovenumber=sd(LPGstovenumber)
sdLPGheatcookdelta=sd(deltacookheatLPGDALYs)
sdLPGheatdelta=sd(deltaheatLPGDALYs)

sdCharcoalcooking=sd(Charcoalcooking)
sdCharcoalwatercooking=sd(Charcoalwatercooking)
sdCharcoalwaterheating=sd(Charcoalwaterheating)
sdCharcoalstovenumber=sd(Charcoalstovenumber)

sdcleancooking=sd(cleancooking)
sdcleanwatercooking=sd(cleanwatercooking)
sdcleanwaterheating=sd(cleanwaterheating)
sdcleanstovenumber=sd(cleanstovenumber)

print("start log reduction sequence")
for (a in logreductionseq)
  {
waterDALYplotavg[a]=mean(waterDALYlogplot[,a])
waterRotaplotavg[a]=mean(waterRotaDALYsresults[,a])
waterCampplotavg[a]=mean(waterCampDALYsresults[,a])
waterCryptoplotavg[a]=mean(waterCryptoDALYsresults[,a])

}
print("finish log reduction sequence")

AirPMaveragedataframe=c()
AirPMaveragedataframe <- cbind(avgminimotocooking,avgminimotowaterheating,avgminimotowatercooking,avgsmokeycooking,avgsmokeywaterheating,avgsmokeywatercooking,avgimprovedcooking,avgimprovedwaterheating,avgimprovedwatercooking,avgLPGcooking,avgLPGwaterheating,avgLPGwatercooking,avgCharcoalcooking,avgCharcoalwaterheating,avgCharcoalwatercooking,avgcleancooking,avgcleanwaterheating,avgcleanwatercooking)
colnames(AirPMaveragedataframe) <- c("avgminimotocooking","avgminimotowaterheating","avgminimotowatercooking","avgsmokeycooking","avgsmokeywaterheating","avgsmokeywatercooking","avgimprovedcooking","avgimprovedwaterheating","avgimprovedwatercooking","avgLPGcooking","avgLPGwaterheating","avgLPGwatercooking","avgcharcoalcooking","avgcharcoalwaterheating","avgcharcoalwatercooking","avgCleancooking","avgCleanwaterheating","avgCleanwatercooking")
write.csv(AirPMaveragedataframe,file.path(currentresultspath,paste("airPMaveragedata",country,personofinterest,".csv",sep="")),row.names=FALSE)

print("writing 1")
Stovenumberdataframe=c()
Stovenumberdataframe <-cbind(avgminimotostovenumber,avgsmokeystovenumber,avgimprovedstovenumber,avgLPGstovenumber,avgCharcoalstovenumber,avgcleanstovenumber)
colnames(Stovenumberdataframe)<-cbind("minimotostovenumber","smokeystovenumber","improvedstovenumber","LPGstovenumber","Charcoalstovenumber","cleanstovenumber")
write.csv(Stovenumberdataframe,file.path(currentresultspath,paste("stovenumberaveragedata",country,personofinterest,".csv",sep="")),row.names=FALSE)

print("writing 2")
Stovesddataframe=c()
Stovesddataframe <-cbind(sdminimotostovenumber,sdsmokeystovenumber,sdimprovedstovenumber,sdLPGstovenumber,sdCharcoalstovenumber,sdcleanstovenumber)
colnames(Stovesddataframe)<-cbind("minimotostovesd","smokeystovesd","improvedstovesd","LPGstovesd","Charcoalstovesd","cleanstovesd")
write.csv(Stovesddataframe,file.path(currentresultspath,paste("stovenumbersddata",country,personofinterest,".csv",sep="")),row.names=FALSE)

print("writing 3")
AirPMsddataframe=c()
AirPMsddataframe<- cbind(sdminimotocooking,sdminimotowaterheating,sdminimotowatercooking,sdsmokeycooking,sdsmokeywaterheating,sdsmokeywatercooking,sdimprovedcooking,sdimprovedwaterheating,sdimprovedwatercooking,sdLPGcooking,sdLPGwaterheating,sdLPGwatercooking,sdCharcoalcooking,sdCharcoalwaterheating,sdCharcoalwatercooking,sdcleancooking,sdcleanwaterheating,sdcleanwatercooking)
colnames(AirPMsddataframe) <- cbind("sdminimotocookingDALYs","sdminimotowaterheating","sdminimotowatercooking","sdsmokeycooking","sdsmokeywaterheating","sdsmokeywatercooking","sdimprovedcooking","sdimprovedwaterheating","sdimprovedwatercooking","sdLPGcooking","sdLPGwaterheating","sdLPGwatercooking","sdcharcoalcooking","sdcharcoalwaterheating","sdcharcoalwatercooking","sdCleancooking","sdCleanwaterheating","sdCleanwatercooking")
write.csv(AirPMsddataframe,file.path(currentresultspath,paste("airPMsddata",country,personofinterest,".csv",sep="")),row.names=FALSE)

# taking averages for air #DALYs
print("air average DALYs")
meanminimotocookingDALYs=round(mean(cookingminimotoDALYs),digits=0)
meanminimotowaterheatingDALYs=round(mean(waterheatingminimotoDALYs),digits=0)
meanminimotowatercookingDALYs=round(mean(watercookingminimotoDALYs),digits=0)
meanminimotowaterheatingDALYsdiff=round(mean(deltaheatminimotoDALYs),digits=0)
meanminimotowatercookingDALYsdiff=round(mean(deltacookheatminimotoDALYs),digits=0)

meansmokeycookingDALYs=round(mean(cookingsmokeyDALYs),digits=0)
meansmokeywaterheatingDALYs=round(mean(waterheatingsmokeyDALYs),digits=0)
meansmokeywatercookingDALYs=round(mean(watercookingsmokeyDALYs),digits=0)
meansmokeywaterheatingDALYsdiff=round(mean(deltaheatsmokeyDALYs),digits=0)
meansmokeywatercookingDALYsdiff=round(mean(deltacookheatsmokeyDALYs),digits=0)

meanimprovedcookingDALYs=round(mean(cookingimprovedDALYs),digits=0)
meanimprovedwaterheatingDALYs=round(mean(waterheatingimprovedDALYs),digits=0)
meanimprovedwatercookingDALYs=round(mean(watercookingimprovedDALYs),digits=0)
meanimprovedwaterheatingDALYsdiff=round(mean(deltaheatimprovedDALYs),digits=0)
meanimprovedwatercookingDALYsdiff=round(mean(deltacookheatimprovedDALYs),digits=0)

meanLPGcookingDALYs=round(mean(cookingLPGDALYs),digits=0)
meanLPGwaterheatingDALYs=round(mean(waterheatingLPGDALYs),digits=0)
meanLPGwatercookingDALYs=round(mean(watercookingLPGDALYs),digits=0)
meanLPGwaterheatingDALYsdiff=round(mean(deltaheatLPGDALYs),digits=0)
meanLPGwatercookingDALYsdiff=round(mean(deltacookheatLPGDALYs),digits=0)

meancharcoalcookingDALYs=round(mean(cookingcharcoalDALYs),digits=0)
meancharcoalwaterheatingDALYs=round(mean(waterheatingcharcoalDALYs),digits=0)
meancharcoalwatercookingDALYs=round(mean(watercookingcharcoalDALYs),digits=0)
meancharcoalwaterheatingDALYsdiff=round(mean(deltaheatcharcoalDALYs),digits=0)
meancharcoalwatercookingDALYsdiff=round(mean(deltacookheatcharcoalDALYs),digits=0)

meanCleancookingDALYs=round(mean(cookingCleanDALYs),digits=0)
meanCleanwaterheatingDALYs=round(mean(waterheatingCleanDALYs),digits=0)
meanCleanwatercookingDALYs=round(mean(watercookingCleanDALYs),digits=0)
meanCleanwaterheatingDALYsdiff=round(mean(deltaheatCleanDALYs),digits=0)
meanCleanwatercookingDALYsdiff=round(mean(deltacookheatCleanDALYs),digits=0)


##########
#standard deviations
print("standard deviations air")
sdminimotocookingDALYs=round(sd(cookingminimotoDALYs),digits=2)
sdminimotowaterheatingDALYs=round(sd(waterheatingminimotoDALYs),digits=2)
sdminimotowatercookingDALYs=round(sd(watercookingminimotoDALYs),digits=2)
sdminimotowaterheatingDALYsdiff=round(sd(deltaheatminimotoDALYs),digits=2)
sdminimotowatercookingDALYsdiff=round(sd(deltacookheatminimotoDALYs),digits=2)

sdsmokeycookingDALYs=round(sd(cookingsmokeyDALYs),digits=2)
sdsmokeywaterheatingDALYs=round(sd(waterheatingsmokeyDALYs),digits=2)
sdsmokeywatercookingDALYs=round(sd(watercookingsmokeyDALYs),digits=2)
sdsmokeywaterheatingDALYsdiff=round(sd(deltaheatsmokeyDALYs),digits=2)
sdsmokeywatercookingDALYsdiff=round(sd(deltacookheatsmokeyDALYs),digits=2)

sdimprovedcookingDALYs=round(sd(cookingimprovedDALYs),digits=2)
sdimprovedwaterheatingDALYs=round(sd(waterheatingimprovedDALYs),digits=2)
sdimprovedwatercookingDALYs=round(sd(watercookingimprovedDALYs),digits=2)
sdimprovedwaterheatingDALYsdiff=round(sd(deltaheatimprovedDALYs),digits=2)
sdimprovedwatercookingDALYsdiff=round(sd(deltacookheatimprovedDALYs),digits=2)

sdLPGcookingDALYs=round(sd(cookingLPGDALYs),digits=2)
sdLPGwaterheatingDALYs=round(sd(waterheatingLPGDALYs),digits=2)
sdLPGwatercookingDALYs=round(sd(watercookingLPGDALYs),digits=2)
sdLPGwaterheatingDALYsdiff=round(sd(deltaheatLPGDALYs),digits=2)
sdLPGwatercookingDALYsdiff=round(sd(deltacookheatLPGDALYs),digits=2)


sdcharcoalcookingDALYs=round(sd(cookingcharcoalDALYs),digits=2)
sdcharcoalwaterheatingDALYs=round(sd(waterheatingcharcoalDALYs),digits=2)
sdcharcoalwatercookingDALYs=round(sd(watercookingcharcoalDALYs),digits=2)
sdcharcoalwaterheatingDALYsdiff=round(sd(deltaheatcharcoalDALYs),digits=2)
sdcharcoalwatercookingDALYsdiff=round(sd(deltacookheatcharcoalDALYs),digits=2)

sdCleancookingDALYs=round(sd(cookingCleanDALYs),digits=2)
sdCleanwaterheatingDALYs=round(sd(waterheatingCleanDALYs),digits=2)
sdCleanwatercookingDALYs=round(sd(watercookingCleanDALYs),digits=2)
sdCleanwaterheatingDALYsdiff=round(sd(deltaheatCleanDALYs),digits=2)
sdCleanwatercookingDALYsdiff=round(sd(deltacookheatCleanDALYs),digits=2)

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

print("PM summary")
PMsummary=cbind(meanminimotocookingDALYs,meanminimotowaterheatingDALYs,
                    meanminimotowatercookingDALYs,meansmokeycookingDALYs,meansmokeywaterheatingDALYs,
                    meansmokeywatercookingDALYs,meanimprovedcookingDALYs,meanimprovedwaterheatingDALYs,
                    meanimprovedwatercookingDALYs,meancharcoalcookingDALYs,meancharcoalwaterheatingDALYs,
                    meancharcoalwatercookingDALYs,meanLPGcookingDALYs,meanLPGwaterheatingDALYs,
                    meanLPGwatercookingDALYs,meanCleancookingDALYs,meanCleanwaterheatingDALYs,
                    meanCleanwatercookingDALYs)


write.csv(PMsummary,file.path(currentresultspath,paste("PMsummaryDALYs",country,personofinterest,".csv",sep="")),row.names=FALSE)

PMsummarysd=cbind(sdminimotocookingDALYs,sdminimotowaterheatingDALYs,
                    sdminimotowatercookingDALYs,sdsmokeycookingDALYs,sdsmokeywaterheatingDALYs,
                    sdsmokeywatercookingDALYs,sdimprovedcookingDALYs,sdimprovedwaterheatingDALYs,
                    sdimprovedwatercookingDALYs,sdcharcoalcookingDALYs,sdcharcoalwaterheatingDALYs,
                    sdcharcoalwatercookingDALYs,sdLPGcookingDALYs,sdLPGwaterheatingDALYs,
                    sdLPGwatercookingDALYs,sdCleancookingDALYs,sdCleanwaterheatingDALYs,
                    sdCleanwatercookingDALYs)


write.csv(PMsummarysd,file.path(currentresultspath,paste("PMsummaryDALYssd",country,personofinterest,".csv",sep="")),row.names=FALSE)

###########################################################################################3
#PM  DALYs diff

PMsummarydiff=cbind(meanminimotowaterheatingDALYsdiff,
                meanminimotowatercookingDALYsdiff,meansmokeywaterheatingDALYsdiff,
                meansmokeywatercookingDALYsdiff,meanimprovedwaterheatingDALYsdiff,
                meanimprovedwatercookingDALYsdiff,meancharcoalwaterheatingDALYsdiff,
                meancharcoalwatercookingDALYsdiff,meanLPGwaterheatingDALYsdiff,
                meanLPGwatercookingDALYsdiff,meanCleanwaterheatingDALYsdiff,
                meanCleanwatercookingDALYsdiff)


write.csv(PMsummarydiff,file.path(currentresultspath,paste("PMsummaryDALYsdiff",country,personofinterest,".csv",sep="")),row.names=FALSE)

PMsummarydiffsd=cbind(sdminimotowaterheatingDALYsdiff,
                  sdminimotowatercookingDALYsdiff,sdsmokeywaterheatingDALYsdiff,
                  sdsmokeywatercookingDALYsdiff,sdimprovedwaterheatingDALYsdiff,
                  sdimprovedwatercookingDALYsdiff,sdcharcoalwaterheatingDALYsdiff,
                  sdcharcoalwatercookingDALYsdiff,sdLPGwaterheatingDALYsdiff,
                  sdLPGwatercookingDALYsdiff,sdCleanwaterheatingDALYsdiff,
                  sdCleanwatercookingDALYsdiff)


write.csv(PMsummarydiffsd,file.path(currentresultspath,paste("PMsummaryDALYssddiff",country,personofinterest,".csv",sep="")),row.names=FALSE)


###############################################################################################
print("more writing")
write.csv(ecolilogreductionvaluelist,file.path(currentresultspath,paste("logreductionsequenceboiling",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
print("write ecoli log reduction")
write.csv(waterDALYplotavg,file.path(currentresultspath,paste("waterDALYplotavg_boiling",country,personofinterest,waterqualitylevel,".csv",sep="")),row.names=FALSE)
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

