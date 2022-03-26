#load the dplyr package
library(dplyr)
#Import and read in the MechaCar_mpg.csv file as a dataframe
MechaCar_mpg <- read.csv(file="./Data/MechaCar_mpg.csv",check.names =F,stringsAsFactors = F)

#linear regression ,pass in all six variables
Mecha_lm <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_mpg) 
Mecha_lm
# To determine p-value and r-square
summary(Mecha_lm)
summary(Mecha_lm)$r.squared
