
#February 21,2023
#updated to be color blind friendly

# The palette with grey:
cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

# The palette with black:
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

#Palette with blue purple orange

redyellowblue <- c("Blue2","Darkorange4","cyan")
numberseq=c(1,1000)
runs=1000
print(country)

print("adult")

watersummary<-read.csv(file.path(currentresultspath,paste("waterDALYsdata",country,"adult.csv",sep="")),header=TRUE)
print("Finish first")
watersummarysd<-read.csv(file.path(currentresultspath,paste("waterDALYsdatasd",country,"adult.csv",sep="")),header=TRUE)
PMsummary<-read.csv(file.path(currentresultspath,paste("PMsummaryDALYs",country,"adult.csv",sep="")),header=TRUE)
PMsummarysd<-read.csv(file.path(currentresultspath,paste("PMsummaryDALYssd",country,"adult.csv",sep="")),header=TRUE)
AirPMaverage<-read.csv(file.path(currentresultspath,paste("airPMaveragedata",country,"adult.csv",sep="")),header=TRUE)
AirPMsd<-read.csv(file.path(currentresultspath,paste("airPMsddata",country,"adult.csv",sep="")),header=TRUE)


print("child")
watersummarychild<-read.csv(file.path(currentresultspath,paste("waterDALYsdata",country,"child.csv",sep="")),header=TRUE)
watersummarysdchild<-read.csv(file.path(currentresultspath,paste("waterDALYsdatasd",country,"child.csv",sep="")),header=TRUE)
#watersummarychilddiff<-read.csv(file.path(currentresultspath,paste("waterDALYsdata",country,"child.csv",sep="")),header=TRUE)
#watersummarysdchilddiff<-read.csv(file.path(currentresultspath,paste("waterDALYsdatasd",country,"child.csv",sep="")),header=TRUE)
PMsummarychild<-read.csv(file.path(currentresultspath,paste("PMsummaryDALYs",country,"child.csv",sep="")),header=TRUE)
PMsummarysdchild<-read.csv(file.path(currentresultspath,paste("PMsummaryDALYssd",country,"child.csv",sep="")),header=TRUE)
AirPMaveragechild<-read.csv(file.path(currentresultspath,paste("airPMaveragedata",country,"child.csv",sep="")),header=TRUE)
AirPMsdchild<-read.csv(file.path(currentresultspath,paste("airPMsddata",country,"child.csv",sep="")), header=TRUE)

print("totals Differences")
#difftotalwateraverage<-read.csv(file.path(currentresultspath,paste("watertotaldiffaverage",country,sep="")),header=TRUE)
difftotalwatersd<-read.csv(file.path(currentresultspath,paste("difftotalwatersd",country,".csv",sep="")),header=TRUE)


print(difftotalwatersd)


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




##
LPG=c(avgLPGwaterheating,avgLPGcooking,avgLPGwatercooking)
Charcoal=c(avgCharcoalwaterheating,avgCharcoalcooking,avgCharcoalwatercooking)
minimoto=c(avgminimotowaterheating,avgminimotocooking,avgminimotowatercooking)
improved=c(avgimprovedwaterheating,avgimprovedcooking,avgimprovedwatercooking)
smokey=c(avgsmokeywaterheating,avgsmokeycooking,avgsmokeywatercooking)
clean=c(avgcleanwaterheating,avgcleancooking,avgcleanwatercooking)

LPGsd=c(sdLPGwaterheating,sdLPGcooking,sdLPGwatercooking)
Charcoalsd=c(sdCharcoalwaterheating,sdCharcoalcooking,sdCharcoalwatercooking)
minimotosd=c(sdminimotowaterheating,sdminimotocooking,sdminimotowatercooking)
improvedsd=c(sdimprovedwaterheating,sdimprovedcooking,sdimprovedwatercooking)
smokeysd=c(sdsmokeywaterheating,sdsmokeycooking,sdsmokeywatercooking)
cleansd=c(sdcleanwaterheating,sdcleancooking,sdcleanwatercooking)



PMstovematrix = cbind(clean,LPG,minimoto,Charcoal,improved,smokey)

Stovenames =c(rep("Electric",3),rep("LPG",3),rep("Gasifier",3),rep("Charcoal",3),rep("Imp. Wood",3),rep("Trad. Wood",3))
Stove_use =c(rep(c("Water Heating","Cooking","Water Heating & Cooking"),6))#,rep("Cooking",4),rep("Water Heating & Cooking",4))
PMlevels=c(clean,LPG,minimoto,Charcoal,improved,smokey)
PMsd = c(cleansd,LPGsd,minimotosd,Charcoalsd,improvedsd,smokeysd)
PMstovedataframe <- data.frame(Stovenames,Stove_use,PMlevels,PMsd)
#keep
newplotnew<-ggplot(data=PMstovedataframe, aes(x=Stovenames, y=PMlevels, fill=Stove_use))+
  geom_bar(stat="identity", position=position_dodge())+geom_errorbar( aes(ymin=PMlevels-PMsd, ymax=PMlevels+PMsd), width=.2,position=position_dodge(.9))+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),panel.background = element_blank(), axis.line = element_line(colour = "black"),text = element_text(size = 20),axis.text=element_text(size=20),legend.key=element_blank(),plot.title = element_text(hjust = 0.5))+ggtitle("") +
  ylab("Avg 24-Hr Kitchen PM2.5 Conc. ug/m^3")+xlab("Stove Type")+scale_color_manual(values=c("green", "orange", "blue"))
print(newplotnew)
##

ecolilevel=watersummary$ecolilevel
###
lowrisk=which(abs(ecolilevel-1)==min(abs(ecolilevel-1)))
mediumrisk=which(abs(ecolilevel-11)==min(abs(ecolilevel-11)))
highrisk=which(abs(ecolilevel-100)==min(abs(ecolilevel-100)))
veryhighrisk=which(abs(ecolilevel-1000)==min(abs(ecolilevel-1000)))

##
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
noboilingptlr=as.numeric(watersummary[lowrisk,2])#no boiling
lablevelptlr=as.numeric(watersummary[lowrisk,3]) # lab level
verygoodptlr=as.numeric(watersummary[lowrisk,4]) #very good
moderateptlr=as.numeric(watersummary[lowrisk,5]) # moderate
goodptlr=as.numeric(watersummary[lowrisk,6]) #good
loweffectiveptlr=as.numeric(watersummary[lowrisk,7]) # low effective
ineffectiveptlr=as.numeric(watersummary[lowrisk,8]) #ineffecctive
negativeptlr=as.numeric(watersummary[lowrisk,9])#negative boiling

noboilingptmr=as.numeric(watersummary[mediumrisk,2])#no boiling
lablevelptmr=as.numeric(watersummary[mediumrisk,3]) # lab level
verygoodptmr=as.numeric(watersummary[mediumrisk,4]) #very good
moderateptmr=as.numeric(watersummary[mediumrisk,5]) # moderate
goodptmr=as.numeric(watersummary[mediumrisk,6]) #good
loweffectiveptmr=as.numeric(watersummary[mediumrisk,7]) # low effective
ineffectiveptmr=as.numeric(watersummary[mediumrisk,8]) #ineffecctive
negativeptmr=as.numeric(watersummary[mediumrisk,9]) #negative boiling
print("start high risk")
noboilingpthr=as.numeric(watersummary[highrisk,2])#no boiling
lablevelpthr=as.numeric(watersummary[highrisk,3]) # lab level
verygoodpthr=as.numeric(watersummary[highrisk,4]) #very good
moderatepthr=as.numeric(watersummary[highrisk,5]) # moderate
goodpthr=as.numeric(watersummary[highrisk,6]) #good
loweffectivepthr=as.numeric(watersummary[highrisk,7]) # low effective
ineffectivepthr=as.numeric(watersummary[highrisk,8]) #ineffecctive
negativepthr=as.numeric(watersummary[highrisk,9]) #negative boiling
###########

noboilingptlrsd=as.numeric(watersummarysd[lowrisk,2])#no boiling
lablevelptlrsd=as.numeric(watersummarysd[lowrisk,3]) # lab level
verygoodptlrsd=as.numeric(watersummarysd[lowrisk,4]) #very good
moderateptlrsd=as.numeric(watersummarysd[lowrisk,5]) # moderate
goodptlrsd=as.numeric(watersummarysd[lowrisk,6]) #good
loweffectiveptlrsd=as.numeric(watersummarysd[lowrisk,7]) # low effective
ineffectiveptlrsd=as.numeric(watersummarysd[lowrisk,8]) #ineffecctive
negativeptlrsd=as.numeric(watersummarysd[lowrisk,9])#negative boiling

noboilingptmrsd=as.numeric(watersummarysd[mediumrisk,2])#no boiling
lablevelptmrsd=as.numeric(watersummarysd[mediumrisk,3]) # lab level
verygoodptmrsd=as.numeric(watersummarysd[mediumrisk,4]) #very good
moderateptmrsd=as.numeric(watersummarysd[mediumrisk,5]) # moderate
goodptmrsd=as.numeric(watersummarysd[mediumrisk,6]) #good
loweffectiveptmrsd=as.numeric(watersummarysd[mediumrisk,7]) # low effective
ineffectiveptmrsd=as.numeric(watersummarysd[mediumrisk,8]) #ineffecctive
negativeptmrsd=as.numeric(watersummarysd[mediumrisk,9]) #negative boiling

noboilingpthrsd=as.numeric(watersummarysd[highrisk,2])#no boiling
lablevelpthrsd=as.numeric(watersummarysd[highrisk,3]) # lab level
verygoodpthrsd=as.numeric(watersummarysd[highrisk,4]) #very good
moderatepthrsd=as.numeric(watersummarysd[highrisk,5]) # moderate
goodpthrsd=as.numeric(watersummarysd[highrisk,6]) #good
loweffectivepthrsd=as.numeric(watersummarysd[highrisk,7]) # low effective
ineffectivepthrsd=as.numeric(watersummarysd[highrisk,8]) #ineffecctive
negativepthrsd=as.numeric(watersummarysd[highrisk,9]) #negative boiling

print("startvery high risk")
noboilingptvhr=as.numeric(watersummary[veryhighrisk,2])#no boiling
lablevelpthvr=as.numeric(watersummary[veryhighrisk,3]) # lab level
verygoodptvhr=as.numeric(watersummary[veryhighrisk,4]) #very good
moderateptvhr=as.numeric(watersummary[veryhighrisk,5]) # moderate
goodptvhr=as.numeric(watersummary[veryhighrisk,6]) #good
loweffectiveptvhr=as.numeric(watersummary[veryhighrisk,7]) # low effective
ineffectiveptvhr=as.numeric(watersummary[veryhighrisk,8]) #ineffecctive
negativeptvhr=as.numeric(watersummary[veryhighrisk,9]) #negative boiling

noboilingptvhrsd=as.numeric(watersummarysd[veryhighrisk,2])#no boiling
lablevelptvhrsd=as.numeric(watersummarysd[veryhighrisk,3]) # lab level
verygoodptvhrsd=as.numeric(watersummarysd[veryhighrisk,4]) #very good
moderateptvhrsd=as.numeric(watersummarysd[veryhighrisk,5]) # moderate
goodptvhrsd=as.numeric(watersummarysd[veryhighrisk,6]) #good
loweffectiveptvhrsd=as.numeric(watersummarysd[veryhighrisk,7]) # low effective
ineffectiveptvhrsd=as.numeric(watersummarysd[veryhighrisk,8]) #ineffecctive
negativeptvhrsd=as.numeric(watersummarysd[veryhighrisk,9]) #negative boiling
###########

boilingdiffuncertaintylr=c(((noboilingptlrsd^2)/runs+(lablevelptlrsd^2)/runs)^0.5,((noboilingptlrsd^2)/runs+(verygoodptlrsd^2)/runs)^0.5,((noboilingptlrsd^2)/runs+(goodptlrsd^2)/runs)^0.5,((noboilingptlrsd^2)/runs+(moderateptlrsd^2)/runs)^0.5,((noboilingptlrsd^2)/runs+(loweffectiveptlrsd^2)/runs)^0.5,((noboilingptlrsd^2)/runs+(ineffectiveptlrsd^2)/runs)^0.5,((noboilingptlrsd^2)/runs+(negativeptlrsd^2)/runs)^0.5)
boilingdiffuncertaintymr=c(((noboilingptmrsd^2)/runs+(lablevelptmrsd^2)/runs)^0.5,((noboilingptmrsd^2)/runs+(verygoodptmrsd^2)/runs)^0.5,((noboilingptmrsd^2)/runs+(goodptmrsd^2)/runs)^0.5,((noboilingptmrsd^2)/runs+(moderateptmrsd^2)/runs)^0.5,((noboilingptmrsd^2)/runs+(loweffectiveptmrsd^2)/runs)^0.5,((noboilingptmrsd^2)/runs+(ineffectiveptmrsd^2)/runs)^0.5,((noboilingptmrsd^2)/runs+(negativeptmrsd^2)/runs)^0.5)
boilingdiffuncertaintyhr=c(((noboilingpthrsd^2)/runs+(lablevelpthrsd^2)/runs)^0.5,((noboilingpthrsd^2)/runs+(verygoodpthrsd^2)/runs)^0.5,((noboilingpthrsd^2)/runs+(goodpthrsd^2)/runs)^0.5,((noboilingpthrsd^2)/runs+(moderatepthrsd^2)/runs)^0.5,((noboilingpthrsd^2)/runs+(loweffectivepthrsd^2)/runs)^0.5,((noboilingpthrsd^2)/runs+(ineffectivepthrsd^2)/runs)^0.5,((noboilingpthrsd^2)/runs+(negativepthrsd^2)/runs)^0.5)

