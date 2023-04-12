number=length(numberseq) #number of random selections

#set variables


countrydata<-read.csv(paste(currentcountrypath,"/",country,"_households",HAPITCHECK,".csv",sep=""),header=TRUE) 
averagehousehold =countrydata$ï..averagehousehold
numberchildrenunder5perHH=countrydata$childrenunder5perhh
numberadultsperHH=countrydata$adultsperhh
percentsolidfueluse=countrydata$dirtyfueluse #might not work
households=inputpopulation/averagehousehold
lifeexpectancywomen = countrydata$lifeexpectancywomen
lifeexpectancyman = countrydata$lifeexpectancymen
pplperhousehold=averagehousehold
countrypopulation=countrydata$countrypopulation #2019 from GB
cookperhousehold=countrydata$cookperhh
childperhousehold=countrydata$childperhh
noncookperhousehold=countrydata$noncookperhh
adultperhousehold=cookperhousehold+noncookperhousehold
under5population=countrydata$under5population



source("Air_water_code_uncertainty_code.R")

exposureunc=c(0.33,0.35,0.74)


backgroundunc=c(30.0,96.3,236.5)#https://www.mdpi.com/1660-4601/15/12/2653


#ecolilevelunc=c(1,10,1000)
#ecolilevelunc=c(0,10,5*10)
#ecolilevelunc=c(0,10,5*10)


#https://pubs.acs.org/doi/pdf/10.1021/acs.est.7b01014
ecolileveldist=rlnorm(numberlength,lognormalmean((0.17),(1.57)),lognormalstdev((0.17),(1.57)))
# quantile(data$V1, 0.95)
#ecolileveldist=quantile(ecolileveldist,0.95)
ecolilevelunc=c(min(ecolileveldist),mean(ecolileveldist),max(ecolileveldist))

#https://www.ncbi.nlm.nih.gov/pmc/articles/PMC3435338/pdf/tropmed-87-394.pdf
logreductionunc=c(-0.208,2,6)
#logreductionunc=c(0,2,2*5)  #5th and 95th percentile-
#logreductiondist=rlnorm(numberlength,lognormalmean(7.1,1.3),lognormalstdev(7.1,1.3))
#logreductionunc=c(min(logreductiondist),mean(logreductiondist),max(logreductiondist))

#drinkingwaterunc=c(0.25*1000,3.12*1000,3.59*1000)
#drinkingwaterunc=c(0,3.12*1000,3.12*1000*5)
#drinkingwaterunc=c(0.25*1000,3.12*1000,3.59*1000)
drinkingwaterunc=c(0.67*1000,2.55*1000,6.10*1000)
#0.67,2.55,6.10?

#airexchangeunc=c(1.39,10.4,24.9)
#airexchangeunc=c(0.1,10.4,10.4*5)
airexchangeunc=c(1.39,10.4,24.9)

#volumeunc=c(4.53,22.49,70.3) 
#volumeunc=c(0.1,22.49,22.49*5)
#or from Johnson - mean 30, min 3, Max 100, COV 0.5
volumeunc=c(3,30,100) #from Johnson



#heatvaluewood[i]=sample(rtriangle(numberlength,13.5, 15.883,14.780),1) #sample(rnorm(numberlength,19.49,0.24),1)# wood pellet #35.9 #MJ/kg charcoal #sample(rnorm(numberlength,16.1,0.18),1) #Peanut pellet #sample(rtriangle(numberlength,  18.5, 19.2,19),1) #MJ/kgdaf #dry basis #http://large.stanford.edu/courses/2017/ph240/timcheck1/docs/fao-krajnc-2015.pdf
#emissionfactorgkgsmokeywood[i]=sample(rlnorm(numberlength,lognormalmean(7.1,1.3),lognormalstdev(7.1,1.3)),1)#3.6#0.31#  Phillips gasifier ##0.47 #charcoal #g/kg
#stovepowerMJhourwood = 7.05#4.02#3.87#16.8 #MJ per hour#21.8 #sample(rlnorm(numberlength,lognormalmean((4.9),(0.7*4.9)),lognormalstdev((4.9),(0.7*4.9))),1) #KJ/s chulha Johnson modelling paper
#efficiencywood =0.148#0.544#sample(rlnorm(numberlength,lognormalmean(0.544,0.15),lognormalstdev(0.544,0.15)),1)#1# sample(rnorm(numberlength,0.544,0.15),1)#decimal percent #.40#.148 #+/- 1.8 for cookstoves #McCracken and Smith 1998

