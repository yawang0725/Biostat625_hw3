#' Generate Full Model Summary
#'
#' This function generates a full regression summary, including:
#' - Regression equation
#' - Coefficient table
#' - Model fit statistics
#' - Model evaluation
#'
#' @param fit_result The result of a fitted linear model.
#' @param eval_result A list containing model evaluation metrics (R-squared, F-statistic, etc.).
#' @param response_var The name of the response variable.
#' @param predictor_vars A vector of predictor variable names.
#' @return A printed model summary with all relevant statistics.
#' @export
generate_full_summary <- function(fit_result, eval_result, response_var, predictor_vars) {

  # Extract statistical results
  stats <- extract_stats(fit_result)

  # Construct regression equation
  predictor_terms <- paste(sprintf("%.3f * %s", fit_result$betahat[-1], predictor_vars), collapse = " + ")
  equation <- paste0(response_var, " = ", predictor_terms)
  if (!is.na(fit_result$betahat[1])) {
    equation <- paste0(equation, sprintf(" + %.3f (Intercept)", fit_result$betahat[1]))
  }

  # Coefficients and significance
  betahat <- fit_result$betahat
  se_betahat <- fit_result$se_betahat
  t_statistic <- stats$t_statistic
  p_value <- stats$p_value
  ci_low <- stats$conf_int[, 1]
  ci_up <- stats$conf_int[, 2]

  # Display significance stars
  significance_stars <- function(p) {
    if (p < 0.001) return("***")
    if (p < 0.01) return("**")
    if (p < 0.05) return("*")
    if (p < 0.1) return(".")
    return("")
  }
  sig <- sapply(p_value, significance_stars)

  # Create a data frame for the coefficient table
  coef_table <- data.frame(
    Term = c("(Intercept)", predictor_vars),
    Estimate = betahat,
    Std.Error = se_betahat,
    tvalue = t_statistic,
    `Pr(>|t|)` = p_value,
    Significance = sig,
    `Lower CI` = ci_low,
    `Upper CI` = ci_up
  )

  # Print the model summary
  cat("\n================= Regression Summary =================\n")
  cat("Regression Equation:\n")
  cat(equation, "\n")

  cat("\nRegression Coefficients:\n")
  print(coef_table, row.names = FALSE)

  cat("\nModel Fit:\n")
  cat(sprintf("R-squared: %.3f\n", eval_result$R_squared))
  cat(sprintf("Adjusted R-squared: %.3f\n", eval_result$Adj_R_squared))
  cat(sprintf("F-statistic: %.3f, p-value: %.3e\n", eval_result$F_statistic, eval_result$p_value_F))

  cat("\nModel Evaluation:\n")
  if (eval_result$Adj_R_squared > 0.8) {
    cat("The model explains most of the variance, fitting well.\n")
  } else if (eval_result$Adj_R_squared > 0.5) {
    cat("The model explains a moderate amount of variance.\n")
  } else {
    cat("The model explains a small amount of variance, improvements might be needed.\n")
  }
  cat("=====================================================\n")
}
