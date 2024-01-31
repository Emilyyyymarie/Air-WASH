print("adult air ")
PMsummary<-read.csv(file.path(currentresultspath,paste("PMsummaryDALYs",country,"adult.csv",sep="")),header=TRUE)
PMsummarysd<-read.csv(file.path(currentresultspath,paste("PMsummaryDALYssd",country,"adult.csv",sep="")),header=TRUE)
AirPMaverage<-read.csv(file.path(currentresultspath,paste("airPMaveragedata",country,"adult.csv",sep="")),header=TRUE)
AirPMsd<-read.csv(file.path(currentresultspath,paste("airPMsddata",country,"adult.csv",sep="")),header=TRUE)

print("child air")
PMsummarychild<-read.csv(file.path(currentresultspath,paste("PMsummaryDALYs",country,"child.csv",sep="")),header=TRUE)
PMsummarysdchild<-read.csv(file.path(currentresultspath,paste("PMsummaryDALYssd",country,"child.csv",sep="")),header=TRUE)
AirPMaveragechild<-read.csv(file.path(currentresultspath,paste("airPMaveragedata",country,"child.csv",sep="")),header=TRUE)
AirPMsdchild<-read.csv(file.path(currentresultspath,paste("airPMsddata",country,"child.csv",sep="")), header=TRUE)


##########################################################################################################################
#Read in averages of PM Concentrations
avgminimotocooking<-AirPMaverage$avgminimotocooking
avgminimotowaterheating<-AirPMaverage$avgminimotowaterheating
avgminimotowatercooking<-AirPMaverage$avgminimotowatercooking

avgimprovedcooking<-AirPMaverage$avgimprovedcooking
avgimprovedwaterheating<-AirPMaverage$avgimprovedwaterheating
avgimprovedwatercooking<-AirPMaverage$avgimprovedwatercooking

avgCharcoalcooking<-AirPMaverage$avgcharcoalcooking
avgCharcoalwaterheating<-AirPMaverage$avgcharcoalwaterheating
avgCharcoalwatercooking<-AirPMaverage$avgcharcoalwatercooking

avgsmokeycooking<-AirPMaverage$avgsmokeycooking
avgsmokeywaterheating<-AirPMaverage$avgsmokeywaterheating
avgsmokeywatercooking<-AirPMaverage$avgsmokeywatercooking

avgcleancooking<-AirPMaverage$avgCleancooking
avgcleanwaterheating<-AirPMaverage$avgCleanwaterheating
avgcleanwatercooking<-AirPMaverage$avgCleanwatercooking

avgLPGcooking<-AirPMaverage$avgLPGcooking
avgLPGwaterheating<-AirPMaverage$avgLPGwaterheating
avgLPGwatercooking<-AirPMaverage$avgLPGwatercooking

##
sdminimotocooking<-AirPMsd$sdminimotocooking
sdminimotowaterheating<-AirPMsd$sdminimotowaterheating
sdminimotowatercooking<-AirPMsd$sdminimotowatercooking

sdimprovedcooking<-AirPMsd$sdimprovedcooking
sdimprovedwaterheating<-AirPMsd$sdimprovedwaterheating
sdimprovedwatercooking<-AirPMsd$sdimprovedwatercooking

sdCharcoalcooking<-AirPMsd$sdcharcoalcooking
sdCharcoalwaterheating<-AirPMsd$sdcharcoalwaterheating
sdCharcoalwatercooking<-AirPMsd$sdcharcoalwatercooking

sdsmokeycooking<-AirPMsd$sdsmokeycooking
sdsmokeywaterheating<-AirPMsd$sdsmokeywaterheating
sdsmokeywatercooking<-AirPMsd$sdsmokeywatercooking

sdcleancooking<-AirPMsd$sdCleancooking
sdcleanwaterheating<-AirPMsd$sdCleanwaterheating
sdcleanwatercooking<-AirPMsd$sdCleanwatercooking

sdLPGcooking<-AirPMsd$sdLPGcooking
sdLPGwaterheating<-AirPMsd$sdLPGwaterheating
sdLPGwatercooking<-AirPMsd$sdLPGwatercooking


