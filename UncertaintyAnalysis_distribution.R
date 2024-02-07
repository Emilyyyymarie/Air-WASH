#updated February 5, 2024
number=length(numberseq) #number of random selections

#set variables


countrydata<-read.csv(paste(currentcountrypath,"/",country,"_households",HAPITCHECK,".csv",sep=""),header=TRUE) 
averagehousehold =countrydata$averagehousehold
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


emissionrateresults=c

uncertaintyseq=c(1,2,3)
#######

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

exposureresults=c()

ageresults=c()
cryptokvalueresults=c()
cryptoratiovalueresults=c()
rotaalphavalueresults=c()
rotaNfiftyvalueresults=c()
rotaratiovalueresults=c()
campalphavalueresults=c()
campNfiftyvalueresults=c()
campratiovalueresults=c()

uncertaintyresultsnetdiff=c()
backgroundresultsnetdiff=c()
ecolilevelresultsnetdiff=c()
logreductionresultsnetdiff=c()
drinkingwaterresultsnetdiff=c()
airexchangeresultsnetdiff=c()
volumeresultsnetdiff=c()
heatvalueresultsnetdiff=c()
emissionfactorresultsnetdiff=c()
stovepowerresultsnetdiff=c()
efficiencyresultsnetdiff=c()
energyresultsnetdiff=c()

exposureresultsnetdiff=c()

ageresultsnetdiff=c()
cryptokvalueresultsnetdiff=c()
cryptoratiovalueresultsnetdiff=c()
rotaalphavalueresultsnetdiff=c()
rotaNfiftyvalueresultsnetdiff=c()
rotaratiovalueresultsnetdiff=c()
campalphavalueresultsnetdiff=c()
campNfiftyvalueresultsnetdiff=c()
campratiovalueresultsnetdiff=c()



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

##########
#############################
uncertaintyresultsdelta=c()
backgroundresultsdelta=c()
ecolilevelresultsdelta=c()
logreductionresultsdelta=c()
drinkingwaterresultsdelta=c()
airexchangeresultsdelta=c()
volumeresultsdelta=c()
heatvalueresultsdelta=c()
emissionfactorresultsdelta=c()
stovepowerresultsdelta=c()
efficiencyresultsdelta=c()
energyresultsdelta=c()

exposureresultsdelta=c()

ageresultsdelta=c()
cryptokvalueresultsdelta=c()
cryptoratiovalueresultsdelta=c()
rotaalphavalueresultsdelta=c()
rotaNfiftyvalueresultsdelta=c()
rotaratiovalueresultsdelta=c()
campalphavalueresultsdelta=c()
campNfiftyvalueresultsdelta=c()
campratiovalueresultsdelta=c()

###
uncertaintyresultsnetdiffdelta=c()
backgroundresultsnetdiffdelta=c()
ecolilevelresultsnetdiffdelta=c()
logreductionresultsnetdiffdelta=c()
drinkingwaterresultsnetdiffdelta=c()
airexchangeresultsnetdiffdelta=c()
volumeresultsnetdiffdelta=c()
heatvalueresultsnetdiffdelta=c()
emissionfactorresultsnetdiffdelta=c()
stovepowerresultsnetdiffdelta=c()
efficiencyresultsnetdiffdelta=c()
energyresultsnetdiffdelta=c()

exposureresultsnetdiffdelta=c()

ageresultsnetdiffdelta=c()
cryptokvalueresultsnetdiffdelta=c()
cryptoratiovalueresultsnetdiffdelta=c()
rotaalphavalueresultsnetdiffdelta=c()
rotaNfiftyvalueresultsnetdiffdelta=c()
rotaratiovalueresultsnetdiffdelta=c()
campalphavalueresultsnetdiffdelta=c()
campNfiftyvalueresultsnetdiffdelta=c()
campratiovalueresultsnetdiffdelta=c()

##

exposurewaterdelta=c()
backgroundwaterdelta=c()
ecolilevelwaterdelta=c()
logreductionwaterdelta=c()
drinkingwaterwaterdelta=c()
airexchangewaterdelta=c()
volumewaterdelta=c()
heatvaluewaterdelta=c()
emissionfactorwaterdelta=c() 
stovepowerwaterdelta=c()
efficiencywaterdelta=c()
energywaterdelta=c()
agewaterdelta=c()
cryptokvaluewaterdelta=c()
cryptoratiovaluewaterdelta=c()
rotaalphavaluewaterdelta=c() 
rotaNfiftyvaluewaterdelta=c()
rotaratiovaluewaterdelta=c()
campalphavaluewaterdelta=c()
campNfiftyvaluewaterdelta=c()
campratiovaluewaterdelta=c()


