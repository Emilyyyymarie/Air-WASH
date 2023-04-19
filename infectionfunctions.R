
infectionbetapoisson <- function(drinkingwateroneperson,ecoli,logreduction,alpha,Nfifty,Pillness,ratio,fraction,logreductionratio,deaths,DALYs,populationinput)
{
  if (personofinterest=="adult") {
    population=(populationinput/averagehousehold)*numberadultsperHH #get input from main code
  } else if  (personofinterest == "child") {
    population=(populationinput/averagehousehold)*numberchildrenunder5perHH
  } else {
    print("error")
    print(stopstoppopulation)
  }
 
  probsource = 1 #probability source is contaminated, set to 1 here
  exitingwater = (ecoli*ratio)/(10^(logreduction*logreductionratio)) #ecoli per 100 ml # 0 if no logreduction
  dose=exitingwater*fraction*(drinkingwateroneperson/100) #fraction pathogenic
  probabilityofinfection = 1-(1+(dose/Nfifty)*(2^(1/alpha)-1))^(-alpha) #
  probinfectionyear=(1-((1-probabilityofinfection)^365))*probsource #annual probability of developing illness
  caseswater=population*probinfectionyear*Pillness
  deathwater=deaths*caseswater #uprety 2020
  DALYswater=DALYs*caseswater #uprety 2020 #both deaths and DALYs
  return(c(deathwater,DALYswater))
}

infectionexponential <- function(drinkingwateroneperson,ecoli,logreduction,kvalue,Pillness,ratio,fraction,logreductionratio,deaths,DALYs,populationinput)
{
  if (personofinterest=="adult") {
    population=(populationinput/averagehousehold)*numberadultsperHH #get input from main code
  } else if  (personofinterest == "child") {
    population=(populationinput/averagehousehold)*numberchildrenunder5perHH
  } else {
    print("error")
    print(stopstoppopulation)
  } 
  probsource = 1 #probability source is contaminated, set to 1 here
  exitingwater = (ecoli*ratio)/(10^(logreduction*logreductionratio)) #ecoli per 100 ml # 0 if no logreduction
  dose=exitingwater*fraction*(drinkingwateroneperson/100) #fraction pathogenic
  probabilityofinfection = 1-exp(-kvalue*dose)
  probinfectionyear=(1-((1-probabilityofinfection)^365))*probsource #annual probability of developing illness
  caseswater=population*probinfectionyear*Pillness
  deathwater=deaths*caseswater #uprety 2020
  DALYswater=DALYs*caseswater #uprety 2020 #both deaths and DALYs
  return(c(deathwater,DALYswater))
}


campobacterDALYsdeaths <- function(drinkingwateroneperson,ecolilevel,ecolilogreductionvaluelist,populationinput,agevalue,campalphainput,campNfiftyinput,campratioinput)
{
alphacamp=campalphainput
Nfiftycamp=campNfiftyinput 
Pillnesscamp= 0.30 #probability of illness given infection
fractioncamp = 1#1
ratiocamp=campratioinput 
logreductionratiocamp=(5/6)
ageatdeath=agevalue
deathwatercamp=(lifeexpectancy-ageatdeath)*0.001#5.6*10^-2#((10^-4)+(0.023*2*10^-4)) #Bivins
DALYswatercamp=(8.80*10^-4+5.39*10^-4)#5.74*10^-2#(4.6*10^-3) #Bivins
campobactercases=infectionbetapoisson(drinkingwateroneperson,ecolilevel,ecolilogreductionvaluelist,alphacamp,Nfiftycamp,Pillnesscamp,ratiocamp,fractioncamp,logreductionratiocamp,deathwatercamp,DALYswatercamp,populationinput)
}

