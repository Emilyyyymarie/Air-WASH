
#February 21,2023
#updated to be color blind friendly

# The palette with grey:
cbPalette <- c("#999999", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

# The palette with black:
cbbPalette <- c("#000000", "#E69F00", "#56B4E9", "#009E73", "#F0E442", "#0072B2", "#D55E00", "#CC79A7")

#Palette with blue purple orange

redyellowblue <- c("Blue2","Darkorange4","cyan")
redyellowblue <- c("Blue2","Darkorange4","cyan4")
numberseq=c(1,1000)
runs=1000
print(country)
#read in values from stored excel

print("read variables")
source("Plot_read_variables.R")
print("plot calculations")
source("plot_calculations.R")
print("plot calculations total")
source("Plot_calculations_Total.R")
print("Plot calculations difference total")
source("Plot_calculations_diff_total.R")
#source("Plot_SD_calculations.R")
print("generate totals")
source("Plotting_Generate_Totals.R")
print("end")

print("Starting 24 Hour Kitchen PM2.5 Conc")
############# PLOT NUMBER ONE###########################

###############################################################
### --- 24 Hour Kitchen PM2.5 Conc ug/m^3 --- ####
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

newplotnew<-ggplot(data=PMstovedataframe, aes(x=Stovenames, y=PMlevels, fill=Stove_use))+
  geom_bar(stat="identity", position=position_dodge())+geom_errorbar( aes(ymin=PMlevels-PMsd, ymax=PMlevels+PMsd), width=.2,position=position_dodge(.9))+
  theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),panel.background = element_blank(), axis.line = element_line(colour = "black"),text = element_text(size = 20),axis.text=element_text(size=20),legend.key=element_blank(),plot.title = element_text(hjust = 0.5))+ggtitle("") +
  ylab("Avg 24-Hr Kitchen PM2.5 Conc. ug/m^3")+xlab("Stove Type")+scale_color_manual(values=c("green", "orange", "blue"))
print(newplotnew)
##
print("finish plot one")
#########################





#adult
boilingdiffuncertaintylr=c(lableveldiffsdadultlr,verygooddiffsdadultlr,gooddiffsdadultlr,moderatediffsdadultlr,loweffectivediffsdadultlr,ineffectivediffsdadultlr)
boilingdiffuncertaintymr=c(lableveldiffsdadultmr,verygooddiffsdadultmr,gooddiffsdadultmr,moderatediffsdadultmr,loweffectivediffsdadultmr,ineffectivediffsdadultmr)
boilingdiffuncertaintyhr=c(lableveldiffsdadulthr,verygooddiffsdadulthr,gooddiffsdadulthr,moderatediffsdadulthr,loweffectivediffsdadulthr,ineffectivediffsdadulthr)

#child
boilingdiffuncertaintylrchild=c(lableveldiffsdchildlr,verygooddiffsdchildlr,gooddiffsdchildlr,moderatediffsdchildlr,loweffectivediffsdchildlr,ineffectivediffsdchildlr,negativediffsdchildlr)
boilingdiffuncertaintymrchild=c(lableveldiffsdchildmr,verygooddiffsdchildmr,gooddiffsdchildmr,moderatediffsdchildmr,loweffectivediffsdchildmr,ineffectivediffsdchildmr,negativediffsdchildmr)
boilingdiffuncertaintyhrchild=c(lableveldiffsdchildhr,verygooddiffsdchildhr,gooddiffsdchildhr,moderatediffsdchildhr,loweffectivediffsdchildhr,ineffectivediffsdchildhr,negativediffsdchildhr)

boilingdiffuncertaintylrchildnonegative=c(lableveldiffsdchildlr,verygooddiffsdchildlr,moderatediffsdchildlr,loweffectivediffsdchildlr,ineffectivediffsdchildlr)
boilingdiffuncertaintymrchildnonegative=c(lableveldiffsdchildmr,verygooddiffsdchildmr,moderatediffsdchildmr,loweffectivediffsdchildmr,ineffectivediffsdchildmr)
boilingdiffuncertaintyhrchildnonegative=c(lableveldiffsdchildhr,verygooddiffsdchildhr,moderatediffsdchildhr,loweffectivediffsdchildhr,ineffectivediffsdchildhr)