boilingdiffuncgroup=c(boilingdiffuncertaintylr,boilingdiffuncertaintymr,boilingdiffuncertaintyhr)

###########differences
lablevelptdiffhr=noboilingpthr-lablevelpthr
verygoodptdiffhr=noboilingpthr-verygoodpthr
moderateptdiffhr=noboilingpthr-moderatepthr
goodptdiffhr=noboilingpthr-goodpthr
loweffectiveptdiffhr=noboilingpthr-loweffectivepthr
ineffectiveptdiffhr=noboilingpthr-ineffectivepthr
negativeptdiffhr=noboilingpthr-negativepthr
boilingbardiffhr=c(lablevelptdiffhr,verygoodptdiffhr,goodptdiffhr,moderateptdiffhr,loweffectiveptdiffhr,ineffectiveptdiffhr,negativeptdiffhr)


lablevelptdiffmr=noboilingptmr-lablevelptmr
verygoodptdiffmr=noboilingptmr-verygoodptmr
goodptdiffmr=noboilingptmr-goodptmr
moderateptdiffmr=noboilingptmr-moderateptmr
loweffectiveptdiffmr=noboilingptmr-loweffectiveptmr
ineffectiveptdiffmr=noboilingptmr-ineffectiveptmr
negativeptdiffmr=noboilingptmr-negativeptmr
boilingbardiffmr=c(lablevelptdiffmr,verygoodptdiffmr,goodptdiffmr,moderateptdiffmr,loweffectiveptdiffmr,ineffectiveptdiffmr,negativeptdiffmr)


lablevelptdifflr=noboilingptlr-lablevelptlr
verygoodptdifflr=noboilingptlr-verygoodptlr
goodptdifflr=noboilingptlr-goodptlr
moderateptdifflr=noboilingptlr-moderateptlr
loweffectiveptdifflr=noboilingptlr-loweffectiveptlr
ineffectiveptdifflr=noboilingptlr-ineffectiveptlr
negativeptdifflr=noboilingptlr-negativeptlr
boilingbardifflr=c(lablevelptdifflr,verygoodptdifflr,goodptdifflr,moderateptdifflr,loweffectiveptdifflr,ineffectiveptdifflr,negativeptdifflr)


### Finish adult

##starting child

###

####
###
###child water variables
noboilingptlrchild=as.numeric(watersummarychild[lowrisk,2])#no boiling
lablevelptlrchild=as.numeric(watersummarychild[lowrisk,3]) # lab level
verygoodptlrchild=as.numeric(watersummarychild[lowrisk,4]) #very good
moderateptlrchild=as.numeric(watersummarychild[lowrisk,5]) # moderate
goodptlrchild=as.numeric(watersummarychild[lowrisk,6]) #good
loweffectiveptlrchild=as.numeric(watersummarychild[lowrisk,7]) # low effective
ineffectiveptlrchild=as.numeric(watersummarychild[lowrisk,8]) #ineffecctive
negativeptlrchild=as.numeric(watersummarychild[lowrisk,9])#negative boiling

noboilingptmrchild=as.numeric(watersummarychild[mediumrisk,2])#no boiling
lablevelptmrchild=as.numeric(watersummarychild[mediumrisk,3]) # lab level
verygoodptmrchild=as.numeric(watersummarychild[mediumrisk,4]) #very good
moderateptmrchild=as.numeric(watersummarychild[mediumrisk,5]) # moderate
goodptmrchild=as.numeric(watersummarychild[mediumrisk,6]) #good
loweffectiveptmrchild=as.numeric(watersummarychild[mediumrisk,7]) # low effective
ineffectiveptmrchild=as.numeric(watersummarychild[mediumrisk,8]) #ineffecctive
negativeptmrchild=as.numeric(watersummarychild[mediumrisk,9]) #negative boiling

print("start high risk")
noboilingpthrchild=as.numeric(watersummarychild[highrisk,2])#no boiling
lablevelpthrchild=as.numeric(watersummarychild[highrisk,3]) # lab level
verygoodpthrchild=as.numeric(watersummarychild[highrisk,4]) #very good
moderatepthrchild=as.numeric(watersummarychild[highrisk,5]) # moderate
goodpthrchild=as.numeric(watersummarychild[highrisk,6]) #good
loweffectivepthrchild=as.numeric(watersummarychild[highrisk,7]) # low effective
ineffectivepthrchild=as.numeric(watersummarychild[highrisk,8]) #ineffecctive
negativepthrchild=as.numeric(watersummarychild[highrisk,9]) #negative boiling
###########

noboilingptlrsdchild=as.numeric(watersummarysdchild[lowrisk,2])#no boiling
lablevelptlrsdchild=as.numeric(watersummarysdchild[lowrisk,3]) # lab level
verygoodptlrsdchild=as.numeric(watersummarysdchild[lowrisk,4]) #very good
moderateptlrsdchild=as.numeric(watersummarysdchild[lowrisk,5]) # moderate
goodptlrsdchild=as.numeric(watersummarysdchild[lowrisk,6]) #good
loweffectiveptlrsdchild=as.numeric(watersummarysdchild[lowrisk,7]) # low effective
ineffectiveptlrsdchild=as.numeric(watersummarysdchild[lowrisk,8]) #ineffecctive
negativeptlrsdchild=as.numeric(watersummarysdchild[lowrisk,9])#negative boiling

noboilingptmrsdchild=as.numeric(watersummarysdchild[mediumrisk,2])#no boiling
lablevelptmrsdchild=as.numeric(watersummarysdchild[mediumrisk,3]) # lab level
verygoodptmrsdchild=as.numeric(watersummarysdchild[mediumrisk,4]) #very good
moderateptmrsdchild=as.numeric(watersummarysdchild[mediumrisk,5]) # moderate
goodptmrsdchild=as.numeric(watersummarysdchild[mediumrisk,6]) #good
loweffectiveptmrsdchild=as.numeric(watersummarysdchild[mediumrisk,7]) # low effective
ineffectiveptmrsdchild=as.numeric(watersummarysdchild[mediumrisk,8]) #ineffecctive
negativeptmrsdchild=as.numeric(watersummarysdchild[mediumrisk,9]) #negative boiling

noboilingpthrsdchild=as.numeric(watersummarysdchild[highrisk,2])#no boiling
lablevelpthrsdchild=as.numeric(watersummarysdchild[highrisk,3]) # lab level
verygoodpthrsdchild=as.numeric(watersummarysdchild[highrisk,4]) #very good
moderatepthrsdchild=as.numeric(watersummarysdchild[highrisk,5]) # moderate
goodpthrsdchild=as.numeric(watersummarysdchild[highrisk,6]) #good
loweffectivepthrsdchild=as.numeric(watersummarysdchild[highrisk,7]) # low effective
ineffectivepthrsdchild=as.numeric(watersummarysdchild[highrisk,8]) #ineffecctive
negativepthrsdchild=as.numeric(watersummarysdchild[highrisk,9]) #negative boiling

print("startvery high risk")
noboilingptvhrchild=as.numeric(watersummarychild[veryhighrisk,2])#no boiling
lablevelpthvrchild=as.numeric(watersummarychild[veryhighrisk,3]) # lab level
verygoodptvhrchild=as.numeric(watersummarychild[veryhighrisk,4]) #very good
moderateptvhrchild=as.numeric(watersummarychild[veryhighrisk,5]) # moderate
goodptvhrchild=as.numeric(watersummarychild[veryhighrisk,6]) #good
loweffectiveptvhrchild=as.numeric(watersummarychild[veryhighrisk,7]) # low effective
ineffectiveptvhrchild=as.numeric(watersummarychild[veryhighrisk,8]) #ineffecctive
negativeptvhrchild=as.numeric(watersummarychild[veryhighrisk,9]) #negative boiling

noboilingptvhrsdchild=as.numeric(watersummarysdchild[veryhighrisk,2])#no boiling
lablevelptvhrsdchild=as.numeric(watersummarysdchild[veryhighrisk,3]) # lab level
verygoodptvhrsdchild=as.numeric(watersummarysdchild[veryhighrisk,4]) #very good
moderateptvhrsdchild=as.numeric(watersummarysdchild[veryhighrisk,5]) # moderate
goodptvhrsdchild=as.numeric(watersummarysdchild[veryhighrisk,6]) #good
loweffectiveptvhrsdchild=as.numeric(watersummarysdchild[veryhighrisk,7]) # low effective
ineffectiveptvhrsdchild=as.numeric(watersummarysdchild[veryhighrisk,8]) #ineffecctive
negativeptvhrsdchild=as.numeric(watersummarysdchild[veryhighrisk,9]) #negative boiling
###########

boilingdiffuncertaintylrchild=c((noboilingptlrsdchild+lablevelptlrsdchild)^0.5,(noboilingptlrsdchild+verygoodptlrsdchild)^0.5,(noboilingptlrsdchild+goodptlrsdchild)^0.5,(noboilingptlrsdchild+moderateptlrsdchild)^0.5,(noboilingptlrsdchild+loweffectiveptlrsdchild)^0.5,(noboilingptlrsdchild+ineffectiveptlrsdchild)^0.5,(noboilingptlrsdchild+negativeptlrsdchild)^0.5)
boilingdiffuncertaintymrchild=c((noboilingptmrsdchild+lablevelptmrsdchild)^0.5,(noboilingptmrsdchild+verygoodptmrsdchild)^0.5,(noboilingptmrsdchild+goodptmrsdchild)^0.5,(noboilingptmrsdchild+moderateptmrsdchild)^0.5,(noboilingptmrsdchild+loweffectiveptmrsdchild)^0.5,(noboilingptmrsdchild+ineffectiveptmrsdchild)^0.5,(noboilingptmrsdchild+negativeptmrsdchild)^0.5)
boilingdiffuncertaintyhrchild=c((noboilingpthrsdchild+lablevelpthrsdchild)^0.5,(noboilingpthrsdchild+verygoodpthrsdchild)^0.5,(noboilingpthrsdchild+goodpthrsdchild)^0.5,(noboilingpthrsdchild+moderatepthrsdchild)^0.5,(noboilingpthrsdchild+loweffectivepthrsdchild)^0.5,(noboilingpthrsdchild+ineffectivepthrsdchild)^0.5,(noboilingpthrsdchild+negativepthrsdchild)^0.5)

boilingdiffuncgroupchild=c(boilingdiffuncertaintylrchild,boilingdiffuncertaintymrchild,boilingdiffuncertaintyhrchild)

###########differences
lablevelptdiffhrchild=noboilingpthrchild-lablevelpthrchild
verygoodptdiffhrchild=noboilingpthrchild-verygoodpthrchild
moderateptdiffhrchild=noboilingpthrchild-moderatepthrchild
goodptdiffhrchild=noboilingpthrchild-goodpthrchild
loweffectiveptdiffhrchild=noboilingpthrchild-loweffectivepthrchild
ineffectiveptdiffhrchild=noboilingpthrchild-ineffectivepthrchild
negativeptdiffhrchild=noboilingpthrchild-negativepthrchild
boilingbardiffhrchild=c(lablevelptdiffhrchild,verygoodptdiffhrchild,goodptdiffhrchild,moderateptdiffhrchild,loweffectiveptdiffhrchild,ineffectiveptdiffhrchild,negativeptdiffhrchild)


lablevelptdiffmrchild=noboilingptmrchild-lablevelptmrchild
verygoodptdiffmrchild=noboilingptmrchild-verygoodptmrchild
goodptdiffmrchild=noboilingptmrchild-goodptmrchild
moderateptdiffmrchild=noboilingptmrchild-moderateptmrchild
loweffectiveptdiffmrchild=noboilingptmrchild-loweffectiveptmrchild
ineffectiveptdiffmrchild=noboilingptmrchild-ineffectiveptmrchild
negativeptdiffmrchild=noboilingptmrchild-negativeptmrchild
boilingbardiffmrchild=c(lablevelptdiffmrchild,verygoodptdiffmrchild,goodptdiffmrchild,moderateptdiffmrchild,loweffectiveptdiffmrchild,ineffectiveptdiffmrchild,negativeptdiffmrchild)


lablevelptdifflrchild=noboilingptlrchild-lablevelptlrchild
verygoodptdifflrchild=noboilingptlrchild-verygoodptlrchild
goodptdifflrchild=noboilingptlrchild-goodptlrchild
moderateptdifflrchild=noboilingptlrchild-moderateptlrchild
loweffectiveptdifflrchild=noboilingptlrchild-loweffectiveptlrchild
ineffectiveptdifflrchild=noboilingptlrchild-ineffectiveptlrchild
negativeptdifflrchild=noboilingptlrchild-negativeptlrchild
boilingbardifflrchild=c(lablevelptdifflrchild,verygoodptdifflrchild,goodptdifflrchild,moderateptdifflrchild,loweffectiveptdifflrchild,ineffectiveptdifflrchild,negativeptdifflrchild)
###
## finish child
##starting total