heatvaluedist=rtriangle(numberlength,13.5, 15.883,14.780)
heatvalueunc=c(13.5,19.49,45.780)
#heatvalueunc=c(0.1,19.49,19.49*5)

emissionfactordist=rlnorm(numberlength,lognormalmean(7.1,1.3),lognormalstdev(7.1,1.3)) # from Cheryl's Uganda Measurements
#emissionfactorunc=c(0.053,0.41,14.6)
#emissionfactorunc=c(0,0.41,0.41*5)
emissionfactorunc=c(min(emissionfactordist),mean(emissionfactordist),max(emissionfactordist))

#emissionfactordist=rlnorm(numberlength,lognormalmean(7.1,1.3),lognormalstdev(7.1,1.3)) # from Cheryl's Uganda Measurements
stovepowerdist=rlnorm(numberlength,lognormalmean(4.9,0.7*4.9),lognormalstdev(4.9,0.7*4.9)) # from Cheryl's Uganda Measurements
#stovepowerdist = rlnorm(numberlength,)
#stovepowerunc=c(3.87,16.0,21.8)
#stovepowerunc=c(1,16.0,16.0*5)
stovepowerunc=c(min(stovepowerdist),mean(stovepowerdist),max(stovepowerdist))

efficiencydist=rlnorm(numberlength,lognormalmean(0.14,0.1*0.14),lognormalstdev(0.14,0.1*0.14))
efficiencyunc=c(min(efficiencydist),mean(efficiencydist),max(efficiencydist))
#efficiencyunc=c(.148,.233,.544)
#efficiencyunc=c(0.1,.233,.233*5)

energydist=rlnorm(numberlength,lognormalmean(11,0.5*11),lognormalstdev(11,0.5*11))
#energyunc=c(0.67,2.55,6.10)
#energyunc=c(0,2.55,2.55*5)
energyunc=c(min(energydist),mean(energydist),max(energydist))
#Energy mean 11, min 3, Max 30, COV 0.5

ageatdeathunc=c(1,45,90)
#ageatdeathunc=c(0,45,5*45)

#2 sigma- 95th and percentile 
#transform values
#log mean
#log transform 
cryptokvaluedist=rlnorm(numberlength,lognormalmean((3.44*10^-1),(2.02)),lognormalstdev((3.44*10^-1),(2.02)))
#cryptokvalueunc=c(min(cryptokvaluedist),mean(cryptokvaluedist),max(cryptokvaluedist))
#cryptokvalueunc=c(0,mean(cryptokvaluedist),5*mean(cryptokvaluedist))
cryptokvalueunc=c(min(cryptokvaluedist),mean(cryptokvaluedist),max(cryptokvaluedist))

cryptoratiovaluedist=rlnorm(numberlength,lognormalmean((1.13*10^-6),(9.26*10^-6)),lognormalstdev((1.13*10^-6),(9.26*10^-6)))
#cryptoratiovalueunc=c(min(cryptoratiovaluedist),mean(cryptoratiovaluedist),max(cryptoratiovaluedist))
#cryptoratiovalueunc=c(0,mean(cryptoratiovaluedist),5*mean(cryptoratiovaluedist))
cryptoratiovalueunc=c(min(cryptoratiovaluedist),mean(cryptoratiovaluedist),max(cryptoratiovaluedist))