#child average

boilingbardiffhrchild=c(lablevelptdiffhrchild,verygoodptdiffhrchild,goodptdiffhrchild,moderateptdiffhrchild,loweffectiveptdiffhrchild,ineffectiveptdiffhrchild,negativeptdiffhrchild)
boilingbardiffmrchild=c(lablevelptdiffmrchild,verygoodptdiffmrchild,goodptdiffmrchild,moderateptdiffmrchild,loweffectiveptdiffmrchild,ineffectiveptdiffmrchild,negativeptdiffmrchild)
boilingbardifflrchild=c(lablevelptdifflrchild,verygoodptdifflrchild,goodptdifflrchild,moderateptdifflrchild,loweffectiveptdifflrchild,ineffectiveptdifflrchild,negativeptdifflrchild)

#adult average
boilingbardiffhr=c(lablevelptdiffhr,verygoodptdiffhr,goodptdiffhr,moderateptdiffhr,loweffectiveptdiffhr,ineffectiveptdiffhr,negativeptdiffhr)
boilingbardiffmr=c(lablevelptdiffmr,verygoodptdiffmr,goodptdiffmr,moderateptdiffmr,loweffectiveptdiffmr,ineffectiveptdiffmr,negativeptdiffmr)
boilingbardifflr=c(lablevelptdifflr,verygoodptdifflr,goodptdifflr,moderateptdifflr,loweffectiveptdifflr,ineffectiveptdifflr,negativeptdifflr)
###########
###?????




boilingbardiffhrtotal=c(lablevelptdiffhrtotal,verygoodptdiffhrtotal,goodptdiffhrtotal,moderateptdiffhrtotal,loweffectiveptdiffhrtotal,ineffectiveptdiffhrtotal,negativeptdiffhrtotal)



boilingbardiffmrtotal=c(lablevelptdiffmrtotal,verygoodptdiffmrtotal,goodptdiffmrtotal,moderateptdiffmrtotal,loweffectiveptdiffmrtotal,ineffectiveptdiffmrtotal,negativeptdiffmrtotal)



boilingbardifflrtotal=c(lablevelptdifflrtotal,verygoodptdifflrtotal,goodptdifflrtotal,moderateptdifflrtotal,loweffectiveptdifflrtotal,ineffectiveptdifflrtotal,negativeptdifflrtotal)

### ending total
#finish with variables

#boiling bar difference graph
#0,6,2,1.5,1.8,0.464,0.048,-0.208
boilingbargroupdiff=c(boilingbardifflr,boilingbardiffmr,boilingbardiffhr)
boilingbargroupdiffchild=c(boilingbardifflrchild,boilingbardiffmrchild,boilingbardiffhrchild)
boilingbargroupdifftotal=c(boilingbardifflrtotal,boilingbardiffmrtotal,boilingbardiffhrtotal)

boilingdiffuncertaintylr=c(lableveldiffsdadultlr,verygooddiffsdadultlr,gooddiffsdadultlr,moderatediffsdadultlr,loweffectivediffsdadultlr,ineffectivediffsdadultlr,negativediffsdadultlr)
boilingdiffuncertaintymr=c(lableveldiffsdadultmr,verygooddiffsdadultmr,gooddiffsdadultmr,moderatediffsdadultmr,loweffectivediffsdadultmr,ineffectivediffsdadultmr,negativediffsdadultmr)
boilingdiffuncertaintyhr=c(lableveldiffsdadulthr,verygooddiffsdadulthr,gooddiffsdadulthr,moderatediffsdadulthr,loweffectivediffsdadulthr,ineffectivediffsdadulthr,negativediffsdadulthr)