print("For adult PM DALYs")
minimotocDALYsavg=as.numeric((PMsummary[1])) #DALYs gasifier cooking only
minimotowhDALYsavg=as.numeric((PMsummary[2]))#minimotowaterheatingDALYs
minimotowhcDALYsavg=as.numeric((PMsummary[3]))#minimotowatercooking
minimotoDALYsdiff=minimotowhcDALYsavg-minimotocDALYsavg
smokeycDALYsavg=as.numeric((PMsummary[4])) #smokeycooking
smokeywhDALYsavg=as.numeric((PMsummary[5]))#smokeysmokeywaterheating
smokeywhcDALYsavg=as.numeric((PMsummary[6]))#smokeycookingwaterheating
smokeyDALYsdiff=smokeywhcDALYsavg-smokeycDALYsavg
improvedcDALYsavg=as.numeric((PMsummary[7])) #improvedcooking
improvedwhDALYsavg=as.numeric((PMsummary[8])) #improved Water heating
improvedwhcDALYsavg=as.numeric((PMsummary[9])) #improved cooking water heating
improvedDALYsdiff=improvedwhcDALYsavg-improvedcDALYsavg
charcoalcDALYsavg=as.numeric((PMsummary[10])) #charcoalcooking
charcoalwhDALYsavg=as.numeric((PMsummary[11])) #charcoal Water heating
CharcoalwhcDALYsavg=as.numeric((PMsummary[12])) #charcoal cooking water heating
charcoalDALYsdiff=CharcoalwhcDALYsavg-charcoalcDALYsavg
LPGcDALYsavg=as.numeric((PMsummary[13])) #LPGcooking
LPGwhDALYsavg=as.numeric((PMsummary[14])) #LPG Water heating
LPGwhcDALYsavg=as.numeric((PMsummary[15])) #LPG cooking water heating
LPGDALYsdiff=LPGwhcDALYsavg-LPGcDALYsavg
cleancDALYsavg=as.numeric((PMsummary[16])) #cleancooking
cleanwhDALYsavg=as.numeric((PMsummary[17])) #clean Water heating
cleanwhcDALYsavg=as.numeric((PMsummary[18])) #clean cooking water heating
cleanDALYsdiff=cleanwhcDALYsavg-cleancDALYsavg

minimotocDALYssd=as.numeric((PMsummarysd[1])) #DALYs gasifier cooking only
minimotowhDALYssd=as.numeric((PMsummarysd[2]))#minimotowaterheatingDALYs
minimotowhcDALYssd=as.numeric((PMsummarysd[3]))#minimotowatercooking
smokeycDALYssd=as.numeric((PMsummarysd[4])) #smokeycooking
smokeywhDALYssd=as.numeric((PMsummarysd[5]))#smokeysmokeywaterheating
smokeywhcDALYssd=as.numeric((PMsummarysd[6]))#smokeycookingwaterheating
improvedcDALYssd=as.numeric((PMsummarysd[7])) #improvedcooking
improvedwhDALYssd=as.numeric((PMsummarysd[8])) #improved Water heating
improvedwhcDALYssd=as.numeric((PMsummarysd[9])) #improved cooking water heating
charcoalcDALYssd=as.numeric((PMsummarysd[10])) #charcoalcooking
charcoalwhDALYssd=as.numeric((PMsummarysd[11])) #charcoal Water heating
charcoalwhcDALYssd=as.numeric((PMsummarysd[12])) #charcoal cooking water heating
LPGcDALYssd=as.numeric((PMsummarysd[13])) #LPGcooking
LPGwhDALYssd=as.numeric((PMsummarysd[14])) #LPG Water heating
LPGwhcDALYssd=as.numeric((PMsummarysd[15])) #LPG cooking water heating
cleancDALYssd=as.numeric((PMsummarysd[16])) #cleancooking
cleanwhDALYssd=as.numeric((PMsummarysd[17])) #clean Water heating
cleanwhcDALYssd=as.numeric((PMsummarysd[18])) #clean cooking water heating

###

print("For child PM DALYs")
minimotocDALYsavgchild=as.numeric((PMsummarychild[1])) #DALYs gasifier cooking only
minimotowhDALYsavgchild=as.numeric((PMsummarychild[2]))#minimotowaterheatingDALYs
minimotowhcDALYsavgchild=as.numeric((PMsummarychild[3]))#minimotowatercooking
minimotoDALYsdiffchild=minimotowhcDALYsavgchild-minimotocDALYsavgchild
smokeycDALYsavgchild=as.numeric((PMsummarychild[4])) #smokeycooking
smokeywhDALYsavgchild=as.numeric((PMsummarychild[5]))#smokeysmokeywaterheating
smokeywhcDALYsavgchild=as.numeric((PMsummarychild[6]))#smokeycookingwaterheating
smokeyDALYsdiffchild=smokeywhcDALYsavgchild-smokeycDALYsavgchild
improvedcDALYsavgchild=as.numeric((PMsummarychild[7])) #improvedcooking
improvedwhDALYsavgchild=as.numeric((PMsummarychild[8])) #improved Water heating
improvedwhcDALYsavgchild=as.numeric((PMsummarychild[9])) #improved cooking water heating
improvedDALYsdiffchild=improvedwhcDALYsavgchild-improvedcDALYsavgchild
charcoalcDALYsavgchild=as.numeric((PMsummarychild[10])) #charcoalcooking
charcoalwhDALYsavgchild=as.numeric((PMsummarychild[11])) #charcoal Water heating
CharcoalwhcDALYsavgchild=as.numeric((PMsummarychild[12])) #charcoal cooking water heating
charcoalDALYsdiffchild=CharcoalwhcDALYsavgchild-charcoalcDALYsavgchild
LPGcDALYsavgchild=as.numeric((PMsummarychild[13])) #LPGcooking
LPGwhDALYsavgchild=as.numeric((PMsummarychild[14])) #LPG Water heating
LPGwhcDALYsavgchild=as.numeric((PMsummarychild[15])) #LPG cooking water heating
LPGDALYsdiffchild=LPGwhcDALYsavgchild-LPGcDALYsavgchild
cleancDALYsavgchild=as.numeric((PMsummarychild[16])) #cleancooking
cleanwhDALYsavgchild=as.numeric((PMsummarychild[17])) #clean Water heating
cleanwhcDALYsavgchild=as.numeric((PMsummarychild[18])) #clean cooking water heating
cleanDALYsdiffchild=cleanwhcDALYsavgchild-cleancDALYsavgchild