rotaalphavaluedist=rlnorm(numberlength,lognormalmean((2.48*10^-1),(1.46*10^-1)),lognormalstdev((2.48*10^-1),(1.46*10^-1)))
#rotaalphavalueunc=c(min(rotaalphavaluedist),mean(rotaalphavaluedist),max(rotaalphavaluedist))
#rotaalphavalueunc=c(0,mean(rotaalphavaluedist),5*mean(rotaalphavaluedist))
rotaalphavalueunc=c(min(rotaalphavaluedist),mean(rotaalphavaluedist),max(rotaalphavaluedist))

rotaNfiftyvaluedist=rlnorm(numberlength,lognormalmean(8.16,6.65),lognormalstdev(8.16,6.65))
#rotaNfiftyvalueunc=c(min(rotaNfiftyvaluedist),mean(rotaNfiftyvaluedist),max(rotaNfiftyvaluedist))
#rotaNfiftyvalueunc=c(0,mean(rotaNfiftyvaluedist),5*mean(rotaNfiftyvaluedist))
rotaNfiftyvalueunc=c(min(rotaNfiftyvaluedist),mean(rotaNfiftyvaluedist),max(rotaNfiftyvaluedist))


rotaratiovaluedist=rlnorm(numberlength,lognormalmean((8.79*10^-7),(1.77*10^-6)),lognormalstdev((8.79*10^-7),(1.77*10^-6)))
#rotaratiovalueunc=c(min(rotaratiovaluedist),mean(rotaratiovaluedist),max(rotaratiovaluedist))
#rotaratiovalueunc=c(0,mean(rotaratiovaluedist),5*mean(rotaratiovaluedist))
rotaratiovalueunc=c(min(rotaratiovaluedist),mean(rotaratiovaluedist),max(rotaratiovaluedist))

campalphavaluedist= rlnorm(numberlength,lognormalmean((1.51*10^-1),(5.90*10^-1)),lognormalstdev((1.51*10^-1),(5.90*10^-1)))
#campalphavalueunc=c(min(campalphavaluedist),mean(campalphavaluedist),max(campalphavaluedist))
#campalphavalueunc=c(0,mean(campalphavaluedist),5*mean(campalphavaluedist))
campalphavalueunc=c(min(campalphavaluedist),mean(campalphavaluedist),max(campalphavaluedist))


campNfiftyvaluedist=rlnorm(numberlength,lognormalmean((1.69*10^3),(2.78*10^3)),lognormalstdev((1.69*10^3),(2.78*10^3)))
#campNfiftyvalueunc=c(min(campNfiftyvaluedist),mean(campNfiftyvaluedist),max(campNfiftyvaluedist))
#campNfiftyvalueunc=c(0,mean(campNfiftyvaluedist),5*mean(campNfiftyvaluedist))
campNfiftyvalueunc=c(min(campNfiftyvaluedist),mean(campNfiftyvaluedist),max(campNfiftyvaluedist))


campratiovaluedist=rlnorm(numberlength,lognormalmean((8.89*10^-3),(1.33)),lognormalstdev((8.89*10^-3),(1.33)))
#campratiovalueunc=c(min(campratiovaluedist),mean(campratiovaluedist),max(campratiovaluedist))
#campratiovalueunc=c(0,mean(campratiovaluedist),5*mean(campratiovaluedist))
campratiovalueunc=c(min(campratiovaluedist),mean(campratiovaluedist),max(campratiovaluedist))

#ageatdeathunc,cryptokvalueunc,crytoratiovalueunc,rotaalphavalueunc,rotaNfiftyvalueunc,rotaratiovalueunc,campalphavalueunc,campNfiftyvalueunc,campratiovalueunc

