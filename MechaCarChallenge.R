#----Deliverable 1------------------------------

#load the dplyr package
library(dplyr)
#Import and read in the MechaCar_mpg.csv file as a dataframe
MechaCar_mpg <- read.csv(file="./Data/MechaCar_mpg.csv",check.names =F,stringsAsFactors = F)

#linear regression ,pass in all six variables
Mecha_lsummary(Mecha_lm)$r.squaredm <- lm(mpg ~ vehicle_length + vehicle_weight + spoiler_angle + ground_clearance + AWD,data=MechaCar_mpg) 
Mecha_lm
# To determine p-value and r-square
summary(Mecha_lm)

#-----Deliverable2-------------------------------
#Import and read in the Suspension_Coil.csv file as a dataframe
Suspension_Coil <- read.csv(file="./Data/Suspension_Coil.csv",check.names =F,stringsAsFactors = F)
#create a summery table for suspension coils
total_summary <- Suspension_Coil %>%  summarize(MEAN=mean(PSI),Median=median(PSI),VArience=var(PSI),Std_Dev=sd(PSI))
total_summary 
#create lot summery table with groups(Manufacring_Lot)
lot_summary <- Suspension_Coil %>% group_by(Manufacturing_Lot) %>% summarize(MEAN=mean(PSI),Median=median(PSI),VArience=var(PSI),Std_Dev=sd(PSI), .groups = 'keep')


#-----Deliverable3------------------------------
#level of significance is .05
#Ho: mu =1500
#Ha: mu <> 1500
t.test(Suspension_Coil$PSI,mu=1500)
# p value(0.6) is greater than 0.5 is not statistically significant and indicates strong evidence for the null hypothesis. 
#This means we retain the null hypothesis and reject the alternative hypothesis.(fail to reject the null hypothesis)

#--t test by lots
t.test(subset(Suspension_Coil, Manufacturing_Lot=="Lot1")$PSI, mu=1500)
t.test(subset(Suspension_Coil, Manufacturing_Lot=="Lot2")$PSI, mu=1500)
t.test(subset(Suspension_Coil, Manufacturing_Lot=="Lot3")$PSI, mu=1500)