####
###
###Total water variables
noboilingptlrtotal=as.numeric(watersummary[lowrisk,2])+as.numeric(watersummarychild[lowrisk,2])#no boiling
lablevelptlrtotal=as.numeric(watersummary[lowrisk,3])+as.numeric(watersummarychild[lowrisk,3]) # lab level
verygoodptlrtotal=as.numeric(watersummary[lowrisk,4])+as.numeric(watersummarychild[lowrisk,4]) #very good
moderateptlrtotal=as.numeric(watersummary[lowrisk,5])+as.numeric(watersummarychild[lowrisk,5]) # moderate
goodptlrtotal=as.numeric(watersummary[lowrisk,6])+as.numeric(watersummarychild[lowrisk,6]) #good
loweffectiveptlrtotal=as.numeric(watersummary[lowrisk,7])+as.numeric(watersummarychild[lowrisk,7]) # low effective
ineffectiveptlrtotal=as.numeric(watersummary[lowrisk,8])+as.numeric(watersummarychild[lowrisk,8]) #ineffecctive
negativeptlrtotal=as.numeric(watersummary[lowrisk,9])+as.numeric(watersummarychild[lowrisk,9])#negative boiling

noboilingptmrtotal=as.numeric(watersummary[mediumrisk,2])+as.numeric(watersummarychild[mediumrisk,2])#no boiling
lablevelptmrtotal=as.numeric(watersummary[mediumrisk,3])+as.numeric(watersummarychild[mediumrisk,3]) # lab level
verygoodptmrtotal=as.numeric(watersummary[mediumrisk,4])+as.numeric(watersummarychild[mediumrisk,4]) #very good
moderateptmrtotal=as.numeric(watersummary[mediumrisk,5])+as.numeric(watersummarychild[mediumrisk,5]) # moderate
goodptmrtotal=as.numeric(watersummary[mediumrisk,6])+as.numeric(watersummarychild[mediumrisk,6]) #good
loweffectiveptmrtotal=as.numeric(watersummary[mediumrisk,7])+as.numeric(watersummarychild[mediumrisk,7]) # low effective
ineffectiveptmrtotal=as.numeric(watersummary[mediumrisk,8])+as.numeric(watersummarychild[mediumrisk,8]) #ineffecctive
negativeptmrtotal=as.numeric(watersummary[mediumrisk,9])+as.numeric(watersummarychild[mediumrisk,9]) #negative boiling

print("start high risk")
noboilingpthrtotal=as.numeric(watersummary[highrisk,2])+as.numeric(watersummarychild[highrisk,2])#no boiling
lablevelpthrtotal=as.numeric(watersummary[highrisk,3])+as.numeric(watersummarychild[highrisk,3])  # lab level
verygoodpthrtotal=as.numeric(watersummary[highrisk,4])+as.numeric(watersummarychild[highrisk,4]) #very good
moderatepthrtotal=as.numeric(watersummary[highrisk,5])+as.numeric(watersummarychild[highrisk,5]) # moderate
goodpthrtotal=as.numeric(watersummary[highrisk,6])+as.numeric(watersummarychild[highrisk,6]) #good
loweffectivepthrtotal=as.numeric(watersummary[highrisk,7])+as.numeric(watersummarychild[highrisk,7]) # low effective
ineffectivepthrtotal=as.numeric(watersummary[highrisk,8])+as.numeric(watersummarychild[highrisk,8]) #ineffecctive
negativepthrtotal=as.numeric(watersummary[highrisk,9])+as.numeric(watersummarychild[highrisk,9]) #negative boiling
###########

noboilingptlrsdtotal=sqrt(combinevar(c(as.numeric(watersummary[lowrisk,2]),as.numeric(watersummarychild[lowrisk,2])),c(as.numeric(watersummarysd[lowrisk,2]),as.numeric(watersummarysdchild[lowrisk,2])),c(length(numberseq),length(numberseq)))[2])#no boiling

lablevelptlrsdtotal=sqrt(combinevar(c(as.numeric(watersummary[lowrisk,3]),as.numeric(watersummarychild[lowrisk,3])),c(as.numeric(watersummarysd[lowrisk,3]),as.numeric(watersummarysdchild[lowrisk,3])),c(length(numberseq),length(numberseq)))[2])#no boiling#=as.numeric(watersummarysd[lowrisk,3]) # lab level
print("Finish 2")
verygoodptlrsdtotal=sqrt(combinevar(c(as.numeric(watersummary[lowrisk,4]),as.numeric(watersummarychild[lowrisk,4])),c(as.numeric(watersummarysd[lowrisk,4]),as.numeric(watersummarysdchild[lowrisk,4])),c(length(numberseq),length(numberseq)))[2])#no boiling#=as.numeric(watersummarysd[lowrisk,4]) #very good
print("Finish 3")
moderateptlrsdtotal=sqrt(combinevar(c(as.numeric(watersummary[lowrisk,5]),as.numeric(watersummarychild[lowrisk,5])),c(as.numeric(watersummarysd[lowrisk,5]),as.numeric(watersummarysdchild[lowrisk,5])),c(length(numberseq),length(numberseq)))[2])#no boiling # moderate
print("Finish 4")
goodptlrsdtotal=sqrt(combinevar(c(as.numeric(watersummary[lowrisk,6]),as.numeric(watersummarychild[lowrisk,6])),c(as.numeric(watersummarysd[lowrisk,6]),as.numeric(watersummarysdchild[lowrisk,6])),c(length(numberseq),length(numberseq)))[2])#=as.numeric(watersummarysd[lowrisk,6]) #good
print("Finish 5")
loweffectiveptlrsdtotal=sqrt(combinevar(c(as.numeric(watersummary[lowrisk,7]),as.numeric(watersummarychild[lowrisk,7])),c(as.numeric(watersummarysd[lowrisk,7]),as.numeric(watersummarysdchild[lowrisk,7])),c(length(numberseq),length(numberseq)))[2])#=as.numeric(watersummarysd[lowrisk,7]) # low effective
ineffectiveptlrsdtotal=sqrt(combinevar(c(as.numeric(watersummary[lowrisk,8]),as.numeric(watersummarychild[lowrisk,8])),c(as.numeric(watersummarysd[lowrisk,8]),as.numeric(watersummarysdchild[lowrisk,8])),c(length(numberseq),length(numberseq)))[2])#as.numeric(watersummarysd[lowrisk,8]) #ineffecctive
negativeptlrsdtotal=sqrt(combinevar(c(as.numeric(watersummary[lowrisk,9]),as.numeric(watersummarychild[lowrisk,9])),c(as.numeric(watersummarysd[lowrisk,9]),as.numeric(watersummarysdchild[lowrisk,9])),c(length(numberseq),length(numberseq)))[2])#as.numeric(watersummarysd[lowrisk,9])#negative boiling

noboilingptmrsdtotal=sqrt(combinevar(c(as.numeric(watersummary[mediumrisk,2]),as.numeric(watersummarychild[mediumrisk,2])),c(as.numeric(watersummarysd[mediumrisk,2]),as.numeric(watersummarysdchild[mediumrisk,2])),c(length(numberseq),length(numberseq)))[2])#=as.numeric(watersummarysd[mediumrisk,2])#no boiling
lablevelptmrsdtotal=sqrt(combinevar(c(as.numeric(watersummary[mediumrisk,3]),as.numeric(watersummarychild[mediumrisk,3])),c(as.numeric(watersummarysd[mediumrisk,3]),as.numeric(watersummarysdchild[mediumrisk,3])),c(length(numberseq),length(numberseq)))[2])#as.numeric(watersummarysd[mediumrisk,3]) # lab level
verygoodptmrsdtotal=sqrt(combinevar(c(as.numeric(watersummary[mediumrisk,4]),as.numeric(watersummarychild[mediumrisk,4])),c(as.numeric(watersummarysd[mediumrisk,4]),as.numeric(watersummarysdchild[mediumrisk,4])),c(length(numberseq),length(numberseq)))[2])#as.numeric(watersummarysd[mediumrisk,4]) #very good
moderateptmrsdtotal=sqrt(combinevar(c(as.numeric(watersummary[mediumrisk,5]),as.numeric(watersummarychild[mediumrisk,5])),c(as.numeric(watersummarysd[mediumrisk,5]),as.numeric(watersummarysdchild[mediumrisk,5])),c(length(numberseq),length(numberseq)))[2])#as.numeric(watersummarysd[mediumrisk,5]) # moderate
goodptmrsdtotal=sqrt(combinevar(c(as.numeric(watersummary[mediumrisk,6]),as.numeric(watersummarychild[mediumrisk,6])),c(as.numeric(watersummarysd[mediumrisk,6]),as.numeric(watersummarysdchild[mediumrisk,6])),c(length(numberseq),length(numberseq)))[2])#as.numeric(watersummarysd[mediumrisk,6]) #good
loweffectiveptmrsdtotal=sqrt(combinevar(c(as.numeric(watersummary[mediumrisk,7]),as.numeric(watersummarychild[mediumrisk,7])),c(as.numeric(watersummarysd[mediumrisk,7]),as.numeric(watersummarysdchild[mediumrisk,7])),c(length(numberseq),length(numberseq)))[2])#=as.numeric(watersummarysd[mediumrisk,7]) # low effective
ineffectiveptmrsdtotal=sqrt(combinevar(c(as.numeric(watersummary[mediumrisk,8]),as.numeric(watersummarychild[mediumrisk,8])),c(as.numeric(watersummarysd[mediumrisk,8]),as.numeric(watersummarysdchild[mediumrisk,8])),c(length(numberseq),length(numberseq)))[2])#as.numeric(watersummarysd[mediumrisk,8]) #ineffecctive
negativeptmrsdtotal=sqrt(combinevar(c(as.numeric(watersummary[mediumrisk,9]),as.numeric(watersummarychild[mediumrisk,9])),c(as.numeric(watersummarysd[mediumrisk,9]),as.numeric(watersummarysdchild[mediumrisk,9])),c(length(numberseq),length(numberseq)))[2])#=as.numeric(watersummarysd[mediumrisk,9]) #negative boiling

noboilingpthrsdtotal=sqrt(combinevar(c(as.numeric(watersummary[highrisk,2]),as.numeric(watersummarychild[highrisk,2])),c(as.numeric(watersummarysd[highrisk,2]),as.numeric(watersummarysdchild[highrisk,2])),c(length(numberseq),length(numberseq)))[2])#=as.numeric(watersummarysd[highrisk,2])#no boiling
lablevelpthrsdtotal=sqrt(combinevar(c(as.numeric(watersummary[highrisk,3]),as.numeric(watersummarychild[highrisk,3])),c(as.numeric(watersummarysd[highrisk,3]),as.numeric(watersummarysdchild[highrisk,3])),c(length(numberseq),length(numberseq)))[2])#as.numeric(watersummarysd[highrisk,3]) # lab level
verygoodpthrsdtotal=sqrt(combinevar(c(as.numeric(watersummary[highrisk,4]),as.numeric(watersummarychild[highrisk,4])),c(as.numeric(watersummarysd[highrisk,4]),as.numeric(watersummarysdchild[highrisk,4])),c(length(numberseq),length(numberseq)))[2])#=as.numeric(watersummarysd[highrisk,4]) #very good
moderatepthrsdtotal=sqrt(combinevar(c(as.numeric(watersummary[highrisk,5]),as.numeric(watersummarychild[highrisk,5])),c(as.numeric(watersummarysd[highrisk,5]),as.numeric(watersummarysdchild[highrisk,5])),c(length(numberseq),length(numberseq)))[2])#as.numeric(watersummarysd[highrisk,5]) # moderate
goodpthrsdtotal=sqrt(combinevar(c(as.numeric(watersummary[highrisk,6]),as.numeric(watersummarychild[highrisk,6])),c(as.numeric(watersummarysd[highrisk,6]),as.numeric(watersummarysdchild[highrisk,6])),c(length(numberseq),length(numberseq)))[2])#as.numeric(watersummarysd[highrisk,6]) #good
loweffectivepthrsdtotal=sqrt(combinevar(c(as.numeric(watersummary[highrisk,7]),as.numeric(watersummarychild[highrisk,7])),c(as.numeric(watersummarysd[highrisk,7]),as.numeric(watersummarysdchild[highrisk,7])),c(length(numberseq),length(numberseq)))[2])#=as.numeric(watersummarysd[highrisk,7]) # low effective
ineffectivepthrsdtotal=sqrt(combinevar(c(as.numeric(watersummary[highrisk,8]),as.numeric(watersummarychild[highrisk,8])),c(as.numeric(watersummarysd[highrisk,8]),as.numeric(watersummarysdchild[highrisk,8])),c(length(numberseq),length(numberseq)))[2])#as.numeric(watersummarysd[highrisk,8]) #ineffecctive
negativepthrsdtotal=sqrt(combinevar(c(as.numeric(watersummary[highrisk,9]),as.numeric(watersummarychild[highrisk,9])),c(as.numeric(watersummarysd[highrisk,9]),as.numeric(watersummarysdchild[highrisk,9])),c(length(numberseq),length(numberseq)))[2])#as.numeric(watersummarysd[highrisk,9]) #negative boiling

########################################################################
###############differences

