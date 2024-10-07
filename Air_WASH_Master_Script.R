setwd("C:/Users/emily/Dropbox/Air WASH/Air-WASH")

#If running for the first time, run:
#source("Packages.R")
source("Libraries.R")

#set working directory
#########################
print("Uganda child low")
rm(list = ls())
variable = c()
print("define number seq")
numberseq = seq(1,1000) #number of runs
inputpopulation=10000
country <- "Uganda"
personofinterest="child"
waterqualitylevel<-"low"
currentpath <- "C:/Users/emily/Dropbox/Air WASH/Air-WASH/"
currentresultspath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/Results/logremoval",country)
currentcountrypath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/",country)
source("Air_water_code_person_log_removal_wateronly.R")

print("Uganda child medium")
rm(list = ls())
variable = c()
print("define number seq")
numberseq = seq(1,1000) #number of runs
inputpopulation=10000
country <- "Uganda"
personofinterest="child"
waterqualitylevel<-"medium"
currentpath <- "C:/Users/emily/Dropbox/Air WASH/Air-WASH/"
currentresultspath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/Results/logremoval",country)
currentcountrypath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/",country)
source("Air_water_code_person_log_removal_wateronly.R")

print("Uganda child high")
rm(list = ls())
variable = c()
print("define number seq")
numberseq = seq(1,1000) #number of runs
inputpopulation=10000
country <- "Uganda"
personofinterest="child"
waterqualitylevel<-"high"
currentpath <- "C:/Users/emily/Dropbox/Air WASH/Air-WASH/"
currentresultspath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/Results/logremoval",country)
currentcountrypath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/",country)
source("Air_water_code_person_log_removal_wateronly.R")

print("Uganda adult low")
rm(list = ls())
variable = c()
print("define number seq")
numberseq = seq(1,1000) #number of runs
inputpopulation=10000
country <- "Uganda"
personofinterest="adult"
waterqualitylevel<-"low"
currentpath <- "C:/Users/emily/Dropbox/Air WASH/Air-WASH/"
currentresultspath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/Results/logremoval",country)
currentcountrypath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/",country)
source("Air_water_code_person_log_removal_wateronly.R")

print("Uganda adult medium")
rm(list = ls())
variable = c()
print("define number seq")
numberseq = seq(1,1000) #number of runs
inputpopulation=10000
country <- "Uganda"
personofinterest="adult"
waterqualitylevel<-"medium"
currentpath <- "C:/Users/emily/Dropbox/Air WASH/Air-WASH/"
currentresultspath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/Results/logremoval",country)
currentcountrypath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/",country)
source("Air_water_code_person_log_removal_wateronly.R")

print("Uganda adult high")
rm(list = ls())
variable = c()
print("define number seq")
numberseq = seq(1,1000) #number of runs
inputpopulation=10000
country <- "Uganda"
personofinterest="adult"
waterqualitylevel<-"high"
currentpath <- "C:/Users/emily/Dropbox/Air WASH/Air-WASH/"
currentresultspath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/Results/logremoval",country)
currentcountrypath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/",country)
source("Air_water_code_person_log_removal_wateronly.R")
print(stop)
print(obdougbsodugbeousgbsoubf)
#############################3
print("Vietnam child low")
rm(list = ls())
variable = c()
numberseq = seq(1,10000) #number of runs
inputpopulation=10000

country <- "Vietnam"
personofinterest="child"
waterqualitylevel<-"low"
 

currentpath <- "C:/Users/emily/Dropbox/Air WASH/Air-WASH/"
currentresultspath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/Results",country)
currentcountrypath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/",country)
source("Air_water_code_person.R")

#------------------------------------------------------------------------------

print(" Vietnam child safe")
rm(list = ls())
variable = c()
print("define number seq")
numberseq = seq(1,10000) #number of runs
inputpopulation=10000
country <- "Vietnam"
personofinterest="child"
waterqualitylevel<-"safe"
 

currentpath <- "C:/Users/emily/Dropbox/Air WASH/Air-WASH/"
currentresultspath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/Results",country)
currentcountrypath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/",country)
source("Air_water_code_person.R")
#------------------------------------------------------------------------------
print("Vietnam child medium")
rm(list = ls())
variable = c()
print("define number seq")
numberseq = seq(1,10000) #number of runs
inputpopulation=10000

country <- "Vietnam"
personofinterest="child"
waterqualitylevel<-"medium"
 

currentpath <- "C:/Users/emily/Dropbox/Air WASH/Air-WASH/"
currentresultspath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/Results",country)
currentcountrypath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/",country)
source("Air_water_code_person.R")
#------------------------------------------------------------------------------
print("Vietnam child high")
rm(list = ls())
variable = c()
print("define number seq")
numberseq = seq(1,10000) #number of runs
inputpopulation=10000

country <- "Vietnam"
personofinterest="child"
waterqualitylevel<-"high"
 

currentpath <- "C:/Users/emily/Dropbox/Air WASH/Air-WASH/"
currentresultspath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/Results",country)
currentcountrypath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/",country)
source("Air_water_code_person.R")
#------------------------------------------------------------------------------
####################################################################################


print("Vietnam adult safe")
rm(list = ls())
variable = c()
print("define number seq")
numberseq = seq(1,10000) #number of runs
inputpopulation=10000

country <- "Vietnam"
personofinterest="adult"
waterqualitylevel<-"safe"
 

