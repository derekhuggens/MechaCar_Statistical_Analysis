# MechaCar_Statistical_Analysis
Prototype Vehicle: Statistical Analysis with R

By using the programming language, R, within an IDE known as RStudio, statistical measures for two .csv datasets were acquired. The library `dplyr`, a dataframe manipulation package, was imported and each .csv was read into a dataframe using: <br>`read.csv(file=, stringsAsFactors=FALSE)`.

## Overview of Analysis

## Linear Regression to Predict MPG

Head of read in .csv turned into a dataframe:

![head_mpg](https://github.com/derekhuggens/MechaCar_Statistical_Analysis/blob/bef459e0d4ce3209a215c18be05032dce4741bc7/README_IMAGES/head_df_mpg.png)

Using the lm() function to fit a regression model in R, a regresson analysis was formulated to predict vehicle miles per gallon.

Syntax: source(https://www.rdocumentation.org/)

```R
  lm(formula, data, subset, weights, na.action,
    method = "qr", model = TRUE, x = FALSE, y = FALSE, qr = TRUE,
    singular.ok = TRUE, contrasts = NULL, offset, …)
```

Example used:

```R 
  df <- read.csv(file="MechaCar_mpg.csv", stringsAsFactors=FALSE)
  model = lm(mpg ~ vehicle_weight + spoiler_angle + ground_clearance + AWD + vehicle_length, data = df)
  summary(model)
```

```R 
  model = lm(mpg ~ vehicle_weight + spoiler_angle + ground_clearance + AWD + vehicle_length, data = df)
```

![Deliverable 1](https://github.com/derekhuggens/MechaCar_Statistical_Analysis/blob/ac8dbb6cc2c0cfadc4905b32bf36eeb657316392/README_IMAGES/deliverable_1_summary_highlighted.png)

In the code above, 'model' was the variable assigned to the lm() function. Within the lm() function, six variables (i.e., columns) were passed in and the 'data' argument of the lm() function was assigned to 'df', a variable containing the read in .csv.

According to the summary statistics that are printed by the R function `summary()`, `summary(model)` provided `Residuals` data and a table with an index column of `Coefficients:` containing the `(Intercept)`, `vehicle_weight`, `spoiler_angle`, `ground_clearance`, `AWD`, and `vehicle_length` variables. `summary(model)` also provided four additional columns titled: `Estimate`,  `Std. Error`, `t value`, `Pr(>|t|)`.

Looking to the `Pr(>|t|)` column, we can see that:
* (Intercept) is the response variable (`mpg`) and its `Pr(>|t|)` = 5.08e-08, statistically significant < 0.05
* vehicle_weight `Pr(>|t|)` = .0776, not statistically significant > 0.05
* spoiler_angle `Pr(>|t|)` = 0.3069 not statistically significant > 0.05
* ground_clearance `Pr(>|t|)` = 5.21e-08 statistically significant < 0.05
* AWD `Pr(>|t|)` = 0.1852 not statistically significant > 0.05
* vehicle_length `Pr(>|t|)` = 2.60e-12 statistically significant < 0.05

Which variables/coefficients provided a non-random amount of variance to the mpg values in the dataset?

Together, vehicle_weight, spoiler_angle, and AWD predictor variables, having p-values < 0.05, are redundant to the model. Whereas vehicle_length, ground clearance, and intercept are not redundant, having p-values > 0.05 and provide a non-random amount of variance to the mpg value.

Is the slope of the linear model considered to be zero? Why or why not?

The slope is not zero as can be seen in the below linear regression plots and within `summary(model)` above, the `Pr(>|t|)` of (Intercept) is statistically significant, or not equal to zero.

![code of single linear regression model](https://github.com/derekhuggens/MechaCar_Statistical_Analysis/blob/233e70375be169ceb7639716acf23a356d22ba97/README_IMAGES/mult_linear_regression_code.png)
![slope of single linear regression model](https://github.com/derekhuggens/MechaCar_Statistical_Analysis/blob/233e70375be169ceb7639716acf23a356d22ba97/README_IMAGES/mult_linear_regression_plot_image.png)

`vehicle_weight` measurement values are many factors larger than the other independent variable values so the weight measurements were scaled down 100x.
![code of mult linear regression model](https://github.com/derekhuggens/MechaCar_Statistical_Analysis/blob/e7a6ada5803b33c61134e2fff04a8a61a3df9763/README_IMAGES/mult_linear_regression_code_reduced_weight.png)
![slope of mult linear regression model](https://github.com/derekhuggens/MechaCar_Statistical_Analysis/blob/e7a6ada5803b33c61134e2fff04a8a61a3df9763/README_IMAGES/mult_linear_regression_reduced_weight.png)

![code of multiple linear regression model](https://github.com/derekhuggens/MechaCar_Statistical_Analysis/blob/233e70375be169ceb7639716acf23a356d22ba97/README_IMAGES/complete_per_var_regression_plot_code.png)
![slope of multiple linear regression model](https://github.com/derekhuggens/MechaCar_Statistical_Analysis/blob/233e70375be169ceb7639716acf23a356d22ba97/README_IMAGES/complete_per_var_regression_plots.png)


Does this linear model predict mpg of MechaCar prototypes effectively? Why or why not?

With a Multiple R-squared of 0.7149033 and adjusted R-squared of 0.6825 we can say that the multiple linear regression model predicts mpg "Moderately" according to Pearson's Correlation. 

![r-squared multiple linear regression model](https://github.com/derekhuggens/MechaCar_Statistical_Analysis/blob/e64b74a5830f87dc043fec36d7ee60fc72890651/README_IMAGES/deliverable_1_summary_highlighted_r_squared.png)

## Summary Statistics on Suspension Coils

Total Summary Statistics of Suspension Coil's PSI Values

![Deliverable 2](https://github.com/derekhuggens/MechaCar_Statistical_Analysis/blob/a859769fd774c63718e1b7e37272ae922fefbde3/README_IMAGES/deliverable_2_total_summary.png)

Lot Summary Statistics of Suspension Coil's PSI Values

![Deliverable 2](https://github.com/derekhuggens/MechaCar_Statistical_Analysis/blob/e130a12b894e3b93f3d8955226ce62b75bb5a381/README_IMAGES/deliverable_2_lot_summary.png)

Write a short summary using screenshots from your total_summary and lot_summary dataframes, and address the following question:

The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per square inch. Does the current manufacturing data meet this design specification for all manufacturing lots in total and each lot individually? Why or why not?

The current manufacturing data does meet this design specification of suspension coils not exceeding a variance of 100 PSI as can be seen above in the PSI_VARIANCE column of "Total Summary Statistics of Suspension Coil's PSI Values." The maximum variance for all manufacturing lots in total was 62.29356 PSI.

For each lot individually, the design specification of suspension coils not exceeding a variance of 100 PSI is true for Lots 1 and 2, but not for lot 3. This can be seen above in the PSI_VARIANCE column of "Lot Summary Statistics of Suspension Coil's PSI Values." The PSI_VARIANCE of Lot 3 was 170.2861224.

## T-Tests on Suspension Coils

T-TEST to determine if the PSI across all manufacturing lots is statistically different from the population mean of 1,500 PSI

![DELIVERABLE 3](https://github.com/derekhuggens/MechaCar_Statistical_Analysis/blob/e120b25de40702746ebbdbc45e66f9d6fbfeaa2a/README_IMAGES/one_sample_t_test.png)

The p-value is 0.06028, so we would fail to reject our Null Hypothesis of Ho: mu = 1500 as p-value > 0.05, NOT STATISTICALLY SIGNIFICANT FROM POPULATION
<br>
<br>

T-TEST to determine if the PSI across manufacturing lot 1 is statistically different from the population mean of 1,500 PSI

![DELIVERABLE 3](https://github.com/derekhuggens/MechaCar_Statistical_Analysis/blob/3bf5338012bad8fa6bb9a3d4387e2aca676c5b9d/README_IMAGES/lot1.png)

The p-value is 1, so we would fail to reject our Null Hypothesis of Ho: mu = 1500 as p-value > 0.05, NOT STATISTICALLY SIGNIFICANT FROM POPULATION
<br>
<br>

T-TEST to determine if the PSI across manufacturing lot 2 is statistically different from the population mean of 1,500 PSI

![DELIVERABLE 3](https://github.com/derekhuggens/MechaCar_Statistical_Analysis/blob/3bf5338012bad8fa6bb9a3d4387e2aca676c5b9d/README_IMAGES/lot2.png)

The p-value is 0.6072, so we would fail to reject our Null Hypothesis of Ho: mu = 1500 as p-value > 0.05, NOT STATISTICALLY SIGNIFICANT FROM POPULATION
<br>
<br>

T-TEST to determine if the PSI across manufacturing lot 3 is statistically different from the population mean of 1,500 PSI

![DELIVERABLE 3](https://github.com/derekhuggens/MechaCar_Statistical_Analysis/blob/3bf5338012bad8fa6bb9a3d4387e2aca676c5b9d/README_IMAGES/lot3.png)

The p-value is 0.04168, so we would reject our Null Hypothesis of Ho: mu = 1500 as p-value < 0.05, STATISTICALLY SIGNIFICANT FROM POPULATION
<br>
<br>

## Study Design: MechaCar vs Competition

Statistical studies that a company could pursue in the design and deployment of a new vehicle could be in regards to speed, efficiency, safety, comfortability, afforadability, and visual appreciation. 

Possible statistical (alternate) hypotheses:

Would adding a rear spoiler generate more positive visual reviews? (See visual appreciation category below) Reviews, from a 1-10 rating or 1-5 stars can be turned into frequency nominal data or total count. Can compare different survey groups to test samples compared to the total population using t-tests.
Is there a relationship between having a rear spoiler and generating more downward-force? (See speed category below) Multiple wind-tunnel runs of the same vehicle with different spoiler designs (groups) could be done to compare downward-force measurements between them using ANOVA.

More alternative hypothese examples:

Can using wider factory tires generate faster braking distance times? (See safety category below)
Can using forced-induction improve engine efficiency over increasing engine displacement size? (See speed category below)

Respective null hypotheses for the above would be that no effect or relationship exists between variables or predictions.

Below are measurements and ratings of numerical and categorical types for numerous hypotheses.

For speed:
  1. 0-60 mph/kph times
  2. 0-100 mph/kph times
  3. Standing 1/4-mile times
  4. Nürburgring track records
  5. Top speed
  6. Horsepower generated by engine displacement/forced induction
  7. Wind tunnel measurements for drag/downward force

For efficiency:
  1. Miles per gallon or litres per gallon
  2. Mean times between failures (MTBF)
  
For safety:
  1. Crash test ratings from all possible sides, angles, and speeds on a 5-point scale
  2. Braking distance times(60-0 feet, 100-0 feet)
  
For comfortability:
  1. Interior dimensions such as front/rear head room, total passenger volume, cargo space
  2. Smoothness of ride
  3. Ride sound
 
For affordability:
  1. Varying trims
  2. Cost analysis when selling to dealerships so that dealerships can price accordingly (unless sold sold directly by manufacturer
  
For visual appreciation:
  1. Surveys about design
  2. Checking sales data of competitors in regards to paint color