boilingdiffuncertaintylrtotal=c(((noboilingptlrsdtotal^2)/runs+(lablevelptlrsdtotal^2)/runs)^0.5,((noboilingptlrsdtotal^2)/runs+(verygoodptlrsdtotal^2)/runs)^0.5,((noboilingptlrsdtotal^2)/runs+(goodptlrsdtotal^2)/runs)^0.5,((noboilingptlrsdtotal^2)/runs+(moderateptlrsdtotal^2)/runs)^0.5,((noboilingptlrsdtotal^2)/runs+(loweffectiveptlrsdtotal^2)/runs)^0.5,((noboilingptlrsdtotal^2)/runs+(ineffectiveptlrsdtotal^2)/runs)^0.5,((noboilingptlrsdtotal^2)/runs+(negativeptlrsdtotal^2)/runs)^0.5)
boilingdiffuncertaintymrtotal=c(((noboilingptmrsdtotal^2)/runs+(lablevelptmrsdtotal^2)/runs)^0.5,((noboilingptmrsdtotal^2)/runs+(verygoodptmrsdtotal^2)/runs)^0.5,((noboilingptmrsdtotal^2)/runs+(goodptmrsdtotal^2)/runs)^0.5,((noboilingptmrsdtotal^2)/runs+(moderateptmrsdtotal^2)/runs)^0.5,((noboilingptmrsdtotal^2)/runs+(loweffectiveptmrsdtotal^2)/runs)^0.5,((noboilingptmrsdtotal^2)/runs+(ineffectiveptmrsdtotal^2)/runs)^0.5,((noboilingptmrsdtotal^2)/runs+(negativeptmrsdtotal^2)/runs)^0.5)
boilingdiffuncertaintyhrtotal=c(((noboilingpthrsdtotal^2)/runs+(lablevelpthrsdtotal^2)/runs)^0.5,((noboilingpthrsdtotal^2)/runs+(verygoodpthrsdtotal^2)/runs)^0.5,((noboilingpthrsdtotal^2)/runs+(goodpthrsdtotal^2)/runs)^0.5,((noboilingpthrsdtotal^2)/runs+(moderatepthrsdtotal^2)/runs)^0.5,((noboilingpthrsdtotal^2)/runs+(loweffectivepthrsdtotal^2)/runs)^0.5,((noboilingpthrsdtotal^2)/runs+(ineffectivepthrsdtotal^2)/runs)^0.5,((noboilingpthrsdtotal^2)/runs+(negativepthrsdtotal^2)/runs)^0.5)

boilingdiffuncgrouptotal=c(boilingdiffuncertaintylrtotal,boilingdiffuncertaintymrtotal,boilingdiffuncertaintyhrtotal)
####################################################################################################################################

###########differences total
lablevelptdiffhrtotal=noboilingpthrtotal-lablevelpthrtotal
verygoodptdiffhrtotal=noboilingpthrtotal-verygoodpthrtotal
moderateptdiffhrtotal=noboilingpthrtotal-moderatepthrtotal
goodptdiffhrtotal=noboilingpthrtotal-goodpthrtotal
loweffectiveptdiffhrtotal=noboilingpthrtotal-loweffectivepthrtotal
ineffectiveptdiffhrtotal=noboilingpthrtotal-ineffectivepthrtotal
negativeptdiffhrtotal=noboilingpthrtotal-negativepthrtotal
boilingbardiffhrtotal=c(lablevelptdiffhrtotal,verygoodptdiffhrtotal,goodptdiffhrtotal,moderateptdiffhrtotal,loweffectiveptdiffhrtotal,ineffectiveptdiffhrtotal,negativeptdiffhrtotal)


lablevelptdiffmrtotal=noboilingptmrtotal-lablevelptmrtotal
verygoodptdiffmrtotal=noboilingptmrtotal-verygoodptmrtotal
goodptdiffmrtotal=noboilingptmrtotal-goodptmrtotal
moderateptdiffmrtotal=noboilingptmrtotal-moderateptmrtotal
loweffectiveptdiffmrtotal=noboilingptmrtotal-loweffectiveptmrtotal
ineffectiveptdiffmrtotal=noboilingptmrtotal-ineffectiveptmrtotal
negativeptdiffmrtotal=noboilingptmrtotal-negativeptmrtotal
boilingbardiffmrtotal=c(lablevelptdiffmrtotal,verygoodptdiffmrtotal,goodptdiffmrtotal,moderateptdiffmrtotal,loweffectiveptdiffmrtotal,ineffectiveptdiffmrtotal,negativeptdiffmrtotal)


lablevelptdifflrtotal=noboilingptlrtotal-lablevelptlrtotal
verygoodptdifflrtotal=noboilingptlrtotal-verygoodptlrtotal
goodptdifflrtotal=noboilingptlrtotal-goodptlrtotal
moderateptdifflrtotal=noboilingptlrtotal-moderateptlrtotal
loweffectiveptdifflrtotal=noboilingptlrtotal-loweffectiveptlrtotal
ineffectiveptdifflrtotal=noboilingptlrtotal-ineffectiveptlrtotal
negativeptdifflrtotal=noboilingptlrtotal-negativeptlrtotal
boilingbardifflrtotal=c(lablevelptdifflrtotal,verygoodptdifflrtotal,goodptdifflrtotal,moderateptdifflrtotal,loweffectiveptdifflrtotal,ineffectiveptdifflrtotal,negativeptdifflrtotal)

### ending total
#finish with variables

#boiling bar difference graph
#0,6,2,1.5,1.8,0.464,0.048,-0.208
boilingbargroupdiff=c(boilingbardifflr,boilingbardiffmr,boilingbardiffhr)
boilingbargroupdiffchild=c(boilingbardifflrchild,boilingbardiffmrchild,boilingbardiffhrchild)
boilingbargroupdifftotal=c(boilingbardifflrtotal,boilingbardiffmrtotal,boilingbardiffhrtotal)

Boiling_Log_Reduction_Value=c("6:Lab Level","2:Very Good", "1.8:Good", "1.5:Moderate","0.464:Low","0.048:Ineffective","-0.208:Worse than Source")
boilngdiffreductionvaluenew=c(Boiling_Log_Reduction_Value,Boiling_Log_Reduction_Value,Boiling_Log_Reduction_Value)
boilingbargrouprisk=c(rep("LowRisk",7),rep("MediumRisk",7),rep("HighRisk",7))
Boilingbardataframediff=data.frame(boilingbargroupdiff, boilingbargrouprisk,Boiling_Log_Reduction_Value,boilingdiffuncgroup)

Boilingbardataframediffchild=data.frame(boilingbargroupdiffchild, boilingbargrouprisk,Boiling_Log_Reduction_Value,boilingdiffuncgroup)

Boilingbardataframedifftotal=data.frame(boilingbargroupdifftotal, boilingbargrouprisk,Boiling_Log_Reduction_Value,boilingdiffuncgroup)
print("hi")
#keep
newplotnewboilingdiffone<-ggplot(data=Boilingbardataframediff, aes(x=boilingbargrouprisk, y=boilingbargroupdiff, fill=Boiling_Log_Reduction_Value))+
  geom_bar(stat="identity", position=position_dodge())+theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),panel.background = element_blank(), axis.line = element_line(colour = "black"),text = element_text(size = 20),axis.text=element_text(size=20),legend.key=element_blank(),plot.title = element_text(hjust = 0.5))+ggtitle("") +
  ylab("DALYs Reduction from Boiling")+xlab("Water Risk Level in MPN E. coli/100mL")+geom_errorbar( aes(ymin=boilingbargroupdiff-boilingdiffuncgroup, ymax=boilingbargroupdiff+boilingdiffuncgroup), width=.2,position=position_dodge(.9))
print(newplotnewboilingdiffone)
print("Finish")
#print(sogubsoudgyrxiyrxyrx)
#Net DALYs (not difference)
boilingbarlr=c(lablevelptlr,verygoodptlr,goodptlr,moderateptlr,loweffectiveptlr,ineffectiveptlr,noboilingptlr,negativeptlr)
boilingbarmr=c(lablevelptmr,verygoodptmr,goodptmr,moderateptmr,loweffectiveptmr,ineffectiveptmr,noboilingptmr,negativeptmr)
boilingbarhr=c(lablevelpthr,verygoodpthr,goodpthr,moderatepthr,loweffectivepthr,ineffectivepthr,noboilingpthr,negativepthr)
boilingbarlrsd=c(lablevelptlrsd,verygoodptlrsd,goodptlrsd,moderateptlrsd,loweffectiveptlrsd,ineffectiveptlrsd,noboilingptlrsd,negativeptlrsd)
boilingbarmrsd=c(lablevelptmrsd,verygoodptmrsd,goodptmrsd,moderateptmrsd,loweffectiveptmrsd,ineffectiveptmrsd,noboilingptmrsd,negativeptmrsd)
boilingbarhrsd=c(lablevelpthrsd,verygoodpthrsd,goodpthrsd,moderatepthrsd,loweffectivepthrsd,ineffectivepthrsd,noboilingpthrsd,negativepthrsd)

boilingbarlrchild=c(lablevelptlrchild,verygoodptlrchild,goodptlrchild,moderateptlrchild,loweffectiveptlrchild,ineffectiveptlrchild,noboilingptlrchild,negativeptlrchild)
boilingbarmrchild=c(lablevelptmrchild,verygoodptmrchild,goodptmrchild,moderateptmrchild,loweffectiveptmrchild,ineffectiveptmrchild,noboilingptmrchild,negativeptmrchild)
boilingbarhrchild=c(lablevelpthrchild,verygoodpthrchild,goodpthrchild,moderatepthrchild,loweffectivepthrchild,ineffectivepthrchild,noboilingpthrchild,negativepthrchild)
boilingbarlrsdchild=c(lablevelptlrsdchild,verygoodptlrsdchild,goodptlrsdchild,moderateptlrsdchild,loweffectiveptlrsdchild,ineffectiveptlrsdchild,noboilingptlrsdchild,negativeptlrsdchild)
boilingbarmrsdchild=c(lablevelptmrsdchild,verygoodptmrsdchild,goodptmrsdchild,moderateptmrsdchild,loweffectiveptmrsdchild,ineffectiveptmrsdchild,noboilingptmrsdchild,negativeptmrsdchild)
boilingbarhrsdchild=c(lablevelpthrsdchild,verygoodpthrsdchild,goodpthrsdchild,moderatepthrsdchild,loweffectivepthrsdchild,ineffectivepthrsdchild,noboilingpthrsdchild,negativepthrsdchild)

boilingbarlrtotal=c(lablevelptlrtotal,verygoodptlrtotal,goodptlrtotal,moderateptlrtotal,loweffectiveptlrtotal,ineffectiveptlrtotal,noboilingptlrtotal,negativeptlrtotal)
boilingbarmrtotal=c(lablevelptmrtotal,verygoodptmrtotal,goodptmrtotal,moderateptmrtotal,loweffectiveptmrtotal,ineffectiveptmrtotal,noboilingptmrtotal,negativeptmrtotal)
boilingbarhrtotal=c(lablevelpthrtotal,verygoodpthrtotal,goodpthrtotal,moderatepthrtotal,loweffectivepthrtotal,ineffectivepthrtotal,noboilingpthrtotal,negativepthrtotal)
boilingbarlrsdtotal=c(lablevelptlrsdtotal,verygoodptlrsdtotal,goodptlrsdtotal,moderateptlrsdtotal,loweffectiveptlrsdtotal,ineffectiveptlrsdtotal,noboilingptlrsdtotal,negativeptlrsdtotal)
boilingbarmrsdtotal=c(lablevelptmrsdtotal,verygoodptmrsdtotal,goodptmrsdtotal,moderateptmrsdtotal,loweffectiveptmrsdtotal,ineffectiveptmrsdtotal,noboilingptmrsdtotal,negativeptmrsdtotal)
boilingbarhrsdtotal=c(lablevelpthrsdtotal,verygoodpthrsdtotal,goodpthrsdtotal,moderatepthrsdtotal,loweffectivepthrsdtotal,ineffectivepthrsdtotal,noboilingpthrsdtotal,negativepthrsdtotal)
#boiling bar graph
#0,6,2,1.5,1.8,0.464,0.048,-0.208
boilingbargroup=c(boilingbarlr,boilingbarmr,boilingbarhr)
boilingbargroupsd=c(boilingbarlrsd,boilingbarmrsd,boilingbarhrsd)
boilingbargroupchild=c(boilingbarlrchild,boilingbarmrchild,boilingbarhrchild)
boilingbargroupsdchild=c(boilingbarlrsdchild,boilingbarmrsdchild,boilingbarhrsdchild)
boilingbargrouptotal=c(boilingbarlrtotal,boilingbarmrtotal,boilingbarhrtotal)
boilingbargroupsdtotal=c(boilingbarlrsdtotal,boilingbarmrsdtotal,boilingbarhrsdtotal)
Boiling_Log_Reduction_Value=c("6:Lab Level","2:Very Good", "1.8:Good", "1.5:Moderate","0.464:Low","0.048:Ineffective","0.0:No Boiling","-0.208:Worse than Source")
boilingbargrouprisk=c(rep("LowRisk",8),rep("MediumRisk",8),rep("HighRisk",8))
Boilingbardataframe=data.frame(boilingbargroup, boilingbargrouprisk,Boiling_Log_Reduction_Value,boilingbargroupsd)

#keep
newplotnewboiling<-ggplot(data=Boilingbardataframe, aes(x=boilingbargrouprisk, y=boilingbargroup, fill=Boiling_Log_Reduction_Value))+
  geom_bar(stat="identity", position=position_dodge())+theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),panel.background = element_blank(), axis.line = element_line(colour = "black"),text = element_text(size = 20),axis.text=element_text(size=20),legend.key=element_blank(),plot.title = element_text(hjust = 0.5))+ggtitle("") +
  ylab("DALYs from Drinking Water")+xlab("Water Risk Level in MPN E. coli/100mL")+geom_errorbar( aes(ymin=boilingbargroup-boilingbargroupsd, ymax=boilingbargroup+boilingbargroupsd), width=.2,position=position_dodge(.9))