#rotavirus
rotaDALYsdeaths <- function(drinkingwateroneperson,ecolilevel,ecolilogreductionvaluelist,populationinput,agevalue,rotaalphainput,rotaNfiftyinput,rotaratioinput){
alpharota = rotaalphainput 
Nfiftyrota=rotaNfiftyinput 
Pillnessrota= 0.5 
fractionrota = 1
ratiorota=rotaratioinput 
logreductionrationratiorota=1
ageatdeath=agevalue
deathwaterrota=(lifeexpectancy-ageatdeath)*0.007#(0.006) #Bivins
DALYswaterrota=(1.64*10^-3+6.35*10^-4)#(0.482) #Bivins
rotacases=infectionbetapoisson(drinkingwateroneperson,ecolilevel,ecolilogreductionvaluelist,alpharota,Nfiftyrota,Pillnessrota,ratiorota,fractionrota,logreductionrationratiorota,deathwaterrota,DALYswaterrota,populationinput)
return(rotacases)
}


#cryptosporidium
cryptoDALYsdeaths <- function(drinkingwateroneperson,ecolilevel,ecolilogreductionvaluelist,populationinput,agevalue,cryptokinput,cryptoratioinput){
#kvaluecrypto = #0.00419#
kvaluecrypto=cryptokinput 
Pillnesscrypto= .7 #probability of illness given infection
fractioncrypto = 1#(1.13*10^-6) #using mean#1
ratiocrypto=cryptoratioinput 
logreductionratiocrypto=(8/6)
ageatdeath=agevalue
deathwatercrypto=(lifeexpectancy-ageatdeath)*0.004#(10^-5) #Bivins
DALYswatercrypto=6.03*10^-4#(1.47*10^-3) #Bivins
cryptocases=infectionexponential(drinkingwateroneperson,ecolilevel,ecolilogreductionvaluelist,kvaluecrypto,Pillnesscrypto,ratiocrypto,fractioncrypto,logreductionratiocrypto,deathwatercrypto,DALYswatercrypto,populationinput)
return(cryptocases)
}

waterDALYs <- function(drinkingwateroneperson,ecolilevel,logreductionvalue,populationinput,agevalue,cryptokinput,cryptoratioinput,rotaalphainput,rotaNfiftyinput,rotaratioinput,campalphainput,campNfiftyinput,campratioinput)
{
cryptocases=cryptoDALYsdeaths(drinkingwateroneperson,ecolilevel,logreductionvalue,populationinput,agevalue,cryptokinput,cryptoratioinput)
rotacases=rotaDALYsdeaths(drinkingwateroneperson,ecolilevel,logreductionvalue,populationinput,agevalue,rotaalphainput,rotaNfiftyinput,rotaratioinput)
campobactercases=campobacterDALYsdeaths(drinkingwateroneperson,ecolilevel,logreductionvalue,populationinput,agevalue,campalphainput,campNfiftyinput,campratioinput)
totalwaterDALYs = cryptocases[2]+rotacases[2]+campobactercases[2]+cryptocases[1]+rotacases[1]+campobactercases[1]
return(totalwaterDALYs)
}

watercryptoDALYs <- function(drinkingwateroneperson,ecolilevel,logreductionvalue,populationinput,agevalue,cryptokinput,cryptoratioinput)
{
  cryptocases=cryptoDALYsdeaths(drinkingwateroneperson,ecolilevel,logreductionvalue,populationinput,agevalue,cryptokinput,cryptoratioinput)
  cryptoDALYs=cryptocases[2]+cryptocases[1]
  return(cryptoDALYs)
}

waterrotaDALYs <- function(drinkingwateroneperson,ecolilevel,logreductionvalue,populationinput,agevalue,rotaalphainput,rotaNfiftyinput,rotaratioinput)
{
  rotacases=rotaDALYsdeaths(drinkingwateroneperson,ecolilevel,logreductionvalue,populationinput,agevalue,rotaalphainput,rotaNfiftyinput,rotaratioinput)
  rotaDALYs=rotacases[2]+rotacases[1]
  return(rotaDALYs)
}
watercampDALYs <- function(drinkingwateroneperson,ecolilevel,logreductionvalue,populationinput,agevalue,campalphainput,campNfiftyinput,campratioinput)
{
  campobactercases=campobacterDALYsdeaths(drinkingwateroneperson,ecolilevel,logreductionvalue,populationinput,agevalue,campalphainput,campNfiftyinput,campratioinput)
  campoDALYs=campobactercases[2]+campobactercases[1]
  return(campoDALYs)
}