exposureairdelta=c()
backgroundairdelta=c()
ecolilevelairdelta=c()
logreductionairdelta=c()
drinkingwaterairdelta=c()
airexchangeairdelta=c()
volumeairdelta=c()
heatvalueairdelta=c()
emissionfactorairdelta=c() 
stovepowerairdelta=c()
efficiencyairdelta=c()
energyairdelta=c()
ageairdelta=c()
cryptokvalueairdelta=c()
cryptoratiovalueairdelta=c()
rotaalphavalueairdelta=c() 
rotaNfiftyvalueairdelta=c()
rotaratiovalueairdelta=c()
campalphavalueairdelta=c()
campNfiftyvalueairdelta=c()
campratiovalueairdelta=c()
########
###check

exposureresultscheck=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
backgroundresultscheck=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
ecolilevelresultscheck=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
logreductionresultscheck=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
drinkingwaterresultscheck=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
airexchangeresultscheck=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
volumeresultscheck=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
heatvalueresultscheck=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
emissionfactorresultscheck=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
stovepowerresultscheck=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
efficiencyresultscheck=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
energyresultscheck=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
ageresultscheck=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])


cryptokvalueresultscheck=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
cryptoratiovalueresultscheck=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
rotaalphavalueresultscheck=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
rotaNfiftyvalueresultscheck=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
rotaratiovalueresultscheck=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
campalphavalueresultscheck=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
campNfiftyvalueresultscheck=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
campratiovalueresultscheck=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])

####

for (i in uncertaintyseq)
{
print("i")
print(i)
exposureresultsi=uncertaintyfunction(exposureunc[i],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
print("exposureresultsi")
print(exposureresultsi)
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


cryptokvalueresultsi=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[i],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
cryptoratiovalueresultsi=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[i],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
rotaalphavalueresultsi=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[i],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
rotaNfiftyvalueresultsi=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[i],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
rotaratiovalueresultsi=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[i],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
campalphavalueresultsi=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[i],campNfiftyvalueunc[2],campratiovalueunc[2])
campNfiftyvalueresultsi=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[i],campratiovalueunc[2])
campratiovalueresultsi=uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[i])

exposureresultsnetdiff[i]=exposureresultsi[0]#uncertaintyfunction(exposureunc[i],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
backgroundresultsnetdiff[i]=backgroundresultsi[0] #uncertaintyfunction(exposureunc[2],backgroundunc[i],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
ecolilevelresultsnetdiff[i]=ecolilevelresultsi[0] #uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[i],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
logreductionresultsnetdiff[i]=logreductionresultsi[0]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[i],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
drinkingwaterresultsnetdiff[i]=drinkingwaterresultsi[0]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[i],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
airexchangeresultsnetdiff[i]=airexchangeresultsi[0]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[i],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
volumeresultsnetdiff[i]=volumeresultsi[0]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[i],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
heatvalueresultsnetdiff[i]=heatvalueresultsi[0]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[i],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
emissionfactorresultsnetdiff[i]=emissionfactorresultsi[0] #uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[i],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
stovepowerresultsnetdiff[i]=stovepowerresultsi[0] #uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[i],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
efficiencyresultsnetdiff[i]=efficiencyresultsi[0]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[i],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
energyresultsnetdiff[i]=energyresultsi[0]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[i],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
ageresultsnetdiff[i]=ageresultsi[0]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[i],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
cryptokvalueresultsnetdiff[i]=cryptokvalueresultsi[0]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[i],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
cryptoratiovalueresultsnetdiff[i]=cryptoratiovalueresultsi[0]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[i],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
rotaalphavalueresultsnetdiff[i]=rotaalphavalueresultsi[0] #uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[i],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
rotaNfiftyvalueresultsnetdiff[i]=rotaNfiftyvalueresultsi[0]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[i],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
rotaratiovalueresultsnetdiff[i]=rotaratiovalueresultsi[0]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[i],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
campalphavalueresultsnetdiff[i]=campalphavalueresultsi[0]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[i],campNfiftyvalueunc[2],campratiovalueunc[2])
campNfiftyvalueresultsnetdiff[i]=campNfiftyvalueresultsi[0]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[i],campratiovalueunc[2])
campratiovalueresultsnetdiff[i]=campratiovalueresultsi[0]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[i])

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