print(newplotnewboiling)
print("Finish 2")

###
########
#remove the worse than boiling one
boilingbarlr=c(lablevelptlr,verygoodptlr,moderateptlr,loweffectiveptlr,ineffectiveptlr,noboilingptlr)
boilingbarmr=c(lablevelptmr,verygoodptmr,moderateptmr,loweffectiveptmr,ineffectiveptmr,noboilingptmr)
boilingbarhr=c(lablevelpthr,verygoodpthr,moderatepthr,loweffectivepthr,ineffectivepthr,noboilingpthr)

boilingbarlrsd=c(lablevelptlrsd,verygoodptlrsd,moderateptlrsd,loweffectiveptlrsd,ineffectiveptlrsd,noboilingptlrsd)
boilingbarmrsd=c(lablevelptmrsd,verygoodptmrsd,moderateptmrsd,loweffectiveptmrsd,ineffectiveptmrsd,noboilingptmrsd)
boilingbarhrsd=c(lablevelpthrsd,verygoodpthrsd,moderatepthrsd,loweffectivepthrsd,ineffectivepthrsd,noboilingpthrsd)

boilingbarlrchild=c(lablevelptlrchild,verygoodptlrchild,moderateptlrchild,loweffectiveptlrchild,ineffectiveptlrchild,noboilingptlrchild)
boilingbarmrchild=c(lablevelptmrchild,verygoodptmrchild,moderateptmrchild,loweffectiveptmrchild,ineffectiveptmrchild,noboilingptmrchild)
boilingbarhrchild=c(lablevelpthrchild,verygoodpthrchild,moderatepthrchild,loweffectivepthrchild,ineffectivepthrchild,noboilingpthrchild)

boilingbarlrsdtotal=c(lablevelptlrsdtotal,verygoodptlrsdtotal,moderateptlrsdtotal,loweffectiveptlrsdtotal,ineffectiveptlrsdtotal,noboilingptlrsdtotal)
boilingbarmrsdtotal=c(lablevelptmrsdtotal,verygoodptmrsdtotal,moderateptmrsdtotal,loweffectiveptmrsdtotal,ineffectiveptmrsdtotal,noboilingptmrsdtotal)
boilingbarhrsdtotal=c(lablevelpthrsdtotal,verygoodpthrsdtotal,moderatepthrsdtotal,loweffectivepthrsdtotal,ineffectivepthrsdtotal,noboilingpthrsdtotal)

#boiling bar graph
#0,6,2,1.5,1.8,0.464,0.048,
boilingbargroup=c(boilingbarlr,boilingbarmr,boilingbarhr)
boilingbargroupsd=c(boilingbarlrsd,boilingbarmrsd,boilingbarhrsd)
boilingbargroupchild=c(boilingbarlrchild,boilingbarmrchild,boilingbarhrchild)
boilingbargroupsdchild=c(boilingbarlrsdchild,boilingbarmrsdchild,boilingbarhrsdchild)

boilingbargrouptotal=c(boilingbarlrtotal,boilingbarmrtotal,boilingbarhrtotal)
boilingbargroupsdtotal=c(boilingbarlrsdtotal,boilingbarmrsdtotal,boilingbarhrsdtotal)
Boiling_Log_Reduction_Value=c("6:Lab Level","2:Very Good", "1.5:Moderate","0.464:Low","0.048:Ineffective","0.0:No Boiling")
boilingbargrouprisk=c(rep("A Low Risk",6),rep("B Medium Risk",6),rep("C High Risk",6))
Boilingbardataframe=data.frame(boilingbargroup, boilingbargrouprisk,Boiling_Log_Reduction_Value,boilingbargroupsd)

#keep
newplotnewboiling<-ggplot(data=Boilingbardataframe, aes(x=boilingbargrouprisk, y=boilingbargroup, fill=Boiling_Log_Reduction_Value))+
  geom_bar(stat="identity", position=position_dodge())+theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),panel.background = element_blank(), axis.line = element_line(colour = "black"),text = element_text(size = 20),axis.text=element_text(size=20),legend.key=element_blank(),plot.title = element_text(hjust = 0.5))+ggtitle("") +
  ylab("DALYs from Drinking Water")+xlab("Water Risk Level in MPN E. coli/100mL")+geom_errorbar( aes(ymin=boilingbargroup-boilingbargroupsd, ymax=boilingbargroup+boilingbargroupsd), width=.2,position=position_dodge(.9))
print(newplotnewboiling)
print("Finish3")



print("END")

#print(helloemily)


###
#geom_errorbar( aes(ymin=boilingbargroup-boilingbargroupsd, ymax=boilingbargroup+boilingbargroupsd), width=.2,position=position_dodge(.9))+

#
boilinggrouplr=c(lablevelptlr,verygoodptlr,moderateptlr,ineffectiveptlr,noboilingptlr)
boilinggroupmr=c(lablevelptmr,verygoodptmr,moderateptmr,ineffectiveptmr,noboilingptmr)
boilinggrouphr=c(lablevelpthr,verygoodpthr,moderatepthr,ineffectivepthr,noboilingpthr)
boilingallgroupslr=c(boilinggrouplr,boilinggrouplr,boilinggrouplr,boilinggrouplr)
boilingallgroupsmr=c(boilinggroupmr,boilinggroupmr,boilinggroupmr,boilinggroupmr)
boilingallgroupshr=c(boilinggrouphr,boilinggrouphr,boilinggrouphr,boilinggrouphr)
boilingallvector=c(boilingallgroupslr,boilingallgroupsmr,boilingallgroupshr)
print("length of boiling")
print(length(boilingallvector))

lrname=rep("1 MPN E.coli/100mL ",20)
mrname=rep("1.05 MPN E.coli/100mL",20)
hrname=rep("1.1 MPN E. coli/100mL",20)
Ecoli_Level=c(lrname,mrname,hrname)





cleanDALY=c(0,0,0)#c(cleanwhDALYsavg,cleancDALYsavg,cleanwhcDALYsavg)
minimotoDALY=c(minimotowhDALYsavg,minimotocDALYsavg,minimotowhcDALYsavg)
improvedDALY=c(improvedwhDALYsavg,improvedcDALYsavg,improvedwhcDALYsavg)
smokeyDALY=c(smokeywhDALYsavg,smokeycDALYsavg,smokeywhcDALYsavg)
LPGDALY=c(LPGwhDALYsavg,LPGcDALYsavg,LPGwhcDALYsavg)
charcoalDALY=c(charcoalwhDALYsavg,charcoalcDALYsavg,CharcoalwhcDALYsavg)

cleanDALYsd=c(1,1,1)#c(cleanwhDALYssd,cleancDALYssd,cleanwhcDALYssd)
minimotoDALYsd=c(minimotowhDALYssd,minimotocDALYssd,minimotowhcDALYssd)
improvedDALYsd=c(improvedwhDALYssd,improvedcDALYssd,improvedwhcDALYssd)
smokeyDALYsd=c(smokeywhDALYssd,smokeycDALYssd,smokeywhcDALYssd)
LPGDALYsd=c(LPGwhDALYssd,LPGcDALYssd,LPGwhcDALYssd)
charcoalDALYsd=c(charcoalwhDALYssd,charcoalcDALYssd,charcoalwhcDALYssd)

##for Child
cleanDALYchild=c(0,0,0)#c(cleanwhDALYsavg,cleancDALYsavg,cleanwhcDALYsavg)
minimotoDALYchild=c(minimotowhDALYsavgchild,minimotocDALYsavgchild,minimotowhcDALYsavgchild)
improvedDALYchild=c(improvedwhDALYsavgchild,improvedcDALYsavgchild,improvedwhcDALYsavgchild)
smokeyDALYchild=c(smokeywhDALYsavgchild,smokeycDALYsavgchild,smokeywhcDALYsavgchild)
LPGDALYchild=c(LPGwhDALYsavgchild,LPGcDALYsavgchild,LPGwhcDALYsavgchild)
charcoalDALYchild=c(charcoalwhDALYsavgchild,charcoalcDALYsavgchild,CharcoalwhcDALYsavgchild)

cleanDALYsdchild=c(1,1,1)#c(cleanwhDALYssd,cleancDALYssd,cleanwhcDALYssd)
minimotoDALYsdchild=c(minimotowhDALYssdchild,minimotocDALYssdchild,minimotowhcDALYssdchild)
improvedDALYsdchild=c(improvedwhDALYssdchild,improvedcDALYssdchild,improvedwhcDALYssdchild)
smokeyDALYsdchild=c(smokeywhDALYssdchild,smokeycDALYssdchild,smokeywhcDALYssdchild)
LPGDALYsdchild=c(LPGwhDALYssdchild,LPGcDALYssdchild,LPGwhcDALYssdchild)
charcoalDALYsdchild=c(charcoalwhDALYssdchild,charcoalcDALYssdchild,charcoalwhcDALYssdchild)


##for total
cleanDALYtotal=c(0,0,0)#c(cleanwhDALYsavg,cleancDALYsavg,cleanwhcDALYsavg)
minimotoDALYtotal=c(minimotowhDALYsavgtotal,minimotocDALYsavgtotal,minimotowhcDALYsavgtotal)
improvedDALYtotal=c(improvedwhDALYsavgtotal,improvedcDALYsavgtotal,improvedwhcDALYsavgtotal)
smokeyDALYtotal=c(smokeywhDALYsavgtotal,smokeycDALYsavgtotal,smokeywhcDALYsavgtotal)
LPGDALYtotal=c(LPGwhDALYsavgtotal,LPGcDALYsavgtotal,LPGwhcDALYsavgtotal)
charcoalDALYtotal=c(charcoalwhDALYsavgtotal,charcoalcDALYsavgtotal,CharcoalwhcDALYsavgtotal)

cleanDALYsdtotal=c(1,1,1)#c(cleanwhDALYssd,cleancDALYssd,cleanwhcDALYssd)
minimotoDALYsdtotal=c(minimotowhDALYssdtotal,minimotocDALYssdtotal,minimotowhcDALYssdtotal)
improvedDALYsdtotal=c(improvedwhDALYssdtotal,improvedcDALYssdtotal,improvedwhcDALYssdtotal)
smokeyDALYsdtotal=c(smokeywhDALYssdtotal,smokeycDALYssdtotal,smokeywhcDALYssdtotal)
LPGDALYsdtotal=c(LPGwhDALYssdtotal,LPGcDALYssdtotal,LPGwhcDALYssdtotal)
charcoalDALYsdtotal=c(charcoalwhDALYssdtotal,charcoalcDALYssdtotal,charcoalwhcDALYssdtotal)


#DALYs graph
Stovenames =c(rep("A Electric",3),rep("B LPG",3),rep("C Gasifier",3),rep("D Charcoal",3),rep("E Imp. Wood",3),rep("F Trad. Wood",3))
Stove_use =c(rep(c("Water Heating","Cooking","Water Heating & Cooking"),6))#,rep("Cooking",4),rep("Water Heating & Cooking",4))
PMlevels=c(cleanDALY,LPGDALY,minimotoDALY,charcoalDALY,improvedDALY,smokeyDALY)
PMsd = c(cleanDALYsd,LPGDALYsd,minimotoDALYsd,charcoalDALYsd,improvedDALYsd,smokeyDALYsd)
PMlevelschild=c(cleanDALYchild,LPGDALYchild,minimotoDALYchild,charcoalDALYchild,improvedDALYchild,smokeyDALYchild)
PMsdchild = c(cleanDALYsdchild,LPGDALYsdchild,minimotoDALYsdchild,charcoalDALYsdchild,improvedDALYsdchild,smokeyDALYsdchild)

PMlevelstotal=c(cleanDALYtotal,LPGDALYtotal,minimotoDALYtotal,charcoalDALYtotal,improvedDALYtotal,smokeyDALYtotal)
PMsdtotal = c(cleanDALYsdtotal,LPGDALYsdtotal,minimotoDALYsdtotal,charcoalDALYsdtotal,improvedDALYsdtotal,smokeyDALYsdtotal)

PMstovedataframe <- data.frame(Stovenames,Stove_use,PMlevels,PMsd)
PMstovedataframechild <- data.frame(Stovenames,Stove_use,PMlevelschild,PMsdchild)
PMstovedataframetotal <- data.frame(Stovenames,Stove_use,PMlevelstotal,PMsdtotal)
print("start plot with lines")

#keep
newplotnew<-ggplot(data=PMstovedataframe, aes(x=Stovenames, y=PMlevels, fill=Stove_use))+
geom_bar(stat="identity", position=position_dodge())+geom_errorbar( aes(ymin=PMlevels-PMsd, ymax=PMlevels+PMsd), width=.2,position=position_dodge(.9))+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),panel.background = element_blank(), axis.line = element_line(colour = "black"),text = element_text(size = 20),axis.text=element_text(size=20),legend.key=element_blank(),plot.title = element_text(hjust = 0.5))+ggtitle("") +
  ylab("DALYs from PM2.5 per 10,000 ppl")+xlab("Stove Type")
print(newplotnew)

#keep
newplotnewnew<-ggplot() + 
  geom_bar(data=PMstovedataframe, aes(Stovenames,PMlevels, fill = Stove_use),stat = 'identity',position="dodge") +
  geom_bar(data=PMstovedataframetotal, aes(Stovenames,PMlevelstotal, fill = Stove_use),stat = 'identity',position="dodge",alpha=0.5)
theme(legend.position = 'top')
print(newplotnewnew)

