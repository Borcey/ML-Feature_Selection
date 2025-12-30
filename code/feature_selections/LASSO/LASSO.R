library(glmnet)
library(readxl)
library(writexl)

data <- read.table("TCGA_LUAD_miRNA_expression_disease_status.txt", header = TRUE, row.names = 1)

data <- t(data)

X <- data[, -ncol(data)]  # All columns except the last one
Y <- data[, ncol(data)]
Y <- as.numeric(Y)


lasso_fit <- glmnet(x = X, y = Y, alpha = 1)
plot(lasso_fit, xvar = "lambda", label = TRUE)

set.seed(98)

cv_lasso_fit <- cv.glmnet(x = as.matrix(X), y = Y, alpha = 1, nfolds = 5)
plot(cv_lasso_fit)
cv_lasso_fit$lambda.min
selected_features<-coef(cv_lasso_fit,s=0.01409786)

selected_mirna <- rownames(selected_features)[-1]  # Exclude the intercept term
selected_coefficients <- selected_features[-1]
selected_features_df <- data.frame(miRNA = selected_mirna, Coefficient = selected_coefficients)

write_xlsx(selected_features_df, "LUAD_miRNA_LASSO1.xlsx")