####################################
###added this section 2/5/2025
for (i in uncertaintyseq)
{
  exposureresultsnetdiffdelta[i]=exposureresultsnetdiff[i]-exposureresultsnetdiff[0]#uncertaintyfunction(exposureunc[i],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
  backgroundresultsnetdiffdelta[i]=backgroundresultsnetdiff[i]-backgroundresultsnetdiff[0] #uncertaintyfunction(exposureunc[2],backgroundunc[i],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
  ecolilevelresultsnetdiffdelta[i]=ecolilevelresultsnetdiff[i]-ecolilevelresultsnetdiff[0] #uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[i],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
  logreductionresultsnetdiffdelta[i]=logreductionresultsnetdiff[i]-logreductionresultsnetdiff[0]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[i],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
  drinkingwaterresultsnetdiffdelta[i]=drinkingwaterresultsnetdiff[i]-drinkingwaterresultsnetdiff[0] #uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[i],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
  airexchangeresultsnetdiffdelta[i]=airexchangeresultsnetdiff[i]-airexchangeresultsnetdiff[0]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[i],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
  volumeresultsnetdiffdelta[i]=volumeresultsnetdiff[i]-volumeresultsnetdiff[0] #uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[i],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
  heatvalueresultsnetdiffdelta[i]=heatvalueresultsnetdiff[i]-heatvalueresultsnetdiff[0]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[i],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
  emissionfactorresultsnetdiffdelta[i]=emissionfactorresultsnetdiff[i]-emissionfactorresultsnetdiff[0] #uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[i],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
  stovepowerresultsnetdiffdelta[i]=stovepowerresultsnetdiff[i]-stovepowerresultsnetdiff[0] #uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[i],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
  efficiencyresultsnetdiffdelta[i]=efficiencyresultsnetdiff[i]-efficiencyresultsnetdiff[0]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[i],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
  energyresultsnetdiffdelta[i]=energyresultsnetdiff[i]-energyresultsnetdiff[0]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[i],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
  ageresultsnetdiffdelta[i]=ageresultsnetdiff[i]-ageresultsnetdiff[0] #uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[i],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
  cryptokvalueresultsnetdiffdelta[i]=cryptokvalueresultsnetdiff[i]-cryptokvalueresultsnetdiff[0] #uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[i],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
  cryptoratiovalueresultsnetdiffdelta[i]=cryptoratiovalueresultsnetdiff[i]-cryptoratiovalueresultsnetdiff[0] #uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[i],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
  rotaalphavalueresultsnetdiffdelta[i]=rotaalphavalueresultsnetdiff[i]-rotaalphavalueresultsnetdiff[0] #uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[i],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
  rotaNfiftyvalueresultsnetdiffdelta[i]=rotaNfiftyvalueresultsnetdiff[i]-rotaNfiftyvalueresultsnetdiff[0]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[i],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
  rotaratiovalueresultsnetdiffdelta[i]=rotaratiovalueresultsnetdiff[i]-rotaratiovalueresultsnetdiff[0] #uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[i],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
  campalphavalueresultsnetdiffdelta[i]=campalphavalueresultsnetdiff[i]-campalphavalueresultsnetdiff[0] #uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[i],campNfiftyvalueunc[2],campratiovalueunc[2])
  campNfiftyvalueresultsnetdiffdelta[i]=campNfiftyvalueresultsnetdiff[i]-campNfiftyvalueresultsnetdiff[0]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[i],campratiovalueunc[2])
  campratiovalueresultsnetdiffdelta[i]=campratiovalueresultsnetdiff[i]-campratiovalueresultsnetdiff[0] #uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[i])
  
  
  exposureresultsdelta[i]=exposureresults[i]-exposureresults[2]#uncertaintyfunction(exposureunc[i],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
  backgroundresultsdelta[i]=backgroundresults[i]-backgroundresults[2] #uncertaintyfunction(exposureunc[2],backgroundunc[i],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
  ecolilevelresultsdelta[i]=ecolilevelresults[i]-ecolilevelresults[2] #uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[i],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
  logreductionresultsdelta[i]=logreductionresults[i]-logreductionresults[2]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[i],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
  drinkingwaterresultsdelta[i]=drinkingwaterresults[i]-drinkingwaterresults[2] #uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[i],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
  airexchangeresultsdelta[i]=airexchangeresults[i]-airexchangeresults[2]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[i],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
  volumeresultsdelta[i]=volumeresults[i]-volumeresults[2] #uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[i],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
  heatvalueresultsdelta[i]=heatvalueresults[i]-heatvalueresults[2]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[i],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
  emissionfactorresultsdelta[i]=emissionfactorresults[i]-emissionfactorresults[2] #uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[i],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
  stovepowerresultsdelta[i]=stovepowerresults[i]-stovepowerresults[2] #uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[i],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
  efficiencyresultsdelta[i]=efficiencyresults[i]-efficiencyresults[2]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[i],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
  energyresultsdelta[i]=energyresults[i]-energyresults[2]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[i],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
  ageresultsdelta[i]=ageresults[i]-ageresults[2] #uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[i],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
  cryptokvalueresultsdelta[i]=cryptokvalueresults[i]-cryptokvalueresults[2] #uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[i],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
  cryptoratiovalueresultsdelta[i]=cryptoratiovalueresults[i]-cryptoratiovalueresults[2] #uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[i],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
  rotaalphavalueresultsdelta[i]=rotaalphavalueresults[i]-rotaalphavalueresults[2] #uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[i],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
  rotaNfiftyvalueresultsdelta[i]=rotaNfiftyvalueresults[i]-rotaNfiftyvalueresults[2]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[i],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
  rotaratiovalueresultsdelta[i]=rotaratiovalueresults[i]-rotaratiovalueresults[2] #uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[i],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[2])
  campalphavalueresultsdelta[i]=campalphavalueresults[i]-campalphavalueresults[2] #uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[i],campNfiftyvalueunc[2],campratiovalueunc[2])
  campNfiftyvalueresultsdelta[i]=campNfiftyvalueresults[i]-campNfiftyvalueresults[2]#uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[i],campratiovalueunc[2])
  campratiovalueresultsdelta[i]=campratiovalueresults[i]-campratiovalueresults[2] #uncertaintyfunction(exposureunc[2],backgroundunc[2],ecolilevelunc[2],logreductionunc[2],drinkingwaterunc[2],airexchangeunc[2],volumeunc[2],heatvalueunc[2],emissionfactorunc[2],stovepowerunc[2],efficiencyunc[2],energyunc[2],ageatdeathunc[2],cryptokvalueunc[2],cryptoratiovalueunc[2],rotaalphavalueunc[2],rotaNfiftyvalueunc[2],rotaratiovalueunc[2],campalphavalueunc[2],campNfiftyvalueunc[2],campratiovalueunc[i])
  
  exposurewaterdelta[i]=exposurewater[i]-exposurewater[2]
  backgroundwaterdelta[i]=backgroundwater[i]-backgroundwater[2] 
  ecolilevelwaterdelta[i]=ecolilevelwater[i]-ecolilevelwater[2]
  logreductionwaterdelta[i]=logreductionwater[i]-logreductionwater[2]
  drinkingwaterwaterdelta[i]=drinkingwaterwater[i]-drinkingwaterwater[2]
  airexchangewaterdelta[i]=airexchangewater[i]-airexchangewater[2]
  volumewaterdelta[i]=volumewater[i]-volumewater[2]
  heatvaluewaterdelta[i]=heatvaluewater[i]-heatvaluewater[2]
  emissionfactorwaterdelta[i]=emissionfactorwater[i]-emissionfactorwater[2] 
  stovepowerwaterdelta[i]=stovepowerwater[i]-stovepowerwater[2]
  efficiencywaterdelta[i]=efficiencywater[i]-efficiencywater[2]
  energywaterdelta[i]=energywater[i]-energywater[2]
  agewaterdelta[i]=agewater[i]-agewater[2]
  cryptokvaluewaterdelta[i]=cryptokvaluewater[i]-cryptokvaluewater[2]
  cryptoratiovaluewaterdelta[i]=cryptoratiovaluewater[i]-cryptoratiovaluewater[2]
  rotaalphavaluewaterdelta[i]=rotaalphavaluewater[i]-rotaalphavaluewater[2] 
  rotaNfiftyvaluewaterdelta[i]=rotaNfiftyvaluewater[i]-rotaNfiftyvaluewater[2]
  rotaratiovaluewaterdelta[i]=rotaratiovaluewater[i]-rotaratiovaluewater[2]
  campalphavaluewaterdelta[i]=campalphavaluewater[i]-campalphavaluewater[2]
  campNfiftyvaluewaterdelta[i]=campNfiftyvaluewater[i]-campNfiftyvaluewater[2]
  campratiovaluewaterdelta[i]=campratiovaluewater[i]-campratiovaluewater[2]
  
  exposureairdelta[i]=exposureair[i]-exposureair[2]
  backgroundairdelta[i]=backgroundair[i]-backgroundair[2] 
  ecolilevelairdelta[i]=ecolilevelair[i]-ecolilevelair[2]
  logreductionairdelta[i]=logreductionair[i]-logreductionair[2]
  drinkingwaterairdelta[i]=drinkingwaterair[i]-drinkingwaterair[2]
  airexchangeairdelta[i]=airexchangeair[i]-airexchangeair[2]
  volumeairdelta[i]=volumeair[i]-volumeair[2]
  heatvalueairdelta[i]=heatvalueair[i]-heatvalueair[2]
  emissionfactorairdelta[i]=emissionfactorair[i]-emissionfactorair[2]
  stovepowerairdelta[i]=stovepowerair[i]-stovepowerair[2]
  efficiencyairdelta[i]=efficiencyair[i]-efficiencyair[2]
  energyairdelta[i]=energyair[i]-energyair[2]
  ageairdelta[i]=ageair[i]-ageair[2]
  cryptokvalueairdelta[i]=cryptokvalueair[i]-cryptokvalueair[2]
  cryptoratiovalueairdelta[i]=cryptoratiovalueair[i]-cryptoratiovalueair[2]
  rotaalphavalueairdelta[i]=rotaalphavalueair[i]-rotaalphavalueair[2]
  rotaNfiftyvalueairdelta[i]=rotaNfiftyvalueair[i]-rotaNfiftyvalueair[2]
  rotaratiovalueairdelta[i]=rotaratiovalueair[i]-rotaratiovalueair[2]
  campalphavalueairdelta[i]=campalphavalueair[i]-campalphavalueair[2]
  campNfiftyvalueairdelta[i]=campNfiftyvalueair[i]-campNfiftyvalueair[2]
  campratiovalueairdelta[i]=campratiovalueair[i]-campratiovalueair[2] 
  

}
###############################3 #end Feb 5 2024 addition