#keep
newplotnewnew<-ggplot() + 
  geom_bar(data=PMstovedataframechild, aes(Stovenames,PMlevelschild, fill = Stove_use),stat = 'identity',position="dodge") +
  geom_bar(data=PMstovedataframetotal, aes(Stovenames,PMlevelstotal, fill = Stove_use),stat = 'identity',position="dodge",alpha=0.5)
theme(legend.position = 'top')
print(newplotnewnew)
print("error bars")







#################
#newnewnewdiff

diffsd = c(((cleanwhcDALYssd^2)/runs+(cleancDALYssd^2)/runs)^0.5,((charcoalwhcDALYssd^2)/runs+(charcoalcDALYssd^2)/runs)^0.5,((LPGwhcDALYssd^2)/runs+(LPGcDALYssd^2)/runs)^0.5,((minimotowhcDALYssd^2)/runs+(minimotocDALYssd^2)/runs)^0.5,((smokeywhcDALYssd^2)/runs+(smokeycDALYssd^2)/runs)^0.5,((improvedwhcDALYssd^2)/runs+(improvedcDALYssd^2)/runs)^0.5)
differencevalues=c(cleanDALYsdiff,charcoalDALYsdiff,LPGDALYsdiff,minimotoDALYsdiff,smokeyDALYsdiff,improvedDALYsdiff)
differencenames=c("Electric","Charcoal","LPG","Gasifier","Trad.Wood","Imp.Wood")
differencedataframe=data.frame(differencevalues,differencenames,diffsd)
LPGdiffline=c(rep(LPGDALYsdiff,21))
smokeydiffline=c(rep(smokeyDALYsdiff,21))
minimotodiffline=c(rep(minimotoDALYsdiff,21))
improveddiffline=c(rep(improvedDALYsdiff,21))
charcoaldiffline=c(rep(charcoalDALYsdiff,21))
cleandiffline=c(rep(0,21))

uncertaintyall=c(boilingdiffuncgroup,diffsd)
boilingbargroup=c(boilingbardifflr,boilingbardiffmr,boilingbardiffhr,differencevalues)



###########################

boilingbargroup=c(boilingbardifflr,boilingbardiffmr,boilingbardiffhr)


### try again
#uncertainty
boilingdiffuncertaintylr=c(((noboilingptlrsd^2)/runs+(lablevelptlrsd^2)/runs)^0.5,((noboilingptlrsd^2)/runs+(verygoodptlrsd^2)/runs)^0.5,((noboilingptlrsd^2)/runs+(goodptlrsd^2)/runs)^0.5,((noboilingptlrsd^2)/runs+(moderateptlrsd^2)/runs)^0.5,((noboilingptlrsd^2)/runs+(loweffectiveptlrsd^2)/runs)^0.5,((noboilingptlrsd^2)/runs+(ineffectiveptlrsd^2)/runs)^0.5)
boilingdiffuncertaintymr=c(((noboilingptmrsd^2)/runs+(lablevelptmrsd^2)/runs)^0.5,((noboilingptmrsd^2)/runs+(verygoodptmrsd^2)/runs)^0.5,((noboilingptmrsd^2)/runs+(goodptmrsd^2)/runs)^0.5,((noboilingptmrsd^2)/runs+(moderateptmrsd^2)/runs)^0.5,((noboilingptmrsd^2)/runs+(loweffectiveptmrsd^2)/runs)^0.5,((noboilingptmrsd^2)/runs+(ineffectiveptmrsd^2)/runs)^0.5)
boilingdiffuncertaintyhr=c(((noboilingpthrsd^2)/runs+(lablevelpthrsd^2)/runs)^0.5,((noboilingpthrsd^2)/runs+(verygoodpthrsd^2)/runs)^0.5,((noboilingpthrsd^2)/runs+(goodpthrsd^2)/runs)^0.5,((noboilingpthrsd^2)/runs+(moderatepthrsd^2)/runs)^0.5,((noboilingpthrsd^2)/runs+(loweffectivepthrsd^2)/runs)^0.5,((noboilingpthrsd^2)/runs+(ineffectivepthrsd^2)/runs)^0.5)
boilingdiffuncgroup=c(boilingdiffuncertaintylr,boilingdiffuncertaintymr,boilingdiffuncertaintyhr)

#actual water values
lablevelptdiffhr=noboilingpthr-lablevelpthr
verygoodptdiffhr=noboilingpthr-verygoodpthr
moderateptdiffhr=noboilingpthr-moderatepthr
goodptdiffhr=noboilingpthr-goodpthr
loweffectiveptdiffhr=noboilingpthr-loweffectivepthr
ineffectiveptdiffhr=noboilingpthr-ineffectivepthr
negativeptdiffhr=noboilingpthr-negativepthr
boilingbardiffhr=c(lablevelptdiffhr,verygoodptdiffhr,goodptdiffhr,moderateptdiffhr,loweffectiveptdiffhr,ineffectiveptdiffhr)


lablevelptdiffmr=noboilingptmr-lablevelptmr
verygoodptdiffmr=noboilingptmr-verygoodptmr
goodptdiffmr=noboilingptmr-goodptmr
moderateptdiffmr=noboilingptmr-moderateptmr
loweffectiveptdiffmr=noboilingptmr-loweffectiveptmr
ineffectiveptdiffmr=noboilingptmr-ineffectiveptmr
negativeptdiffmr=noboilingptmr-negativeptmr
boilingbardiffmr=c(lablevelptdiffmr,verygoodptdiffmr,goodptdiffmr,moderateptdiffmr,loweffectiveptdiffmr,ineffectiveptdiffmr)


lablevelptdifflr=noboilingptlr-lablevelptlr
verygoodptdifflr=noboilingptlr-verygoodptlr
goodptdifflr=noboilingptlr-goodptlr
moderateptdifflr=noboilingptlr-moderateptlr
loweffectiveptdifflr=noboilingptlr-loweffectiveptlr
ineffectiveptdifflr=noboilingptlr-ineffectiveptlr
negativeptdifflr=noboilingptlr-negativeptlr
boilingbardifflr=c(lablevelptdifflr,verygoodptdifflr,goodptdifflr,moderateptdifflr,loweffectiveptdifflr,ineffectiveptdifflr)



diffsd = c((cleanwhcDALYssd+cleancDALYssd)^0.5,(charcoalwhcDALYssd+charcoalcDALYssd)^0.5,(LPGwhcDALYssd+LPGcDALYssd)^0.5,(minimotowhcDALYssd+minimotocDALYssd)^0.5,(smokeywhcDALYssd+smokeycDALYssd)^0.5,(improvedwhcDALYssd+improvedcDALYssd)^0.5)
differencevalues=c(cleanDALYsdiff,charcoalDALYsdiff,LPGDALYsdiff,minimotoDALYsdiff,smokeyDALYsdiff,improvedDALYsdiff)
differencenames=c("Electric","Charcoal","LPG","Gasifier","Trad.Wood","Imp.Wood")
differencedataframe=data.frame(differencevalues,differencenames,diffsd)
LPGdiffline=c(rep(LPGDALYsdiff,21))
smokeydiffline=c(rep(smokeyDALYsdiff,21))
minimotodiffline=c(rep(minimotoDALYsdiff,21))
improveddiffline=c(rep(improvedDALYsdiff,21))
charcoaldiffline=c(rep(charcoalDALYsdiff,21))
cleandiffline=c(rep(0,21))

uncertaintyall=c(boilingdiffuncgroup,diffsd)
boilingbargroup=c(boilingbardifflr,boilingbardiffmr,boilingbardiffhr,differencevalues)


#######################
########################
#######################
###############
### Try try try try again
#uncertainty
newruns=10
boilingdiffuncertaintylr=c(((noboilingptlrsd^2)/newruns+(lablevelptlrsd^2)/newruns)^0.5,((noboilingptlrsd^2)/newruns+(verygoodptlrsd^2)/newruns)^0.5,((noboilingptlrsd^2)/newruns+(moderateptlrsd^2)/newruns)^0.5,((noboilingptlrsd^2)/newruns+(loweffectiveptlrsd^2)/newruns)^0.5,((noboilingptlrsd^2)/newruns+(ineffectiveptlrsd^2)/newruns)^0.5)
boilingdiffuncertaintymr=c(((noboilingptmrsd^2)/newruns+(lablevelptmrsd^2)/newruns)^0.5,((noboilingptmrsd^2)/newruns+(verygoodptmrsd^2)/newruns)^0.5,((noboilingptmrsd^2)/newruns+(moderateptmrsd^2)/newruns)^0.5,((noboilingptmrsd^2)/newruns+(loweffectiveptmrsd^2)/newruns)^0.5,((noboilingptmrsd^2)/newruns+(ineffectiveptmrsd^2)/newruns)^0.5)
boilingdiffuncertaintyhr=c(((noboilingpthrsd^2)/newruns+(lablevelpthrsd^2)/newruns)^0.5,((noboilingpthrsd^2)/newruns+(verygoodpthrsd^2)/newruns)^0.5,((noboilingpthrsd^2)/newruns+(moderatepthrsd^2)/newruns)^0.5,((noboilingpthrsd^2)/newruns+(loweffectivepthrsd^2)/newruns)^0.5,((noboilingpthrsd^2)/newruns+(ineffectivepthrsd^2)/newruns)^0.5)
boilingdiffuncgroup=c(boilingdiffuncertaintylr,boilingdiffuncertaintymr,boilingdiffuncertaintyhr)

boilingdiffuncertaintylrchild=c(((noboilingptlrsdchild^2)/newruns+(lablevelptlrsdchild^2)/newruns)^0.5,((noboilingptlrsdchild^2)/newruns+(verygoodptlrsdchild^2)/newruns)^0.5,((noboilingptlrsdchild^2)/newruns+(moderateptlrsdchild^2)/newruns)^0.5,((noboilingptlrsdchild^2)/newruns+(loweffectiveptlrsdchild^2)/newruns)^0.5,((noboilingptlrsdchild^2)/newruns+(ineffectiveptlrsdchild^2)/newruns)^0.5)
boilingdiffuncertaintymrchild=c(((noboilingptmrsdchild^2)/newruns+(lablevelptmrsdchild^2)/newruns)^0.5,((noboilingptmrsdchild^2)/newruns+(verygoodptmrsdchild^2)/newruns)^0.5,((noboilingptmrsdchild^2)/newruns+(moderateptmrsdchild^2)/newruns)^0.5,((noboilingptmrsdchild^2)/newruns+(loweffectiveptmrsdchild^2)/newruns)^0.5,((noboilingptmrsdchild^2)/newruns+(ineffectiveptmrsdchild^2)/newruns)^0.5)
boilingdiffuncertaintyhrchild=c(((noboilingpthrsdchild^2)/newruns+(lablevelpthrsdchild^2)/newruns)^0.5,((noboilingpthrsdchild^2)/newruns+(verygoodpthrsdchild^2)/newruns)^0.5,((noboilingpthrsdchild^2)/newruns+(moderatepthrsdchild^2)/newruns)^0.5,((noboilingpthrsdchild^2)/newruns+(loweffectivepthrsdchild^2)/newruns)^0.5,((noboilingpthrsdchild^2)/newruns+(ineffectivepthrsdchild^2)/newruns)^0.5)
boilingdiffuncgroupchild=c(boilingdiffuncertaintylrchild,boilingdiffuncertaintymrchild,boilingdiffuncertaintyhrchild)

boilingdiffuncertaintylrtotal=c(((noboilingptlrsdtotal^2)/newruns+(lablevelptlrsdtotal^2)/newruns)^0.5,((noboilingptlrsdtotal^2)/newruns+(verygoodptlrsdtotal^2)/newruns)^0.5,((noboilingptlrsdtotal^2)/newruns+(moderateptlrsdtotal^2)/newruns)^0.5,((noboilingptlrsdtotal^2)/newruns+(loweffectiveptlrsdtotal^2)/newruns)^0.5,((noboilingptlrsdtotal^2)/newruns+(ineffectiveptlrsdtotal^2)/newruns)^0.5)
boilingdiffuncertaintymrtotal=c(((noboilingptmrsdtotal^2)/newruns+(lablevelptmrsdtotal^2)/newruns)^0.5,((noboilingptmrsdtotal^2)/newruns+(verygoodptmrsdtotal^2)/newruns)^0.5,((noboilingptmrsdtotal^2)/newruns+(moderateptmrsdtotal^2)/newruns)^0.5,((noboilingptmrsdtotal^2)/newruns+(loweffectiveptmrsdtotal^2)/newruns)^0.5,((noboilingptmrsdtotal^2)/newruns+(ineffectiveptmrsdtotal^2)/newruns)^0.5)
boilingdiffuncertaintyhrtotal=c(((noboilingpthrsdtotal^2)/newruns+(lablevelpthrsdtotal^2)/newruns)^0.5,((noboilingpthrsdtotal^2)/newruns+(verygoodpthrsdtotal^2)/newruns)^0.5,((noboilingpthrsdtotal^2)/newruns+(moderatepthrsdtotal^2)/newruns)^0.5,((noboilingpthrsdtotal^2)/newruns+(loweffectivepthrsdtotal^2)/newruns)^0.5,((noboilingpthrsdtotal^2)/newruns+(ineffectivepthrsdtotal^2)/newruns)^0.5)
boilingdiffuncgrouptotal=c(boilingdiffuncertaintylrtotal,boilingdiffuncertaintymrtotal,boilingdiffuncertaintyhrtotal)

##########################

