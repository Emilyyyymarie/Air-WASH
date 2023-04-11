

####
####
###calculate risks
#COPD
relativeriskCOPD <- function(PMinput,indexcr)
{
  relativeriskCOPD=(1+alphaCOPD[indexcr]*(1-exp(-betaCOPD[indexcr]*(PMinput-zcfCOPD[indexcr])^deltaCOPD[indexcr])))
  return(relativeriskCOPD)
}

#ALRI
relativeriskALRI <- function(PM,indexcr)
{
  #=1+IHD_alpha*(1-EXP(-IHD_beta*(B2-Counterfactual)^IHD_delta))
  relativeriskALRI=(1+alphaALRI[indexcr]*(1-exp(-betaALRI[indexcr]*(PM-zcfALRI[indexcr])^deltaALRI[indexcr])))
  return(relativeriskALRI)
}

#IHD
relativeriskIHD <- function(PM,indexcr)
{
  relativeriskIHD=(1+alphaIHD[indexcr]*(1-exp(-betaIHD[indexcr]*(PM-zcfIHD[indexcr])^deltaIHD[indexcr])))
  return(relativeriskIHD)
}

#LC
relativeriskLC <- function(PM,indexcr)
{
  relativeriskLC=(1+alphaLC[indexcr]*(1-exp(-betaLC[indexcr]*(PM-zcfLC[indexcr])^deltaLC[indexcr])))
  return(relativeriskLC)
}

#stroke
relativeriskStroke <- function(PM,indexcr)
{
  relativeriskStroke=(1+alphastroke[indexcr]*(1-exp(-betastroke[indexcr]*(PM-zcfstroke[indexcr])^deltastroke[indexcr])))
  return(relativeriskStroke)
}

######


#COPD  
totalCOPDDALYs <- function(PMconcentration,inputpopulation,womenexposure,menexposure,childrenexposure,backgroundconcentration)
{
  backgroundconcentration=backgroundconcentration
  index =  sample(1:1000,1)#round(runif(1, min=1, max=1000),0)
  
  if (PMconcentration<backgroundconcentration)
  {
    PMconcentration=backgroundconcentration
  }
  else
  {
    PMconcentration=PMconcentration
  }
  
  
  women=womenexposure*PMconcentration #assuming 0.742 exposure to concentration ratio
  men=menexposure*PMconcentration  # assuming 0.45 exposure to concentration ratio
  children=childrenexposure*PMconcentration #assuming 0.628 exposure to concentration ratio
  RRwomen = relativeriskCOPD(women,index)
  RRmen = relativeriskCOPD(men,index)
  RRchildren=relativeriskCOPD(children,index)
  
  AFwomen=(percentsolidfueluse*(RRwomen-1))/(percentsolidfueluse*(RRwomen-1)+1) 
  AFmen =(percentsolidfueluse*(RRmen-1))/(percentsolidfueluse*(RRmen-1)+1) 
  AFchildren=(percentsolidfueluse*(RRchildren-1))/(percentsolidfueluse*(RRchildren-1)+1) 

  COPDDALYunder5dist=sample(rtriangle(numberlength,COPDDALYlowerunder5, COPDDALYupperunder5,COPDDALYunder5),1)
  COPDDALY_20plusdist=sample(rtriangle(numberlength,COPDDALYlower_20plus, COPDDALYupper_20plus,COPDDALY_20plus),1)
  COPDDALY_5_to_19dist=sample(rtriangle(numberlength,COPDDALYlower_5_to_19, COPDDALYupper_5_to_19,COPDDALY_5_to_19),1)
  ABwomen=AFwomen*(inputpopulation/countrypopulation)*(COPDDALY_5_to_19dist+COPDDALY_20plusdist)
  ABmen=AFmen*(inputpopulation/countrypopulation)*(COPDDALY_5_to_19dist+COPDDALY_20plusdist)
  ABchildren=AFchildren*(inputpopulation/countrypopulation)*(COPDDALYunder5dist)
  

  if (personofinterest=="adult") {
    attributableburdenCOPDDALYs=ABwomen+ABmen
  } else if  (personofinterest == "child") {
    attributableburdenCOPDDALYs = ABchildren
  } else {
    print("error")
    print(stopstoppopulation)
  }
  
  if(attributableburdenCOPDDALYs=="NaN")
  {attributableburdenCOPDDALYs=0}
  else{attributableburdenCOPDDALYs=attributableburdenCOPDDALYs}
  return(attributableburdenCOPDDALYs)

  return(attributableburdenCOPDDALYs)
}