####
xaxis=c(2,3,4)
print("Start plot 1")
plot(xaxis, exposureresultsdelta, xaxt="n",type="b", col="green", lwd=5, pch=15, xlab="Variation", ylab="Change in Total DALYs",ylim=c(-125,25),xlim=c(-0.25,5))
lines(xaxis, backgroundresultsdelta, type="b", col="red", lwd=2, pch=19)
lines(xaxis, ecolilevelresultsdelta, type="b", col="yellow", lwd=2, pch=19)
lines(xaxis, logreductionresultsdelta, type="b", col="blue", lwd=2, pch=19)
lines(xaxis, drinkingwaterresultsdelta, type="b", col="purple", lwd=2, pch=19)
lines(xaxis, airexchangeresultsdelta, type="b", col="black", lwd=2, pch=19)
lines(xaxis, volumeresultsdelta, type="b", col="gray", lwd=2, pch=19)
lines(xaxis, heatvalueresultsdelta, type="b", col="pink", lwd=2, pch=19)
lines(xaxis, emissionfactorresultsdelta, type="b", col="coral", lwd=2, pch=19)
lines(xaxis, stovepowerresultsdelta, type="b", col="magenta", lwd=2, pch=19)
lines(xaxis, efficiencyresultsdelta, type="b", col="skyblue", lwd=2, pch=19)
lines(xaxis, energyresultsdelta, type="b", col="deepskyblue", lwd=2, pch=19)
lines(xaxis, ageresultsdelta, type="b", col="aquamarine", lwd=2, pch=19)
lines(xaxis, cryptokvalueresultsdelta, type="b", col="bisque4", lwd=2, pch=19)
lines(xaxis, cryptoratiovalueresultsdelta, type="b", col="deeppink", lwd=2, pch=19)
lines(xaxis, rotaalphavalueresultsdelta, type="b", col="lightblue4", lwd=2, pch=19)
lines(xaxis, rotaNfiftyvalueresultsdelta, type="b", col="mediumseagreen", lwd=2, pch=19)
lines(xaxis, rotaratiovalueresultsdelta, type="b", col="salmon", lwd=2, pch=19)
lines(xaxis, campalphavalueresultsdelta, type="b", col="thistle1", lwd=2, pch=19)
lines(xaxis, campNfiftyvalueresultsdelta, type="b", col="slateblue4", lwd=2, pch=19)
lines(xaxis, campratiovalueresultsdelta, type="b", col="violetred4", lwd=2, pch=19)
title("Sensitivity Analysis-Net Difference in Total DALYs",cex=0.5)
axis(1,at=2:4,labels=c("Low Value","Average","High Value"))
op <- par(cex = 2)
legend("topleft", legend=c("exp to conc", "background","ecoli","log red.","water vol","air ex.","volume","heat v.","emission f.","stove power","eff.","energy","age","crypto k","crypto ratio","rota alpha","rota N","rota ratio","camp alpha","camp N", "camp ratio"),
       col=c("green", "red","yellow","blue","purple","black","gray","pink","coral","magenta","skyblue","deepskyblue","aquamarine","bisque4","deeppink","lightblue4","mediumseagreen","Salmon","thistle1","slateblue4","violetred4"), lty=1:2, cex=0.5)