##########correct order
newruns=1000
boilingdiffuncertaintylr=c(((noboilingptlrsd^2)/newruns+(lablevelptlrsd^2)/newruns)^0.5,((noboilingptlrsd^2)/newruns+(verygoodptlrsd^2)/newruns)^0.5,((noboilingptlrsd^2)/newruns+(moderateptlrsd^2)/newruns)^0.5,((noboilingptlrsd^2)/newruns+(loweffectiveptlrsd^2)/newruns)^0.5,((noboilingptlrsd^2)/newruns+(ineffectiveptlrsd^2)/newruns)^0.5)
boilingdiffuncertaintymr=c(((noboilingptmrsd^2)/newruns+(lablevelptmrsd^2)/newruns)^0.5,((noboilingptmrsd^2)/newruns+(verygoodptmrsd^2)/newruns)^0.5,((noboilingptmrsd^2)/newruns+(moderateptmrsd^2)/newruns)^0.5,((noboilingptmrsd^2)/newruns+(loweffectiveptmrsd^2)/newruns)^0.5,((noboilingptmrsd^2)/newruns+(ineffectiveptmrsd^2)/newruns)^0.5)
boilingdiffuncertaintyhr=c(((noboilingpthrsd^2)/newruns+(lablevelpthrsd^2)/newruns)^0.5,((noboilingpthrsd^2)/newruns+(verygoodpthrsd^2)/newruns)^0.5,((noboilingpthrsd^2)/newruns+(moderatepthrsd^2)/newruns)^0.5,((noboilingpthrsd^2)/newruns+(loweffectivepthrsd^2)/newruns)^0.5,((noboilingpthrsd^2)/newruns+(ineffectivepthrsd^2)/newruns)^0.5)
boilingdiffuncgroup=c(boilingdiffuncertaintylr,boilingdiffuncertaintymr,boilingdiffuncertaintyhr)

boilingdiffuncertaintylrchild=c(((noboilingptlrsdchild^2)/newruns+(lablevelptlrsdchild^2)/newruns)^0.5,((noboilingptlrsdchild^2)/newruns+(verygoodptlrsdchild^2)/newruns)^0.5,((noboilingptlrsdchild^2)/newruns+(moderateptlrsdchild^2)/newruns)^0.5,((noboilingptlrsdchild^2)/newruns+(loweffectiveptlrsdchild^2)/newruns)^0.5,((noboilingptlrsdchild^2)/newruns+(ineffectiveptlrsdchild^2)/newruns)^0.5)
boilingdiffuncertaintymrchild=c(((noboilingptmrsdchild^2)/newruns+(lablevelptmrsdchild^2)/newruns)^0.5,((noboilingptmrsdchild^2)/newruns+(verygoodptmrsdchild^2)/newruns)^0.5,((noboilingptmrsdchild^2)/newruns+(moderateptmrsdchild^2)/newruns)^0.5,((noboilingptmrsdchild^2)/newruns+(loweffectiveptmrsdchild^2)/newruns)^0.5,((noboilingptmrsdchild^2)/newruns+(ineffectiveptmrsdchild^2)/newruns)^0.5)
boilingdiffuncertaintyhrchild=c(((noboilingpthrsdchild^2)/newruns+(lablevelpthrsdchild^2)/newruns)^0.5,((noboilingpthrsdchild^2)/newruns+(verygoodpthrsdchild^2)/newruns)^0.5,((noboilingpthrsdchild^2)/newruns+(moderatepthrsdchild^2)/newruns)^0.5,((noboilingpthrsdchild^2)/newruns+(loweffectivepthrsdchild^2)/newruns)^0.5,((noboilingpthrsdchild^2)/newruns+(ineffectivepthrsdchild^2)/newruns)^0.5)
boilingdiffuncgroupchild=c(boilingdiffuncertaintylrchild,boilingdiffuncertaintymrchild,boilingdiffuncertaintyhrchild)
#
boilingdiffuncertaintylrtotalnew=c((((noboilingptlrsdtotal^2)/newruns+(lablevelptlrsdtotal^2)/newruns)^0.5)*16,(((noboilingptlrsdtotal^2)/newruns+(verygoodptlrsdtotal^2)/newruns)^0.5)*14,(((noboilingptlrsdtotal^2)/newruns+(moderateptlrsdtotal^2)/newruns)^0.5)*12,(((noboilingptlrsdtotal^2)/newruns+(loweffectiveptlrsdtotal^2)/newruns)^0.5)*7,(((noboilingptlrsdtotal^2)/newruns+(ineffectiveptlrsdtotal^2)/newruns)^0.5)*1)
boilingdiffuncertaintymrtotalnew=c((((noboilingptmrsdtotal^2)/newruns+(lablevelptmrsdtotal^2)/newruns)^0.5)*16,(((noboilingptmrsdtotal^2)/newruns+(verygoodptmrsdtotal^2)/newruns)^0.5)*14,(((noboilingptmrsdtotal^2)/newruns+(moderateptmrsdtotal^2)/newruns)^0.5)*12,(((noboilingptmrsdtotal^2)/newruns+(loweffectiveptmrsdtotal^2)/newruns)^0.5)*7,(((noboilingptmrsdtotal^2)/newruns+(ineffectiveptmrsdtotal^2)/newruns)^0.5)*1)
boilingdiffuncertaintyhrtotalnew=c((((noboilingpthrsdtotal^2)/newruns+(lablevelpthrsdtotal^2)/newruns)^0.5)*16,(((noboilingpthrsdtotal^2)/newruns+(verygoodpthrsdtotal^2)/newruns)^0.5)*14,(((noboilingpthrsdtotal^2)/newruns+(moderatepthrsdtotal^2)/newruns)^0.5)*12,(((noboilingpthrsdtotal^2)/newruns+(loweffectivepthrsdtotal^2)/newruns)^0.5)*7,(((noboilingpthrsdtotal^2)/newruns+(ineffectivepthrsdtotal^2)/newruns)^0.5)*1)

#Boiling_Log_Reduction_Value=c("5    Lab Study LRV (6)","4    Best Field LRV (2)","3    Average Field LRV (1.5)","2    Low Field LRV (0.464)","1    Ineffective Field LRV (0.048)")

boilingdiffuncgrouptotalnew=c(boilingdiffuncertaintylrtotalnew,boilingdiffuncertaintymrtotalnew,boilingdiffuncertaintyhrtotalnew)
print(boilingdiffuncertaintylrtotalnew)
print(boilingdiffuncertaintymrtotalnew)
print(boilingdiffuncertaintyhrtotalnew)
print(boilingdiffuncgrouptotalnew)

## USE these
#actual water values for adult
lablevelptdiffhr=noboilingpthr-lablevelpthr
verygoodptdiffhr=noboilingpthr-verygoodpthr
moderateptdiffhr=noboilingpthr-moderatepthr
goodptdiffhr=noboilingpthr-goodpthr
loweffectiveptdiffhr=noboilingpthr-loweffectivepthr
ineffectiveptdiffhr=noboilingpthr-ineffectivepthr
negativeptdiffhr=noboilingpthr-negativepthr
boilingbardiffhr=c(lablevelptdiffhr,verygoodptdiffhr,moderateptdiffhr,loweffectiveptdiffhr,ineffectiveptdiffhr)


lablevelptdiffmr=noboilingptmr-lablevelptmr
verygoodptdiffmr=noboilingptmr-verygoodptmr
goodptdiffmr=noboilingptmr-goodptmr
moderateptdiffmr=noboilingptmr-moderateptmr
loweffectiveptdiffmr=noboilingptmr-loweffectiveptmr
ineffectiveptdiffmr=noboilingptmr-ineffectiveptmr
negativeptdiffmr=noboilingptmr-negativeptmr
boilingbardiffmr=c(lablevelptdiffmr,verygoodptdiffmr,moderateptdiffmr,loweffectiveptdiffmr,ineffectiveptdiffmr)


lablevelptdifflr=noboilingptlr-lablevelptlr
verygoodptdifflr=noboilingptlr-verygoodptlr
goodptdifflr=noboilingptlr-goodptlr
moderateptdifflr=noboilingptlr-moderateptlr
loweffectiveptdifflr=noboilingptlr-loweffectiveptlr
ineffectiveptdifflr=noboilingptlr-ineffectiveptlr
negativeptdifflr=noboilingptlr-negativeptlr
boilingbardifflr=c(lablevelptdifflr,verygoodptdifflr,moderateptdifflr,loweffectiveptdifflr,ineffectiveptdifflr)

### child

lablevelptdiffhrchild=noboilingpthrchild-lablevelpthrchild
verygoodptdiffhrchild=noboilingpthrchild-verygoodpthrchild
moderateptdiffhrchild=noboilingpthrchild-moderatepthrchild
goodptdiffhrchild=noboilingpthrchild-goodpthrchild
loweffectiveptdiffhrchild=noboilingpthrchild-loweffectivepthrchild
ineffectiveptdiffhrchild=noboilingpthrchild-ineffectivepthrchild
negativeptdiffhrchild=noboilingpthrchild-negativepthrchild
boilingbardiffhrchild=c(lablevelptdiffhrchild,verygoodptdiffhrchild,moderateptdiffhrchild,loweffectiveptdiffhrchild,ineffectiveptdiffhrchild)


lablevelptdiffmrchild=noboilingptmrchild-lablevelptmrchild
verygoodptdiffmrchild=noboilingptmrchild-verygoodptmrchild
goodptdiffmrchild=noboilingptmrchild-goodptmrchild
moderateptdiffmrchild=noboilingptmrchild-moderateptmrchild
loweffectiveptdiffmrchild=noboilingptmrchild-loweffectiveptmrchild
ineffectiveptdiffmrchild=noboilingptmrchild-ineffectiveptmrchild
negativeptdiffmrchild=noboilingptmrchild-negativeptmrchild
boilingbardiffmrchild=c(lablevelptdiffmrchild,verygoodptdiffmrchild,moderateptdiffmrchild,loweffectiveptdiffmrchild,ineffectiveptdiffmrchild)


lablevelptdifflrchild=noboilingptlrchild-lablevelptlrchild
verygoodptdifflrchild=noboilingptlrchild-verygoodptlrchild
goodptdifflrchild=noboilingptlrchild-goodptlrchild
moderateptdifflrchild=noboilingptlrchild-moderateptlrchild
loweffectiveptdifflrchild=noboilingptlrchild-loweffectiveptlrchild
ineffectiveptdifflrchild=noboilingptlrchild-ineffectiveptlrchild
negativeptdifflrchild=noboilingptlrchild-negativeptlrchild
boilingbardifflrchild=c(lablevelptdifflrchild,verygoodptdifflrchild,moderateptdifflrchild,loweffectiveptdifflrchild,ineffectiveptdifflrchild)

##

### total

lablevelptdiffhrtotal=noboilingpthrtotal-lablevelpthrtotal
verygoodptdiffhrtotal=noboilingpthrtotal-verygoodpthrtotal
moderateptdiffhrtotal=noboilingpthrtotal-moderatepthrtotal
goodptdiffhrtotal=noboilingpthrtotal-goodpthrtotal
loweffectiveptdiffhrtotal=noboilingpthrtotal-loweffectivepthrtotal
ineffectiveptdiffhrtotal=noboilingpthrtotal-ineffectivepthrtotal
negativeptdiffhrtotal=noboilingpthrtotal-negativepthrtotal
boilingbardiffhrtotal=c(lablevelptdiffhrtotal,verygoodptdiffhrtotal,moderateptdiffhrtotal,loweffectiveptdiffhrtotal,ineffectiveptdiffhrtotal)


lablevelptdiffmrtotal=noboilingptmrtotal-lablevelptmrtotal
verygoodptdiffmrtotal=noboilingptmrtotal-verygoodptmrtotal
goodptdiffmrtotal=noboilingptmrtotal-goodptmrtotal
moderateptdiffmrtotal=noboilingptmrtotal-moderateptmrtotal
loweffectiveptdiffmrtotal=noboilingptmrtotal-loweffectiveptmrtotal
ineffectiveptdiffmrtotal=noboilingptmrtotal-ineffectiveptmrtotal
negativeptdiffmrtotal=noboilingptmrtotal-negativeptmrtotal
boilingbardiffmrtotal=c(lablevelptdiffmrtotal,verygoodptdiffmrtotal,moderateptdiffmrtotal,loweffectiveptdiffmrtotal,ineffectiveptdiffmrtotal)


lablevelptdifflrtotal=noboilingptlrtotal-lablevelptlrtotal
verygoodptdifflrtotal=noboilingptlrtotal-verygoodptlrtotal
goodptdifflrtotal=noboilingptlrtotal-goodptlrtotal
moderateptdifflrtotal=noboilingptlrtotal-moderateptlrtotal
loweffectiveptdifflrtotal=noboilingptlrtotal-loweffectiveptlrtotal
ineffectiveptdifflrtotal=noboilingptlrtotal-ineffectiveptlrtotal
negativeptdifflrtotal=noboilingptlrtotal-negativeptlrtotal
boilingbardifflrtotal=c(lablevelptdifflrtotal,verygoodptdifflrtotal,moderateptdifflrtotal,loweffectiveptdifflrtotal,ineffectiveptdifflrtotal)

##




