Linear Regression Preprocessing and Modeling
================

<!-- badges: start -->
  [![R-CMD-check](https://github.com/yawang0725/Biostat625_hw3/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/yawang0725/Biostat625_hw3/actions/workflows/R-CMD-check.yaml)
  [![codecov](https://codecov.io/github/yawang0725/Biostat625_hw3/graph/badge.svg?token=Y35ISSXNRR)](https://codecov.io/github/yawang0725/Biostat625_hw3)
  <!-- badges: end -->
# Introduction

This package offers researchers a straightforward and comprehensive
solution for modeling linear regression data while generating detailed
statistical reports. It streamlines the analysis process, ensuring both
ease of use and accuracy, making it an ideal tool for statistical
exploration and reporting in research workflows.

This document demonstrates a comprehensive workflow for:

- Cleaning data
- Fitting a linear regression model
- Evaluating model performance
- Generating a complete regression summary

### Built With

Built Using Languages and Libraries Listed Below

- [R](https://www.r-project.org/)

## Table of Contents

- [Getting Started](#GettingStarted)

  - [Install](#Install)

  - [Usage](#Usage)

- [Example](#Example)

- [Contributing](#Contributing)

- [License](#License)

## Getting Started

### Install

Using [hw3](https://www.npmjs.org/), just run the following command:

``` r
# install the package "devtools" first with:
# install.packages("devtools")

# install the new package
devtools::install_github("yawang0725/Biostat625_hw3")
# build the vignette
devtools::install_github('yawang0725/Biostat625_hw3', build_vignettes =T)
# browse the vignette 
browseVignettes(package = "hw3")
```

### Usage

#### 1. `clean_data()`

Cleans a dataset by performing the following operations:

- **Handling missing values:** Options for omitting rows with missing
  data or replacing missing values with the mean or median of the
  respective column.
- **Handling outliers:** Options for removing or replacing outliers
  based on the Interquartile Range (IQR). -**Scaling numeric data:**
  Option to scale the numeric columns to have zero mean and unit
  variance.
- **Removing constant columns:** Removes columns with constant values,
  which do not contribute to the predictive power of the model.

``` r
library(hw3)
cleaned_iris <- clean_data(iris, 
                           method_missing = "omit", 
                           method_outliers = "none", 
                           scale_data = TRUE, 
                           remove_constant = TRUE)
```

**Parameters:**

- `dataset`: A `data.frame` to be cleaned.
- `method_missing`: Method to handle missing data (`"omit"`, `"mean"`,
  `"median"`).
- `method_outliers`: Method to handle outliers (`"remove"`, `"replace"`,
  `"none"`).
- `scale_data`: Boolean to scale numeric data (default is `FALSE`).
- `remove_constant`: Boolean to remove constant columns (default is
  `FALSE`).

**Return:**

- A cleaned `data.frame`.

#### 2. `fit_linear_model()`

Fits a linear regression model using Ordinary Least Squares (OLS) and
extracts relevant statistical measures such as estimated coefficients,
residuals, and variance-covariance matrix.

``` r
fit_result <- fit_linear_model(dataset = cleaned_iris, 
                        response_var = "Sepal.Length", 
                        predictor_vars = c("Sepal.Width", "Petal.Length", "Petal.Width"))
```

**Parameters:**

- `dataset`: A `data.frame` containing the dataset.
- `response_var`: The name of the response (dependent) variable.
- `predictor_vars`: A vector of predictor (independent) variable names.
- `intercept`: Boolean indicating whether to include an intercept term
  (default is `TRUE`).

**Return:**

- A list containing:
- `betahat`: Estimated regression coefficients.
- `y_hat`: Predicted values.
- `residuals`: Residuals of the model.
- `var_betahat`: Variance-covariance matrix for the regression
  coefficients.
- `se_betahat`: Standard errors of the regression coefficients.
- `mse`: Mean squared error of the model.
- `degree`: Degrees of freedom.

#### 3. `extract_stats()`

Extracts statistical measures (t-statistics, p-values, confidence
intervals) from a linear regression model fit result.

``` r
stats <- extract_stats(fit_result, alpha = 0.01)
```

**Parameters:**

- `fit_result`: A list containing the results from a linear regression
  model.
- `alpha`: Significance level for confidence intervals (default is
  `0.05`).

**Return:**

- A list containing:
- `t_statistic`: t-statistics for each coefficient.
- `p_value`: p-values for each coefficient.
- `conf_int`: Confidence intervals for each coefficient.
- `mse`: Mean squared error.

#### 4. `evaluate_model_performance()`

Evaluates the performance of a linear regression model by computing
R-squared, Adjusted R-squared, F-statistic, and its associated p-value.

``` r
performance_metrics <- evaluate_model_performance(
  fit_result = fit_result,
  dataset = cleaned_iris,
  response_var = "Sepal.Length",
  predictor_vars = c("Sepal.Width", "Petal.Length", "Petal.Width"))
```

**Parameters:**

- `fit_result`: A list containing the results from a linear regression
  model.
- `dataset`: The dataset used to fit the model.
- `response_var`: The name of the response variable.
- `predictor_vars`: A vector of predictor variables.

**Return:**

- A list containing:
- `R_squared`: The R-squared value.
- `Adj_R_squared`: The Adjusted R-squared value.
- `F_statistic`: The F-statistic value.
- `p_value_F`: The p-value for the F-statistic.

#### 5. `generate_full_summary()`

Generates a complete regression summary, including: - Regression
equation - Coefficient table with estimates, standard errors, t-values,
p-values, and confidence intervals - Model fit statistics (R-squared,
Adjusted R-squared, F-statistic, and its p-value) - Model evaluation
(e.g., how well the model fits the data)

``` r
generate_full_summary(cleaned_iris, 
                      response_var = "Sepal.Length", 
                      predictor_vars = c("Sepal.Width", "Petal.Length", "Petal.Width"))
```

    ## 
    ## ================= Regression Summary =================
    ## Regression Equation:
    ## Sepal.Length = 0.343 * Sepal.Width + 1.512 * Petal.Length + -0.512 * Petal.Width + 0.000 (Intercept) 
    ## 
    ## Regression Coefficients:
    ##          Term      Estimate  Std.Error        tvalue     Pr...t.. Significance
    ##   (Intercept)  1.222198e-15 0.03059909  3.994228e-14 1.000000e+00             
    ##   Sepal.Width  3.425789e-01 0.03461005  9.898249e+00 0.000000e+00          ***
    ##  Petal.Length  1.511751e+00 0.11929291  1.267259e+01 0.000000e+00          ***
    ##   Petal.Width -5.122442e-01 0.11583230 -4.422291e+00 1.895892e-05          ***
    ##     Lower.CI    Upper.CI
    ##  -0.05997423  0.05997423
    ##   0.27474319  0.41041459
    ##   1.27793641  1.74556462
    ##  -0.73927547 -0.28521287
    ## 
    ## Model Fit:
    ## R-squared: 0.859
    ## Adjusted R-squared: 0.856
    ## F-statistic: 295.539, p-value: 8.588e-62
    ## 
    ## Model Evaluation:
    ## The model explains most of the variance, fitting well.
    ## =====================================================

**Parameters:**

- `dataset`: A `data.frame` containing the dataset.
- `response_var`: The name of the response (dependent) variable.
- `predictor_vars`: A vector of predictor (independent) variable names.
- `intercept`: Boolean indicating whether to include an intercept term
  (default is `TRUE`).

**Return:**

- A printed model summary with all relevant statistics.

## Example

Input dataset: `iris` from `library(datasets)` (`data(iris)`). We
compared the results of fitting a linear regression model using the
custom function `fit_linear_model()` and the base `lm()` function. To
ensure correctness, we used `all.equal()` to verify that the model
coefficients, t-values, and p-values from both methods were virtually
identical, with coefficients matching exactly and only minor differences
in t-values and p-values (relative differences of 0.0134 and 5.17e-06,
respectively). For efficiency, we employed `bench::mark()` to benchmark
the performance of both methods. The custom method was significantly
faster than `lm()`, processing three times more iterations per second,
with slightly lower memory usage (32.8KB vs. 47.6KB). The number of
garbage collection events was similar for both methods, and the total
runtime was 378ms for the custom method versus 433ms for `lm()`. These
comparisons demonstrate that the custom method excels in both accuracy
and computational efficiency while providing results consistent with the
standard R function.

## Contributing

Ya Wang

## License

This project is licensed under the **GNU General Public License v3.0 or
later (GPL-3.0+)**. You are free to use, modify, and distribute this
software under the terms of this license.

For more details, see the [LICENSE](./LICENSE) file or visit the [GNU
GPL website](https://www.gnu.org/licenses/gpl-3.0.en.html).
