library(dplyr)
library(ggplot2)
library(reshape2)
install.packages("reshape2")

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

data("mtcars")

# Visualizations

ggplot(model, aes(x = vehicle_weight, y = mpg, shape = )) + 
  geom_point() +
  geom_smooth(method = "lm", col = "red")


ggplot(df) + 
  geom_jitter(aes(vehicle_weight,mpg), colour="purple") + geom_smooth(aes(vehicle_weight,mpg), method=lm, se=FALSE) +
  geom_jitter(aes(spoiler_angle,mpg), colour="green") + geom_smooth(aes(spoiler_angle,mpg), method=lm, se=FALSE) +
  geom_jitter(aes(ground_clearance,mpg), colour="red") + geom_smooth(aes(ground_clearance,mpg), method=lm, se=FALSE) +
  geom_jitter(aes(AWD,mpg), colour="black") + geom_smooth(aes(AWD,mpg), method=lm, se=FALSE) +
  geom_jitter(aes(vehicle_length,mpg), colour="orange") + geom_smooth(aes(vehicle_length,mpg), method=lm, se=FALSE) +
  labs(x = "Measurement", y = "MPG)")



require(ggplot2)
require(reshape2)
df_table = df
setDT(df_table)
df2 = melt(df_table, id.vars='mpg')
ggplot(df2) +
  geom_jitter(aes(value,mpg, colour=variable),) + geom_smooth(aes(value,mpg, colour=variable), method=lm, se=FALSE) +
  facet_wrap(~variable, scales="free_x") +
  labs(x = "Measurement", y = "MPG")
