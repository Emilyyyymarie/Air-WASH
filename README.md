# Air WASH
 A code to compare the air and water health risks

This code calculate the air and water health risks for two focus countries. 

Country data: Country data is contained in a folder with that country's name. Currently, the data for Uganda and Vietnam are provided. This includes the country wide DALYs, population, and household demographics.

There are three master scripts:

1) Air_WASH_Master_Script runs the code to calculate the health impacts.
2) Air_WASH_Master_Uncertainty runs the code to produce the uncertainty outputs.
3) Master_Script_Plotting runs the code to produce the plots

Results:
Results is organzied by countries, with a folder for Uganda and Vietnam
Uncertainty has it's own folder in the results folder.

Air_WASH_Master_Uncertainty runs the Uncertainty code (UncertaintyAnalysis_distribution and Air_water_code_uncertainty) for the specified country. In Uncertainty_Analysis_distribution, the distributions of interest to be run through the uncertainty code are provided, and can be changed by the user. These distributions are based on the literature.  In Air_water_code_uncertainty_code, using the distribution inputs, the net difference in DALYs, water DALYs, air DALYs, and water heating is provided. 
