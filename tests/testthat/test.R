# Load necessary library
set.seed(42)  # For reproducibility

# Create a sample dataset for testing
dataset <- data.frame(
  A = c(1, 2, 3, NA, 5, 1000),   # Numeric column with a missing value and an outlier
  B = c(2, 4, NA, 8, 10, 12),    # Numeric column with a missing value
  C = c(1, 1, 1, 1, 1, 1),      # Constant column
  D = c("apple", "banana", "apple", "cherry", "banana", "cherry")  # Non-numeric column
)

# Test case 1: Handle missing values by omitting, remove outliers, scale data, and remove constant columns
cleaned_data1 <- clean_data(
  dataset,
  method_missing = "omit",      # Omit rows with missing values
  method_outliers = "remove",   # Remove outliers
  scale_data = TRUE,            # Standardize the numeric columns
  remove_constant = TRUE        # Remove constant columns
)
print("\nTest Case 1 (Omit Missing, Remove Outliers, Scale, Remove Constant Columns):")
print(cleaned_data1)

# Test case 2: Handle missing values by replacing with the mean, remove outliers, scale data, and remove constant columns
cleaned_data2 <- clean_data(
  dataset,
  method_missing = "mean",      # Replace missing values with the mean
  method_outliers = "remove",   # Remove outliers
  scale_data = TRUE,            # Standardize the numeric columns
  remove_constant = TRUE        # Remove constant columns
)
print("\nTest Case 2 (Mean for Missing, Remove Outliers, Scale, Remove Constant Columns):")
print(cleaned_data2)

# Test case 3: Handle missing values by replacing with the median, remove outliers, scale data, and remove constant columns
cleaned_data3 <- clean_data(
  dataset,
  method_missing = "median",    # Replace missing values with the median
  method_outliers = "remove",   # Remove outliers
  scale_data = TRUE,            # Standardize the numeric columns
  remove_constant = TRUE        # Remove constant columns
)
print("\nTest Case 3 (Median for Missing, Remove Outliers, Scale, Remove Constant Columns):")
print(cleaned_data3)

# Test case 4: Handle missing values by omitting, do not remove outliers, do not scale data, and do not remove constant columns
cleaned_data4 <- clean_data(
  dataset,
  method_missing = "omit",      # Omit rows with missing values
  method_outliers = "none",     # Do not remove outliers
  scale_data = FALSE,           # Do not scale the numeric columns
  remove_constant = FALSE       # Do not remove constant columns
)
print("\nTest Case 4 (Omit Missing, No Outliers, No Scaling, No Constant Removal):")
print(cleaned_data4)

# Test case 5: Handle missing values by replacing with the mean, do not remove outliers, do not scale data, and do not remove constant columns
cleaned_data5 <- clean_data(
  dataset,
  method_missing = "mean",      # Replace missing values with the mean
  method_outliers = "none",     # Do not remove outliers
  scale_data = FALSE,           # Do not scale the numeric columns
  remove_constant = FALSE       # Do not remove constant columns
)
print("\nTest Case 5 (Mean for Missing, No Outliers, No Scaling, No Constant Removal):")
print(cleaned_data5)

# Test case 6: Handle missing values by replacing with the median, do not remove outliers, scale data, and do not remove constant columns
cleaned_data6 <- clean_data(
  dataset,
  method_missing = "median",    # Replace missing values with the median
  method_outliers = "none",     # Do not remove outliers
  scale_data = TRUE,            # Standardize the numeric columns
  remove_constant = FALSE       # Do not remove constant columns
)
print("\nTest Case 6 (Median for Missing, No Outliers, Scale, No Constant Removal):")
print(cleaned_data6)

# Test case 7: Handle missing values by omitting, remove outliers, do not scale data, and remove constant columns
cleaned_data7 <- clean_data(
  dataset,
  method_missing = "omit",      # Omit rows with missing values
  method_outliers = "remove",   # Remove outliers
  scale_data = FALSE,           # Do not scale the numeric columns
  remove_constant = TRUE        # Remove constant columns
)
print("\nTest Case 7 (Omit Missing, Remove Outliers, No Scaling, Remove Constant Columns):")
print(cleaned_data7)