boilingdiffuncgroup=c(boilingdiffuncertaintylr,boilingdiffuncertaintymr,boilingdiffuncertaintyhr)

boilingdiffuncertaintylrnonegative=c(lableveldiffsdadultlr,verygooddiffsdadultlr,moderatediffsdadultlr,loweffectivediffsdadultlr,ineffectivediffsdadultlr)
boilingdiffuncertaintymrnonegative=c(lableveldiffsdadultmr,verygooddiffsdadultmr,moderatediffsdadultmr,loweffectivediffsdadultmr,ineffectivediffsdadultmr)
boilingdiffuncertaintyhrnonegative=c(lableveldiffsdadulthr,verygooddiffsdadulthr,moderatediffsdadulthr,loweffectivediffsdadulthr,ineffectivediffsdadulthr)

boilingdiffuncgroupnonegative=c(boilingdiffuncertaintylrnonegative,boilingdiffuncertaintymrnonegative,boilingdiffuncertaintyhrnonegative)
print("check1")
Boiling_Log_Reduction_Value=c("6:Lab Level","2:Very Good", "1.8:Good", "1.5:Moderate","0.464:Low","0.048:Ineffective","-0.208:Worse than Source")
boilngdiffreductionvaluenew=c(Boiling_Log_Reduction_Value,Boiling_Log_Reduction_Value,Boiling_Log_Reduction_Value)
boilingbargrouprisk=c(rep("LowRisk",7),rep("MediumRisk",7),rep("HighRisk",7))
Boilingbardataframediff=data.frame(boilingbargroupdiff, boilingbargrouprisk,boilngdiffreductionvaluenew,boilingdiffuncgroup)
print("check2")
Boilingbardataframediffchild=data.frame(boilingbargroupdiffchild, boilingbargrouprisk,boilngdiffreductionvaluenew,boilingdiffuncgroup)
print("check3")
Boilingbardataframedifftotal=data.frame(boilingbargroupdifftotal, boilingbargrouprisk,boilngdiffreductionvaluenew,boilingdiffuncgroup)
print("hi")
#keep
newplotnewboilingdiffone<-ggplot(data=Boilingbardataframediff, aes(x=boilingbargrouprisk, y=boilingbargroupdiff, fill=boilngdiffreductionvaluenew))+
  geom_bar(stat="identity", position=position_dodge())+theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),panel.background = element_blank(), axis.line = element_line(colour = "black"),text = element_text(size = 20),axis.text=element_text(size=20),legend.key=element_blank(),plot.title = element_text(hjust = 0.5))+ggtitle("") +
  ylab("DALYs Reduction from Boiling")+xlab("Water Risk Level in MPN E. coli/100mL")+geom_errorbar( aes(ymin=boilingbargroupdiff-boilingdiffuncgroup, ymax=boilingbargroupdiff+boilingdiffuncgroup), width=.2,position=position_dodge(.9))
print(newplotnewboilingdiffone)
print("Finish")

#Net DALYs (not difference)###############
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
Boilingbardataframechild=data.frame(boilingbargroupchild, boilingbargrouprisk,Boiling_Log_Reduction_Value,boilingbargroupsdchild)
Boilingbardataframetotal=data.frame(boilingbargrouptotal, boilingbargrouprisk,Boiling_Log_Reduction_Value,boilingbargroupsdtotal)

write.csv(Boilingbardataframe,file.path(currentresultspath, paste("Boiling_DALYs_adults",country,".csv",sep="")),row.names=FALSE)
write.csv(Boilingbardataframechild,file.path(currentresultspath, paste("Boiling_DALYs_child",country,".csv",sep="")),row.names=FALSE)
write.csv(Boilingbardataframetotal,file.path(currentresultspath,paste("Boiling_DALYs_total",country,".csv",sep="")),row.names=FALSE)


