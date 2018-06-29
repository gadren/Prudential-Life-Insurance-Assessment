# Prudential-Life-Insurance-Assessment

In this dataset, you are provided over a hundred variables describing attributes of life insurance applicants. 
The task is to predict the "Response" variable for each Id in the test set. 
"Response" is an ordinal measure of risk that has 8 levels.

<b>Introduction</b>
Prudential, is one of the largest issuers of life insurance in the United States. 
What they are trying to accomplish is better understand the predictive capabilities of data 
and determine what are the key factors that affect Life Insurance and how can they make this extensive process quicker for the customers

<b>Different Type of Data</b>
1. <b>Categorical Variables</b> – Variables that have a finite or distinct number of groups. An example of categorical variable is gender.
2. <b>Continuous Variables</b>- Variables whose values lie between a range(max,min). 
3. <b>Discrete Variables</b>-  A numeric value , for example the count of patients that come in the hospital on any given day.

Our dataset had two files : Train and Test. We have a response variable in Train and we need to predict the Response Variable for the Test data file.
We will use our Train file and implement Machine Learning Algorithms to find a predictive model.
Build linear regression, decision tree regression, SVM regression, and XGBoost linear booster models using the training data 
and then report the performance on the test data using the mean-squared performance criteria as described in the class.

<b>Pre-processing</b> :
Pre-processing forms a major part of the data prediction which is done over a number of stages :
<b>Data Cleaning</b>  : We found our data had columns that had over 70% values as null, which makes it hard for us to do analysis and implement any Machine Learning Algorithms.
<b>Data Imputation</b> : After removing, the columns with majority of null values, we encounter that some columns still have missing values and for these cases we use mean and median to miss the filling data.
<b>Data Standardization</b> : We were lucky, because the data was already standardized in this case.
<b>Manipulating Categorical Variables</b> : We use 1:C coding or one hot encoding, to remove the  categorization and make every instance of each category a separate column for the Machine Learning Algorithm to do a better job.
<b>Picking a ML Algorithm</b> : We used 4 algorithms to predict the same thing, Linear Regression, Decision Tree, SVM and XGBoost.
Finding the algorithm that fits the data best.

<b>Linear Regression</b>:
Reducing Dimension
– PCA: Principal component analysis (Simple but powerful!)
Mostly used as a tool in exploratory data analysis and for making predictive models. 
Used to visualize genetic distance and relatedness between populations. 
Can be done by eigenvalue decomposition of a data covariance (or correlation) matrix or singular value decomposition of a data matrix,
Use an orthogonal transformation to convert a set of observations of possibly correlated variables into a set of values of linearly uncorrelated variables called principal components.
An orthogonal linear transformation that transforms the data to a new coordinate system such that the greatest variance by some projection of the data comes to lie on the first coordinate (called the first principal component), the second greatest variance on the second coordinate, etc.

<b>SVM Regression</b>:
Steps involved in SVM Regression are:
The data obtained after preprocessing was fed into RStudio.
Using Random Forest, the insignificant columns were eliminated.
Parameter tuning of SVM was done to obtain the best cost and gamma values.
The SVM model was built using the obtained values.
Predicted the response values for the test dataset.
Accuracy and the Root Mean Square Error were calculated based on the above obtained response values.

<b>Decision Tree</b>:
Steps performed in application of decision tree regression on prudential dataset:
	1. Fetch the preprocessed data and split it as test data and train data
	2. Using rpart() train the model on train data
	3. Render the plots and summary of the model
	4. Display the cross validation plots and confusion matrix
	5. Calculate the model accuracy with the actual and predicted values

<b>XGBoost / Extreme Gradient Boosting</b>:
XGBoost is an ensemble method that uses a couple of weak predictors and brings them together to form a model that has high accuracy and can predict the values better than a singular decision tree.
We use the xgboost function to train our data and after every iteration we check the value of the evaluation metric.
We also use xgb.cv to cross validate our findings and use RMSE and MAE as the evaluations metrics.

<b>Conclusion</b> :

<b>Type of Regression</b>    <b>RMSE Value</b>
Linear Regression     1.985102
SVM                   1.926136
Decision Tree         2.146986
XGBoost               1.712073

As we look at the RMSE values for all the models we can see that 
XGBoost gives us the lowest RMSE value and is the best model that should be used to determine the ordinal variable Response.


<b>Future Solutions/Use Cases</b>:

1) Use of Lasso and Elastic Net to do Dimension Reduction and get the most important variables and try using our ML models 
on the subset of variables and notice the change in accuracy.

2) Factor Analysis- A lot of categorical variables in the dataset have levels that do not occur frequently 
and probably removing those can give us a more cleaner dataset to work on.

3) Using a agglomerative approach or bottom up method like Hierarchical Clustering to train the data.



  
 

