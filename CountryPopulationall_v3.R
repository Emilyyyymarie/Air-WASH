

agebin=c()

ageseq=seq(2,(length(agepop)-1))
agebin[1]=agepop[1]
for (i in ageseq)
{
  agebin[i]=agebin[i-1]+agepop[i]
}

countryageperson<-function()
{
randomage=sample(1:totalpopulation,1)
printage=min((which((agebin-randomage)>0)))
if (printage==Inf)
    {
printage=length(agebin)
    }
else
{
  printage=printage
}

if (personofinterest=="adult") {
  actualage=printage+4
} else if  (personofinterest == "child") {
  actualage=printage-1
} else {
  print("error")
  print(stopstoppopulation)
}
return(actualage)
}


