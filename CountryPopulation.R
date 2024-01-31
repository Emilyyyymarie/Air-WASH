

agebin=c()
#these age bins are funny
ageseq=seq(2,(length(agepop)))
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
print(sodgubsdougb)
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