#legend(0,2.8, lwd=c(5,2), col=c("green","red"), pch=c(15,19), y.intersp=1.5)

#plot(1:10, xaxt = "n", xlab='Some Letters')
#axis(1, at=1:10, labels=letters[1:10])

plot(xaxis, ecolilevelwaterdelta, xaxt="n",type="b", col="red", lwd=5, pch=15, xlab="Variation", ylab="Change in Water DALYs",ylim=c(-200,2),xlim=c(-0.25,5))
#lines(xaxis, backgroundresults, type="b", col="red", lwd=2, pch=19)
#lines(xaxis, ecolilevelresults, type="b", col="yellow", lwd=2, pch=19)
lines(xaxis, logreductionwaterdelta, type="b", col="yellow", lwd=2, pch=19)
lines(xaxis, drinkingwaterwaterdelta, type="b", col="black", lwd=2, pch=19)
#lines(xaxis, airexchangeresults, type="b", col="black", lwd=2, pch=19)
#lines(xaxis, volumeresults, type="b", col="gray", lwd=2, pch=19)
#lines(xaxis, heatvalueresults, type="b", col="pink", lwd=2, pch=19)
#lines(xaxis, emissionfactorresults, type="b", col="coral", lwd=2, pch=19)
#lines(xaxis, stovepowerresults, type="b", col="magenta", lwd=2, pch=19)
#lines(xaxis, efficiencyresults, type="b", col="skyblue", lwd=2, pch=19)
#lines(xaxis, energyresults, type="b", col="deepskyblue", lwd=2, pch=19)
lines(xaxis, agewaterdelta, type="b", col="orange", lwd=2, pch=19)
#lines(xaxis, cryptokvaluewater, type="b", col="blue", lwd=2, pch=19)
#lines(xaxis, cryptoratiovaluewater, type="b", col="green", lwd=2, pch=19)
#lines(xaxis, rotaalphavaluewater, type="b", col="royalblue", lwd=2, pch=19)
#lines(xaxis, rotaNfiftyvaluewater, type="b", col="powderblue", lwd=2, pch=19)
#lines(xaxis, rotaratiovaluewater, type="b", col="yellowgreen", lwd=2, pch=19)
#lines(xaxis, campalphavaluewater, type="b", col="navy", lwd=2, pch=19)
#lines(xaxis, campNfiftyvaluewater, type="b", col="slateblue4", lwd=2, pch=19)
#lines(xaxis, campratiovaluewater, type="b", col="seagreen", lwd=2, pch=19)
title("Sensitivity Analysis-Net Difference in Water DALYs",cex=0.4)
op <- par(cex = 2)
axis(1,at=2:4,labels=c("Low Value","Average","High Value"))
legend("topleft",legend=c("ecoli","log red.","water vol","age"),col=c("red","yellow","black","orange"),lty=1:3,cex=0.5)

