source('Dataset/Data Exploration.R')
library(caret)
library(e1071)

train_labels <- train_data$Class
test_labels <- test_data$Class

print("Training Model")
model <- naiveBayes(train_data, train_labels)
print("Finish")

NB_predictions <- predict(model, test_data)

NB_conf <- confusionMatrix(NB_predictions, as.factor(test_labels))
write.csv(as.matrix(as.matrix(NB_conf, what = "classes")), 'Naive Bayes/NB-ConfusionMatrix.csv') # nolint
accuracy <- confusion$overall["Accuracy"]
precision <- confusion$byClass["Pos Pred Value"]
recall <- confusion$byClass["Sensitivity"]
f1_score <- confusion$byClass["F1"]

# Print the evaluation metrics
cat("Accuracy:", accuracy, "\n")
cat("Precision:", precision, "\n")
cat("Recall:", recall, "\n")
cat("F1-Score:", f1_score, "\n")

head(NB_predictions)
head(test_labels)
