rm(list = ls())
setwd("C:/Users/emily/Dropbox/NC State Spring 2021/Air-Water Spring/Updated Code")
#setwd("/gpfs_common/share03/gaelanalysis/emfloess/guide/AirWater/")

#
#
#source("Packages.R")
source("Libraries.R")

variable = c()
print("uncertainty")
numberseq=seq(1,1000)
numberlength=length(numberseq)
inputpopulation=10000

#country <- "Malawi"
country <- "Uganda"
#country <- "Vietnam"
#country <- "uncertainty"
personofinterest="child"
HAPITCHECK = ""

currentpath <- "C:/Users/emily/Dropbox/NC State Spring 2021/Air-Water Spring/Updated Code/"
#currentpath <-"/gpfs_common/share03/gaelanalysis/emfloess/guide/AirWater"

#currentresultspath <-file.path("/gpfs_common/share03/gaelanalysis/emfloess/guide/AirWater/Results",country,"/")
currentresultspath <-file.path("C:/Users/emily/Dropbox/NC State Spring 2021/Air-Water Spring/Updated Code/Results/Uncertainty",country)

#currentcountrypath <-file.path("/gpfs_common/share03/gaelanalysis/emfloess/guide/AirWater",country,"/")
currentcountrypath <-file.path("C:/Users/emily/Dropbox/NC State Spring 2021/Air-Water Spring/Updated Code",country)

#source("UncertaintyAnalysis_Summer2021_v6.R")
#source("UncertaintyAnalysis_Summer2021_percentile_v6.R")

source("UncertaintyAnalysis_Summer2021_distribution_v6.R")




