% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/fit_linear_model.R
\name{fit_linear_model}
\alias{fit_linear_model}
\title{Fit Linear Model and Extract Statistical Measures}
\usage{
fit_linear_model(dataset, response_var, predictor_vars, intercept = TRUE)
}
\arguments{
\item{dataset}{A data.frame containing the data}

\item{response_var}{The name of the response variable (dependent variable)}

\item{predictor_vars}{A vector of names of predictor variables (independent variables)}

\item{intercept}{Logical; whether to include an intercept term (default is TRUE)}
}
\value{
A list containing:
\itemize{
\item betahat: Estimated regression coefficients
\item y_hat: Predicted values
\item residuals: Residuals of the model
\item var_betahat: Variance-covariance matrix for the regression coefficients
\item se_betahat: Standard errors of the regression coefficients
\item mse: Mean squared error
\item degree: Degrees of freedom (n - p)
}
}
\description{
This function fits a linear regression model and extracts various statistical measures.
}