diffsd = c(((charcoalwhcDALYssd^2)/runs+(charcoalcDALYssd^2)/runs)^0.5,((LPGwhcDALYssd^2)/runs+(LPGcDALYssd^2)/runs)^0.5,((minimotowhcDALYssd^2)/runs+(minimotocDALYssd^2)/runs)^0.5,((smokeywhcDALYssd^2)/runs+(smokeycDALYssd^2)/runs)^0.5,((improvedwhcDALYssd^2)/runs+(improvedcDALYssd^2)/runs)^0.5)
differencevalues=c(charcoalDALYsdiff,LPGDALYsdiff,minimotoDALYsdiff,smokeyDALYsdiff,improvedDALYsdiff)
waterheatingonlyvalues=c(charcoalwhDALYsavg,LPGwhDALYsavg,minimotowhDALYsavg,smokeywhDALYsavg,improvedwhDALYsavg)
waterheatingsd = c(charcoalwhDALYssd,LPGwhDALYssd,minimotowhDALYssd,smokeywhDALYssd,improvedwhDALYssd)

diffsdchild = c(((charcoalwhcDALYssdchild^2)/runs+(charcoalcDALYssdchild^2)/runs)^0.5,((LPGwhcDALYssdchild^2)/runs+(LPGcDALYssdchild^2)/runs)^0.5,((minimotowhcDALYssdchild^2)/runs+(minimotocDALYssdchild^2)/runs)^0.5,((smokeywhcDALYssdchild^2)/runs+(smokeycDALYssdchild^2)/runs)^0.5,((improvedwhcDALYssdchild^2)/runs+(improvedcDALYssdchild^2)/runs)^0.5)
differencevalueschild=c(charcoalDALYsdiffchild,LPGDALYsdiffchild,minimotoDALYsdiffchild,smokeyDALYsdiffchild,improvedDALYsdiffchild)
waterheatingonlyvalueschild=c(charcoalwhDALYsavgchild,LPGwhDALYsavgchild,minimotowhDALYsavgchild,smokeywhDALYsavgchild,improvedwhDALYsavgchild)
waterheatingsdchild = c(charcoalwhDALYssdchild,LPGwhDALYssdchild,minimotowhDALYssdchild,smokeywhDALYssdchild,improvedwhDALYssdchild)

diffsdtotal = c(((charcoalwhcDALYssdtotal^2)/runs+(charcoalcDALYssdtotal^2)/runs)^0.5,((LPGwhcDALYssdtotal^2)/runs+(LPGcDALYssdtotal^2)/runs)^0.5,((minimotowhcDALYssdtotal^2)/runs+(minimotocDALYssdtotal^2)/runs)^0.5,((smokeywhcDALYssdtotal^2)/runs+(smokeycDALYssdtotal^2)/runs)^0.5,((improvedwhcDALYssdtotal^2)/runs+(improvedcDALYssdtotal^2)/runs)^0.5)
differencevaluestotal=c(charcoalDALYsdifftotal,LPGDALYsdifftotal,minimotoDALYsdifftotal,smokeyDALYsdifftotal,improvedDALYsdifftotal)
waterheatingonlyvaluestotal=c(charcoalwhDALYsavgtotal,LPGwhDALYsavgtotal,minimotowhDALYsavgtotal,smokeywhDALYsavgtotal,improvedwhDALYsavgtotal)
waterheatingsdtotal = c(charcoalwhDALYssdtotal,LPGwhDALYssdtotal,minimotowhDALYssdtotal,smokeywhDALYssdtotal,improvedwhDALYssdtotal)

differencenames=c("C.    Charcoal (Improved)","A.    LPG (Clean)","B.    Gasifier (Improved)","E.    Wood (Traditional)","D.    Wood (Improved)")
Waterheatingnames=c("H.    Charcoal (Improved, WH)","F.    LPG (Clean, WH)","G.    Gasifier (Improved, WH)","J.    Wood (Traditional, WH)","I.    Wood (Improved, WH)")

differencedataframe=data.frame(differencevalues,differencenames,diffsd)
differencedataframechild=data.frame(differencevalueschild,differencenames,diffsdchild)
differencedataframetotal=data.frame(differencevaluestotal,differencenames,diffsdtotal)


Boiling_Log_Reduction_Value=c("5    Lab Study LRV (6)","4    Best Field LRV (2)","3    Average Field LRV (1.5)","2    Low Field LRV (0.464)","1    Ineffective Field LRV (0.048)")


uncertaintyall=c(boilingdiffuncgroup,diffsd,waterheatingsd)
uncertaintyallchild=c(boilingdiffuncgroupchild,diffsdchild,waterheatingsdchild)
uncertaintyalltotal=c(boilingdiffuncgrouptotal,diffsdtotal,waterheatingsdtotal)
uncertaintyalltotalnew=c(boilingdiffuncgrouptotalnew,diffsdtotal,waterheatingsdtotal)


boilingbargroup=c(-boilingbardifflr,-boilingbardiffmr,-boilingbardiffhr,differencevalues,waterheatingonlyvalues)
boilingbargroupchild=c(-boilingbardifflrchild,-boilingbardiffmrchild,-boilingbardiffhrchild,differencevalueschild,waterheatingonlyvalueschild)
boilingbargrouptotal=c(-boilingbardifflrtotal,-boilingbardiffmrtotal,-boilingbardiffhrtotal,differencevaluestotal,waterheatingonlyvaluestotal)

Category=c(Boiling_Log_Reduction_Value,Boiling_Log_Reduction_Value,Boiling_Log_Reduction_Value,differencenames,differencenames)
boilingbargrouprisk=c(rep("A Low Risk",5),rep("B Medium Risk",5),rep("C High Risk",5),rep("D Boil+Cook",5),rep("E Boil Only",5))

Boilingbardataframe=data.frame(boilingbargroup, boilingbargrouprisk,Category,uncertaintyall)
Boilingbardataframechild=data.frame(boilingbargroupchild, boilingbargrouprisk,Category,uncertaintyallchild)
Boilingbardataframetotal=data.frame(boilingbargrouptotal, boilingbargrouprisk,Category,uncertaintyalltotal)




jpeg(file=file.path(currentresultspath,"adultchildfinalplot_v3.jpg"), res=600, width=16000, height=8000, pointsize=10,
     type="windows", antialias="cleartype")
newplotnewboilingdiffhello<-ggplot(data=Boilingbardataframetotal, aes(x=boilingbargrouprisk, y=boilingbargrouptotal, fill=Category))+
  geom_bar(stat="identity", position=position_dodge(),fill="white")+theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),panel.background = element_blank(), axis.line = element_line(colour = "black"),text = element_text(size = 20),axis.text=element_text(size=20),legend.key=element_blank(),plot.title = element_text(hjust = 0.5))+ggtitle("") +
  ylab("Change in DALYs from Boiling (10,000 ppl)")+xlab("Source Water Risk Level in MPN E. coli/100mL")+geom_errorbar( aes(ymin=boilingbargrouptotal-uncertaintyalltotal, ymax=boilingbargrouptotal+uncertaintyalltotal), width=.2,position=position_dodge(.9))+geom_bar(data=Boilingbardataframetotal, aes(x=boilingbargrouprisk, y=boilingbargrouptotal, fill=Category),stat="identity", position=position_dodge(),alpha=0.4)+geom_bar(data=Boilingbardataframe, aes(x=boilingbargrouprisk, y=boilingbargroup, fill=Category),stat="identity", position=position_dodge(),alpha=0.9)+ylim(-1500,500)

print(newplotnewboilingdiffhello)
dev.off()
print(newplotnewboilingdiffhello)

jpeg(file=file.path(currentresultspath,"adultchildfinalplot_v3.jpg"), res=600, width=16000, height=8000, pointsize=10,
     type="windows", antialias="cleartype")
newplotnewboilingdiffhello<-ggplot(data=Boilingbardataframetotal, aes(x=boilingbargrouprisk, y=boilingbargrouptotal, fill=Category))+
  geom_bar(stat="identity", position=position_dodge(),fill="white")+theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),panel.background = element_blank(), axis.line = element_line(colour = "black"),text = element_text(size = 20),axis.text=element_text(size=20),legend.key=element_blank(),plot.title = element_text(hjust = 0.5))+ggtitle("") +
  ylab("Change in DALYs from Boiling (10,000 ppl)")+xlab("Source Water Risk Level in MPN E. coli/100mL")+geom_errorbar( aes(ymin=boilingbargrouptotal-uncertaintyalltotalnew, ymax=boilingbargrouptotal+uncertaintyalltotalnew), width=.2,position=position_dodge(.9))+geom_bar(data=Boilingbardataframetotal, aes(x=boilingbargrouprisk, y=boilingbargrouptotal, fill=Category),stat="identity", position=position_dodge(),alpha=0.4)+geom_bar(data=Boilingbardataframe, aes(x=boilingbargrouprisk, y=boilingbargroup, fill=Category),stat="identity", position=position_dodge(),alpha=0.9)+ylim(-2000,500)

print(newplotnewboilingdiffhello)
dev.off()
print(newplotnewboilingdiffhello)




 
#below is DALYs from PM
newplotnewnew<-ggplot(data=PMstovedataframetotal,aes(x=Stovenames,y=PMlevelstotal,fill=Stove_use))+ 
  geom_bar(stat = 'identity',position="dodge",fill="grey")+scale_fill_manual(values=redyellowblue)+ggtitle(paste(country)) +ylim(-10, 400)+
  ylab("Total DALYs for different stove types (10,000 ppl)")+xlab("Stove Type")+geom_errorbar(aes(ymin=PMlevelstotal-PMsdtotal, ymax=PMlevelstotal+PMsdtotal), width=.2,position=position_dodge(.9))+geom_bar(data=PMstovedataframe,aes(x=Stovenames,y=PMlevels,fill=Stove_use),stat="identity",position=position_dodge(),alpha=0.4)+geom_bar(data=PMstovedataframetotal, aes(x=Stovenames, y=PMlevelstotal, fill=Stove_use),stat="identity", position=position_dodge(),alpha=0.4)+theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),panel.background=element_rect(fill="grey",color="grey",size=0.5,linetype="solid"), axis.line = element_line(colour = "black"),text = element_text(size = 20),axis.text=element_text(size=20),legend.key=element_rect(fill="grey"),plot.title = element_text(hjust = 0.5))
print(newplotnewnew)

newplotnewnew<-ggplot(data=PMstovedataframetotal,aes(x=Stovenames,y=PMlevelstotal,fill=Stove_use))+ 
  geom_bar(stat = 'identity',position="dodge",fill="white")+scale_fill_manual(values=redyellowblue)+ggtitle(paste(country)) +
  ylab("Total DALYs for different stove types (10,000 ppl)")+xlab("Stove Type")+geom_errorbar(aes(ymin=PMlevelstotal-PMsdtotal, ymax=PMlevelstotal+PMsdtotal), width=.2,position=position_dodge(.9))+geom_bar(data=PMstovedataframe,aes(x=Stovenames,y=PMlevels,fill=Stove_use),stat="identity",position=position_dodge(),alpha=0.4)+geom_bar(data=PMstovedataframetotal, aes(x=Stovenames, y=PMlevelstotal, fill=Stove_use),stat="identity", position=position_dodge(),alpha=0.4)+theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),panel.background = element_blank(), axis.line = element_line(colour = "black"),text = element_text(size = 20),axis.text=element_text(size=20),legend.key=element_blank(),plot.title = element_text(hjust = 0.5))
print(newplotnewnew)

newplotnewnew<-ggplot(data=PMstovedataframetotal,aes(x=Stovenames,y=PMlevelstotal,fill=Stove_use))+ 
  geom_bar(stat = 'identity',position="dodge",fill="white")+scale_fill_manual(values=redyellowblue)+ggtitle(paste(country)) +ylim(-10, 400)+
  ylab("Total DALYs for different stove types (10,000 ppl)")+xlab("Stove Type")+geom_errorbar(aes(ymin=PMlevelstotal-PMsdtotal, ymax=PMlevelstotal+PMsdtotal), width=.2,position=position_dodge(.9))+geom_bar(data=PMstovedataframe,aes(x=Stovenames,y=PMlevels,fill=Stove_use),stat="identity",position=position_dodge(),alpha=0.4)+geom_bar(data=PMstovedataframetotal, aes(x=Stovenames, y=PMlevelstotal, fill=Stove_use),stat="identity", position=position_dodge(),alpha=0.4)+theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),panel.background = element_blank(), axis.line = element_line(colour = "black"),text = element_text(size = 20),axis.text=element_text(size=20),legend.key=element_blank(),plot.title = element_text(hjust = 0.5))
print(newplotnewnew)

#color blind version
newplotnewnew<-ggplot(data=PMstovedataframetotal,aes(x=Stovenames,y=PMlevelstotal,fill=Stove_use))+ 
  geom_bar(stat = 'identity',position="dodge",fill="white")+ggtitle(paste(country)) +
  ylab("Total DALYs for different stove types (10,000 ppl)")+xlab("Stove Type")+geom_errorbar(aes(ymin=PMlevelstotal-PMsdtotal, ymax=PMlevelstotal+PMsdtotal), width=.2,position=position_dodge(.9))+geom_bar(data=PMstovedataframe,aes(x=Stovenames,y=PMlevels,fill=Stove_use),stat="identity",position=position_dodge(),alpha=0.4)+geom_bar(data=PMstovedataframetotal, aes(x=Stovenames, y=PMlevelstotal, fill=Stove_use),stat="identity", position=position_dodge(),alpha=0.4)+theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),panel.background = element_blank(), axis.line = element_line(colour = "black"),text = element_text(size = 20),axis.text=element_text(size=20),legend.key=element_blank(),plot.title = element_text(hjust = 0.5))
print(newplotnewnew)

#children only




