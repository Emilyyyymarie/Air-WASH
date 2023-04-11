#This is the current version from 10/18/2022
setwd("C:/Users/emily/Dropbox/NC Fall 2021/Air WASH Spring 2022/Air WASH Code Updated October 2022")
#setwd("/gpfs_common/share03/gaelanalysis/emfloess/guide/AirWater/")  # this is for the cluster
print("start!")
#source("Packages.R")
source("Libraries.R")

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

