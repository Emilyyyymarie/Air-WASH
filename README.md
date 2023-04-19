# Air and WASH Health Risk comparison

 This code in R is written to compare the health risks from drinking water and indoor air pollution when boiling drinking water with various types of fuels. It can be run for various countries. Right now, data to run for two focus countries, Uganda and Vietnam, is provided. Data for additional countries can be added.
 
## Country Level Inputs
A folder is created for each country.
Inside the folder the following files are contained:
DALYs ages 5 to 19
DALYs ages 20 plus
DALYs under 5
household demographics
population
The data for these files comes from the GBD

##Required Packages & Libraries
Packages.R contains the required packages for the code. Only needs to be run once.
Libraries.R contains the required libraries for the code. Only needs to be run once.

##Health Files
Files containing data on ALRI, COPD, IHD, LC and stroke are provided in the health folder

##Running the code
Air_WASH_Master_Script is used to run the code. 
Examples are given for Uganda and Vietnam, adults and children.
In this , you can set the following:
1) Number of Monte Carlo iterations (currently 1000)
2) Population of concern (currently 10,000)
3) Country (ie Uganda)
4) Person of interest (child or adult)
5) Water Quality Level based on e coli levels (safe, low, medium, or high)
6) Current path of code files
7) Current results path
8) Current country path

Once this is set, this file calls the Air_water_code_person which calculates the DALYs for the WASH and air health risk. Running this code produces results in the results folder, for Uganda and Vietnam. 

## Dependent R Files
There are several necessary dependent files:
### countryspecificvariables
This file reads in the following:
1) population data
2) household data (number of adults, children, etc)
3) Percent solid fuel use
4) Life expectancy
5) Country population
6) Country Specific DALYs
7) The relative risk parameters for ALRI, COPD, IHD, LC and Stroke

### CountryPopulation
This file generates a random distribution of the ages of people in a country

### infectionfunctions
This calculates the DALYs for Rotavirus, cryptosporidium, and campylobacter

###IndoorAirPollution
This calculates the 24 hour kitchen PM2.5 concentration uses the air pollution box model

###RelativeRisk
This code calculates the DALYs for LC, ALRI, COPD, Stroke, and IHD

## Navigating Results
Results is organzied by countries, with a folder for Uganda and Vietnam
There are files divided by adults and children including:
1) PM2.5 data
2) DALYs from Air Pollution
3) DALYs from Drinking water

##Plotting
Master_Script_Plotting runs the code to produce the plots
Given a country, this calls the file AirWASHPlots_Indicatedcountry_adult_and_child
This reads in the results, and produces plots of the indoor air pollution, drinking water DALYs, IAP DALYs, and plot of the DALYs difference.

##Uncertainty
Air_WASH_Master_Uncertainty runs the code to produce the uncertainty outputs.
For a given number of runs, input population, country of interest, and person of interest, it runs the UncertaintyAnalysis_distribution file. This file has the given distributions to run the uncertainty. The uncertainty ranges are calculated for the low, average and high values of the distributions, and then plotted.