print("check4")
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
boilingbargrouprisk=c(rep("ALow Risk",6),rep("BMedium Risk",6),rep("CHigh Risk",6))
Boilingbardataframe=data.frame(boilingbargroup, boilingbargrouprisk,Boiling_Log_Reduction_Value,boilingbargroupsd)
print("check5")
#keep
newplotnewboiling<-ggplot(data=Boilingbardataframe, aes(x=boilingbargrouprisk, y=boilingbargroup, fill=Boiling_Log_Reduction_Value))+
  geom_bar(stat="identity", position=position_dodge())+theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),panel.background = element_blank(), axis.line = element_line(colour = "black"),text = element_text(size = 20),axis.text=element_text(size=20),legend.key=element_blank(),plot.title = element_text(hjust = 0.5))+ggtitle("") +
  ylab("DALYs from Drinking Water")+xlab("Water Risk Level in MPN E. coli/100mL")+geom_errorbar( aes(ymin=boilingbargroup-boilingbargroupsd, ymax=boilingbargroup+boilingbargroupsd), width=.2,position=position_dodge(.9))
print(newplotnewboiling)
print("Finish3")



print("END")

#################end drinking water plots##########################


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
#boilingdiffuncertaintylr=c((noboilingptlrsd^2)/runs+(lablevelptlrsd^2)/runs)^0.5,((noboilingptlrsd^2)/runs+(verygoodptlrsd^2)/runs)^0.5,((noboilingptlrsd^2)/runs+(goodptlrsd^2)/runs)^0.5,((noboilingptlrsd^2)/runs+(moderateptlrsd^2)/runs)^0.5,((noboilingptlrsd^2)/runs+(loweffectiveptlrsd^2)/runs)^0.5,((noboilingptlrsd^2)/runs+(ineffectiveptlrsd^2)/runs)^0.5)
#boilingdiffuncertaintymr=c(((noboilingptmrsd^2)/runs+(lablevelptmrsd^2)/runs)^0.5,((noboilingptmrsd^2)/runs+(verygoodptmrsd^2)/runs)^0.5,((noboilingptmrsd^2)/runs+(goodptmrsd^2)/runs)^0.5,((noboilingptmrsd^2)/runs+(moderateptmrsd^2)/runs)^0.5,((noboilingptmrsd^2)/runs+(loweffectiveptmrsd^2)/runs)^0.5,((noboilingptmrsd^2)/runs+(ineffectiveptmrsd^2)/runs)^0.5)
#boilingdiffuncertaintyhr=c(((noboilingpthrsd^2)/runs+(lablevelpthrsd^2)/runs)^0.5,((noboilingpthrsd^2)/runs+(verygoodpthrsd^2)/runs)^0.5,((noboilingpthrsd^2)/runs+(goodpthrsd^2)/runs)^0.5,((noboilingpthrsd^2)/runs+(moderatepthrsd^2)/runs)^0.5,((noboilingpthrsd^2)/runs+(loweffectivepthrsd^2)/runs)^0.5,((noboilingpthrsd^2)/runs+(ineffectivepthrsd^2)/runs)^0.5)
#boilingdiffuncgroup=c(boilingdiffuncertaintylr,boilingdiffuncertaintymr,boilingdiffuncertaintyhr)

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


#boilingdiffuncertaintylrtotalnew=c((noboilingptlrsdtotal^2+lablevelptlrsdtotal^2)^0.5,(noboilingptlrsdtotal^2+verygoodptlrsdtotal^2)^0.5,(noboilingptlrsdtotal^2+moderateptlrsdtotal^2)^0.5,(noboilingptlrsdtotal^2+loweffectiveptlrsdtotal^2)^0.5,(noboilingptlrsdtotal^2+ineffectiveptlrsdtotal^2)^0.5)
#boilingdiffuncertaintymrtotalnew=c((noboilingptmrsdtotal^2+lablevelptmrsdtotal^2)^0.5,(noboilingptmrsdtotal^2+verygoodptmrsdtotal)^0.5,(noboilingptmrsdtotal^2+moderateptmrsdtotal^2)^0.5,(noboilingptmrsdtotal^2+loweffectiveptmrsdtotal^2)^0.5,(noboilingptmrsdtotal^2+ineffectiveptmrsdtotal^2)^0.5)
#boilingdiffuncertaintyhrtotalnew=c((noboilingpthrsdtotal^2+lablevelpthrsdtotal^2)^0.5,(noboilingpthrsdtotal^2+verygoodpthrsdtotal^2)^0.5,(noboilingpthrsdtotal^2+moderatepthrsdtotal^2)^0.5,(noboilingpthrsdtotal^2+loweffectivepthrsdtotal^2)^0.5,(noboilingpthrsdtotal^2+ineffectivepthrsdtotal^2)^0.5)