minimotocDALYssdchild=as.numeric((PMsummarysdchild[1])) #DALYs gasifier cooking only
minimotowhDALYssdchild=as.numeric((PMsummarysdchild[2]))#minimotowaterheatingDALYs
minimotowhcDALYssdchild=as.numeric((PMsummarysdchild[3]))#minimotowatercooking
smokeycDALYssdchild=as.numeric((PMsummarysdchild[4])) #smokeycooking
smokeywhDALYssdchild=as.numeric((PMsummarysdchild[5]))#smokeysmokeywaterheating
smokeywhcDALYssdchild=as.numeric((PMsummarysdchild[6]))#smokeycookingwaterheating
improvedcDALYssdchild=as.numeric((PMsummarysdchild[7])) #improvedcooking
improvedwhDALYssdchild=as.numeric((PMsummarysdchild[8])) #improved Water heating
improvedwhcDALYssdchild=as.numeric((PMsummarysdchild[9])) #improved cooking water heating
charcoalcDALYssdchild=as.numeric((PMsummarysdchild[10])) #charcoalcooking
charcoalwhDALYssdchild=as.numeric((PMsummarysdchild[11])) #charcoal Water heating
charcoalwhcDALYssdchild=as.numeric((PMsummarysdchild[12])) #charcoal cooking water heating
LPGcDALYssdchild=as.numeric((PMsummarysdchild[13])) #LPGcooking
LPGwhDALYssdchild=as.numeric((PMsummarysdchild[14])) #LPG Water heating
LPGwhcDALYssdchild=as.numeric((PMsummarysdchild[15])) #LPG cooking water heating
cleancDALYssdchild=as.numeric((PMsummarysdchild[16])) #cleancooking
cleanwhDALYssdchild=as.numeric((PMsummarysdchild[17])) #clean Water heating
cleanwhcDALYssdchild=as.numeric((PMsummarysdchild[18])) #clean cooking water heating

#Totals

