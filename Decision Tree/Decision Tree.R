source("Data Exploration.R")
library(rpart)
library(rpart.plot)
library(caret)

decision_tree <- rpart(Class ~ . , train_data, method = 'class')
DT_Predict <- predict(decision_tree, test_data, type='class') # nolint
DT_probability <- as.factor(predict(decision_tree, test_data, Calss=TRUE, type = 'response')) # nolint

conf_mat = confusionMatrix(DT_Predict, as.factor(test_data$Class))

write.csv(as.matrix(as.matrix(conf_mat, what = "classes")), 'Decision Tree/DT-ConfusionMatrix.csv') # nolint