#cryptokvaluedist=rlnorm(numberlength,lognormalmean((3.44*10^-1),(2.02)),lognormalstdev((3.44*10^-1),(2.02)))
#cryptoratiovalue[i]=sample(rlnorm(numberlength,lognormalmean((1.13*10^-6),(9.26*10^-6)),lognormalstdev((1.13*10^-6),(9.26*10^-6))),1)
#rotaalphavalue[i]=sample(rlnorm(numberlength,lognormalmean((2.48*10^-1),(1.46*10^-1)),lognormalstdev((2.48*10^-1),(1.46*10^-1))),1)
#rotaNfiftyvalue[i]=sample(rlnorm(numberlength,lognormalmean(8.16,6.65),lognormalstdev(8.16,6.65)),1)
#rotaratiovalue[i]=sample(rlnorm(numberlength,lognormalmean((8.79*10^-7),(1.77*10^-6))),lognormalstdev((8.79*10^-7),(1.77*10^-6)),1)
#campalphavalue[i]= sample(rlnorm(numberlength,lognormalmean((1.51*10^-1),(5.90*10^-1)),lognormalstdev((1.51*10^-1),(5.90*10^-1))),1) #0.1
#campNfiftyvalue[i]=sample(rlnorm(numberlength,lognormalmean((1.69*10^3),(2.78*10^3)),lognormalstdev((1.69*10^3),(2.78*10^3))),1)
#campratiovalue[i]=sample(rlnorm(numberlength,lognormalmean((8.89*10^-3),(1.33)),lognormalstdev((8.89*10^-3),(1.33))),1)

#ageatdeathinputunc,cryptokvalueunc,cryptoratiovalueunc,rotaalphavalueunc,rotaNfiftyvalueunc,rotaratiovalueunc,campalphavalueunc,campNfiftyvalueunc,campratiovalueunc

uncertaintyresults=c()
backgroundresults=c()
ecolilevelresults=c()
logreductionresults=c()
drinkingwaterresults=c()
airexchangeresults=c()
volumeresults=c()
heatvalueresults=c()
emissionfactorresults=c()
stovepowerresults=c()
efficiencyresults=c()
energyresults=c()
uncertaintyseq=c(1,2,3)
exposureresults=c()
emissionrateresults=c



ageresults=c()
cryptokvalueresults=c()
cryptoratiovalueresults=c()
rotaalphavalueresults=c()
rotaNfiftyvalueresults=c()
rotaratiovalueresults=c()
campalphavalueresults=c()
campNfiftyvalueresults=c()
campratiovalueresults=c()



exposurewater=c()
backgroundwater=c()
ecolilevelwater=c()
logreductionwater=c()
drinkingwaterwater=c()
airexchangewater=c()
volumewater=c()
heatvaluewater=c()
emissionfactorwater=c() 
stovepowerwater=c()
efficiencywater=c()
energywater=c()
agewater=c()
cryptokvaluewater=c()
cryptoratiovaluewater=c()
rotaalphavaluewater=c() 
rotaNfiftyvaluewater=c()
rotaratiovaluewater=c()
campalphavaluewater=c()
campNfiftyvaluewater=c()
campratiovaluewater=c()


exposureair=c()
backgroundair=c()
ecolilevelair=c()
logreductionair=c()
drinkingwaterair=c()
airexchangeair=c()
volumeair=c()
heatvalueair=c()
emissionfactorair=c() 
stovepowerair=c()
efficiencyair=c()
energyair=c()
ageair=c()
cryptokvalueair=c()
cryptoratiovalueair=c()
rotaalphavalueair=c() 
rotaNfiftyvalueair=c()
rotaratiovalueair=c()
campalphavalueair=c()
campNfiftyvalueair=c()
campratiovalueair=c()


for (i in uncertaintyseq)
{
print(i)
exposureresultsi=uncertaintyfunction(exposureunc[i],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
print(exposureresults)
backgroundresultsi=uncertaintyfunction(exposureunc[2],backgroundunc[i],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
ecolilevelresultsi=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[i],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
logreductionresultsi=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[i],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
drinkingwaterresultsi=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[i],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
airexchangeresultsi=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[i],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
volumeresultsi=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[i],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
heatvalueresultsi=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[i],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
emissionfactorresultsi=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[i],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
stovepowerresultsi=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[i],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
efficiencyresultsi=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[i],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
energyresultsi=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[i],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
ageresultsi=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[i],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
#ageresultsi=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[i],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])

cryptokvalueresultsi=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[i],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
cryptoratiovalueresultsi=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[i],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
rotaalphavalueresultsi=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[i],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
rotaNfiftyvalueresultsi=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[i],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
rotaratiovalueresultsi=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[i],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
campalphavalueresultsi=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[i],campNfiftyvalueunc[2],campratiovalueunc[2])
campNfiftyvalueresultsi=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[i],campratiovalueunc[2])
campratiovalueresultsi=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[i])