###
####
#ALRI
totalALRIDALYs <- function(PMconcentration,inputpopulation,womenexposure,menexposure,childrenexposure,backgroundconcentration)
{
  
  index =  sample(1:1000,1)#round(runif(1000, min=1, max=1000),0)
  backgroundconcentration=backgroundconcentration
  if (PMconcentration<backgroundconcentration)
  {
    PMconcentration=backgroundconcentration
  }
  else
  {
    PMconcentration=PMconcentration
  }
  
  women=womenexposure*PMconcentration #assuming 0.742 exposure to concentration ratio
  men=menexposure*PMconcentration  # assuming 0.45 exposure to concentration ratio
  children=childrenexposure*PMconcentration #assuming 0.628 exposure to concentration ratio
  
  RRwomen = relativeriskALRI(women,index)
  RRmen = relativeriskALRI(men,index)
  RRchildren=relativeriskALRI(children,index)
  
  
  AFwomen=(percentsolidfueluse*(RRwomen-1))/(percentsolidfueluse*(RRwomen-1)+1)
  AFmen =(percentsolidfueluse*(RRmen-1))/(percentsolidfueluse*(RRmen-1)+1) 
  AFchildren=(percentsolidfueluse*(RRchildren-1))/(percentsolidfueluse*(RRchildren-1)+1)

  ALRIDALYunder5dist=sample(rtriangle(numberlength,ALRIDALYlowerunder5, ALRIDALYupperunder5,ALRIDALYunder5),1)
  ALRIDALY_20plusdist=sample(rtriangle(numberlength,ALRIDALYlower_20plus, ALRIDALYupper_20plus,ALRIDALY_20plus),1)
  ALRIDALY_5_to_19dist=sample(rtriangle(numberlength,ALRIDALYlower_5_to_19, ALRIDALYupper_5_to_19,ALRIDALY_5_to_19),1)
  ABwomen=AFwomen*1*(inputpopulation/countrypopulation)*(ALRIDALY_5_to_19dist+ALRIDALY_20plusdist)
  ABmen=AFmen*1*(inputpopulation/countrypopulation)*(ALRIDALY_5_to_19dist+ALRIDALY_20plusdist) 
  ABchildren=AFchildren*(inputpopulation/countrypopulation)*(ALRIDALYunder5dist)

  if (personofinterest=="adult") {
    attributableburdenALRIDALYs=ABwomen+ABmen
  } else if  (personofinterest == "child") {
    attributableburdenALRIDALYs = ABchildren
  } else {
    print("error")
    print(stopstoppopulation)
  }

  if(attributableburdenALRIDALYs=="NaN")
  {attributableburdenALRIDALYs=0}
  else{attributableburdenALRIDALYs=attributableburdenALRIDALYs}
  return(attributableburdenALRIDALYs)
  
  return(attributableburdenALRIDALYs)
}