currentpath <- "C:/Users/emily/Dropbox/Air WASH/Air-WASH/"
currentresultspath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/Results",country)
currentcountrypath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/",country)
source("Air_water_code_person.R")
#------------------------------------------------------------------------------

print("Vietnam adult low")
rm(list = ls())
variable = c()
print("define number seq")
numberseq = seq(1,10000) #number of runs
inputpopulation=10000

country <- "Vietnam"
personofinterest="adult"
waterqualitylevel<-"low"
 

currentpath <- "C:/Users/emily/Dropbox/Air WASH/Air-WASH/"
currentresultspath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/Results",country)
currentcountrypath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/",country)
source("Air_water_code_person.R")
#------------------------------------------------------------------------------
print("Vietnam adult medium")
rm(list = ls())
variable = c()
print("define number seq")
numberseq = seq(1,10000) #number of runs
inputpopulation=10000

country <- "Vietnam"
personofinterest="adult"
waterqualitylevel<-"medium"
 

currentpath <- "C:/Users/emily/Dropbox/Air WASH/Air-WASH/"
currentresultspath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/Results",country)
currentcountrypath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/",country)
source("Air_water_code_person.R")
#------------------------------------------------------------------------------
print("Vietnam adult high")
rm(list = ls())
variable = c()
print("define number seq")
numberseq = seq(1,10000) #number of runs
inputpopulation=10000

country <- "Vietnam"
personofinterest="adult"
waterqualitylevel<-"high"
 

currentpath <- "C:/Users/emily/Dropbox/Air WASH/Air-WASH/"
currentresultspath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/Results",country)
currentcountrypath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/",country)
source("Air_water_code_person.R")

#---------------------------------------------------------------------------------------------------------------------
print("Uganda child safe")
rm(list = ls())
variable = c()
print("define number seq")
numberseq = seq(1,10000) #number of runs
inputpopulation=10000

country <- "Uganda"
personofinterest="child"
waterqualitylevel<-"safe"
 

currentpath <- "C:/Users/emily/Dropbox/Air WASH/Air-WASH/"
currentresultspath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/Results",country)
currentcountrypath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/",country)
source("Air_water_code_person.R")
#------------------------------------------------------------------------------

print("Uganda child low")
rm(list = ls())
variable = c()
print("define number seq")
numberseq = seq(1,10000) #number of runs
inputpopulation=10000

country <- "Uganda"
personofinterest="child"
waterqualitylevel<-"low"
 

currentpath <- "C:/Users/emily/Dropbox/Air WASH/Air-WASH/"
currentresultspath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/Results",country)
currentcountrypath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/",country)
source("Air_water_code_person.R")
#------------------------------------------------------------------------------
print("Uganda child medium")
rm(list = ls())
variable = c()
print("define number seq")
numberseq = seq(1,10000) #number of runs
inputpopulation=10000

country <- "Uganda"
personofinterest="child"
waterqualitylevel<-"medium"
 

currentpath <- "C:/Users/emily/Dropbox/Air WASH/Air-WASH/"
currentresultspath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/Results",country)
currentcountrypath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/",country)
source("Air_water_code_person.R")
#------------------------------------------------------------------------------
print("Uganda child high")
rm(list = ls())
variable = c()
print("define number seq")
numberseq = seq(1,10000) #number of runs
inputpopulation=10000

country <- "Uganda"
personofinterest="child"
waterqualitylevel<-"high"
 

currentpath <- "C:/Users/emily/Dropbox/Air WASH/Air-WASH/"
currentresultspath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/Results",country)
currentcountrypath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/",country)
source("Air_water_code_person.R")
#------------------------------------------------------------------------------

print("Uganda adult safe")
rm(list = ls())
variable = c()
print("define number seq")
numberseq = seq(1,10000) #number of runs
inputpopulation=10000

country <- "Uganda"
personofinterest="adult"
waterqualitylevel<-"safe"
 

currentpath <- "C:/Users/emily/Dropbox/Air WASH/Air-WASH/"
currentresultspath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/Results",country)
currentcountrypath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/",country)
source("Air_water_code_person.R")
#------------------------------------------------------------------------------

print("Uganda adult low")
rm(list = ls())
variable = c()
print("define number seq")
numberseq = seq(1,10000) #number of runs
inputpopulation=10000

country <- "Uganda"
personofinterest="adult"
waterqualitylevel<-"low"
 

currentpath <- "C:/Users/emily/Dropbox/Air WASH/Air-WASH/"
currentresultspath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/Results",country)
currentcountrypath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/",country)
source("Air_water_code_person.R")
#------------------------------------------------------------------------------
print("Uganda adult medium")
rm(list = ls())
variable = c()
print("define number seq")
numberseq = seq(1,10000) #number of runs
inputpopulation=10000

country <- "Uganda"
personofinterest="adult"
waterqualitylevel<-"medium"
 

currentpath <- "C:/Users/emily/Dropbox/Air WASH/Air-WASH/"
currentresultspath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/Results",country)
currentcountrypath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/",country)
source("Air_water_code_person.R")
#------------------------------------------------------------------------------
print("Uganda adult high")
rm(list = ls())
variable = c()
print("define number seq")
numberseq = seq(1,10000) #number of runs
inputpopulation=10000

country <- "Uganda"
personofinterest="adult"
waterqualitylevel<-"high"
 

currentpath <- "C:/Users/emily/Dropbox/Air WASH/Air-WASH/"
currentresultspath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/Results",country)
currentcountrypath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH/",country)
source("Air_water_code_person.R")