# Test case 8: Handle missing values by replacing with the mean, do not remove outliers, scale data, and remove constant columns
cleaned_data8 <- clean_data(
  dataset,
  method_missing = "mean",      # Replace missing values with the mean
  method_outliers = "none",     # Do not remove outliers
  scale_data = TRUE,            # Standardize the numeric columns
  remove_constant = TRUE        # Remove constant columns
)
print("\nTest Case 8 (Mean for Missing, No Outliers, Scale, Remove Constant Columns):")
print(cleaned_data8)

# Test case 9: Handle missing values by omitting, replace outliers with NA, scale data, and remove constant columns
cleaned_data9 <- clean_data(
  dataset,
  method_missing = "omit",      # Omit rows with missing values
  method_outliers = "replace",  # Replace outliers with NA
  scale_data = TRUE,            # Standardize the numeric columns
  remove_constant = TRUE        # Remove constant columns
)
print("\nTest Case 9 (Omit Missing, Replace Outliers with NA, Scale, Remove Constant Columns):")
print(cleaned_data9)

# Test case 10: Handle missing values by replacing with the mean, replace outliers with NA, scale data, and remove constant columns
cleaned_data10 <- clean_data(
  dataset,
  method_missing = "mean",      # Replace missing values with the mean
  method_outliers = "replace",  # Replace outliers with NA
  scale_data = TRUE,            # Standardize the numeric columns
  remove_constant = TRUE        # Remove constant columns
)
print("\nTest Case 10 (Mean for Missing, Replace Outliers with NA, Scale, Remove Constant Columns):")
print(cleaned_data10)

# Test case 11: Handle missing values by replacing with the median, replace outliers with NA, scale data, and remove constant columns
cleaned_data11 <- clean_data(
  dataset,
  method_missing = "median",    # Replace missing values with the median
  method_outliers = "replace",  # Replace outliers with NA
  scale_data = TRUE,            # Standardize the numeric columns
  remove_constant = TRUE        # Remove constant columns
)
print("\nTest Case 11 (Median for Missing, Replace Outliers with NA, Scale, Remove Constant Columns):")
print(cleaned_data11)

# 清理数据
cleaned_iris <- clean_data(iris,
                           method_missing = "omit",  # 假设没有缺失值
                           method_outliers = "none",  # 不处理异常值
                           scale_data = TRUE,         # 标准化数值数据
                           remove_constant = TRUE)    # 删除常数列

# 拟合线性回归模型
fit_result <- fit_linear_model(dataset = cleaned_iris,
                               response_var = "Sepal.Length",
                               predictor_vars = c("Sepal.Width", "Petal.Length", "Petal.Width"))

# 评估模型性能
performance_metrics <- evaluate_model_performance(fit_result,
                                                  dataset = cleaned_iris,
                                                  response_var = "Sepal.Length",
                                                  predictor_vars = c("Sepal.Width", "Petal.Length", "Petal.Width"))

# 输出模型性能评估
print(performance_metrics)

# 生成完整的回归模型总结
generate_full_summary(dataset = cleaned_iris,
                      response_var = "Sepal.Length",
                      predictor_vars = c("Sepal.Width", "Petal.Length", "Petal.Width"))




# Step 1: Prepare the cleaned data using the clean_data function
cleaned_iris <- clean_data(iris,
                           method_missing = "omit",  # Assume no missing values in this case
                           method_outliers = "none",  # No outlier handling
                           scale_data = TRUE,         # Standardize numeric data
                           remove_constant = TRUE)    # Remove constant columns

# Step 2: Fit the linear regression model using the cleaned dataset
fit_result <- fit_linear_model(dataset = cleaned_iris,
                               response_var = "Sepal.Length",
                               predictor_vars = c("Sepal.Width", "Petal.Length", "Petal.Width"))

# Step 3: Extract statistical measures using the extract_stats function
stats_result <- extract_stats(fit_result, alpha = 0.05)

# Step 4: Print the extracted statistics for manual verification
print("Extracted Statistical Measures:")
print(stats_result)