###
#LC
totalLCDALYs <- function(PMconcentration,inputpopulation,womenexposure,menexposure,childrenexposure,backgroundconcentration)
{
  backgroundconcentration=backgroundconcentration
  index =  sample(1:1000,1)#round(runif(1, min=1, max=1000),0)
  
  if (PMconcentration<backgroundconcentration)
  {
    PMconcentration=backgroundconcentration
  }
  else
  {
    PMconcentration=PMconcentration
  }
  
  women=womenexposure*PMconcentration #assuming 0.742 exposure to concentration ratio
  men=menexposure*PMconcentration  # assuming 0.45 exposure to concentration ratio
  children=childrenexposure*PMconcentration #assuming 0.628 exposure to concentration ratio
  
  RRwomen = relativeriskLC(women,index)
  RRmen = relativeriskLC(men,index)
  RRchildren=relativeriskLC(children,index)
  
  
  AFwomen=(percentsolidfueluse*(RRwomen-1))/(percentsolidfueluse*(RRwomen-1)+1)
  AFmen =(percentsolidfueluse*(RRmen-1))/(percentsolidfueluse*(RRmen-1)+1) 
  AFchildren=(percentsolidfueluse*(RRchildren-1))/(percentsolidfueluse*(RRchildren-1)+1) 

  LCDALYunder5dist=sample(rtriangle(numberlength,LCDALYlowerunder5, LCDALYupperunder5,LCDALYunder5),1)
  LCDALY_20plusdist=sample(rtriangle(numberlength,LCDALYlower_20plus, LCDALYupper_20plus,LCDALY_20plus),1)
  LCDALY_5_to_19dist=sample(rtriangle(numberlength,LCDALYlower_5_to_19, LCDALYupper_5_to_19,LCDALY_5_to_19),1)
  ABwomen=AFwomen*1*(inputpopulation/countrypopulation)*(LCDALY_5_to_19dist+LCDALY_20plusdist)# not using
  ABmen=AFmen*1*(inputpopulation/countrypopulation)*(LCDALY_5_to_19dist+LCDALY_20plusdist) #no tusing
  ABchildren=AFchildren*1*(inputpopulation/countrypopulation)*(LCDALYunder5dist)
  if (personofinterest=="adult") {
    attributableburdenLCDALYs=ABwomen+ABmen
  } else if  (personofinterest == "child") {
    attributableburdenLCDALYs = ABchildren
  } else {
    print("error")
    print(stopstoppopulation)
  }
  

  if(attributableburdenLCDALYs=="NaN")
  {attributableburdenLCDALYs=0}
  else{attributableburdenLCDALYs=attributableburdenLCDALYs}
  return(attributableburdenLCDALYs)
  
  return(attributableburdenLCDALYs)
}

######
#IHD  
totalIHDDALYs <- function(PMconcentration,inputpopulation,womenexposure,menexposure,childrenexposure,backgroundconcentration)
{
  backgroundconcentration=backgroundconcentration
  index =  sample(1:1000,1)#round(runif(1, min=1, max=1000),0)
  
  if (PMconcentration<backgroundconcentration)
  {
    PMconcentration=backgroundconcentration
  }
  else
  {
    PMconcentration=PMconcentration
  }
  
  women=womenexposure*PMconcentration #assuming 0.742 exposure to concentration ratio
  men=menexposure*PMconcentration  # assuming 0.45 exposure to concentration ratio
  children=childrenexposure*PMconcentration #assuming 0.628 exposure to concentration ratio
  
  RRwomen = relativeriskIHD(women,index)
  RRmen = relativeriskIHD(men,index)
  RRchildren=relativeriskIHD(children,index)
  
  
  AFwomen=(percentsolidfueluse*(RRwomen-1))/(percentsolidfueluse*(RRwomen-1)+1)
  AFmen =(percentsolidfueluse*(RRmen-1))/(percentsolidfueluse*(RRmen-1)+1) 
  AFchildren=(percentsolidfueluse*(RRchildren-1))/(percentsolidfueluse*(RRchildren-1)+1) 

  IHDDALYunder5dist=sample(rtriangle(numberlength,IHDDALYlowerunder5, IHDDALYupperunder5,IHDDALYunder5),1)
  IHDDALY_20plusdist=sample(rtriangle(numberlength,IHDDALYlower_20plus, IHDDALYupper_20plus,IHDDALY_20plus),1)
  IHDDALY_5_to_19dist=sample(rtriangle(numberlength,IHDDALYlower_5_to_19, IHDDALYupper_5_to_19,IHDDALY_5_to_19),1)
  ABwomen=AFwomen*1*(inputpopulation/countrypopulation)*(IHDDALY_5_to_19dist+IHDDALY_20plusdist)# not using
  ABmen=AFmen*1*(inputpopulation/countrypopulation)*(IHDDALY_5_to_19dist+IHDDALY_20plusdist) #no tusing
  ABchildren=AFchildren*1*(inputpopulation/countrypopulation)*(IHDDALYunder5dist)
  
  
  if (personofinterest=="adult") {
    attributableburdenIHDDALYs=ABwomen+ABmen
  } else if  (personofinterest == "child") {
    attributableburdenIHDDALYs = ABchildren
  } else {
    print("error")
    print(stopstoppopulation)
  }
  
  if(attributableburdenIHDDALYs=="NaN")
  {attributableburdenIHDDALYs=0}
  else{attributableburdenIHDDALYs=attributableburdenIHDDALYs}
  
  return(attributableburdenIHDDALYs)
}