#boilingdiffuncertaintylrtotalnew=c(lablevelptdifflrtotalsd,verygoodptdifflrtotalsd,moderateptdifflrtotalsd,loweffectiveptdifflrtotalsd,ineffectiveptdifflrtotalsd)
boilingdiffuncertaintylrtotalnew=c(lablevelptdifflrtotalsd,verygoodptdifflrtotalsd,moderateptdifflrtotalsd,loweffectiveptdifflrtotalsd,ineffectiveptdifflrtotalsd)
boilingdiffuncertaintymrtotalnew=c(lablevelptdiffmrtotalsd,verygoodptdiffmrtotalsd,moderateptdiffmrtotalsd,loweffectiveptdiffmrtotalsd,ineffectiveptdiffmrtotalsd)
boilingdiffuncertaintyhrtotalnew=c(lablevelptdiffhrtotalsd,verygoodptdiffhrtotalsd,moderateptdiffhrtotalsd,loweffectiveptdiffhrtotalsd,ineffectiveptdiffhrtotalsd)
#boilingdiffuncertaintylrtotalnew=c(ineffectiveptdifflrtotalsd,loweffectiveptdifflrtotalsd,moderateptdifflrtotalsd,verygoodptdifflrtotalsd,lablevelptdifflrtotalsd)
#boilingdiffuncertaintymrtotalnew=c(ineffectiveptdiffmrtotalsd,loweffectiveptdiffmrtotalsd,moderateptdiffmrtotalsd,verygoodptdiffmrtotalsd,lablevelptdiffmrtotalsd)
#boilingdiffuncertaintyhrtotalnew=c(ineffectiveptdiffhrtotalsd,loweffectiveptdiffhrtotalsd,moderateptdiffhrtotalsd,verygoodptdiffhrtotalsd,lablevelptdiffhrtotalsd)
#boilingdiffuncertaintymrtotalnew=c((noboilingptmrsdtotal^2+lablevelptmrsdtotal^2)^0.5,(noboilingptmrsdtotal^2+verygoodptmrsdtotal)^0.5,(noboilingptmrsdtotal^2+moderateptmrsdtotal^2)^0.5,(noboilingptmrsdtotal^2+loweffectiveptmrsdtotal^2)^0.5,(noboilingptmrsdtotal^2+ineffectiveptmrsdtotal^2)^0.5)
#boilingdiffuncertaintyhrtotalnew=c((noboilingpthrsdtotal^2+lablevelpthrsdtotal^2)^0.5,(noboilingpthrsdtotal^2+verygoodpthrsdtotal^2)^0.5,(noboilingpthrsdtotal^2+moderatepthrsdtotal^2)^0.5,(noboilingpthrsdtotal^2+loweffectivepthrsdtotal^2)^0.5,(noboilingpthrsdtotal^2+ineffectivepthrsdtotal^2)^0.5)

#Boiling_Log_Reduction_Value=c("5    Lab Study LRV (6)","4    Best Field LRV (2)","3    Average Field LRV (1.5)","2    Low Field LRV (0.464)","1    Ineffective Field LRV (0.048)")

boilingdiffuncgrouptotalnew=c(0.5*boilingdiffuncertaintylrtotalnew,boilingdiffuncertaintymrtotalnew,boilingdiffuncertaintyhrtotalnew)

## USE  
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