plot(xaxis, cryptokvaluewaterdelta, xaxt="n",type="b", col="orange", lwd=5, pch=15, xlab="Variation", ylab="Change in Water DALYs",ylim=c(-100,2),xlim=c(-0.25,5))
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
lines(xaxis, cryptoratiovaluewaterdelta, type="b", col="green", lwd=2, pch=19)
lines(xaxis, rotaalphavaluewaterdelta, type="b", col="royalblue", lwd=2, pch=19)
lines(xaxis, rotaNfiftyvaluewaterdelta, type="b", col="powderblue", lwd=2, pch=19)
lines(xaxis, rotaratiovaluewaterdelta, type="b", col="yellowgreen", lwd=2, pch=19)
lines(xaxis, campalphavaluewaterdelta, type="b", col="navy", lwd=2, pch=19)
lines(xaxis, campNfiftyvaluewaterdelta, type="b", col="slateblue4", lwd=2, pch=19)
lines(xaxis, campratiovaluewaterdelta, type="b", col="red", lwd=2, pch=19)#http://127.0.0.1:29759/graphics/b4987376-b69b-40af-b517-56496c82c33d.png
title("Sensitivity Analysis-Net Difference in Water DALYs","Focus on Pathogen Parameters",cex=0.5)
axis(1,at=2:4,labels=c("Low Value","Average","High Value"))
op <- par(cex = 2)
legend("topleft",legend=c("crypto k value","crypto ratio value","rota alpha value","rota N fifty value","rota ratio value","camp alpha value","camp Nfifty","camp ratio"),
       col=c("orange","green","royalblue","powderblue","yellowgreen","navy","slateblue4","red"),lty=1:3,cex=0.5)