exposureresults[i]=exposureresultsi[1]#uncertaintyfunction(exposureunc[i],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
backgroundresults[i]=backgroundresultsi[1] #uncertaintyfunction(exposureunc[2],backgroundunc[i],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
ecolilevelresults[i]=ecolilevelresultsi[1] #uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[i],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
logreductionresults[i]=logreductionresultsi[1]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[i],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
drinkingwaterresults[i]=drinkingwaterresultsi[1]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[i],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
airexchangeresults[i]=airexchangeresultsi[1]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[i],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
volumeresults[i]=volumeresultsi[1]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[i],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
heatvalueresults[i]=heatvalueresultsi[1]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[i],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
emissionfactorresults[i]=emissionfactorresultsi[1] #uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[i],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
stovepowerresults[i]=stovepowerresultsi[1] #uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[i],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
efficiencyresults[i]=efficiencyresultsi[1]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[i],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
energyresults[i]=energyresultsi[1]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[i],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
ageresults[i]=ageresultsi[1]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[i],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
cryptokvalueresults[i]=cryptokvalueresultsi[1]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[i],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
cryptoratiovalueresults[i]=cryptoratiovalueresultsi[1]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[i],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
rotaalphavalueresults[i]=rotaalphavalueresultsi[1] #uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[i],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
rotaNfiftyvalueresults[i]=rotaNfiftyvalueresultsi[1]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[i],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
rotaratiovalueresults[i]=rotaratiovalueresultsi[1]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[i],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
campalphavalueresults[i]=campalphavalueresultsi[1]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[i],campNfiftyvalueunc[2],campratiovalueunc[2])
campNfiftyvalueresults[i]=campNfiftyvalueresultsi[1]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[i],campratiovalueunc[2])
campratiovalueresults[i]=campratiovalueresultsi[1]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[i])

exposurewater[i]=exposureresultsi[2]
backgroundwater[i]=backgroundresultsi[2] 
ecolilevelwater[i]=ecolilevelresultsi[2] 
logreductionwater[i]=logreductionresultsi[2]
drinkingwaterwater[i]=drinkingwaterresultsi[2]
airexchangewater[i]=airexchangeresultsi[2]
volumewater[i]=volumeresultsi[2]
heatvaluewater[i]=heatvalueresultsi[2]
emissionfactorwater[i]=emissionfactorresultsi[2] 
stovepowerwater[i]=stovepowerresultsi[2] 
efficiencywater[i]=efficiencyresultsi[2]
energywater[i]=energyresultsi[2]
agewater[i]=ageresultsi[2]
cryptokvaluewater[i]=cryptokvalueresultsi[2]
cryptoratiovaluewater[i]=cryptoratiovalueresultsi[2]
rotaalphavaluewater[i]=rotaalphavalueresultsi[2] 
rotaNfiftyvaluewater[i]=rotaNfiftyvalueresultsi[2]
rotaratiovaluewater[i]=rotaratiovalueresultsi[2]
campalphavaluewater[i]=campalphavalueresultsi[2]
campNfiftyvaluewater[i]=campNfiftyvalueresultsi[2]
campratiovaluewater[i]=campratiovalueresultsi[2]