print("For total PM DALYs")
minimotocDALYsavgtotal=as.numeric((PMsummarychild[1]))+as.numeric((PMsummary[1])) #DALYs gasifier cooking only
minimotowhDALYsavgtotal=as.numeric((PMsummarychild[2]))+as.numeric((PMsummary[2]))#minimotowaterheatingDALYs
minimotowhcDALYsavgtotal=as.numeric((PMsummarychild[3]))+as.numeric((PMsummary[3]))#minimotowatercooking
minimotoDALYsdifftotal=minimotowhcDALYsavgtotal-minimotocDALYsavgtotal
smokeycDALYsavgtotal=as.numeric((PMsummarychild[4]))+as.numeric((PMsummary[4])) #smokeycooking
smokeywhDALYsavgtotal=as.numeric((PMsummarychild[5]))+as.numeric((PMsummary[5]))#smokeysmokeywaterheating
smokeywhcDALYsavgtotal=as.numeric((PMsummarychild[6]))+as.numeric((PMsummary[6]))#smokeycookingwaterheating
smokeyDALYsdifftotal=smokeywhcDALYsavgtotal-smokeycDALYsavgtotal
improvedcDALYsavgtotal=as.numeric((PMsummarychild[7]))+as.numeric((PMsummary[7])) #improvedcooking
improvedwhDALYsavgtotal=as.numeric((PMsummarychild[8]))+as.numeric((PMsummary[8])) #improved Water heating
improvedwhcDALYsavgtotal=as.numeric((PMsummarychild[9]))+as.numeric((PMsummary[9])) #improved cooking water heating
improvedDALYsdifftotal=improvedwhcDALYsavgtotal-improvedcDALYsavgtotal
charcoalcDALYsavgtotal=as.numeric((PMsummarychild[10]))+as.numeric((PMsummary[10])) #charcoalcooking
charcoalwhDALYsavgtotal=as.numeric((PMsummarychild[11]))+as.numeric((PMsummary[11])) #charcoal Water heating
CharcoalwhcDALYsavgtotal=as.numeric((PMsummarychild[12]))+as.numeric((PMsummary[12])) #charcoal cooking water heating
charcoalDALYsdifftotal=CharcoalwhcDALYsavgtotal-charcoalcDALYsavgtotal
LPGcDALYsavgtotal=as.numeric((PMsummarychild[13]))+as.numeric((PMsummary[13])) #LPGcooking
LPGwhDALYsavgtotal=as.numeric((PMsummarychild[14]))+as.numeric((PMsummary[14])) #LPG Water heating
LPGwhcDALYsavgtotal=as.numeric((PMsummarychild[15]))+as.numeric((PMsummary[15])) #LPG cooking water heating
LPGDALYsdifftotal=LPGwhcDALYsavgtotal-LPGcDALYsavgtotal
cleancDALYsavgtotal=as.numeric((PMsummarychild[16]))+as.numeric((PMsummary[16])) #cleancooking
cleanwhDALYsavgtotal=as.numeric((PMsummarychild[17]))+as.numeric((PMsummary[17])) #clean Water heating
cleanwhcDALYsavgtotal=as.numeric((PMsummarychild[18]))+as.numeric((PMsummary[18])) #clean cooking water heating
cleanDALYsdifftotal=cleanwhcDALYsavgtotal-cleancDALYsavgtotal

minimotocDALYssdtotal=as.numeric((PMsummarysdchild[1]))+as.numeric((PMsummarysd[1])) #DALYs gasifier cooking only
minimotowhDALYssdtotal=as.numeric((PMsummarysdchild[2]))+as.numeric((PMsummarysd[2]))#minimotowaterheatingDALYs
minimotowhcDALYssdtotal=as.numeric((PMsummarysdchild[3]))+as.numeric((PMsummarysd[3]))#minimotowatercooking
smokeycDALYssdtotal=as.numeric((PMsummarysdchild[4]))+as.numeric((PMsummarysd[4])) #smokeycooking
smokeywhDALYssdtotal=as.numeric((PMsummarysdchild[5]))+as.numeric((PMsummarysd[5]))#smokeysmokeywaterheating
smokeywhcDALYssdtotal=as.numeric((PMsummarysdchild[6]))+as.numeric((PMsummarysd[6]))#smokeycookingwaterheating
improvedcDALYssdtotal=as.numeric((PMsummarysdchild[7]))+as.numeric((PMsummarysd[7])) #improvedcooking
improvedwhDALYssdtotal=as.numeric((PMsummarysdchild[8]))+as.numeric((PMsummarysd[8])) #improved Water heating
improvedwhcDALYssdtotal=as.numeric((PMsummarysdchild[9]))+as.numeric((PMsummarysd[9])) #improved cooking water heating
charcoalcDALYssdtotal=as.numeric((PMsummarysdchild[10]))+as.numeric((PMsummarysd[10])) #charcoalcooking
charcoalwhDALYssdtotal=as.numeric((PMsummarysdchild[11]))+as.numeric((PMsummarysd[11])) #charcoal Water heating
charcoalwhcDALYssdtotal=as.numeric((PMsummarysdchild[12]))+as.numeric((PMsummarysd[12])) #charcoal cooking water heating
LPGcDALYssdtotal=as.numeric((PMsummarysdchild[13]))+as.numeric((PMsummarysd[13])) #LPGcooking
LPGwhDALYssdtotal=as.numeric((PMsummarysdchild[14]))+as.numeric((PMsummarysd[14])) #LPG Water heating
LPGwhcDALYssdtotal=as.numeric((PMsummarysdchild[15]))+as.numeric((PMsummarysd[15])) #LPG cooking water heating
cleancDALYssdtotal=as.numeric((PMsummarysdchild[16]))+as.numeric((PMsummarysd[16])) #cleancooking
cleanwhDALYssdtotal=as.numeric((PMsummarysdchild[17]))+as.numeric((PMsummarysd[17])) #clean Water heating
cleanwhcDALYssdtotal=as.numeric((PMsummarysdchild[18]))+as.numeric((PMsummarysd[18])) #clean cooking water heating