plot(xaxis, backgroundairdelta, xaxt="n",type="b", col="orange", lwd=5, pch=15, xlab="Variation", ylab="Change in Air DALYs",ylim=c(-10,15),xlim=c(-0.25,5))
#lines(xaxis, backgroundresults, type="b", col="red", lwd=2, pch=19)
#lines(xaxis, ecolilevelresults, type="b", col="yellow", lwd=2, pch=19)
#lines(xaxis, logreductionwater, type="b", col="yellow", lwd=2, pch=19)
lines(xaxis, drinkingwaterairdelta, type="b", col="black", lwd=2, pch=19)
lines(xaxis, airexchangeairdelta, type="b", col="blue", lwd=2, pch=19)
lines(xaxis, volumeairdelta, type="b", col="gray", lwd=2, pch=19)
lines(xaxis, heatvalueairdelta, type="b", col="pink", lwd=2, pch=19)
lines(xaxis, emissionfactorairdelta, type="b", col="coral", lwd=2, pch=19)
lines(xaxis, stovepowerairdelta, type="b", col="magenta", lwd=2, pch=19)
lines(xaxis, efficiencyairdelta, type="b", col="skyblue", lwd=2, pch=19)
lines(xaxis, energyairdelta, type="b", col="green", lwd=2, pch=19)
#lines(xaxis, ageresults, type="b", col="orange", lwd=2, pch=19)
#lines(xaxis, cryptokvaluewater, type="b", col="blue", lwd=2, pch=19)
#lines(xaxis, cryptoratiovaluewater, type="b", col="green", lwd=2, pch=19)
#lines(xaxis, rotaalphavaluewater, type="b", col="royalblue", lwd=2, pch=19)
#lines(xaxis, rotaNfiftyvaluewater, type="b", col="powderblue", lwd=2, pch=19)
#lines(xaxis, rotaratiovaluewater, type="b", col="yellowgreen", lwd=2, pch=19)
#lines(xaxis, campalphavaluewater, type="b", col="navy", lwd=2, pch=19)
#lines(xaxis, campNfiftyvaluewater, type="b", col="slateblue4", lwd=2, pch=19)
#lines(xaxis, campratiovaluewater, type="b", col="red", lwd=2, pch=19)
title("Sensitivity Analysis-Difference in Air DALYs",cex=0.5)
axis(1,at=2:4,labels=c("Low Value","Average","High Value"))
op <- par(cex = 2)
legend("bottomleft",legend=c("background","water volume","air exchange","volume","heating value","emission factor","Stove Power","Efficiency","Cooking energy"),
       col=c("orange","black","blue","gray","pink","coral","magenta","skyblue","green"),lty=1:3,cex=0.5)