exposureair[i]=exposureresultsi[3]
backgroundair[i]=backgroundresultsi[3] 
ecolilevelair[i]=ecolilevelresultsi[3] 
logreductionair[i]=logreductionresultsi[3]
drinkingwaterair[i]=drinkingwaterresultsi[3]
airexchangeair[i]=airexchangeresultsi[3]
volumeair[i]=volumeresultsi[3]
heatvalueair[i]=heatvalueresultsi[3]
emissionfactorair[i]=emissionfactorresultsi[3] 
stovepowerair[i]=stovepowerresultsi[3] 
efficiencyair[i]=efficiencyresultsi[3]
energyair[i]=energyresultsi[3]
ageair[i]=ageresultsi[3]
cryptokvalueair[i]=cryptokvalueresultsi[3]
cryptoratiovalueair[i]=cryptoratiovalueresultsi[3]
rotaalphavalueair[i]=rotaalphavalueresultsi[3] 
rotaNfiftyvalueair[i]=rotaNfiftyvalueresultsi[3]
rotaratiovalueair[i]=rotaratiovalueresultsi[3]
campalphavalueair[i]=campalphavalueresultsi[3]
campNfiftyvalueair[i]=campNfiftyvalueresultsi[3]
campratiovalueair[i]=campratiovalueresultsi[3]

}
print("start plots")
xaxis=c(1,2,3)
#plot(xaxis,exposureresults)
plot(xaxis, exposureresults, xaxt="n",type="b", col="green", lwd=5, pch=15, xlab="Percent Change", ylab="Net Change in DALYs",ylim=c(-200,100),xlim=c(-0.25,3))
lines(xaxis, backgroundresults, type="b", col="red", lwd=2, pch=19)
lines(xaxis, ecolilevelresults, type="b", col="yellow", lwd=2, pch=19)
lines(xaxis, logreductionresults, type="b", col="blue", lwd=2, pch=19)
lines(xaxis, drinkingwaterresults, type="b", col="purple", lwd=2, pch=19)
lines(xaxis, airexchangeresults, type="b", col="black", lwd=2, pch=19)
lines(xaxis, volumeresults, type="b", col="gray", lwd=2, pch=19)
lines(xaxis, heatvalueresults, type="b", col="pink", lwd=2, pch=19)
lines(xaxis, emissionfactorresults, type="b", col="coral", lwd=2, pch=19)
lines(xaxis, stovepowerresults, type="b", col="magenta", lwd=2, pch=19)
lines(xaxis, efficiencyresults, type="b", col="skyblue", lwd=2, pch=19)
lines(xaxis, energyresults, type="b", col="deepskyblue", lwd=2, pch=19)
lines(xaxis, ageresults, type="b", col="aquamarine", lwd=2, pch=19)
lines(xaxis, cryptokvalueresults, type="b", col="bisque4", lwd=2, pch=19)
lines(xaxis, cryptoratiovalueresults, type="b", col="deeppink", lwd=2, pch=19)
lines(xaxis, rotaalphavalueresults, type="b", col="lightblue4", lwd=2, pch=19)
lines(xaxis, rotaNfiftyvalueresults, type="b", col="mediumseagreen", lwd=2, pch=19)
lines(xaxis, rotaratiovalueresults, type="b", col="salmon", lwd=2, pch=19)
lines(xaxis, campalphavalueresults, type="b", col="thistle1", lwd=2, pch=19)
lines(xaxis, campNfiftyvalueresults, type="b", col="slateblue4", lwd=2, pch=19)
lines(xaxis, campratiovalueresults, type="b", col="violetred4", lwd=2, pch=19)
title("Sensitivity Analysis-Net Difference in Dalys from Water Boiling")
axis(1,at=1:3,labels=c("-100%","0%","+400%"))
legend("topleft", legend=c("exp to conc", "background","ecoli","log red.","water vol","air ex.","volume","heat v.","emission f.","stove power","eff.","energy","age","crypto k","crypto ratio","rota alpha","rota N","rota ratio","camp alpha","camp N", "camp ratio"),
       col=c("green", "red","yellow","blue","purple","black","gray","pink","coral","magenta","skyblue","deepskyblue","aquamarine","bisque4","deeppink","lightblue4","mediumseagreen","Salmon","thistle1","slateblue4","violetred4"), lty=1:2, cex=0.8)
#legend(0,2.8, lwd=c(5,2), col=c("green","red"), pch=c(15,19), y.intersp=1.5)