####
####
###
###Adult water variables
#low risk variables
#"C:\Users\emily\Dropbox\Air WASH\Air-WASH\Results\Uganda\waterDALYsdataUgandachildmedium.csv"
watersummaryadultlow<-read.csv(file.path(currentresultspath,paste("waterDALYsdata",country,"adultlow.csv",sep="")),header=TRUE) #example
watersummaryadultlowsd<-read.csv(file.path(currentresultspath,paste("waterDALYsdatasd",country,"adultlow.csv",sep="")),header=TRUE) #example  

watersummaryadultmedium<-read.csv(file.path(currentresultspath,paste("waterDALYsdata",country,"adultmedium.csv",sep="")),header=TRUE) #example
watersummaryadultmediumsd<-read.csv(file.path(currentresultspath,paste("waterDALYsdatasd",country,"adultmedium.csv",sep="")),header=TRUE) #example

watersummaryadulthigh<-read.csv(file.path(currentresultspath,paste("waterDALYsdata",country,"adulthigh.csv",sep="")),header=TRUE) #example
watersummaryadulthighsd<-read.csv(file.path(currentresultspath,paste("waterDALYsdatasd",country,"adulthigh.csv",sep="")),header=TRUE) #example

watersummarychildlow<-read.csv(file.path(currentresultspath,paste("waterDALYsdata",country,"childlow.csv",sep="")),header=TRUE) #example
watersummarychildlowsd<-read.csv(file.path(currentresultspath,paste("waterDALYsdatasd",country,"childlow.csv",sep="")),header=TRUE) #example  

watersummarychildmedium<-read.csv(file.path(currentresultspath,paste("waterDALYsdata",country,"childmedium.csv",sep="")),header=TRUE) #example
watersummarychildmediumsd<-read.csv(file.path(currentresultspath,paste("waterDALYsdatasd",country,"childmedium.csv",sep="")),header=TRUE) #example

watersummarychildhigh<-read.csv(file.path(currentresultspath,paste("waterDALYsdata",country,"childhigh.csv",sep="")),header=TRUE) #example
watersummarychildhighsd<-read.csv(file.path(currentresultspath,paste("waterDALYsdatasd",country,"childhigh.csv",sep="")),header=TRUE) #example


##differences
waterdiffsdchildlow<-read.csv(file.path(currentresultspath,paste("waterDALYsdatadiffsd",country,"childlow.csv",sep="")),header=TRUE) #example
waterdiffsdchildmedium<-read.csv(file.path(currentresultspath,paste("waterDALYsdatadiffsd",country,"childmedium.csv",sep="")),header=TRUE) #example
waterdiffsdchildhigh<-read.csv(file.path(currentresultspath,paste("waterDALYsdatadiffsd",country,"childhigh.csv",sep="")),header=TRUE) #example
waterdiffsdadultlow<-read.csv(file.path(currentresultspath,paste("waterDALYsdatadiffsd",country,"adultlow.csv",sep="")),header=TRUE) #example
waterdiffsdadultmedium<-read.csv(file.path(currentresultspath,paste("waterDALYsdatadiffsd",country,"adultmedium.csv",sep="")),header=TRUE) #example
waterdiffsdadulthigh<-read.csv(file.path(currentresultspath,paste("waterDALYsdatadiffsd",country,"adulthigh.csv",sep="")),header=TRUE) #example

#read in values adults low risk, medium risk, high risk

lableveldiffsdadultlr=as.numeric(waterdiffsdadultlow$sdlabboilingdiff) # lab level
verygooddiffsdadultlr=as.numeric(waterdiffsdadultlow$sdgoodboilingdiff) #very good
moderatediffsdadultlr=as.numeric(waterdiffsdadultlow$sdineffectiveboilingdiff) # moderate
gooddiffsdadultlr=as.numeric(waterdiffsdadultlow$sdmoderateboilingdiff) #good
loweffectivediffsdadultlr=as.numeric(waterdiffsdadultlow$sdworseboilingdiff) # low effective
ineffectivediffsdadultlr=as.numeric(waterdiffsdadultlow$sdbadzeroboilingdiff) #ineffecctive
negativediffsdadultlr=as.numeric(waterdiffsdadultlow$sdnegativeboilingdiff)#negative boiling


lableveldiffsdadultmr=as.numeric(waterdiffsdadultmedium$sdlabboilingdiff) # lab level
verygooddiffsdadultmr=as.numeric(waterdiffsdadultmedium$sdgoodboilingdiff) #very good
moderatediffsdadultmr=as.numeric(waterdiffsdadultmedium$sdineffectiveboilingdiff) # moderate
gooddiffsdadultmr=as.numeric(waterdiffsdadultmedium$sdmoderateboilingdiff) #good
loweffectivediffsdadultmr=as.numeric(waterdiffsdadultmedium$sdworseboilingdiff) # low effective
ineffectivediffsdadultmr=as.numeric(waterdiffsdadultmedium$sdbadzeroboilingdiff) #ineffecctive
negativediffsdadultmr=as.numeric(waterdiffsdadultmedium$sdnegativeboilingdiff)#negative boiling