### start plot 0

print("checks")
print(exposureresultsnetdiffdelta)
print(backgroundresultsnetdiffdelta)
print(ecolilevelresultsnetdiffdelta)
print(logreducationresultsnetdiffdelta)
print(drinkingwaterresultsnetdiffdelta)
xaxis=c(2,3,4)
print("Start plot 1")
plot(xaxis, exposureresultsnetdiffdelta, xaxt="n",type="b", col="green", lwd=5, pch=15, xlab="Variation", ylab="Net Change in DALYs",ylim=c(-50,100),xlim=c(-0.25,5))
lines(xaxis, backgroundresultsnetdiffdelta, type="b", col="red", lwd=2, pch=19)
lines(xaxis, ecolilevelresultsnetdiffdelta, type="b", col="yellow", lwd=2, pch=19)
lines(xaxis, logreductionresultsnetdiffdelta, type="b", col="blue", lwd=2, pch=19)
lines(xaxis, drinkingwaterresultsnetdiffdelta, type="b", col="purple", lwd=2, pch=19)
lines(xaxis, airexchangeresultsnetdiffdelta, type="b", col="black", lwd=2, pch=19)
lines(xaxis, volumeresultsnetdiffdelta, type="b", col="gray", lwd=2, pch=19)
lines(xaxis, heatvalueresultsnetdiffdelta, type="b", col="pink", lwd=2, pch=19)
lines(xaxis, emissionfactorresultsnetdiffdelta, type="b", col="coral", lwd=2, pch=19)
lines(xaxis, stovepowerresultsnetdiffdelta, type="b", col="magenta", lwd=2, pch=19)
lines(xaxis, efficiencyresultsnetdiffdelta, type="b", col="skyblue", lwd=2, pch=19)
lines(xaxis, energyresultsnetdiffdelta, type="b", col="deepskyblue", lwd=2, pch=19)
lines(xaxis, ageresultsnetdiffdelta, type="b", col="aquamarine", lwd=2, pch=19)
lines(xaxis, cryptokvalueresultsnetdiffdelta, type="b", col="bisque4", lwd=2, pch=19)
lines(xaxis, cryptoratiovalueresultsnetdiffdelta, type="b", col="deeppink", lwd=2, pch=19)
lines(xaxis, rotaalphavalueresultsnetdiffdelta, type="b", col="lightblue4", lwd=2, pch=19)
lines(xaxis, rotaNfiftyvalueresultsnetdiffdelta, type="b", col="mediumseagreen", lwd=2, pch=19)
lines(xaxis, rotaratiovalueresultsnetdiffdelta, type="b", col="salmon", lwd=2, pch=19)
lines(xaxis, campalphavalueresultsnetdiffdelta, type="b", col="thistle1", lwd=2, pch=19)
lines(xaxis, campNfiftyvalueresultsnetdiffdelta, type="b", col="slateblue4", lwd=2, pch=19)
lines(xaxis, campratiovalueresultsnetdiffdelta, type="b", col="violetred4", lwd=2, pch=19)
title("Sensitivity Analysis-Net Difference in Total Dalys from Water Boiling",cex=0.5)
axis(1,at=2:4,labels=c("Low Value","Average","High Value"))
op <- par(cex = 2)
legend("topleft", legend=c("exp to conc", "background","ecoli","log red.","water vol","air ex.","volume","heat v.","emission f.","stove power","eff.","energy","age","crypto k","crypto ratio","rota alpha","rota N","rota ratio","camp alpha","camp N", "camp ratio"),
       col=c("green", "red","yellow","blue","purple","black","gray","pink","coral","magenta","skyblue","deepskyblue","aquamarine","bisque4","deeppink","lightblue4","mediumseagreen","Salmon","thistle1","slateblue4","violetred4"), lty=1:2, cex=0.3)
#legend(0,2.8, lwd=c(5,2), col=c("green","red"), pch=c(15,19), y.intersp=1.5)

#plot(1:10, xaxt = "n", xlab='Some Letters')
####