diffsd = c((charcoalwhcDALYssd^2+charcoalcDALYssd^2)^0.5,(LPGwhcDALYssd^2+LPGcDALYssd^2)^0.5,(minimotowhcDALYssd^2+minimotocDALYssd^2)^0.5,(smokeywhcDALYssd^2+smokeycDALYssd^2)^0.5,(improvedwhcDALYssd^2+improvedcDALYssd^2)^0.5)
differencevalues=c(charcoalDALYsdiff,LPGDALYsdiff,minimotoDALYsdiff,smokeyDALYsdiff,improvedDALYsdiff)
waterheatingonlyvalues=c(charcoalwhDALYsavg,LPGwhDALYsavg,minimotowhDALYsavg,smokeywhDALYsavg,improvedwhDALYsavg)
waterheatingsd = c(charcoalwhDALYssd,LPGwhDALYssd,minimotowhDALYssd,smokeywhDALYssd,improvedwhDALYssd)

diffsdchild = c((charcoalwhcDALYssdchild^2+charcoalcDALYssdchild^2)^0.5,(LPGwhcDALYssdchild^2+LPGcDALYssdchild^2)^0.5,(minimotowhcDALYssdchild^2+minimotocDALYssdchild^2)^0.5,(smokeywhcDALYssdchild^2+smokeycDALYssdchild^2)^0.5,(improvedwhcDALYssdchild^2+improvedcDALYssdchild^2)^0.5)
differencevalueschild=c(charcoalDALYsdiffchild,LPGDALYsdiffchild,minimotoDALYsdiffchild,smokeyDALYsdiffchild,improvedDALYsdiffchild)
waterheatingonlyvalueschild=c(charcoalwhDALYsavgchild,LPGwhDALYsavgchild,minimotowhDALYsavgchild,smokeywhDALYsavgchild,improvedwhDALYsavgchild)
waterheatingsdchild = c(charcoalwhDALYssdchild,LPGwhDALYssdchild,minimotowhDALYssdchild,smokeywhDALYssdchild,improvedwhDALYssdchild)

diffsdtotal = c((charcoalwhcDALYssdtotal^2+charcoalcDALYssdtotal^2)^0.5,(LPGwhcDALYssdtotal^2+LPGcDALYssdtotal^2)^0.5,(minimotowhcDALYssdtotal^2+minimotocDALYssdtotal^2)^0.5,(smokeywhcDALYssdtotal^2+smokeycDALYssdtotal^2)^0.5,(improvedwhcDALYssdtotal^2+improvedcDALYssdtotal^2)^0.5)
differencevaluestotal=c(charcoalDALYsdifftotal,LPGDALYsdifftotal,minimotoDALYsdifftotal,smokeyDALYsdifftotal,improvedDALYsdifftotal)
waterheatingonlyvaluestotal=c(charcoalwhDALYsavgtotal,LPGwhDALYsavgtotal,minimotowhDALYsavgtotal,smokeywhDALYsavgtotal,improvedwhDALYsavgtotal)
waterheatingsdtotal = c(charcoalwhDALYssdtotal,LPGwhDALYssdtotal,minimotowhDALYssdtotal,smokeywhDALYssdtotal,improvedwhDALYssdtotal)

differencenames=c("C.    Charcoal (Improved)","A.    LPG (Clean)","B.    Gasifier (Improved)","E.    Wood (Traditional)","D.    Wood (Improved)")
Waterheatingnames=c("H.    Charcoal (Improved, WH)","F.    LPG (Clean, WH)","G.    Gasifier (Improved, WH)","J.    Wood (Traditional, WH)","I.    Wood (Improved, WH)")

differencedataframe=data.frame(differencevalues,differencenames,diffsd)
differencedataframechild=data.frame(differencevalueschild,differencenames,diffsdchild)
differencedataframetotal=data.frame(differencevaluestotal,differencenames,diffsdtotal)


Boiling_Log_Reduction_Value=c("5    Lab Study LRV (6)","4    Best Field LRV (2)","3    Average Field LRV (1.5)","2    Low Field LRV (0.464)","1    Ineffective Field LRV (0.048)")

