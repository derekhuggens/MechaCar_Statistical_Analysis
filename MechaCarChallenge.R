library(dplyr)

# DELIVERABLE 1
df <- read.csv(file="MechaCar_mpg.csv", stringsAsFactors=FALSE)
?lm()
model = lm(mpg ~ vehicle_weight + spoiler_angle + ground_clearance + AWD + vehicle_length, data = df)
summary(model)

# DELIVERABLE 2
?summarize()
coil_df <- read.csv(file="Suspension_Coil.csv", stringsAsFactors=FALSE)
total_summary <- summarize(coil_df, PSI_MEAN = mean(coil_df$PSI), PSI_MEDIAN = median(coil_df$PSI), PSI_VARIANCE = var(coil_df$PSI), PSI_SD = sd(coil_df$PSI))
summary <- group_by(coil_df, Manufacturing_Lot)
lot_summary <- summarize(summary, PSI_MEAN = mean(PSI), PSI_MEDIAN = median(PSI), PSI_VARIANCE = var(PSI), PSI_SD = sd(PSI))


# DELIVERABLE 3
?t.test()
t.test(coil_df$PSI, mu = 1500)

#LOT1
lot_1 = subset(coil_df, Manufacturing_Lot == 'Lot1')
t.test(lot_1$PSI, mu = 1500)

#LOT2
lot_2 = subset(coil_df, Manufacturing_Lot == 'Lot2')
t.test(lot_2$PSI, mu = 1500)

#LOT3
lot_3 = subset(coil_df, Manufacturing_Lot == 'Lot3')
t.test(lot_3$PSI, mu = 1500)
