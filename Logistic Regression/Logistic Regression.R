source("Dataset/Data Exploration.R")
library(caret)
library(pROC)
library(PRROC)
library(verification)


logistic_regression =glm(Class~.,train_data,family=binomial())


LR_Predict <- predict(logistic_regression, test_data, Class = TRUE, type="response") # nolint

pred <- as.integer(as.logical(LR_Predict > 0.5))
pred <- as.factor(pred)

conf_mat = confusionMatrix(pred, as.factor(test_data$Class))

write.csv(as.matrix(as.matrix(conf_mat, what = "classes")), 'Logistic Regression/LR-ConfusionMatrix.csv') # nolint



# pdf(file = "Logistic Regression/LR-ROC.pdf", width = 40, height = 30)
# auc.gbm = roc(test_data$Class, LR_Predict, plot = TRUE, col = "blue")
# dev.off()

# pdf(file = "Logistic Regression/LR-PRCurve.pdf", width = 40, height = 30)
# pr_curve <- pr.curve(curve=TRUE, scores.class0 = LR_Predict, weights.class0 = test_data$Class) # nolint
# plot(pr_curve, main = "Precision-Recall Curve", xlab = "Recall", ylab = "Precision") # nolint
# dev.off()
