PM2.5concentration <- function(heatvalueinput,emissionfactorgkginput,stovepowerMJhourinput,efficiencyinput,airexchangeinput,volumeinput,drinkingwateronepersoninput,energyinput,backgroundconcentrationinput) #g/kg for emissionfactor
{
  backgroundconcentration=backgroundconcentrationinput
  watercookingconcentrationtime=c()
  waterheatingconcentrationtime=c()
  cookingconcentrationtime=c()
  heatingconcentrationtime=c()
  heatingcookingconcentrationtime=c()
  heatingcookingwaterconcentrationtime=c()
  hourseq = seq(1,1440,by=1)/60 #minutes in day
  
  drinkingwatervolume=averagehousehold*drinkingwateronepersoninput
  
  #Air Quality
  boilingtime=1 #minute, update this
  cp = 4.186 #joules/gramC #ml to grams is 1 to 1
  deltaT = 85 # assume heated to 100 degrees celsius starting at 15 degrees C4
  airexchangeinput=airexchangeinput #5.99#sample(rlnorm(number,lognormalmean(10.4,5.8),lognormalstdev(10.4,5.8)),1)/60 #convert per minute # enter hr^-1#sample(rlnorm(number,lognormalmean((25),(0.6)^0.5),lognormalstdev((25),(0.6)^0.5)),1) #hr^-1
  volume=volumeinput #5.1889#sample(rlnorm(number,lognormalmean(22.49,10.3),lognormalstdev(22.49,10.3)),1)#m^3 #based off of WHO document fo rIndia  WHO Indoor Air Quality Guidelines: household
  heatvaluefuel=heatvalueinput#sample(rtriangle(1000,13.5, 15.883,14.780),1)#sample(rnorm(number,19.49,0.24),1)# wood pellet #35.9 #MJ/kg charcoal #sample(rnorm(number,16.1,0.18),1) #Peanut pellet #sample(rtriangle(number,  18.5, 19.2,19),1) #MJ/kgdaf #dry basis #http://large.stanford.edu/courses/2017/ph240/timcheck1/docs/fao-krajnc-2015.pdf
  emissionfactor=emissionfactorgkginput #sample(rlnorm(1000,lognormalmean((7.1),(1.3)),lognormalstdev((7.1),(1.3))),1)#3.6#0.31#  Phillips gasifier ##0.47 #charcoal #g/kg
  stovepowerMJhour = stovepowerMJhourinput #7.05#4.02#3.87#16.8 #MJ per hour#21.8 #sample(rlnorm(number,lognormalmean((4.9),(0.7*4.9)),lognormalstdev((4.9),(0.7*4.9))),1) #KJ/s chulha Johnson modelling paper
  stovepowerMJmin=stovepowerMJhour/60 #MJ per minute #(14.97/60)#0.001*stovepowerKJ[i]*60 #MJ per minute
  efficiency =efficiencyinput #0.544#sample(rlnorm(number,lognormalmean(0.544,0.15),lognormalstdev(0.544,0.15)),1)#1# sample(rnorm(number,0.544,0.15),1)#decimal percent #.40#.148 #+/- 1.8 for cookstoves #McCracken and Smith 1998
  fraction = 1 #fraction emissions entering room (assums no chimney use)
  
  #start different stove number scenario
  dailyenergy=energyinput 
  dailyheating=1.6*dailyenergy
  emissionrate=(fraction*(1000*1000*emissionfactor*stovepowerMJmin)/heatvaluefuel) #microgramsg/min  assumes all the same right now
  # Emission rate units check: 1000*1000*((g/kg)*(MJ/min))/(MJ/kg) - ug/min
  
  amountheatwater = ((drinkingwatervolume*cp*deltaT)+(stovepowerMJmin*boilingtime*1000000))/1000/1000 #Megajoules #daily heat to drink water assumes boiles for 3 minutes
  timeenergy=(dailyenergy/((stovepowerMJmin*efficiency))) #minutes
  timewaterheating=(amountheatwater/((stovepowerMJmin*efficiency)))#(heatwater[i]/(stovepowerMJmin[i])) #minutes
  timeheating=(dailyheating/((stovepowerMJmin*efficiency)))
  roundenergytime=round(timeenergy,0)
  roundwatertime=round(timewaterheating,0)#round(timewaterheating[i],0)
  roundheatingtime=round(dailyheating,0)
  
  if (roundenergytime<1)
  {
    roundenergytime=1
  }
  else
  {
    roundenergytime=roundenergytime
  }
  roundwatertime=round(timewaterheating,0)#round(timewaterheating[i],0)
  if (roundwatertime<1)
  {
    roundwatertime=1
  }
  else
  {
    roundwatertime=roundwatertime
  }
  

  notcooking=1440-roundenergytime-roundwatertime

  if (notcooking>3){
  stovenumber=1
  notcookinground=round((notcooking/3),0) # not cooking four times

  timezero=notcookinground #divided by 3
  timeone=notcookinground  #divided by 3
  timethree=1440-roundenergytime-roundwatertime-timezero-timeone
  newtimeseqzero = seq(1,timezero,by=1)
  newtimeenergy = seq((1+newtimeseqzero[length(newtimeseqzero)]),(newtimeseqzero[length(newtimeseqzero)]+roundenergytime),by=1)
  newtimeseqone=seq((1+newtimeenergy[length(newtimeenergy)]),((newtimeenergy[length(newtimeenergy)])+timeone),by=1)
  newtimewaterheating = seq((1+newtimeseqone[length(newtimeseqone)]),((newtimeseqone[length(newtimeseqone)])+roundwatertime),by=1)
  newtimeseqthree = seq((1+newtimewaterheating[length(newtimewaterheating)]),(newtimewaterheating[length(newtimewaterheating)]+timethree),by=1)
  
  #no emissions
  for (q in newtimeseqzero){
    j=q
    watercookingconcentrationtime[q]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
    cookingconcentrationtime[q]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
    waterheatingconcentrationtime[q]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
    heatingconcentrationtime[q]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
    heatingcookingconcentrationtime[q]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
    heatingcookingwaterconcentrationtime[q]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
    }
  
  #cooking emissions
  for (r in newtimeenergy){
    k=r-length(newtimeseqzero)
    watercookingconcentrationtime[r]= (emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*k))+watercookingconcentrationtime[length(newtimeseqzero)]*(exp(-airexchangeinput*k))+backgroundconcentration
    cookingconcentrationtime[r]= (emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*k))+cookingconcentrationtime[length(newtimeseqzero)]*(exp(-airexchangeinput*k))+backgroundconcentration
    waterheatingconcentrationtime[r]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*k))+waterheatingconcentrationtime[length(newtimeseqzero)]*(exp(-airexchangeinput*k))+backgroundconcentration
    heatingconcentrationtime[q]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
    heatingcookingconcentrationtime[q]= (emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*k))+heatingcookingconcentrationtime[length(newtimeseqzero)]*(exp(-airexchangeinput*k))+backgroundconcentration
    heatingcookingwaterconcentrationtime[q]= (emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*k))+heatingcookingwaterconcentrationtime[length(newtimeseqzero)]*(exp(-airexchangeinput*k))+backgroundconcentration
    
    
    }
  #no emissions
  for (s in newtimeseqone)
  {
    l=s-length(newtimeseqzero)-length(newtimeenergy)
    watercookingconcentrationtime[s]= watercookingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)]*(exp(-airexchangeinput*l))+ backgroundconcentration
    cookingconcentrationtime[s]= cookingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)]*(exp(-airexchangeinput*l))+backgroundconcentration
    waterheatingconcentrationtime[s]= waterheatingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)]*(exp(-airexchangeinput*l))+backgroundconcentration
    heatingconcentrationtime[q]=heatingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)]*(exp(-airexchangeinput*l))+backgroundconcentration
    heatingcookingconcentrationtime[q]=heatingcookingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)]*(exp(-airexchangeinput*l))+backgroundconcentration
    heatingcookingwaterconcentrationtime[q]=heatingcookingwaterconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)]*(exp(-airexchangeinput*l))+backgroundconcentration
  }
  #water heating
  for (t in newtimewaterheating){
    m=t-length(newtimeseqzero)-length(newtimeenergy)-length(newtimeseqone)
    watercookingconcentrationtime[t]= ((emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*m)))+((watercookingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)+length(newtimeseqone)])*((exp(-airexchangeinput*m))))+backgroundconcentration
    cookingconcentrationtime[t]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*m))+cookingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*m))+backgroundconcentration
    waterheatingconcentrationtime[t]= (emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*m))+waterheatingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*m))+backgroundconcentration
    heatingconcentrationtime[t]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*m))+heatingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*m))+backgroundconcentration
    heatingcookingconcentrationtime[t]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*m))+heatingcookingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*m))+backgroundconcentration
    heatingcookingwaterconcentrationtime[q]= (emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*m))+heatingcookingwaterconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*m))+backgroundconcentration
    }

  #no heating
  for (v in newtimeseqthree){
    p=v-length(newtimeseqzero)-length(newtimeenergy)-length(newtimeseqone)-length(newtimewaterheating)
    watercookingconcentrationtime[v]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*p))+watercookingconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*p))+backgroundconcentration
    cookingconcentrationtime[v]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*p))+cookingconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*p))+backgroundconcentration
    waterheatingconcentrationtime[v]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*p))+waterheatingconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*p))+backgroundconcentration
    heatingconcentrationtime[v]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*p))+heatingconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*p))+backgroundconcentration
    heatingcookingconcentrationtime[v]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*p))+heatingcookingconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*p))+backgroundconcentration
    heatingcookingwaterconcentrationtime[v]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*p))+heatingcookingwaterconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*p))+backgroundconcentration
  }
  }#end case where not cooking >3 
  
  else
  {
    #print("not cooking too short try two stoves")
    stovenumber=2
    emissionrate=(fraction*(1000*1000*emissionfactor*2*stovepowerMJmin)/heatvaluefuel) #microgramsg/min  assumes all the same right now
    # Emission rate units check: 1000*1000*((g/kg)*(MJ/min))/(MJ/kg) - ug/min
    
    amountheatwater = ((drinkingwatervolume*cp*100)+(2*stovepowerMJmin*3*1000000))/1000/1000 #Megajoules #daily heat to drink water assumes boiles for 3 minutes
    
    timeenergy=(dailyenergy/((2*stovepowerMJmin*efficiency))) #minutes
    timewaterheating=(amountheatwater/((2*stovepowerMJmin*efficiency)))#(heatwater[i]/(stovepowerMJmin[i])) #minutes
    roundenergytime=round(timeenergy,0)
    roundwatertime=round(timewaterheating,0)#round(timewaterheating[i],0)
    
    if (roundenergytime<1)
    {
      roundenergytime=1
    }
    else
    {
      roundenergytime=roundenergytime
    }
    roundwatertime=round(timewaterheating,0)#round(timewaterheating[i],0)
    if (roundwatertime<1)
    {
      roundwatertime=1
    }
    else
    {
      roundwatertime=roundwatertime
    }
    
    
    notcooking=1440-roundenergytime-roundwatertime
    
    if (notcooking>3){
      #print("Two stoves!")
      stovenumber=2
      notcookinground=round((notcooking/3),0) # not cooking four times
      
      timezero=notcookinground #divided by 3
      timeone=notcookinground  #divided by 3
      timethree=1440-roundenergytime-roundwatertime-timezero-timeone
      newtimeseqzero = seq(1,timezero,by=1)
      newtimeenergy = seq((1+newtimeseqzero[length(newtimeseqzero)]),(newtimeseqzero[length(newtimeseqzero)]+roundenergytime),by=1)
      newtimeseqone=seq((1+newtimeenergy[length(newtimeenergy)]),((newtimeenergy[length(newtimeenergy)])+timeone),by=1)
      newtimewaterheating = seq((1+newtimeseqone[length(newtimeseqone)]),((newtimeseqone[length(newtimeseqone)])+roundwatertime),by=1)
      newtimeseqthree = seq((1+newtimewaterheating[length(newtimewaterheating)]),(newtimewaterheating[length(newtimewaterheating)]+timethree),by=1)
      
      #no emissions
      for (q in newtimeseqzero){
        j=q
        watercookingconcentrationtime[q]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
        cookingconcentrationtime[q]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
        waterheatingconcentrationtime[q]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
        heatingconcentrationtime[q]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
        heatingcookingconcentrationtime[q]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
        heatingcookingwaterconcentrationtime[q]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
      }
      
      #cooking emissions
      for (r in newtimeenergy){
        k=r-length(newtimeseqzero)
        watercookingconcentrationtime[r]= (emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*k))+watercookingconcentrationtime[length(newtimeseqzero)]*(exp(-airexchangeinput*k))+backgroundconcentration
        cookingconcentrationtime[r]= (emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*k))+cookingconcentrationtime[length(newtimeseqzero)]*(exp(-airexchangeinput*k))+backgroundconcentration
        waterheatingconcentrationtime[r]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*k))+waterheatingconcentrationtime[length(newtimeseqzero)]*(exp(-airexchangeinput*k))+backgroundconcentration
        heatingconcentrationtime[q]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
        heatingcookingconcentrationtime[q]= (emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*k))+heatingcookingconcentrationtime[length(newtimeseqzero)]*(exp(-airexchangeinput*k))+backgroundconcentration
        heatingcookingwaterconcentrationtime[q]= (emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*k))+heatingcookingwaterconcentrationtime[length(newtimeseqzero)]*(exp(-airexchangeinput*k))+backgroundconcentration
        
        
      }
      #no emissions
      for (s in newtimeseqone)
      {
        l=s-length(newtimeseqzero)-length(newtimeenergy)
        watercookingconcentrationtime[s]= watercookingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)]*(exp(-airexchangeinput*l))+ backgroundconcentration
        cookingconcentrationtime[s]= cookingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)]*(exp(-airexchangeinput*l))+backgroundconcentration
        waterheatingconcentrationtime[s]= waterheatingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)]*(exp(-airexchangeinput*l))+backgroundconcentration
        heatingconcentrationtime[q]=heatingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)]*(exp(-airexchangeinput*l))+backgroundconcentration
        heatingcookingconcentrationtime[q]=heatingcookingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)]*(exp(-airexchangeinput*l))+backgroundconcentration
        heatingcookingwaterconcentrationtime[q]=heatingcookingwaterconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)]*(exp(-airexchangeinput*l))+backgroundconcentration
      }
      #water heating
      for (t in newtimewaterheating){
        m=t-length(newtimeseqzero)-length(newtimeenergy)-length(newtimeseqone)
        watercookingconcentrationtime[t]= ((emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*m)))+((watercookingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)+length(newtimeseqone)])*((exp(-airexchangeinput*m))))+backgroundconcentration
        cookingconcentrationtime[t]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*m))+cookingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*m))+backgroundconcentration
        waterheatingconcentrationtime[t]= (emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*m))+waterheatingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*m))+backgroundconcentration
        heatingconcentrationtime[t]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*m))+heatingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*m))+backgroundconcentration
        heatingcookingconcentrationtime[t]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*m))+heatingcookingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*m))+backgroundconcentration
        heatingcookingwaterconcentrationtime[q]= (emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*m))+heatingcookingwaterconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*m))+backgroundconcentration
      }

      for (v in newtimeseqthree){
        p=v-length(newtimeseqzero)-length(newtimeenergy)-length(newtimeseqone)-length(newtimewaterheating)
        watercookingconcentrationtime[v]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*p))+watercookingconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*p))+backgroundconcentration
        cookingconcentrationtime[v]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*p))+cookingconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*p))+backgroundconcentration
        waterheatingconcentrationtime[v]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*p))+waterheatingconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*p))+backgroundconcentration
        heatingconcentrationtime[v]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*p))+heatingconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*p))+backgroundconcentration
        heatingcookingconcentrationtime[v]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*p))+heatingcookingconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*p))+backgroundconcentration
        heatingcookingwaterconcentrationtime[v]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*p))+heatingcookingwaterconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*p))+backgroundconcentration
      }
      #print("end two stove scenario")
    }#end case where not cooking >3 
    
    else
    {
      #print("not cooking too short try three stoves")
      stovenumber=3
      emissionrate=(fraction*(1000*1000*emissionfactor*3*stovepowerMJmin)/heatvaluefuel) #microgramsg/min  assumes all the same right now
      # Emission rate units check: 1000*1000*((g/kg)*(MJ/min))/(MJ/kg) - ug/min
      
      amountheatwater = ((drinkingwatervolume*cp*100)+(3*stovepowerMJmin*3*1000000))/1000/1000 #Megajoules #daily heat to drink water assumes boiles for 3 minutes
      
      timeenergy=(dailyenergy/((3*stovepowerMJmin*efficiency))) #minutes
      timewaterheating=(amountheatwater/((3*stovepowerMJmin*efficiency)))#(heatwater[i]/(stovepowerMJmin[i])) #minutes
      roundenergytime=round(timeenergy,0)
      roundwatertime=round(timewaterheating,0)#round(timewaterheating[i],0)
      
      if (roundenergytime<1)
      {
        roundenergytime=1
      }
      else
      {
        roundenergytime=roundenergytime
      }
      roundwatertime=round(timewaterheating,0)#round(timewaterheating[i],0)
      if (roundwatertime<1)
      {
        roundwatertime=1
      }
      else
      {
        roundwatertime=roundwatertime
      }
      
      
      notcooking=1440-roundenergytime-roundwatertime
      
      if (notcooking>3){
        #print("Three stoves!")
        stovenumber=3
        notcookinground=round((notcooking/3),0) # not cooking four times
        
        timezero=notcookinground #divided by 3
        timeone=notcookinground  #divided by 3
        timethree=1440-roundenergytime-roundwatertime-timezero-timeone
        newtimeseqzero = seq(1,timezero,by=1)
        newtimeenergy = seq((1+newtimeseqzero[length(newtimeseqzero)]),(newtimeseqzero[length(newtimeseqzero)]+roundenergytime),by=1)
        newtimeseqone=seq((1+newtimeenergy[length(newtimeenergy)]),((newtimeenergy[length(newtimeenergy)])+timeone),by=1)
        newtimewaterheating = seq((1+newtimeseqone[length(newtimeseqone)]),((newtimeseqone[length(newtimeseqone)])+roundwatertime),by=1)
        newtimeseqthree = seq((1+newtimewaterheating[length(newtimewaterheating)]),(newtimewaterheating[length(newtimewaterheating)]+timethree),by=1)
        
        #no emissions
        for (q in newtimeseqzero){
          j=q
          watercookingconcentrationtime[q]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
          cookingconcentrationtime[q]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
          waterheatingconcentrationtime[q]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
          heatingconcentrationtime[q]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
          heatingcookingconcentrationtime[q]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
          heatingcookingwaterconcentrationtime[q]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
        }
        
        #cooking emissions
        for (r in newtimeenergy){
          k=r-length(newtimeseqzero)
          watercookingconcentrationtime[r]= (emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*k))+watercookingconcentrationtime[length(newtimeseqzero)]*(exp(-airexchangeinput*k))+backgroundconcentration
          cookingconcentrationtime[r]= (emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*k))+cookingconcentrationtime[length(newtimeseqzero)]*(exp(-airexchangeinput*k))+backgroundconcentration
          waterheatingconcentrationtime[r]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*k))+waterheatingconcentrationtime[length(newtimeseqzero)]*(exp(-airexchangeinput*k))+backgroundconcentration
          heatingconcentrationtime[q]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
          heatingcookingconcentrationtime[q]= (emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*k))+heatingcookingconcentrationtime[length(newtimeseqzero)]*(exp(-airexchangeinput*k))+backgroundconcentration
          heatingcookingwaterconcentrationtime[q]= (emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*k))+heatingcookingwaterconcentrationtime[length(newtimeseqzero)]*(exp(-airexchangeinput*k))+backgroundconcentration
          
          
        }
        #no emissions
        for (s in newtimeseqone)
        {
          l=s-length(newtimeseqzero)-length(newtimeenergy)
          watercookingconcentrationtime[s]= watercookingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)]*(exp(-airexchangeinput*l))+ backgroundconcentration
          cookingconcentrationtime[s]= cookingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)]*(exp(-airexchangeinput*l))+backgroundconcentration
          waterheatingconcentrationtime[s]= waterheatingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)]*(exp(-airexchangeinput*l))+backgroundconcentration
          heatingconcentrationtime[q]=heatingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)]*(exp(-airexchangeinput*l))+backgroundconcentration
          heatingcookingconcentrationtime[q]=heatingcookingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)]*(exp(-airexchangeinput*l))+backgroundconcentration
          heatingcookingwaterconcentrationtime[q]=heatingcookingwaterconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)]*(exp(-airexchangeinput*l))+backgroundconcentration
        }
        #water heating
        for (t in newtimewaterheating){
          m=t-length(newtimeseqzero)-length(newtimeenergy)-length(newtimeseqone)
          watercookingconcentrationtime[t]= ((emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*m)))+((watercookingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)+length(newtimeseqone)])*((exp(-airexchangeinput*m))))+backgroundconcentration
          cookingconcentrationtime[t]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*m))+cookingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*m))+backgroundconcentration
          waterheatingconcentrationtime[t]= (emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*m))+waterheatingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*m))+backgroundconcentration
          heatingconcentrationtime[t]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*m))+heatingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*m))+backgroundconcentration
          heatingcookingconcentrationtime[t]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*m))+heatingcookingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*m))+backgroundconcentration
          heatingcookingwaterconcentrationtime[q]= (emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*m))+heatingcookingwaterconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*m))+backgroundconcentration
        }
        #no heating
        #  for (u in newtimeseqtwo)
        #  {
        #    n=u-length(newtimeseqzero)-length(newtimeenergy)-length(newtimeseqone)-length(newtimewaterheating)
        #    watercookingconcentrationtime[u]=watercookingconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchange*n))+backgroundconcentration
        #    cookingconcentrationtime[u]= cookingconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchange*n))+backgroundconcentration
        #    waterheatingconcentrationtime[u]= waterheatingconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchange*n))+backgroundconcentration
        #  }
        #no heating
        for (v in newtimeseqthree){
          p=v-length(newtimeseqzero)-length(newtimeenergy)-length(newtimeseqone)-length(newtimewaterheating)
          watercookingconcentrationtime[v]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*p))+watercookingconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*p))+backgroundconcentration
          cookingconcentrationtime[v]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*p))+cookingconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*p))+backgroundconcentration
          waterheatingconcentrationtime[v]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*p))+waterheatingconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*p))+backgroundconcentration
          heatingconcentrationtime[v]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*p))+heatingconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*p))+backgroundconcentration
          heatingcookingconcentrationtime[v]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*p))+heatingcookingconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*p))+backgroundconcentration
          heatingcookingwaterconcentrationtime[v]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*p))+heatingcookingwaterconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*p))+backgroundconcentration
        }
        #print("end three stove scenario")
      }
      
      else
      {
      
          #print("not cooking too short try four stoves")
          stovenumber=4
          emissionrate=(fraction*(1000*1000*emissionfactor*4*stovepowerMJmin)/heatvaluefuel) #microgramsg/min  assumes all the same right now
          # Emission rate units check: 1000*1000*((g/kg)*(MJ/min))/(MJ/kg) - ug/min
          
          amountheatwater = ((drinkingwatervolume*cp*100)+(3*stovepowerMJmin*4*1000000))/1000/1000 #Megajoules #daily heat to drink water assumes boiles for 3 minutes
          
          timeenergy=(dailyenergy/((4*stovepowerMJmin*efficiency))) #minutes
          timewaterheating=(amountheatwater/((4*stovepowerMJmin*efficiency)))#(heatwater[i]/(stovepowerMJmin[i])) #minutes
          roundenergytime=round(timeenergy,0)
          roundwatertime=round(timewaterheating,0)#round(timewaterheating[i],0)
          
          if (roundenergytime<1)
          {
            roundenergytime=1
          }
          else
          {
            roundenergytime=roundenergytime
          }
          roundwatertime=round(timewaterheating,0)#round(timewaterheating[i],0)
          if (roundwatertime<1)
          {
            roundwatertime=1
          }
          else
          {
            roundwatertime=roundwatertime
          }
          
          
          notcooking=1440-roundenergytime-roundwatertime
          
          if (notcooking>3){
            #print("Three stoves!")
            stovenumber=3
            notcookinground=round((notcooking/3),0) # not cooking four times
            
            timezero=notcookinground #divided by 3
            timeone=notcookinground  #divided by 3
            timethree=1440-roundenergytime-roundwatertime-timezero-timeone
            newtimeseqzero = seq(1,timezero,by=1)
            newtimeenergy = seq((1+newtimeseqzero[length(newtimeseqzero)]),(newtimeseqzero[length(newtimeseqzero)]+roundenergytime),by=1)
            newtimeseqone=seq((1+newtimeenergy[length(newtimeenergy)]),((newtimeenergy[length(newtimeenergy)])+timeone),by=1)
            newtimewaterheating = seq((1+newtimeseqone[length(newtimeseqone)]),((newtimeseqone[length(newtimeseqone)])+roundwatertime),by=1)
            newtimeseqthree = seq((1+newtimewaterheating[length(newtimewaterheating)]),(newtimewaterheating[length(newtimewaterheating)]+timethree),by=1)
            
            #no emissions
            for (q in newtimeseqzero){
              j=q
              watercookingconcentrationtime[q]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
              cookingconcentrationtime[q]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
              waterheatingconcentrationtime[q]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
              heatingconcentrationtime[q]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
              heatingcookingconcentrationtime[q]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
              heatingcookingwaterconcentrationtime[q]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
            }
            
            #cooking emissions
            for (r in newtimeenergy){
              k=r-length(newtimeseqzero)
              watercookingconcentrationtime[r]= (emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*k))+watercookingconcentrationtime[length(newtimeseqzero)]*(exp(-airexchangeinput*k))+backgroundconcentration
              cookingconcentrationtime[r]= (emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*k))+cookingconcentrationtime[length(newtimeseqzero)]*(exp(-airexchangeinput*k))+backgroundconcentration
              waterheatingconcentrationtime[r]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*k))+waterheatingconcentrationtime[length(newtimeseqzero)]*(exp(-airexchangeinput*k))+backgroundconcentration
              heatingconcentrationtime[q]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
              heatingcookingconcentrationtime[q]= (emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*k))+heatingcookingconcentrationtime[length(newtimeseqzero)]*(exp(-airexchangeinput*k))+backgroundconcentration
              heatingcookingwaterconcentrationtime[q]= (emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*k))+heatingcookingwaterconcentrationtime[length(newtimeseqzero)]*(exp(-airexchangeinput*k))+backgroundconcentration
              
              
            }
            #no emissions
            for (s in newtimeseqone)
            {
              l=s-length(newtimeseqzero)-length(newtimeenergy)
              watercookingconcentrationtime[s]= watercookingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)]*(exp(-airexchangeinput*l))+ backgroundconcentration
              cookingconcentrationtime[s]= cookingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)]*(exp(-airexchangeinput*l))+backgroundconcentration
              waterheatingconcentrationtime[s]= waterheatingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)]*(exp(-airexchangeinput*l))+backgroundconcentration
              heatingconcentrationtime[q]=heatingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)]*(exp(-airexchangeinput*l))+backgroundconcentration
              heatingcookingconcentrationtime[q]=heatingcookingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)]*(exp(-airexchangeinput*l))+backgroundconcentration
              heatingcookingwaterconcentrationtime[q]=heatingcookingwaterconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)]*(exp(-airexchangeinput*l))+backgroundconcentration
            }
            #water heating
            for (t in newtimewaterheating){
              m=t-length(newtimeseqzero)-length(newtimeenergy)-length(newtimeseqone)
              watercookingconcentrationtime[t]= ((emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*m)))+((watercookingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)+length(newtimeseqone)])*((exp(-airexchangeinput*m))))+backgroundconcentration
              cookingconcentrationtime[t]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*m))+cookingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*m))+backgroundconcentration
              waterheatingconcentrationtime[t]= (emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*m))+waterheatingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*m))+backgroundconcentration
              heatingconcentrationtime[t]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*m))+heatingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*m))+backgroundconcentration
              heatingcookingconcentrationtime[t]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*m))+heatingcookingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*m))+backgroundconcentration
              heatingcookingwaterconcentrationtime[q]= (emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*m))+heatingcookingwaterconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*m))+backgroundconcentration
            }
            for (v in newtimeseqthree){
              p=v-length(newtimeseqzero)-length(newtimeenergy)-length(newtimeseqone)-length(newtimewaterheating)
              watercookingconcentrationtime[v]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*p))+watercookingconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*p))+backgroundconcentration
              cookingconcentrationtime[v]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*p))+cookingconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*p))+backgroundconcentration
              waterheatingconcentrationtime[v]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*p))+waterheatingconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*p))+backgroundconcentration
              heatingconcentrationtime[v]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*p))+heatingconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*p))+backgroundconcentration
              heatingcookingconcentrationtime[v]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*p))+heatingcookingconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*p))+backgroundconcentration
              heatingcookingwaterconcentrationtime[v]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*p))+heatingcookingwaterconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*p))+backgroundconcentration
            }
            #print("end four stove scenario")
          }
          
            else
            {
              
              print("not cooking too short try five stoves")
              stovenumber=5
              emissionrate=(fraction*(1000*1000*emissionfactor*5*stovepowerMJmin)/heatvaluefuel) #microgramsg/min  assumes all the same right now
              # Emission rate units check: 1000*1000*((g/kg)*(MJ/min))/(MJ/kg) - ug/min
              
              amountheatwater = ((drinkingwatervolume*cp*100)+(3*stovepowerMJmin*5*1000000))/1000/1000 #Megajoules #daily heat to drink water assumes boiles for 3 minutes
              
              timeenergy=(dailyenergy/((5*stovepowerMJmin*efficiency))) #minutes
              timewaterheating=(amountheatwater/((5*stovepowerMJmin*efficiency)))#(heatwater[i]/(stovepowerMJmin[i])) #minutes
              roundenergytime=round(timeenergy,0)
              roundwatertime=round(timewaterheating,0)#round(timewaterheating[i],0)
              print("roundwatertime")
              print(roundwatertime)
              print("round energy time")
              print(roundenergytime)
              if (roundenergytime<1)
              {
                roundenergytime=1
              }
              else
              {
                roundenergytime=roundenergytime
              }
              roundwatertime=round(timewaterheating,0)#round(timewaterheating[i],0)
              if (roundwatertime<1)
              {
                roundwatertime=1
              }
              else
              {
                roundwatertime=roundwatertime
              }
              
              
              notcooking=1440-roundenergytime-roundwatertime
              print("not cooking")
              print(notcooking)
              if (notcooking>3){
                #print("Three stoves!")
                stovenumber=3
                notcookinground=round((notcooking/3),0) # not cooking four times
                
                timezero=notcookinground #divided by 3
                timeone=notcookinground  #divided by 3
                timethree=1440-roundenergytime-roundwatertime-timezero-timeone
                newtimeseqzero = seq(1,timezero,by=1)
                newtimeenergy = seq((1+newtimeseqzero[length(newtimeseqzero)]),(newtimeseqzero[length(newtimeseqzero)]+roundenergytime),by=1)
                newtimeseqone=seq((1+newtimeenergy[length(newtimeenergy)]),((newtimeenergy[length(newtimeenergy)])+timeone),by=1)
                newtimewaterheating = seq((1+newtimeseqone[length(newtimeseqone)]),((newtimeseqone[length(newtimeseqone)])+roundwatertime),by=1)
                newtimeseqthree = seq((1+newtimewaterheating[length(newtimewaterheating)]),(newtimewaterheating[length(newtimewaterheating)]+timethree),by=1)
                
                #no emissions
                for (q in newtimeseqzero){
                  j=q
                  watercookingconcentrationtime[q]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
                  cookingconcentrationtime[q]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
                  waterheatingconcentrationtime[q]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
                  heatingconcentrationtime[q]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
                  heatingcookingconcentrationtime[q]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
                  heatingcookingwaterconcentrationtime[q]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
                }
                
                #cooking emissions
                for (r in newtimeenergy){
                  k=r-length(newtimeseqzero)
                  watercookingconcentrationtime[r]= (emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*k))+watercookingconcentrationtime[length(newtimeseqzero)]*(exp(-airexchangeinput*k))+backgroundconcentration
                  cookingconcentrationtime[r]= (emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*k))+cookingconcentrationtime[length(newtimeseqzero)]*(exp(-airexchangeinput*k))+backgroundconcentration
                  waterheatingconcentrationtime[r]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*k))+waterheatingconcentrationtime[length(newtimeseqzero)]*(exp(-airexchangeinput*k))+backgroundconcentration
                  heatingconcentrationtime[q]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
                  heatingcookingconcentrationtime[q]= (emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*k))+heatingcookingconcentrationtime[length(newtimeseqzero)]*(exp(-airexchangeinput*k))+backgroundconcentration
                  heatingcookingwaterconcentrationtime[q]= (emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*k))+heatingcookingwaterconcentrationtime[length(newtimeseqzero)]*(exp(-airexchangeinput*k))+backgroundconcentration
                  
                  
                }
                #no emissions
                for (s in newtimeseqone)
                {
                  l=s-length(newtimeseqzero)-length(newtimeenergy)
                  watercookingconcentrationtime[s]= watercookingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)]*(exp(-airexchangeinput*l))+ backgroundconcentration
                  cookingconcentrationtime[s]= cookingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)]*(exp(-airexchangeinput*l))+backgroundconcentration
                  waterheatingconcentrationtime[s]= waterheatingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)]*(exp(-airexchangeinput*l))+backgroundconcentration
                  heatingconcentrationtime[q]=heatingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)]*(exp(-airexchangeinput*l))+backgroundconcentration
                  heatingcookingconcentrationtime[q]=heatingcookingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)]*(exp(-airexchangeinput*l))+backgroundconcentration
                  heatingcookingwaterconcentrationtime[q]=heatingcookingwaterconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)]*(exp(-airexchangeinput*l))+backgroundconcentration
                }
                #water heating
                for (t in newtimewaterheating){
                  m=t-length(newtimeseqzero)-length(newtimeenergy)-length(newtimeseqone)
                  watercookingconcentrationtime[t]= ((emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*m)))+((watercookingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)+length(newtimeseqone)])*((exp(-airexchangeinput*m))))+backgroundconcentration
                  cookingconcentrationtime[t]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*m))+cookingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*m))+backgroundconcentration
                  waterheatingconcentrationtime[t]= (emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*m))+waterheatingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*m))+backgroundconcentration
                  heatingconcentrationtime[t]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*m))+heatingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*m))+backgroundconcentration
                  heatingcookingconcentrationtime[t]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*m))+heatingcookingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*m))+backgroundconcentration
                  heatingcookingwaterconcentrationtime[q]= (emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*m))+heatingcookingwaterconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*m))+backgroundconcentration
                }
                for (v in newtimeseqthree){
                  p=v-length(newtimeseqzero)-length(newtimeenergy)-length(newtimeseqone)-length(newtimewaterheating)
                  watercookingconcentrationtime[v]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*p))+watercookingconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*p))+backgroundconcentration
                  cookingconcentrationtime[v]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*p))+cookingconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*p))+backgroundconcentration
                  waterheatingconcentrationtime[v]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*p))+waterheatingconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*p))+backgroundconcentration
                  heatingconcentrationtime[v]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*p))+heatingconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*p))+backgroundconcentration
                  heatingcookingconcentrationtime[v]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*p))+heatingcookingconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*p))+backgroundconcentration
                  heatingcookingwaterconcentrationtime[v]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*p))+heatingcookingwaterconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*p))+backgroundconcentration
                }
                print("end five stove scenario")
                print("water cooking")
                print(watercookingconcentrationtime)
                print(cookingconcentrationtime)
                print(waterheatingconcentrationtime)
              }
              

                
                else
                {
                  
                  print("not cooking too short try six stoves")
                  stovenumber=6
                  emissionrate=(fraction*(1000*1000*emissionfactor*6*stovepowerMJmin)/heatvaluefuel) #microgramsg/min  assumes all the same right now
                  # Emission rate units check: 1000*1000*((g/kg)*(MJ/min))/(MJ/kg) - ug/min
                  
                  amountheatwater = ((drinkingwatervolume*cp*100)+(3*stovepowerMJmin*6*1000000))/1000/1000 #Megajoules #daily heat to drink water assumes boiles for 3 minutes
                  
                  timeenergy=(dailyenergy/((6*stovepowerMJmin*efficiency))) #minutes
                  timewaterheating=(amountheatwater/((6*stovepowerMJmin*efficiency)))#(heatwater[i]/(stovepowerMJmin[i])) #minutes
                  roundenergytime=round(timeenergy,0)
                  roundwatertime=round(timewaterheating,0)#round(timewaterheating[i],0)
                  
                  if (roundenergytime<1)
                  {
                    roundenergytime=1
                  }
                  else
                  {
                    roundenergytime=roundenergytime
                  }
                  roundwatertime=round(timewaterheating,0)#round(timewaterheating[i],0)
                  if (roundwatertime<1)
                  {
                    roundwatertime=1
                  }
                  else
                  {
                    roundwatertime=roundwatertime
                  }
                  
                  
                  notcooking=1440-roundenergytime-roundwatertime
                  
                  if (notcooking>3){
                    print("Six stoves!")
                    stovenumber=6
                    notcookinground=round((notcooking/3),0) # not cooking four times
                    
                    timezero=notcookinground #divided by 3
                    timeone=notcookinground  #divided by 3
                    timethree=1440-roundenergytime-roundwatertime-timezero-timeone
                    newtimeseqzero = seq(1,timezero,by=1)
                    newtimeenergy = seq((1+newtimeseqzero[length(newtimeseqzero)]),(newtimeseqzero[length(newtimeseqzero)]+roundenergytime),by=1)
                    newtimeseqone=seq((1+newtimeenergy[length(newtimeenergy)]),((newtimeenergy[length(newtimeenergy)])+timeone),by=1)
                    newtimewaterheating = seq((1+newtimeseqone[length(newtimeseqone)]),((newtimeseqone[length(newtimeseqone)])+roundwatertime),by=1)
                    newtimeseqthree = seq((1+newtimewaterheating[length(newtimewaterheating)]),(newtimewaterheating[length(newtimewaterheating)]+timethree),by=1)
                    
                    #no emissions
                    for (q in newtimeseqzero){
                      j=q
                      watercookingconcentrationtime[q]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
                      cookingconcentrationtime[q]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
                      waterheatingconcentrationtime[q]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
                      heatingconcentrationtime[q]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
                      heatingcookingconcentrationtime[q]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
                      heatingcookingwaterconcentrationtime[q]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
                    }
                    
                    #cooking emissions
                    for (r in newtimeenergy){
                      k=r-length(newtimeseqzero)
                      watercookingconcentrationtime[r]= (emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*k))+watercookingconcentrationtime[length(newtimeseqzero)]*(exp(-airexchangeinput*k))+backgroundconcentration
                      cookingconcentrationtime[r]= (emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*k))+cookingconcentrationtime[length(newtimeseqzero)]*(exp(-airexchangeinput*k))+backgroundconcentration
                      waterheatingconcentrationtime[r]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*k))+waterheatingconcentrationtime[length(newtimeseqzero)]*(exp(-airexchangeinput*k))+backgroundconcentration
                      heatingconcentrationtime[q]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
                      heatingcookingconcentrationtime[q]= (emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*k))+heatingcookingconcentrationtime[length(newtimeseqzero)]*(exp(-airexchangeinput*k))+backgroundconcentration
                      heatingcookingwaterconcentrationtime[q]= (emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*k))+heatingcookingwaterconcentrationtime[length(newtimeseqzero)]*(exp(-airexchangeinput*k))+backgroundconcentration
                      
                      
                    }
                    #no emissions
                    for (s in newtimeseqone)
                    {
                      l=s-length(newtimeseqzero)-length(newtimeenergy)
                      watercookingconcentrationtime[s]= watercookingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)]*(exp(-airexchangeinput*l))+ backgroundconcentration
                      cookingconcentrationtime[s]= cookingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)]*(exp(-airexchangeinput*l))+backgroundconcentration
                      waterheatingconcentrationtime[s]= waterheatingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)]*(exp(-airexchangeinput*l))+backgroundconcentration
                      heatingconcentrationtime[q]=heatingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)]*(exp(-airexchangeinput*l))+backgroundconcentration
                      heatingcookingconcentrationtime[q]=heatingcookingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)]*(exp(-airexchangeinput*l))+backgroundconcentration
                      heatingcookingwaterconcentrationtime[q]=heatingcookingwaterconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)]*(exp(-airexchangeinput*l))+backgroundconcentration
                    }
                    #water heating
                    for (t in newtimewaterheating){
                      m=t-length(newtimeseqzero)-length(newtimeenergy)-length(newtimeseqone)
                      watercookingconcentrationtime[t]= ((emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*m)))+((watercookingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)+length(newtimeseqone)])*((exp(-airexchangeinput*m))))+backgroundconcentration
                      cookingconcentrationtime[t]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*m))+cookingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*m))+backgroundconcentration
                      waterheatingconcentrationtime[t]= (emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*m))+waterheatingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*m))+backgroundconcentration
                      heatingconcentrationtime[t]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*m))+heatingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*m))+backgroundconcentration
                      heatingcookingconcentrationtime[t]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*m))+heatingcookingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*m))+backgroundconcentration
                      heatingcookingwaterconcentrationtime[q]= (emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*m))+heatingcookingwaterconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*m))+backgroundconcentration
                    }
                    for (v in newtimeseqthree){
                      p=v-length(newtimeseqzero)-length(newtimeenergy)-length(newtimeseqone)-length(newtimewaterheating)
                      watercookingconcentrationtime[v]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*p))+watercookingconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*p))+backgroundconcentration
                      cookingconcentrationtime[v]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*p))+cookingconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*p))+backgroundconcentration
                      waterheatingconcentrationtime[v]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*p))+waterheatingconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*p))+backgroundconcentration
                      heatingconcentrationtime[v]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*p))+heatingconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*p))+backgroundconcentration
                      heatingcookingconcentrationtime[v]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*p))+heatingcookingconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*p))+backgroundconcentration
                      heatingcookingwaterconcentrationtime[v]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*p))+heatingcookingwaterconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*p))+backgroundconcentration
                    }
                    #print("end six stove scenario")
                  }
                  
                  else
                  {
                    
                    print("not cooking too short try 20 stoves")
                    stovenumber=20
                    emissionrate=(fraction*(1000*1000*emissionfactor*6*stovepowerMJmin)/heatvaluefuel) #microgramsg/min  assumes all the same right now
                    # Emission rate units check: 1000*1000*((g/kg)*(MJ/min))/(MJ/kg) - ug/min
                    
                    amountheatwater = ((drinkingwatervolume*cp*100)+(3*stovepowerMJmin*20*1000000))/1000/1000 #Megajoules #daily heat to drink water assumes boiles for 3 minutes
                    
                    timeenergy=(dailyenergy/((20*stovepowerMJmin*efficiency))) #minutes
                    timewaterheating=(amountheatwater/((20*stovepowerMJmin*efficiency)))#(heatwater[i]/(stovepowerMJmin[i])) #minutes
                    roundenergytime=round(timeenergy,0)
                    roundwatertime=round(timewaterheating,0)#round(timewaterheating[i],0)
                    
                    if (roundenergytime<1)
                    {
                      roundenergytime=1
                    }
                    else
                    {
                      roundenergytime=roundenergytime
                    }
                    roundwatertime=round(timewaterheating,0)#round(timewaterheating[i],0)
                    if (roundwatertime<1)
                    {
                      roundwatertime=1
                    }
                    else
                    {
                      roundwatertime=roundwatertime
                    }
                    
                    
                    notcooking=1440-roundenergytime-roundwatertime
                    
                    if (notcooking>3){
                      print("20 stoves!")
                      stovenumber=20
                      notcookinground=round((notcooking/3),0) # not cooking four times
                      
                      timezero=notcookinground #divided by 3
                      timeone=notcookinground  #divided by 3
                      timethree=1440-roundenergytime-roundwatertime-timezero-timeone
                      newtimeseqzero = seq(1,timezero,by=1)
                      newtimeenergy = seq((1+newtimeseqzero[length(newtimeseqzero)]),(newtimeseqzero[length(newtimeseqzero)]+roundenergytime),by=1)
                      newtimeseqone=seq((1+newtimeenergy[length(newtimeenergy)]),((newtimeenergy[length(newtimeenergy)])+timeone),by=1)
                      newtimewaterheating = seq((1+newtimeseqone[length(newtimeseqone)]),((newtimeseqone[length(newtimeseqone)])+roundwatertime),by=1)
                      newtimeseqthree = seq((1+newtimewaterheating[length(newtimewaterheating)]),(newtimewaterheating[length(newtimewaterheating)]+timethree),by=1)
                      
                      #no emissions
                      for (q in newtimeseqzero){
                        j=q
                        watercookingconcentrationtime[q]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
                        cookingconcentrationtime[q]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
                        waterheatingconcentrationtime[q]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
                        heatingconcentrationtime[q]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
                        heatingcookingconcentrationtime[q]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
                        heatingcookingwaterconcentrationtime[q]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
                      }
                      
                      #cooking emissions
                      for (r in newtimeenergy){
                        k=r-length(newtimeseqzero)
                        watercookingconcentrationtime[r]= (emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*k))+watercookingconcentrationtime[length(newtimeseqzero)]*(exp(-airexchangeinput*k))+backgroundconcentration
                        cookingconcentrationtime[r]= (emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*k))+cookingconcentrationtime[length(newtimeseqzero)]*(exp(-airexchangeinput*k))+backgroundconcentration
                        waterheatingconcentrationtime[r]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*k))+waterheatingconcentrationtime[length(newtimeseqzero)]*(exp(-airexchangeinput*k))+backgroundconcentration
                        heatingconcentrationtime[q]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*j))+0*(exp(-airexchangeinput*j))+backgroundconcentration
                        heatingcookingconcentrationtime[q]= (emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*k))+heatingcookingconcentrationtime[length(newtimeseqzero)]*(exp(-airexchangeinput*k))+backgroundconcentration
                        heatingcookingwaterconcentrationtime[q]= (emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*k))+heatingcookingwaterconcentrationtime[length(newtimeseqzero)]*(exp(-airexchangeinput*k))+backgroundconcentration
                        
                        
                      }
                      #no emissions
                      for (s in newtimeseqone)
                      {
                        l=s-length(newtimeseqzero)-length(newtimeenergy)
                        watercookingconcentrationtime[s]= watercookingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)]*(exp(-airexchangeinput*l))+ backgroundconcentration
                        cookingconcentrationtime[s]= cookingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)]*(exp(-airexchangeinput*l))+backgroundconcentration
                        waterheatingconcentrationtime[s]= waterheatingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)]*(exp(-airexchangeinput*l))+backgroundconcentration
                        heatingconcentrationtime[q]=heatingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)]*(exp(-airexchangeinput*l))+backgroundconcentration
                        heatingcookingconcentrationtime[q]=heatingcookingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)]*(exp(-airexchangeinput*l))+backgroundconcentration
                        heatingcookingwaterconcentrationtime[q]=heatingcookingwaterconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)]*(exp(-airexchangeinput*l))+backgroundconcentration
                      }
                      #water heating
                      for (t in newtimewaterheating){
                        m=t-length(newtimeseqzero)-length(newtimeenergy)-length(newtimeseqone)
                        watercookingconcentrationtime[t]= ((emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*m)))+((watercookingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)+length(newtimeseqone)])*((exp(-airexchangeinput*m))))+backgroundconcentration
                        cookingconcentrationtime[t]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*m))+cookingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*m))+backgroundconcentration
                        waterheatingconcentrationtime[t]= (emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*m))+waterheatingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*m))+backgroundconcentration
                        heatingconcentrationtime[t]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*m))+heatingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*m))+backgroundconcentration
                        heatingcookingconcentrationtime[t]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*m))+heatingcookingconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*m))+backgroundconcentration
                        heatingcookingwaterconcentrationtime[q]= (emissionrate/(airexchangeinput*volume))*(1-exp(-airexchangeinput*m))+heatingcookingwaterconcentrationtime[length(newtimeseqzero)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*m))+backgroundconcentration
                      }
                      for (v in newtimeseqthree){
                        p=v-length(newtimeseqzero)-length(newtimeenergy)-length(newtimeseqone)-length(newtimewaterheating)
                        watercookingconcentrationtime[v]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*p))+watercookingconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*p))+backgroundconcentration
                        cookingconcentrationtime[v]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*p))+cookingconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*p))+backgroundconcentration
                        waterheatingconcentrationtime[v]= (0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*p))+waterheatingconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*p))+backgroundconcentration
                        heatingconcentrationtime[v]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*p))+heatingconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*p))+backgroundconcentration
                        heatingcookingconcentrationtime[v]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*p))+heatingcookingconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*p))+backgroundconcentration
                        heatingcookingwaterconcentrationtime[v]=(0/(airexchangeinput*volume))*(1-exp(-airexchangeinput*p))+heatingcookingwaterconcentrationtime[length(newtimeseqzero)+length(newtimewaterheating)+length(newtimeenergy)+length(newtimeseqone)]*(exp(-airexchangeinput*p))+backgroundconcentration
                      }
                      print("end 20 stove scenario")
                    }
                    
                    else
                    {
                      
                      
                      print("not cooking too short!!!!")
                      print("ERROR")
                      print("notcooking")
                      print(sgoewubgowugb)
                    }
                    
                    
                    
                  }
                  
                  
                  
                }

              
            
            

          }
        
      }
    }
    
  }
  

cookingconcentration=mean(cookingconcentrationtime)
waterheatingconcentration= mean(waterheatingconcentrationtime)
watercookingconcentration=mean(watercookingconcentrationtime)

concentrations=c(cookingconcentration,waterheatingconcentration,watercookingconcentration,stovenumber)
return(concentrations)

}