#plot(1:10, xaxt = "n", xlab='Some Letters')
#axis(1, at=1:10, labels=letters[1:10])

plot(xaxis, ecolilevelwater, xaxt="n",type="b", col="red", lwd=5, pch=15, xlab="percent Change", ylab="Net Change in DALYs for Water",ylim=c(-100,200),xlim=c(-0.25,3))
#lines(xaxis, backgroundresults, type="b", col="red", lwd=2, pch=19)
#lines(xaxis, ecolilevelresults, type="b", col="yellow", lwd=2, pch=19)
lines(xaxis, logreductionwater, type="b", col="yellow", lwd=2, pch=19)
lines(xaxis, drinkingwaterwater, type="b", col="black", lwd=2, pch=19)
#lines(xaxis, airexchangeresults, type="b", col="black", lwd=2, pch=19)
#lines(xaxis, volumeresults, type="b", col="gray", lwd=2, pch=19)
#lines(xaxis, heatvalueresults, type="b", col="pink", lwd=2, pch=19)
#lines(xaxis, emissionfactorresults, type="b", col="coral", lwd=2, pch=19)
#lines(xaxis, stovepowerresults, type="b", col="magenta", lwd=2, pch=19)
#lines(xaxis, efficiencyresults, type="b", col="skyblue", lwd=2, pch=19)
#lines(xaxis, energyresults, type="b", col="deepskyblue", lwd=2, pch=19)
lines(xaxis, agewater, type="b", col="orange", lwd=2, pch=19)
#lines(xaxis, cryptokvaluewater, type="b", col="blue", lwd=2, pch=19)
#lines(xaxis, cryptoratiovaluewater, type="b", col="green", lwd=2, pch=19)
#lines(xaxis, rotaalphavaluewater, type="b", col="royalblue", lwd=2, pch=19)
#lines(xaxis, rotaNfiftyvaluewater, type="b", col="powderblue", lwd=2, pch=19)
#lines(xaxis, rotaratiovaluewater, type="b", col="yellowgreen", lwd=2, pch=19)
#lines(xaxis, campalphavaluewater, type="b", col="navy", lwd=2, pch=19)
#lines(xaxis, campNfiftyvaluewater, type="b", col="slateblue4", lwd=2, pch=19)
#lines(xaxis, campratiovaluewater, type="b", col="seagreen", lwd=2, pch=19)
title("Sensitivity Analysis-Net Difference in Dalys from Water Boiling")
axis(1,at=1:3,labels=c("-100%","0","400%"))
legend("topleft",legend=c("ecoli","log red.","water vol","age"),col=c("red","yellow","black","orange"),lty=1:2,cex=0.8)