boilingdiffuncgroupchildnonegative=c(boilingdiffuncertaintylrchildnonegative,boilingdiffuncertaintymrchildnonegative,boilingdiffuncertaintyhrchildnonegative)
uncertaintyall=c(boilingdiffuncgroupnonegative,diffsd,waterheatingsd)
uncertaintyallchild=c(boilingdiffuncgroupchildnonegative,diffsdchild,waterheatingsdchild)
uncertaintyalltotalnew=c(boilingdiffuncgrouptotalnew,diffsdtotal,waterheatingsdtotal)


boilingbargroup=c(-boilingbardifflr,-boilingbardiffmr,-boilingbardiffhr,differencevalues,waterheatingonlyvalues)
boilingbargroupchild=c(-boilingbardifflrchild,-boilingbardiffmrchild,-boilingbardiffhrchild,differencevalueschild,waterheatingonlyvalueschild)
boilingbargrouptotal=c(-boilingbardifflrtotal,-boilingbardiffmrtotal,-boilingbardiffhrtotal,differencevaluestotal,waterheatingonlyvaluestotal)

Category=c(Boiling_Log_Reduction_Value,Boiling_Log_Reduction_Value,Boiling_Log_Reduction_Value,differencenames,differencenames)
boilingbargrouprisk=c(rep("A Low Risk",5),rep("B Medium Risk",5),rep("C High Risk",5),rep("D Boil+Cook",5),rep("E Boil Only",5))
print("check it")

Boilingbardataframe=data.frame(boilingbargroup, boilingbargrouprisk,Category,uncertaintyall)
Boilingbardataframechild=data.frame(boilingbargroupchild, boilingbargrouprisk,Category,uncertaintyallchild)
Boilingbardataframetotal=data.frame(boilingbargrouptotal, boilingbargrouprisk,Category,uncertaintyalltotalnew)

print("check 6")


jpeg(file=file.path(currentresultspath,"adultchildfinalplot_v3.jpg"), res=600, width=16000, height=8000, pointsize=10,
     type="windows", antialias="cleartype")
newplotnewboilingdiffhello<-ggplot(data=Boilingbardataframetotal, aes(x=boilingbargrouprisk, y=boilingbargrouptotal, fill=Category))+
  geom_bar(stat="identity", position=position_dodge(),fill="white")+theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),panel.background = element_blank(), axis.line = element_line(colour = "black"),text = element_text(size = 20),axis.text=element_text(size=20),legend.key=element_blank(),plot.title = element_text(hjust = 0.5))+ggtitle("") +
  ylab("Change in DALYs from Boiling (10,000 ppl)")+xlab("Source Water Risk Level in MPN E. coli/100mL")+geom_errorbar( aes(ymin=boilingbargrouptotal-uncertaintyalltotalnew, ymax=boilingbargrouptotal+uncertaintyalltotalnew), width=.2,position=position_dodge(.9))+geom_bar(data=Boilingbardataframetotal, aes(x=boilingbargrouprisk, y=boilingbargrouptotal, fill=Category),stat="identity", position=position_dodge(),alpha=0.4)+geom_bar(data=Boilingbardataframe, aes(x=boilingbargrouprisk, y=boilingbargroup, fill=Category),stat="identity", position=position_dodge(),alpha=0.9)+ylim(-2000,500)

print(newplotnewboilingdiffhello)
dev.off()
print(newplotnewboilingdiffhello)

###
jpeg(file=file.path(currentresultspath,"adultchildfinalplot_v3.jpg"), res=600, width=16000, height=8000, pointsize=10,
     type="windows", antialias="cleartype")
