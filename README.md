# MechaCar_Statistical_Analysis
Prototype Vehicle: Statistical Analysis with R

By using the programming language, R, within an IDE known as RStudio, statistical measures for two .csv datasets were acquired. The library `dplyr`, a dataframe manipulation package, was imported and each .csv was read into a dataframe using `read.csv(file=, stringsAsFactors=FALSE)`.

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

vehicle_weight measurements are in the 
![code of mult linear regression model](https://github.com/derekhuggens/MechaCar_Statistical_Analysis/blob/e7a6ada5803b33c61134e2fff04a8a61a3df9763/README_IMAGES/mult_linear_regression_code_reduced_weight.png)
![slope of mult linear regression model](https://github.com/derekhuggens/MechaCar_Statistical_Analysis/blob/e7a6ada5803b33c61134e2fff04a8a61a3df9763/README_IMAGES/mult_linear_regression_reduced_weight.png)

![code of multiple linear regression model](https://github.com/derekhuggens/MechaCar_Statistical_Analysis/blob/233e70375be169ceb7639716acf23a356d22ba97/README_IMAGES/complete_per_var_regression_plot_code.png)
![slope of multiple linear regression model](https://github.com/derekhuggens/MechaCar_Statistical_Analysis/blob/233e70375be169ceb7639716acf23a356d22ba97/README_IMAGES/complete_per_var_regression_plots.png)


Does this linear model predict mpg of MechaCar prototypes effectively? Why or why not?

With a Multiple R-squared of 0.7149033 and adjusted R-squared of 0.6825 we can say that the multiple linear regression model predicts mpg "Moderately" according to Pearson's Correlation. 

![r-squared multiple linear regression model](https://github.com/derekhuggens/MechaCar_Statistical_Analysis/blob/e64b74a5830f87dc043fec36d7ee60fc72890651/README_IMAGES/deliverable_1_summary_highlighted_r_squared.png)

### Summary Statistics on Suspension Coils

Total Summary Statistics of Suspension Coil's PSI Values

![Deliverable 2](https://github.com/derekhuggens/MechaCar_Statistical_Analysis/blob/a859769fd774c63718e1b7e37272ae922fefbde3/README_IMAGES/deliverable_2_total_summary.png)

Lot Summary Statistics of Suspension Coil's PSI Values

![Deliverable 2](https://github.com/derekhuggens/MechaCar_Statistical_Analysis/blob/e130a12b894e3b93f3d8955226ce62b75bb5a381/README_IMAGES/deliverable_2_lot_summary.png)

Write a short summary using screenshots from your total_summary and lot_summary dataframes, and address the following question:

The design specifications for the MechaCar suspension coils dictate that the variance of the suspension coils must not exceed 100 pounds per square inch. Does the current manufacturing data meet this design specification for all manufacturing lots in total and each lot individually? Why or why not?

## T-Tests on Suspension Coils

T-TEST to determine if the PSI across all manufacturing lots is statistically different from the population mean of 1,500 PSI

![DELIVERABLE 3](https://github.com/derekhuggens/MechaCar_Statistical_Analysis/blob/e120b25de40702746ebbdbc45e66f9d6fbfeaa2a/README_IMAGES/one_sample_t_test.png)

T-TEST to determine if the PSI across manufacturing lot 1 is statistically different from the population mean of 1,500 PSI

![DELIVERABLE 3](https://github.com/derekhuggens/MechaCar_Statistical_Analysis/blob/3bf5338012bad8fa6bb9a3d4387e2aca676c5b9d/README_IMAGES/lot1.png)

T-TEST to determine if the PSI across manufacturing lot 2 is statistically different from the population mean of 1,500 PSI

![DELIVERABLE 3](https://github.com/derekhuggens/MechaCar_Statistical_Analysis/blob/3bf5338012bad8fa6bb9a3d4387e2aca676c5b9d/README_IMAGES/lot2.png)

T-TEST to determine if the PSI across manufacturing lot 3 is statistically different from the population mean of 1,500 PSI

![DELIVERABLE 3](https://github.com/derekhuggens/MechaCar_Statistical_Analysis/blob/3bf5338012bad8fa6bb9a3d4387e2aca676c5b9d/README_IMAGES/lot3.png)

Then briefly summarize your interpretation and findings for the t-test results. Include screenshots of the t-test to support your summary.

## Study Design: MechaCar vs Competition

Write a short description of a statistical study that can quantify how the MechaCar performs against the competition. In your study design, think critically about what metrics would be of interest to a consumer: for a few examples, cost, city or highway fuel efficiency, horse power, maintenance cost, or safety rating.
In your description, address the following questions:
What metric or metrics are you going to test?
What is the null hypothesis or alternative hypothesis?
What statistical test would you use to test the hypothesis? And why?
What data is needed to run the statistical test?
