library(caTools)

creditcard_data <- read.csv("Dataset\\creditcard.csv")

dataframe = creditcard_data[-c(1)]

dataframe$Amount = scale(dataframe$Amount)

set.seed(123)
data_sample = sample.split(dataframe$Class,SplitRatio=0.80)
train_data = subset(dataframe,data_sample==TRUE)
test_data = subset(dataframe,data_sample==FALSE)
dim(train_data)
dim(test_data)
dim(dataframe)