lableveldiffsdadulthr=as.numeric(waterdiffsdadulthigh$sdlabboilingdiff) # lab level
verygooddiffsdadulthr=as.numeric(waterdiffsdadulthigh$sdgoodboilingdiff) #very good
moderatediffsdadulthr=as.numeric(waterdiffsdadulthigh$sdineffectiveboilingdiff) # moderate
gooddiffsdadulthr=as.numeric(waterdiffsdadulthigh$sdmoderateboilingdiff) #good
loweffectivediffsdadulthr=as.numeric(waterdiffsdadulthigh$sdworseboilingdiff) # low effective
ineffectivediffsdadulthr=as.numeric(waterdiffsdadulthigh$sdbadzeroboilingdiff) #ineffecctive
negativediffsdadulthr=as.numeric(waterdiffsdadulthigh$sdnegativeboilingdiff)#negative boiling

###################
#read in values child low risk, medium risk, high risk

lableveldiffsdchildlr=as.numeric(waterdiffsdchildlow$sdlabboilingdiff) # lab level
verygooddiffsdchildlr=as.numeric(waterdiffsdchildlow$sdgoodboilingdiff) #very good
moderatediffsdchildlr=as.numeric(waterdiffsdchildlow$sdineffectiveboilingdiff) # moderate
gooddiffsdchildlr=as.numeric(waterdiffsdchildlow$sdmoderateboilingdiff) #good
loweffectivediffsdchildlr=as.numeric(waterdiffsdchildlow$sdworseboilingdiff) # low effective
ineffectivediffsdchildlr=as.numeric(waterdiffsdchildlow$sdbadzeroboilingdiff) #ineffecctive
negativediffsdchildlr=as.numeric(waterdiffsdchildlow$sdnegativeboilingdiff)#negative boiling


lableveldiffsdchildmr=as.numeric(waterdiffsdchildmedium$sdlabboilingdiff) # lab level
verygooddiffsdchildmr=as.numeric(waterdiffsdchildmedium$sdgoodboilingdiff) #very good
moderatediffsdchildmr=as.numeric(waterdiffsdchildmedium$sdineffectiveboilingdiff) # moderate
gooddiffsdchildmr=as.numeric(waterdiffsdchildmedium$sdmoderateboilingdiff) #good
loweffectivediffsdchildmr=as.numeric(waterdiffsdchildmedium$sdworseboilingdiff) # low effective
ineffectivediffsdchildmr=as.numeric(waterdiffsdchildmedium$sdbadzeroboilingdiff) #ineffecctive
negativediffsdchildmr=as.numeric(waterdiffsdchildmedium$sdnegativeboilingdiff)#negative boiling

lableveldiffsdchildhr=as.numeric(waterdiffsdchildhigh$sdlabboilingdiff) # lab level
verygooddiffsdchildhr=as.numeric(waterdiffsdchildhigh$sdgoodboilingdiff) #very good
moderatediffsdchildhr=as.numeric(waterdiffsdchildhigh$sdineffectiveboilingdiff) # moderate
gooddiffsdchildhr=as.numeric(waterdiffsdchildhigh$sdmoderateboilingdiff) #good
loweffectivediffsdchildhr=as.numeric(waterdiffsdchildhigh$sdworseboilingdiff) # low effective
ineffectivediffsdchildhr=as.numeric(waterdiffsdchildhigh$sdbadzeroboilingdiff) #ineffecctive
negativediffsdchildhr=as.numeric(waterdiffsdchildhigh$sdnegativeboilingdiff)#negative boiling
#####################
###
# low risk adult 
noboilingptlr=as.numeric(watersummaryadultlow$meannoboiling)
lablevelptlr=as.numeric(watersummaryadultlow$meanlabboiling) # lab level
verygoodptlr=as.numeric(watersummaryadultlow$meangoodboiling) #very good
moderateptlr=as.numeric(watersummaryadultlow$meanineffectiveboiling) # moderate
goodptlr=as.numeric(watersummaryadultlow$meanmoderateboiling) #good
loweffectiveptlr=as.numeric(watersummaryadultlow$meanworseboiling) # low effective
ineffectiveptlr=as.numeric(watersummaryadultlow$meanbadzeroboiling) #ineffecctive
negativeptlr=as.numeric(watersummaryadultlow$meannegativeboiling)#negative boiling

