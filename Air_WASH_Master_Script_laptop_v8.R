#This is the current version from 10/18/2022
setwd("C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022")
#setwd("/gpfs_common/share03/gaelanalysis/emfloess/guide/AirWater/")  # this is for the cluster
print("start!")
#source("Packages.R")
source("Libraries.R")
#---------------------------------------------------------------------------------------------------------------------
print("starting Vietnam child safe")
rm(list = ls())
variable = c()
print("define number seq")
#numberseq = seq(1,1000) #number of runs
numberseq = seq(1,1000) #number of runs
inputpopulation=10000

country <- "Vietnam"
personofinterest="child"
#waterqualitylevel<-"safe"
waterqualitylevel<-"low"
HAPITCHECK = "HAPIT"

currentpath <- "C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022/"
currentresultspath <-file.path("C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022/Results",country)
currentcountrypath <-file.path("C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022",country)
source("Air_water_code_April_2021_person_v23.R")
#print(odubgosdugb)
#------------------------------------------------------------------------------

print("starting Vietnam child low")
rm(list = ls())
variable = c()
print("define number seq")
numberseq = seq(1,1000) #number of runs
inputpopulation=10000

country <- "Vietnam"
personofinterest="child"
waterqualitylevel<-"low"
HAPITCHECK = "HAPIT"

currentpath <- "C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022/"
currentresultspath <-file.path("C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022/Results",country)
currentcountrypath <-file.path("C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022",country)
source("Air_water_code_April_2021_person_v23.R")
#------------------------------------------------------------------------------
print("starting Vietnam child medium")
rm(list = ls())
variable = c()
print("define number seq")
numberseq = seq(1,1000) #number of runs
inputpopulation=10000

country <- "Vietnam"
personofinterest="child"
waterqualitylevel<-"medium"
HAPITCHECK = "HAPIT"

currentpath <- "C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022/"
currentresultspath <-file.path("C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022/Results",country)
currentcountrypath <-file.path("C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022",country)
source("Air_water_code_April_2021_person_v23.R")
#------------------------------------------------------------------------------
print("starting Vietnam child high")
rm(list = ls())
variable = c()
print("define number seq")
numberseq = seq(1,1000) #number of runs
inputpopulation=10000

country <- "Vietnam"
personofinterest="child"
waterqualitylevel<-"high"
HAPITCHECK = "HAPIT"

currentpath <- "C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022/"
currentresultspath <-file.path("C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022/Results",country)
currentcountrypath <-file.path("C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022",country)
source("Air_water_code_April_2021_person_v23.R")
#------------------------------------------------------------------------------
####################################################################################


print("starting Vietnam adult safe")
rm(list = ls())
variable = c()
print("define number seq")
numberseq = seq(1,1000) #number of runs
inputpopulation=10000

country <- "Vietnam"
personofinterest="adult"
waterqualitylevel<-"safe"
HAPITCHECK = "HAPIT"

currentpath <- "C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022/"
currentresultspath <-file.path("C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022/Results",country)
currentcountrypath <-file.path("C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022",country)
source("Air_water_code_April_2021_person_v23.R")
#------------------------------------------------------------------------------

print("starting Vietnam adult low")
rm(list = ls())
variable = c()
print("define number seq")
numberseq = seq(1,1000) #number of runs
inputpopulation=10000

country <- "Vietnam"
personofinterest="adult"
waterqualitylevel<-"low"
HAPITCHECK = "HAPIT"

currentpath <- "C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022/"
currentresultspath <-file.path("C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022/Results",country)
currentcountrypath <-file.path("C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022",country)
source("Air_water_code_April_2021_person_v23.R")
#------------------------------------------------------------------------------
print("starting Vietnam adult medium")
rm(list = ls())
variable = c()
print("define number seq")
numberseq = seq(1,1000) #number of runs
inputpopulation=10000

country <- "Vietnam"
personofinterest="adult"
waterqualitylevel<-"medium"
HAPITCHECK = "HAPIT"

currentpath <- "C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022/"
currentresultspath <-file.path("C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022/Results",country)
currentcountrypath <-file.path("C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022",country)
source("Air_water_code_April_2021_person_v23.R")
#------------------------------------------------------------------------------
print("starting Vietnam adult high")
rm(list = ls())
variable = c()
print("define number seq")
numberseq = seq(1,1000) #number of runs
inputpopulation=10000

country <- "Vietnam"
personofinterest="adult"
waterqualitylevel<-"high"
HAPITCHECK = "HAPIT"

currentpath <- "C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022/"
currentresultspath <-file.path("C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022/Results",country)
currentcountrypath <-file.path("C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022",country)
source("Air_water_code_April_2021_person_v23.R")
#------------------------------------------------------------------------------
###########################################################################################################

#---------------------------------------------------------------------------------------------------------------------
print("starting Uganda child safe")
rm(list = ls())
variable = c()
print("define number seq")
numberseq = seq(1,1000) #number of runs
inputpopulation=10000

country <- "Uganda"
personofinterest="child"
waterqualitylevel<-"safe"
HAPITCHECK = "HAPIT"

