

if (personofinterest=="adult") {
  countrypop=read.csv2(paste(currentcountrypath,"/",country,"_population_GBD_adult.csv",sep=""),header=TRUE,sep=",")
} else if  (personofinterest == "child") {
  countrypop=read.csv2(paste(currentcountrypath,"/",country,"_population_GBD_child.csv",sep=""),header=TRUE,sep=",")
} else {
  print("error")
  print(stopstoppopulation)
}

age=as.numeric(countrypop$age_group_name)
agepop=as.numeric(countrypop$val)

totalpopulation=sum(agepop)



####
countrydata<-read.csv(paste(currentcountrypath,"/",country,"_households.csv",sep=""),header=TRUE) 
#averagehousehold =countrydata$?..averagehousehold
averagehousehold =countrydata$ averagehousehold
pplperhousehold=averagehousehold
numberchildrenunder5perHH=countrydata$childrenunder5perhh
numberadultsperHH=countrydata$adultsperhh
percentsolidfueluse=countrydata$dirtyfueluse 
households=inputpopulation/averagehousehold

lifeexpectancywomen = countrydata$lifeexpectancywomen
lifeexpectancyman = countrydata$lifeexpectancymen
lifeexpectancy= (lifeexpectancywomen+lifeexpectancyman)/2 


countrypopulation=countrydata$countrypopulation #2019 from GB
cookperhousehold=countrydata$cookperhh
childperhousehold=countrydata$childperhh
noncookperhousehold=countrydata$noncookperhh
adultperhousehold=cookperhousehold+noncookperhousehold
under5population=countrydata$under5population

###
HAPITCHECK=""
countryDALYparameters20plus <- read.table(paste(currentcountrypath,"/",country,"_DALYs_2019_20_plus",HAPITCHECK,".csv",sep=""), sep=",",header=TRUE)
countryDALYparametersunder5 <- read.table(paste(currentcountrypath,"/",country,"_DALYs_2019_under5",HAPITCHECK,".csv",sep=""), sep=",",header=TRUE)
countryDALYparameters_5_to_19 <- read.table(paste(currentcountrypath,"/",country,"_DALYs_2019_5_to_19",HAPITCHECK,".csv",sep=""), sep=",",header=TRUE)
DALYsmean_20plus <- countryDALYparameters20plus$val
DALYsupper_20plus <- countryDALYparameters20plus$upper
DALYslower_20plus <- countryDALYparameters20plus$lower

DALYsmeanunder5 <- countryDALYparametersunder5$val
DALYsupperunder5 <- countryDALYparametersunder5$upper
DALYslowerunder5 <- countryDALYparametersunder5$lower

DALYsmean_5_to_19 <- countryDALYparameters_5_to_19$val
DALYsupper_5_to_19 <- countryDALYparameters_5_to_19$upper
DALYslower_5_to_19 <- countryDALYparameters_5_to_19$lower

ALRIDALYunder5 =DALYsmeanunder5[4]
ALRIDALYupperunder5 =DALYsupperunder5[4]
ALRIDALYlowerunder5= DALYslowerunder5[4]
COPDDALYunder5 =DALYsmeanunder5[1]
COPDDALYupperunder5= DALYsupperunder5[1]
COPDDALYlowerunder5 =DALYslowerunder5[1]
IHDDALYunder5=DALYsmeanunder5[2]
IHDDALYupperunder5 =DALYsupperunder5[2]
IHDDALYlowerunder5 =DALYslowerunder5[2]
LCDALYunder5 = DALYsmeanunder5[5]
LCDALYupperunder5=DALYsupperunder5[5]
LCDALYlowerunder5= DALYslowerunder5[5]
StrokeDALYunder5=DALYsmeanunder5[3]
StrokeDALYupperunder5=DALYsupperunder5[3]
StrokeDALYlowerunder5 = DALYslowerunder5[3]

ALRIDALY_5_to_19 =DALYsmean_5_to_19[4]
ALRIDALYupper_5_to_19 =DALYsupper_5_to_19[4]
ALRIDALYlower_5_to_19= DALYslower_5_to_19[4]
COPDDALY_5_to_19 =DALYsmean_5_to_19[1]
COPDDALYupper_5_to_19= DALYsupper_5_to_19[1]
COPDDALYlower_5_to_19 =DALYslower_5_to_19[1]
IHDDALY_5_to_19=DALYsmean_5_to_19[2]
IHDDALYupper_5_to_19 =DALYsupper_5_to_19[2]
IHDDALYlower_5_to_19 =DALYslower_5_to_19[2]
LCDALY_5_to_19 = DALYsmean_5_to_19[5]
LCDALYupper_5_to_19=DALYsupper_5_to_19[5]
LCDALYlower_5_to_19= DALYslower_5_to_19[5]
StrokeDALY_5_to_19=DALYsmean_5_to_19[3]
StrokeDALYupper_5_to_19=DALYsupper_5_to_19[3]
StrokeDALYlower_5_to_19 = DALYslower_5_to_19[3]

ALRIDALY_20plus =DALYsmean_20plus[4]
ALRIDALYupper_20plus =DALYsupper_20plus[4]
ALRIDALYlower_20plus= DALYslower_20plus[4]
COPDDALY_20plus =DALYsmean_20plus[1]
COPDDALYupper_20plus= DALYsupper_20plus[1]
COPDDALYlower_20plus =DALYslower_20plus[1]
IHDDALY_20plus=DALYsmean_20plus[2]
IHDDALYupper_20plus =DALYsupper_20plus[2]
IHDDALYlower_20plus =DALYslower_20plus[2]
LCDALY_20plus = DALYsmean_20plus[5]
LCDALYupper_20plus=DALYsupper_20plus[5]
LCDALYlower_20plus= DALYslower_20plus[5]
StrokeDALY_20plus=DALYsmean_20plus[3]
StrokeDALYupper_20plus=DALYsupper_20plus[3]
StrokeDALYlower_20plus = DALYslower_20plus[3]


###
print("get COPD, ALRI,IHD,LC Stroke")
CRparametersCOPD <- read.table("Health/COPD.csv", sep=",",header=TRUE)
alphaCOPD <-CRparametersCOPD$alpha
betaCOPD <-CRparametersCOPD$beta
deltaCOPD <-CRparametersCOPD$delta
zcfCOPD <-CRparametersCOPD$zcf

#ALRI
CRparametersALRI <- read.table("Health/ALRI.csv", sep=",",header=TRUE)
alphaALRI <-CRparametersALRI$alpha
betaALRI <-CRparametersALRI$beta
deltaALRI <-CRparametersALRI$delta
zcfALRI <-CRparametersALRI$zcf

#IHD
CRparametersIHD <- read.table("Health/IHD.csv", sep=",",header=TRUE)
alphaIHD <-CRparametersIHD$alpha
betaIHD <-CRparametersIHD$beta
deltaIHD <-CRparametersIHD$delta
zcfIHD <-CRparametersIHD$zcf

#LC
CRparametersLC <- read.table("Health/LC.csv", sep=",",header=TRUE)
alphaLC <-CRparametersLC$alpha
betaLC <-CRparametersLC$beta
deltaLC <-CRparametersLC$delta
zcfLC <-CRparametersLC$zcf

#stroke
CRparametersstroke <- read.table("Health/stroke.csv", sep=",",header=TRUE)
alphastroke <-CRparametersstroke$alpha
betastroke <-CRparametersstroke$beta
deltastroke <-CRparametersstroke$delta
zcfstroke <-CRparametersstroke$zcf