#medium risk adult
noboilingptmr=as.numeric(watersummaryadultmedium$meannoboiling)
lablevelptmr=as.numeric(watersummaryadultmedium$meanlabboiling) # lab level
verygoodptmr=as.numeric(watersummaryadultmedium$meangoodboiling) #very good
moderateptmr=as.numeric(watersummaryadultmedium$meanineffectiveboiling) # moderate
goodptmr=as.numeric(watersummaryadultmedium$meanmoderateboiling) #good
loweffectiveptmr=as.numeric(watersummaryadultmedium$meanworseboiling) # low effective
ineffectiveptmr=as.numeric(watersummaryadultmedium$meanbadzeroboiling) #ineffecctive
negativeptmr=as.numeric(watersummaryadultmedium$meannegativeboiling)#negative boiling

#high risk adult
noboilingpthr=as.numeric(watersummaryadulthigh$meannoboiling)
lablevelpthr=as.numeric(watersummaryadulthigh$meanlabboiling) # lab level
verygoodpthr=as.numeric(watersummaryadulthigh$meangoodboiling) #very good
moderatepthr=as.numeric(watersummaryadulthigh$meanineffectiveboiling) # moderate
goodpthr=as.numeric(watersummaryadulthigh$meanmoderateboiling) #good
loweffectivepthr=as.numeric(watersummaryadulthigh$meanworseboiling) # low effective
ineffectivepthr=as.numeric(watersummaryadulthigh$meanbadzeroboiling) #ineffecctive
negativepthr=as.numeric(watersummaryadulthigh$meannegativeboiling)#negative boiling
###########
#low risk sd
noboilingptlrsd=as.numeric(watersummaryadultlowsd$sdnoboiling)
lablevelptlrsd=as.numeric(watersummaryadultlowsd$sdlabboiling) # lab level
verygoodptlrsd=as.numeric(watersummaryadultlowsd$sdgoodboiling) #very good
moderateptlrsd=as.numeric(watersummaryadultlowsd$sdineffectiveboiling) # moderate
goodptlrsd=as.numeric(watersummaryadultlowsd$sdmoderateboiling) #good
loweffectiveptlrsd=as.numeric(watersummaryadultlowsd$sdworseboiling) # low effective
ineffectiveptlrsd=as.numeric(watersummaryadultlowsd$sdbadzeroboiling) #ineffecctive
negativeptlrsd=as.numeric(watersummaryadultlowsd$sdnegativeboiling)#negative boiling

#medium risk sd
noboilingptmrsd=as.numeric(watersummaryadultmediumsd$sdnoboiling)
lablevelptmrsd=as.numeric(watersummaryadultmediumsd$sdlabboiling) # lab level
verygoodptmrsd=as.numeric(watersummaryadultmediumsd$sdgoodboiling) #very good
moderateptmrsd=as.numeric(watersummaryadultmediumsd$sdineffectiveboiling) # moderate
goodptmrsd=as.numeric(watersummaryadultmediumsd$sdmoderateboiling) #good
loweffectiveptmrsd=as.numeric(watersummaryadultmediumsd$sdworseboiling) # low effective
ineffectiveptmrsd=as.numeric(watersummaryadultmediumsd$sdbadzeroboiling) #ineffecctive
negativeptmrsd=as.numeric(watersummaryadultmediumsd$sdnegativeboiling)#negative boiling

#high risk sd
noboilingpthrsd=as.numeric(watersummaryadulthighsd$sdnoboiling)
lablevelpthrsd=as.numeric(watersummaryadulthighsd$sdlabboiling) # lab level
verygoodpthrsd=as.numeric(watersummaryadulthighsd$sdgoodboiling) #very good
moderatepthrsd=as.numeric(watersummaryadulthighsd$sdineffectiveboiling) # moderate
goodpthrsd=as.numeric(watersummaryadulthighsd$sdmoderateboiling) #good
loweffectivepthrsd=as.numeric(watersummaryadulthighsd$sdworseboiling) # low effective
ineffectivepthrsd=as.numeric(watersummaryadulthighsd$sdbadzeroboiling) #ineffecctive
negativepthrsd=as.numeric(watersummaryadulthighsd$sdnegativeboiling)#negative boiling

### Finish adult

##starting child
# low risk child
noboilingptlrchild=as.numeric(watersummarychildlow$meannoboiling)
lablevelptlrchild=as.numeric(watersummarychildlow$meanlabboiling) # lab level
verygoodptlrchild=as.numeric(watersummarychildlow$meangoodboiling) #very good
moderateptlrchild=as.numeric(watersummarychildlow$meanineffectiveboiling) # moderate
goodptlrchild=as.numeric(watersummarychildlow$meanmoderateboiling) #good
loweffectiveptlrchild=as.numeric(watersummarychildlow$meanworseboiling) # low effective
ineffectiveptlrchild=as.numeric(watersummarychildlow$meanbadzeroboiling) #ineffecctive
negativeptlrchild=as.numeric(watersummarychildlow$meannegativeboiling)#negative boiling