currentpath <- "C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022/"
currentresultspath <-file.path("C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022/Results",country)
currentcountrypath <-file.path("C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022",country)
source("Air_water_code_April_2021_person_v23.R")
#------------------------------------------------------------------------------

print("starting Uganda child low")
rm(list = ls())
variable = c()
print("define number seq")
numberseq = seq(1,1000) #number of runs
inputpopulation=10000

country <- "Uganda"
personofinterest="child"
waterqualitylevel<-"low"
HAPITCHECK = "HAPIT"

currentpath <- "C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022/"
currentresultspath <-file.path("C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022/Results",country)
currentcountrypath <-file.path("C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022",country)
source("Air_water_code_April_2021_person_v23.R")
#------------------------------------------------------------------------------
print("starting Uganda child medium")
rm(list = ls())
variable = c()
print("define number seq")
numberseq = seq(1,1000) #number of runs
inputpopulation=10000

country <- "Uganda"
personofinterest="child"
waterqualitylevel<-"medium"
HAPITCHECK = "HAPIT"

currentpath <- "C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022/"
currentresultspath <-file.path("C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022/Results",country)
currentcountrypath <-file.path("C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022",country)
source("Air_water_code_April_2021_person_v23.R")
#------------------------------------------------------------------------------
print("starting Uganda child high")
rm(list = ls())
variable = c()
print("define number seq")
numberseq = seq(1,1000) #number of runs
inputpopulation=10000

country <- "Uganda"
personofinterest="child"
waterqualitylevel<-"high"
HAPITCHECK = "HAPIT"

currentpath <- "C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022/"
currentresultspath <-file.path("C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022/Results",country)
currentcountrypath <-file.path("C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022",country)
source("Air_water_code_April_2021_person_v23.R")
#------------------------------------------------------------------------------
####################################################################################


print("starting Uganda adult safe")
rm(list = ls())
variable = c()
print("define number seq")
numberseq = seq(1,1000) #number of runs
inputpopulation=10000

country <- "Uganda"
personofinterest="adult"
waterqualitylevel<-"safe"
HAPITCHECK = "HAPIT"

currentpath <- "C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022/"
currentresultspath <-file.path("C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022/Results",country)
currentcountrypath <-file.path("C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022",country)
source("Air_water_code_April_2021_person_v23.R")
#------------------------------------------------------------------------------

print("starting Uganda adult low")
rm(list = ls())
variable = c()
print("define number seq")
numberseq = seq(1,1000) #number of runs
inputpopulation=10000

country <- "Uganda"
personofinterest="adult"
waterqualitylevel<-"low"
HAPITCHECK = "HAPIT"

currentpath <- "C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022/"
currentresultspath <-file.path("C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022/Results",country)
currentcountrypath <-file.path("C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022",country)
source("Air_water_code_April_2021_person_v23.R")
#------------------------------------------------------------------------------
print("starting Uganda adult medium")
rm(list = ls())
variable = c()
print("define number seq")
numberseq = seq(1,1000) #number of runs
inputpopulation=10000

country <- "Uganda"
personofinterest="adult"
waterqualitylevel<-"medium"
HAPITCHECK = "HAPIT"

currentpath <- "C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022/"
currentresultspath <-file.path("C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022/Results",country)
currentcountrypath <-file.path("C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022",country)
source("Air_water_code_April_2021_person_v23.R")
#------------------------------------------------------------------------------
print("starting Uganda adult high")
rm(list = ls())
variable = c()
print("define number seq")
numberseq = seq(1,1000) #number of runs
inputpopulation=10000

country <- "Uganda"
personofinterest="adult"
waterqualitylevel<-"high"
HAPITCHECK = "HAPIT"

currentpath <- "C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022/"
currentresultspath <-file.path("C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022/Results",country)
currentcountrypath <-file.path("C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022",country)
source("Air_water_code_April_2021_person_v23.R")


########################################################################################################################################################
#######################################################################################################################################################
#######################################################################################################################################################
#######################################################################################################################################################

print("start plots!!")
country="Vietnam"
currentpath <- "C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022/"
#("C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022")
#currentpath <-"/gpfs_common/share03/gaelanalysis/emfloess/guide/AirWater"

#currentresultspath <-file.path("/gpfs_common/share03/gaelanalysis/emfloess/guide/AirWater/Results",country,"/")
currentresultspath <-file.path("C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022/Results",country)

#currentcountrypath <-file.path("/gpfs_common/share03/gaelanalysis/emfloess/guide/AirWater",country,"/")
currentcountrypath <-file.path("C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022",country)

source("AirWASHPlots_final_April_2021_Indicatedcountry_adult_and_child_Both_v7.R")

country="Uganda"
currentpath <- "C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022/"
("C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022")
#currentpath <-"/gpfs_common/share03/gaelanalysis/emfloess/guide/AirWater"

#currentresultspath <-file.path("/gpfs_common/share03/gaelanalysis/emfloess/guide/AirWater/Results",country,"/")
currentresultspath <-file.path("C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022/Results",country)

#currentcountrypath <-file.path("/gpfs_common/share03/gaelanalysis/emfloess/guide/AirWater",country,"/")
currentcountrypath <-file.path("C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022",country)
source("AirWASHPlots_final_April_2021_Indicatedcountry_adult_and_child_Both_v7.R")

