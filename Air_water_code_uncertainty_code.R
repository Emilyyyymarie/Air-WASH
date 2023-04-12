

# E. coli only
numberlength=length(numberseq) #number of random selections

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
source("infectionfunctions.R")
source("IndoorAirPollution.R")
source("RelativeRisk.R")


###

#variables to vary

uncertaintyfunction <- function(exposureinputunc,backgroundinputunc,ecoliinputunc,ecolilogreductioninputunc,drinkingwateronepersoninputunc,airexchangeinputunc,volumeinputunc,heatvaluewoodinputunc,emissionfactorinputunc,stovepowerinputunc,efficiencyinputunc,energyinputunc,ageatdeathinputunc,cryptokvalueunc,cryptoratiovalueunc,rotaalphavalueunc,rotaNfiftyvalueunc,rotaratiovalueunc,campalphavalueunc,campNfiftyvalueunc,campratiovalueunc)
{
dailyenergy=energyinputunc 
womenexposureinput=exposureinputunc
menexposureinput=exposureinputunc
childrenexposureinput=exposureinputunc
backgroundconcentration=backgroundinputunc
ecolilogreductionvaluelist=ecolilogreductioninputunc
waterqualityseq=ecoliinputunc
drinkingwateroneperson=drinkingwateronepersoninputunc 
airexchange=airexchangeinputunc
volume=volumeinputunc
heatvaluewood=heatvaluewoodinputunc
emissionfactorgkgsmokeywood=emissionfactorinputunc
stovepowerMJhourwood=stovepowerinputunc
efficiencywood=efficiencyinputunc
ageatdeath=ageatdeathinputunc
cryptokvalue=cryptokvalueunc
cryptoratiovalue=cryptoratiovalueunc
rotaalphavalue=rotaalphavalueunc
rotaNfiftyvalue=rotaNfiftyvalueunc
rotaratiovalue=rotaratiovalueunc
campalphavalue=campalphavalueunc
campNfiftyvalue=campNfiftyvalueunc
campratiovalue=campratiovalueunc
#DO EMISSION RATE INSTEAD

#ageatdeathinputunc,cryptokvalueunc,cryptoratiovalueunc,rotaalphavalueunc,rotaNfiftyvalueunc,rotaratiovalueunc,campalphavalueunc,campNfiftyvalueunc,campratiovalueunc
#PM2.5concentration <- function(heatvalueinput,emissionfactorgkginput,stovepowerMJhourinput,efficiencyinput,airexchangeinput,volumeinput,drinkingwateronepersoninput,energyinput) #g/kg for emissionfactor
Smokeyconcentration=PM2.5concentration(heatvaluewood,emissionfactorgkgsmokeywood,stovepowerMJhourwood,efficiencywood,airexchange,volume,drinkingwateroneperson,dailyenergy,backgroundconcentration)  
print("heat value wood")
print(heatvaluewood)
print("emission factor")
print(emissionfactorgkgsmokeywood)

print("stove power")
print(stovepowerMJhourwood)

print("efficiency")
print(efficiencywood)

print("air exchange")
print(airexchange)

print("volume")
print(volume)

print("drinkingwateroneperson")
print(drinkingwateroneperson)

print("dailyenergy")
print(dailyenergy)

print("backgroundconcentration")
print(backgroundconcentration)

Smokeycooking= Smokeyconcentration[1]
Smokeywaterheating=Smokeyconcentration[2]
Smokeywatercooking=Smokeyconcentration[3]
Smokeystovenumber=Smokeyconcentration[4]
print("Smokeyconcentration")
print(Smokeyconcentration)
print("Smokeycooking")
print(Smokeycooking)
cookingsmokeyDALYs=totalairDALYs(Smokeycooking,inputpopulation,womenexposureinput,menexposureinput,childrenexposureinput,backgroundconcentration)
waterheatingsmokeyDALYs=totalairDALYs(Smokeywaterheating,inputpopulation,womenexposureinput,menexposureinput,childrenexposureinput,backgroundconcentration)
watercookingsmokeyDALYs=totalairDALYs(Smokeywatercooking,inputpopulation,womenexposureinput,menexposureinput,childrenexposureinput,backgroundconcentration)
deltaaircooking=watercookingsmokeyDALYs-cookingsmokeyDALYs
deltaairwaterheatingonly=waterheatingsmokeyDALYs-backgroundconcentration
#use this
#cookingminimotoDALYs[i]=totalairDALYs(Minimotocooking[i],inputpopulation,womenexposureinput,menexposureinput,childrenexposureinput) 
waterDALYresultsbaseline=waterDALYs(drinkingwateroneperson,waterqualityseq,0,inputpopulation,ageatdeath,cryptokvalue,cryptoratiovalue,rotaalphavalue,rotaNfiftyvalue,rotaratiovalue,campalphavalue,campNfiftyvalue,campratiovalue)
waterDALYresults=waterDALYs(drinkingwateroneperson,waterqualityseq,ecolilogreductionvaluelist,inputpopulation,ageatdeath,cryptokvalue,cryptoratiovalue,rotaalphavalue,rotaNfiftyvalue,rotaratiovalue,campalphavalue,campNfiftyvalue,campratiovalue)
deltawater=waterDALYresults-waterDALYresultsbaseline

##waterDALYresults[i,a,w]=waterDALYs(drinkingwateroneperson[i],waterqualityseq[w],ecolilogreductionvaluelist[a],inputpopulation)


#waterRotaDALYsresults=waterrotaDALYs(drinkingwateroneperson,waterqualityseq,ecolilogreductionvaluelist)
#waterCampDALYsresults=watercampDALYs(drinkingwateroneperson,waterqualityseq,ecolilogreductionvaluelist)
#waterCryptoDALYsresults=watercryptoDALYs(drinkingwateroneperson[i],waterqualityseq[w],ecolilogreductionvaluelist)
#waterecoliDALYsresults=waterecoliDALYs(drinkingwateroneperson[i],waterqualityseq[w],ecolilogreductionvaluelist)

netdifference=deltaaircooking-deltawater
resultsequence=c(netdifference,deltawater,deltaaircooking,deltaairwaterheatingonly)
return(resultsequence)

}