newplotnewboilingdiffhello<-ggplot(data=Boilingbardataframetotal, aes(x=boilingbargrouprisk, y=boilingbargrouptotal, fill=Category))+
  geom_bar(stat="identity", position=position_dodge(),fill="white")+theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),panel.background = element_blank(), axis.line = element_line(colour = "black"),text = element_text(size = 20),axis.text=element_text(size=20),legend.key=element_blank(),plot.title = element_text(hjust = 0.5))+ggtitle("") +
  ylab("Change in DALYs from Boiling (10,000 ppl)")+xlab("Source Water Risk Level in MPN E. coli/100mL")+geom_errorbar( aes(ymin=boilingbargrouptotal-uncertaintyalltotalnew, ymax=boilingbargrouptotal+uncertaintyalltotalnew), width=.2,position=position_dodge(.9))+geom_bar(data=Boilingbardataframetotal, aes(x=boilingbargrouprisk, y=boilingbargrouptotal, fill=Category),stat="identity", position=position_dodge(),alpha=0.4)+geom_bar(data=Boilingbardataframe, aes(x=boilingbargrouprisk, y=boilingbargroup, fill=Category),stat="identity", position=position_dodge(),alpha=0.9)+ylim(-3000,500)

print(newplotnewboilingdiffhello)
dev.off()
print(newplotnewboilingdiffhello)

jpeg(file=file.path(currentresultspath,"adultchildfinalplot_v3.jpg"), res=600, width=20000, height=10000, pointsize=10,
     type="windows", antialias="cleartype")
newplotnewboilingdiffhello<-ggplot(data=Boilingbardataframetotal, aes(x=boilingbargrouprisk, y=boilingbargrouptotal, fill=Category))+
  geom_bar(stat="identity", position=position_dodge(),fill="white")+theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),panel.background = element_blank(), axis.line = element_line(colour = "black"),text = element_text(size = 20),axis.text=element_text(size=20),legend.key=element_blank(),plot.title = element_text(hjust = 0.5))+ggtitle("") +
  ylab("Change in DALYs from Boiling (10,000 ppl)")+xlab("Source Water Risk Level in MPN E. coli/100mL")+geom_errorbar( aes(ymin=boilingbargrouptotal-uncertaintyalltotalnew, ymax=boilingbargrouptotal+uncertaintyalltotalnew), width=.2,position=position_dodge(.9))+geom_bar(data=Boilingbardataframetotal, aes(x=boilingbargrouprisk, y=boilingbargrouptotal, fill=Category),stat="identity", position=position_dodge(),alpha=0.4)+geom_bar(data=Boilingbardataframe, aes(x=boilingbargrouprisk, y=boilingbargroup, fill=Category),stat="identity", position=position_dodge(),alpha=0.9)+ scale_y_continuous(breaks=seq(-3000,800,200))

print(newplotnewboilingdiffhello)
dev.off()
print(newplotnewboilingdiffhello)
###


 
#below is DALYs from PM


newplotnewnew<-ggplot(data=PMstovedataframetotal,aes(x=Stovenames,y=PMlevelstotal,fill=Stove_use))+ 
  geom_bar(stat = 'identity',position="dodge",fill="white")+scale_fill_manual(values=redyellowblue)+ggtitle(paste(country)) +ylim(-10, 800)+
  ylab("Total DALYs for different stove types (10,000 ppl)")+xlab("Stove Type")+geom_errorbar(aes(ymin=PMlevelstotal-PMsdtotal, ymax=PMlevelstotal+PMsdtotal), width=.2,position=position_dodge(.9))+geom_bar(data=PMstovedataframe,aes(x=Stovenames,y=PMlevels,fill=Stove_use),stat="identity",position=position_dodge(),alpha=0.2)+geom_bar(data=PMstovedataframetotal, aes(x=Stovenames, y=PMlevelstotal, fill=Stove_use),stat="identity", position=position_dodge(),alpha=0.4)+theme(panel.grid.major = element_blank(), panel.grid.minor = element_blank(),panel.background = element_blank(), axis.line = element_line(colour = "black"),text = element_text(size = 20),axis.text=element_text(size=20),legend.key=element_blank(),plot.title = element_text(hjust = 0.5))
print(newplotnewnew)





