#' Extract Statistical Measures
#'
#' This function extracts statistical measures (t-statistics, p-values, confidence intervals)
#' from a linear regression model fit result.
#'
#' @param fit_result A list containing the results from a linear regression model
#' @param alpha The significance level for confidence intervals (default is 0.05)
#'
#' @return A list containing:
#' - t_statistic: t-statistics for each coefficient
#' - p_value: p-values for each coefficient
#' - conf_int: Confidence intervals for each coefficient
#' - mse: Mean squared error
#' @export
extract_stats <- function(fit_result, alpha = 0.05) {

  # Extract components from fit_result
  betahat <- fit_result$betahat
  se_betahat <- fit_result$se_betahat
  degree <- fit_result$degree
  mse <- fit_result$mse

  # Calculate t-statistics
  t_stats <- betahat / se_betahat

  # Calculate p-values based on t-statistics
  p_values <- 2 * (1 - pt_custom(abs(t_stats), df = degree))

  # Calculate confidence intervals
  t_critical <- qt_custom(1 - alpha / 2, df = degree)
  ci_low <- betahat - t_critical * se_betahat
  ci_up <- betahat + t_critical * se_betahat
  conf_int <- cbind(ci_low, ci_up)

  # Return results as a list
  return(list(
    t_statistic = t_stats,
    p_value = p_values,
    conf_int = conf_int,
    mse = mse
  ))
}

# Custom implementation of the pt function
pt_custom <- function(q, df) {
  # Implementation of the cumulative density function for the t-distribution
  pbeta((q^2) / (df + q^2), 0.5, df / 2)
}

# Custom implementation of the qt function
qt_custom <- function(p, df) {
  # Inverse of pt: approximation of the quantile function for the t-distribution
  optimize(function(q) abs(pt_custom(q, df) - p), interval = c(0, 10^6))$minimum
}
