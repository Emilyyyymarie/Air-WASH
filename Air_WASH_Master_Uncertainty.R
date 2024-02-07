
rm(list = ls())
setwd("C:/Users/emily/Dropbox/Air WASH/Air-WASH/")

#source("Packages.R")
source("Libraries.R")

variable = c()

numberseq=seq(1,30000)
numberlength=length(numberseq)
inputpopulation=10000

#select country of interest
#country <- "Malawi"
country <- "Uganda"
#country <- "Vietnam"

personofinterest="child"
HAPITCHECK = ""

currentpath <- "C:/Users/emily/Dropbox/Air WASH/Air-WASH/"

currentresultspath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH",country)

currentcountrypath <-file.path("C:/Users/emily/Dropbox/Air WASH/Air-WASH",country)


source("UncertaintyAnalysis_distribution.R")