# Step 5: Optionally, compare with R's built-in lm() function to check for consistency
# Fit a model using lm() to compare results
lm_fit <- lm(Sepal.Length ~ Sepal.Width + Petal.Length + Petal.Width, data = cleaned_iris)

# Show a summary of the lm model for comparison
summary(lm_fit)



# Create different test datasets
set.seed(123)

# High R-squared: Strong correlation
high_r_squared <- data.frame(
  Sepal.Length = 5 + 2 * rnorm(100),  # Strong linear relationship
  Sepal.Width = rnorm(100),
  Petal.Length = rnorm(100),
  Petal.Width = rnorm(100)
)

# Moderate R-squared: Moderate correlation
moderate_r_squared <- data.frame(
  Sepal.Length = 5 + rnorm(100),  # Moderate relationship
  Sepal.Width = rnorm(100),
  Petal.Length = rnorm(100),
  Petal.Width = rnorm(100)
)

# Low R-squared: No correlation
low_r_squared <- data.frame(
  Sepal.Length = rnorm(100),  # No clear pattern
  Sepal.Width = rnorm(100),
  Petal.Length = rnorm(100),
  Petal.Width = rnorm(100)
)

# Simulate some response and predictors with known relationships
cleaned_high_r_squared <- clean_data(high_r_squared, method_missing = "omit", method_outliers = "none", scale_data = TRUE, remove_constant = TRUE)
cleaned_moderate_r_squared <- clean_data(moderate_r_squared, method_missing = "omit", method_outliers = "none", scale_data = TRUE, remove_constant = TRUE)
cleaned_low_r_squared <- clean_data(low_r_squared, method_missing = "omit", method_outliers = "none", scale_data = TRUE, remove_constant = TRUE)

# Run the generate_full_summary function for different datasets
cat("===== High R-Squared Dataset =====\n")
generate_full_summary(cleaned_high_r_squared, response_var = "Sepal.Length", predictor_vars = c("Sepal.Width", "Petal.Length", "Petal.Width"))

cat("\n===== Moderate R-Squared Dataset =====\n")
generate_full_summary(cleaned_moderate_r_squared, response_var = "Sepal.Length", predictor_vars = c("Sepal.Width", "Petal.Length", "Petal.Width"))

cat("\n===== Low R-Squared Dataset =====\n")
generate_full_summary(cleaned_low_r_squared, response_var = "Sepal.Length", predictor_vars = c("Sepal.Width", "Petal.Length", "Petal.Width"))


# 创建测试数据集
set.seed(42)  # 固定随机种子以确保结果可重复

# 数据集包含一个强相关变量和一个噪声变量
test_data <- data.frame(
  x1 = rnorm(100, mean = 10, sd = 3),       # 强相关变量
  x2 = rnorm(100, mean = 5, sd = 10),       # 噪声变量
  y = NA                                    # 响应变量
)

# 构造 y，使 x1 显著，x2 不显著，同时 R_squared 在目标区间
test_data$y <- 5 + 2 * test_data$x1 + rnorm(100, sd = 10)  # 高噪声降低 R_squared

# 测试 generate_full_summary 函数
generate_full_summary(
  dataset = test_data,
  response_var = "y",
  predictor_vars = c("x1", "x2"),
  intercept = TRUE
)


# 固定随机种子
set.seed(1234)

# 样本数量
n <- 150

# 强相关变量 x1
x1 <- rnorm(n, mean = 50, sd = 10)

# 中等相关变量 x2（与 x1 的相关性降低）
x2 <- 0.4 * x1 + rnorm(n, mean = 0, sd = 7)

# 减少噪声项 e 的影响
e <- rnorm(n, mean = 0, sd = 10)

# 生成响应变量 y（增强对 x1 和 x2 的依赖）
y <- 25 + 1.2 * x1 + 0.6 * x2 + e

# 构建数据框
test_data <- data.frame(x1 = x1, x2 = x2, y = y)

# 调用 generate_full_summary 函数
generate_full_summary(
  dataset = test_data,
  response_var = "y",
  predictor_vars = c("x1", "x2"),
  intercept = TRUE
)
