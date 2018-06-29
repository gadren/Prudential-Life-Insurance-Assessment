# loading neccessary packages and dataset
install.packages("caret")
install.packages("e1071")
install.packages("Lahman")
install.packages("plyr")
library(caret)
library(e1071)
library(Lahman)
library(dplyr)

install.packages("randomForest")
library(randomForest)
dataset <- read.csv("Prudential_Edited_Training.csv",header = TRUE)
#dataset

#Initially the data is sampled i.e., divided as 100 and 500 samples as we can see that out of
#59000 samples 600 are taken initially and in the next step we can observe that this sample is
#assigned as test_dataset and eventually the remaining 500 values are assigned as train_dataset
sample_index = sample(500, 100)
test_dataSet = dataset[sample_index,]
sample_index_1 = sample(1000, 500)
train_dataSet = dataset[sample_index_1,]
test_dataSet
train_dataSet

rf<-randomForest(Response~.,data=train_dataSet,importance=TRUE,ntree=100)

significant<- importance(rf, type=1)
head(significant)
significant<-data.frame(predictors=rownames(significant), significant)

significant.sort<- arrange(significant,desc(X.IncMSE))
significant.sort$predictors <- factor(significant.sort$predictors, level= significant.sort$predictors)

significant.20<- significant.sort[1:20,]
print(significant.20)

#SVM Parameters are obtained which best suit the model  
#gamma & cost values are decided based on the tune values
#substituted in the model
tuned <-tune.svm(Response~BMI+Product_Info_4+Wt+Medical_History_131.1+Medical_Keyword_3+Medical_History_133.1+Ins_Age+InsuredInfo_36+Medical_History_233.1+InsuredInfo_53+Medical_History_393+Product_Info_2D4+Medical_Keyword_15+Medical_History_16+Medical_History_401+Medical_History_391+Insurance_History_12+Medical_History_163.1+Medical_History_403+InsuredInfo_38, data = train_dataSet, gamma = 10^(-1:1), cost = 10^(.5:1))
summary(tuned)

#The model is trained with specific parameters of cost and gamma and train data and later based 
#on the best performance while substituting different kernels we decide the best kernel suitable 
#which has the maximum accuracy
model = svm(Response ~. , kernel = "radial", cost =3.162278, gamma =0.1, data = train_dataSet, scale = F)

#After the model is trained using the train_dataSet the next step is to predict the values for 
#the test sample using the predicted values and the test sample
#Both the model and test_dataSet sample with only the required column are given as input to 
#the prediction function
predictions <-  predict(model, test_dataSet[-1127])
predictions
newPredictions<-round(predictions)
newPredictions
matrixPredictions<-as.matrix(newPredictions)
matrixPredictions
test_dataSet[1127]

write.csv(test_dataSet, file = "Output.csv")

acc<-which(test_dataSet$Response-matrixPredictions==0)
length(acc)
length(acc)/length(test_dataSet$Response)

resp <- test_dataSet$Response

rmse <- function(matrixPredictions, resp)
{
  sqrt(mean((matrixPredictions-resp)^2))
}
rmse(matrixPredictions, resp)

#library(caret)
#library(ggplot2)

#plot(model, test_dataSet)