######
#Stroke
totalStrokeDALYs <- function(PMconcentration,inputpopulation,womenexposure,menexposure,childrenexposure,backgroundconcentration)
{
  backgroundconcentration=backgroundconcentration
  index =  sample(1:1000,1)#round(runif(1, min=1, max=1000),0)
  
  if (PMconcentration<backgroundconcentration)
  {
    PMconcentration=backgroundconcentration
  }
  else
  {
    PMconcentration=PMconcentration
  }
  women=womenexposure*PMconcentration #assuming 0.742 exposure to concentration ratio
  men=menexposure*PMconcentration  # assuming 0.45 exposure to concentration ratio
  children=childrenexposure*PMconcentration #assuming 0.628 exposure to concentration ratio
  
  RRwomen = relativeriskStroke(women,index)
  RRmen = relativeriskStroke(men,index)
  RRchildren=relativeriskStroke(children,index)
  
  AFwomen=(percentsolidfueluse*(RRwomen-1))/(percentsolidfueluse*(RRwomen-1)+1)
  AFmen =(percentsolidfueluse*(RRmen-1))/(percentsolidfueluse*(RRmen-1)+1) 
  AFchildren=(percentsolidfueluse*(RRchildren-1))/(percentsolidfueluse*(RRchildren-1)+1) 
  
  StrokeDALYunder5dist=sample(rtriangle(numberlength,StrokeDALYlowerunder5, StrokeDALYupperunder5,StrokeDALYunder5),1)
  StrokeDALY_20plusdist=sample(rtriangle(numberlength,StrokeDALYlower_20plus, StrokeDALYupper_20plus,StrokeDALY_20plus),1)
  StrokeDALY_5_to_19dist=sample(rtriangle(numberlength,StrokeDALYlower_5_to_19, StrokeDALYupper_5_to_19,StrokeDALY_5_to_19),1)
  ABwomen=AFwomen*1*(inputpopulation/countrypopulation)*(StrokeDALY_5_to_19dist+StrokeDALY_20plusdist)# not using
  ABmen=AFmen*1*(inputpopulation/countrypopulation)*(StrokeDALY_5_to_19dist+StrokeDALY_20plusdist) #no tusing
  ABchildren=1*(inputpopulation/countrypopulation)*AFchildren*(StrokeDALYunder5dist)

  if (personofinterest=="adult") {
    attributableburdenStrokeDALYs=ABwomen+ABmen
  } else if  (personofinterest == "child") {
    attributableburdenStrokeDALYs = ABchildren
  } else {
    print("error")
    print(stopstoppopulation)
  }

  if(attributableburdenStrokeDALYs=="NaN")
  {attributableburdenStrokeDALYs=0}
  else{attributableburdenStrokeDALYs=attributableburdenStrokeDALYs}
  return(attributableburdenStrokeDALYs)
  
  
  return(attributableburdenStrokeDALYs)
}

########
### Total air DALYs function
totalairDALYs <- function(PMconc, exposedpop,womenexposure,menexposure,childrenexposure,backgroundconcentration){
  totalairDALYs= totalCOPDDALYs(PMconc,exposedpop,womenexposure,menexposure,childrenexposure,backgroundconcentration)+totalLCDALYs(PMconc,exposedpop,womenexposure,menexposure,childrenexposure,backgroundconcentration)+totalStrokeDALYs(PMconc,exposedpop,womenexposure,menexposure,childrenexposure,backgroundconcentration)+totalIHDDALYs(PMconc,exposedpop,womenexposure,menexposure,childrenexposure,backgroundconcentration)+totalALRIDALYs(PMconc,exposedpop,womenexposure,menexposure,childrenexposure,backgroundconcentration)
  return(totalairDALYs)
}