plot(xaxis, cryptokvaluewater, xaxt="n",type="b", col="orange", lwd=5, pch=15, xlab="time", ylab="Net Change in DALYs for Water",ylim=c(-100,50),xlim=c(-0.25,3))
#lines(xaxis, backgroundresults, type="b", col="red", lwd=2, pch=19)
#lines(xaxis, ecolilevelresults, type="b", col="yellow", lwd=2, pch=19)
#lines(xaxis, logreductionwater, type="b", col="yellow", lwd=2, pch=19)
#lines(xaxis, drinkingwaterwater, type="b", col="black", lwd=2, pch=19)
#lines(xaxis, airexchangeresults, type="b", col="black", lwd=2, pch=19)
#lines(xaxis, volumeresults, type="b", col="gray", lwd=2, pch=19)
#lines(xaxis, heatvalueresults, type="b", col="pink", lwd=2, pch=19)
#lines(xaxis, emissionfactorresults, type="b", col="coral", lwd=2, pch=19)
#lines(xaxis, stovepowerresults, type="b", col="magenta", lwd=2, pch=19)
#lines(xaxis, efficiencyresults, type="b", col="skyblue", lwd=2, pch=19)
#lines(xaxis, energyresults, type="b", col="deepskyblue", lwd=2, pch=19)
#lines(xaxis, ageresults, type="b", col="orange", lwd=2, pch=19)
#lines(xaxis, cryptokvaluewater, type="b", col="blue", lwd=2, pch=19)
lines(xaxis, cryptoratiovaluewater, type="b", col="green", lwd=2, pch=19)
lines(xaxis, rotaalphavaluewater, type="b", col="royalblue", lwd=2, pch=19)
lines(xaxis, rotaNfiftyvaluewater, type="b", col="powderblue", lwd=2, pch=19)
lines(xaxis, rotaratiovaluewater, type="b", col="yellowgreen", lwd=2, pch=19)
lines(xaxis, campalphavaluewater, type="b", col="navy", lwd=2, pch=19)
lines(xaxis, campNfiftyvaluewater, type="b", col="slateblue4", lwd=2, pch=19)
lines(xaxis, campratiovaluewater, type="b", col="red", lwd=2, pch=19)
title("Sensitivity Analysis-Net Difference in Dalys from Water Boiling")
axis(1,at=1:3,labels=c("-100%","0","+400%"))
legend("topleft",legend=c("crypto k value","crypto ratio value","rota alpha value","rota N fifty value","rota ratio value","camp alpha value","camp Nfifty","camp ratio"),
       col=c("orange","green","royalblue","powderblue","yellowgreen","navy","slateblue4","red"),lty=1:2,cex=0.8)

plot(xaxis, backgroundair, xaxt="n",type="b", col="orange", lwd=5, pch=15, xlab="Percent Change", ylab="Net Change in DALYs for Air",ylim=c(-5,50),xlim=c(-0.25,3))
#lines(xaxis, backgroundresults, type="b", col="red", lwd=2, pch=19)
#lines(xaxis, ecolilevelresults, type="b", col="yellow", lwd=2, pch=19)
#lines(xaxis, logreductionwater, type="b", col="yellow", lwd=2, pch=19)
lines(xaxis, drinkingwaterair, type="b", col="black", lwd=2, pch=19)
lines(xaxis, airexchangeair, type="b", col="blue", lwd=2, pch=19)
lines(xaxis, volumeair, type="b", col="gray", lwd=2, pch=19)
lines(xaxis, heatvalueair, type="b", col="pink", lwd=2, pch=19)
lines(xaxis, emissionfactorair, type="b", col="coral", lwd=2, pch=19)
lines(xaxis, stovepowerair, type="b", col="magenta", lwd=2, pch=19)
lines(xaxis, efficiencyair, type="b", col="skyblue", lwd=2, pch=19)
lines(xaxis, energyair, type="b", col="green", lwd=2, pch=19)
#lines(xaxis, ageresults, type="b", col="orange", lwd=2, pch=19)
#lines(xaxis, cryptokvaluewater, type="b", col="blue", lwd=2, pch=19)
#lines(xaxis, cryptoratiovaluewater, type="b", col="green", lwd=2, pch=19)
#lines(xaxis, rotaalphavaluewater, type="b", col="royalblue", lwd=2, pch=19)
#lines(xaxis, rotaNfiftyvaluewater, type="b", col="powderblue", lwd=2, pch=19)
#lines(xaxis, rotaratiovaluewater, type="b", col="yellowgreen", lwd=2, pch=19)
#lines(xaxis, campalphavaluewater, type="b", col="navy", lwd=2, pch=19)
#lines(xaxis, campNfiftyvaluewater, type="b", col="slateblue4", lwd=2, pch=19)
#lines(xaxis, campratiovaluewater, type="b", col="red", lwd=2, pch=19)
title("Sensitivity Analysis-Difference in Air DALYs from Water Boiling")
axis(1,at=1:3,labels=c("-100%","0%","+400%"))
legend("bottomleft",legend=c("background","drinkingwater volume","air exchange","volume","heating value","emission factor","Stove Power","Efficiency","Cooking energy"),
       col=c("orange","black","blue","gray","pink","coral","magenta","skyblue","green"),lty=1:2,cex=0.8)