#medium risk child
noboilingptmrchild=as.numeric(watersummarychildmedium$meannoboiling)
lablevelptmrchild=as.numeric(watersummarychildmedium$meanlabboiling) # lab level
verygoodptmrchild=as.numeric(watersummarychildmedium$meangoodboiling) #very good
moderateptmrchild=as.numeric(watersummarychildmedium$meanineffectiveboiling) # moderate
goodptmrchild=as.numeric(watersummarychildmedium$meanmoderateboiling) #good
loweffectiveptmrchild=as.numeric(watersummarychildmedium$meanworseboiling) # low effective
ineffectiveptmrchild=as.numeric(watersummarychildmedium$meanbadzeroboiling) #ineffecctive
negativeptmrchild=as.numeric(watersummarychildmedium$meannegativeboiling)#negative boiling

#high risk child
noboilingpthrchild=as.numeric(watersummarychildhigh$meannoboiling)
lablevelpthrchild=as.numeric(watersummarychildhigh$meanlabboiling) # lab level
verygoodpthrchild=as.numeric(watersummarychildhigh$meangoodboiling) #very good
moderatepthrchild=as.numeric(watersummarychildhigh$meanineffectiveboiling) # moderate
goodpthrchild=as.numeric(watersummarychildhigh$meanmoderateboiling) #good
loweffectivepthrchild=as.numeric(watersummarychildhigh$meanworseboiling) # low effective
ineffectivepthrchild=as.numeric(watersummarychildhigh$meanbadzeroboiling) #ineffecctive
negativepthrchild=as.numeric(watersummarychildhigh$meannegativeboiling)#negative boiling
###########
#sd for children
#low risk sd
noboilingptlrsdchild=as.numeric(watersummarychildlowsd$sdnoboiling)
lablevelptlrsdchild=as.numeric(watersummarychildlowsd$sdlabboiling) # lab level
verygoodptlrsdchild=as.numeric(watersummarychildlowsd$sdgoodboiling) #very good
moderateptlrsdchild=as.numeric(watersummarychildlowsd$sdineffectiveboiling) # moderate
goodptlrsdchild=as.numeric(watersummarychildlowsd$sdmoderateboiling) #good
loweffectiveptlrsdchild=as.numeric(watersummarychildlowsd$sdworseboiling) # low effective
ineffectiveptlrsdchild=as.numeric(watersummarychildlowsd$sdbadzeroboiling) #ineffecctive
negativeptlrsdchild=as.numeric(watersummarychildlowsd$sdnegativeboiling)#negative boiling

#medium risk sd
noboilingptmrsdchild=as.numeric(watersummarychildmediumsd$sdnoboiling)
lablevelptmrsdchild=as.numeric(watersummarychildmediumsd$sdlabboiling) # lab level
verygoodptmrsdchild=as.numeric(watersummarychildmediumsd$sdgoodboiling) #very good
moderateptmrsdchild=as.numeric(watersummarychildmediumsd$sdineffectiveboiling) # moderate
goodptmrsdchild=as.numeric(watersummarychildmediumsd$sdmoderateboiling) #good
loweffectiveptmrsdchild=as.numeric(watersummarychildmediumsd$sdworseboiling) # low effective
ineffectiveptmrsdchild=as.numeric(watersummarychildmediumsd$sdbadzeroboiling) #ineffecctive
negativeptmrsdchild=as.numeric(watersummarychildmediumsd$sdnegativeboiling)#negative boiling

#high risk sd
noboilingpthrsdchild=as.numeric(watersummarychildhighsd$sdnoboiling)
lablevelpthrsdchild=as.numeric(watersummarychildhighsd$sdlabboiling) # lab level
verygoodpthrsdchild=as.numeric(watersummarychildhighsd$sdgoodboiling) #very good
moderatepthrsdchild=as.numeric(watersummarychildhighsd$sdineffectiveboiling) # moderate
goodpthrsdchild=as.numeric(watersummarychildhighsd$sdmoderateboiling) #good
loweffectivepthrsdchild=as.numeric(watersummarychildhighsd$sdworseboiling) # low effective
ineffectivepthrsdchild=as.numeric(watersummarychildhighsd$sdbadzeroboiling) #ineffecctive
negativepthrsdchild=as.numeric(watersummarychildhighsd$sdnegativeboiling)#negative boiling


#########################################################################################################################
#read in values to create totals of differences

#watersummaryadultlow<-read.csv(file.path(currentresultspath,paste("waterDALYsdata",country,"adultlow.csv",sep="")),header=TRUE) #example
#watersummaryadultlowsd<-read.csv(file.path(currentresultspath,paste("waterDALYsdatasd",country,"adultlow.csv",sep="")),header=TRUE) #example  

#waterDALYsnegativeboilingdiffVietnamadult