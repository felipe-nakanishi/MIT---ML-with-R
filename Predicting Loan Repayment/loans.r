# Preparing the Dataset

# Loading the dataset loans.csv into a data frame called loans:
loans = read.csv('loans.csv')
# exploring it using the str() and summary() functions:
str(loans)
summary(loans)

# Looking for NAs
# We could see in the summary that the following variables have missing values: "log.annual.inc", "days.with.cr.line", "revol.util", "inq.last.6mths", "delinq.2yrs", "pub.rec". 

# building a dataset with the missing values: 
missing = subset(loans, is.na(log.annual.inc) | is.na(days.with.cr.line) | is.na(revol.util) | is.na(inq.last.6mths) | is.na(delinq.2yrs) | is.na(pub.rec))
str(missing)

# We can see that only 62 obs. have missing values, considering that we have 9578 obs. 
# Removing this small number of observations would not lead to overfitting.

#omitting the NAs values:
library(dplyr)
loans = na.omit(loans)

# Splitting the data into train and test

# We are now splitting the dataset into training data and testing data, using a proportion of
# 70% of the data for the training set and 30% for the testing set. We are setting the random seed
# to 144.


library(caTools) #loading the package.
set.seed(144) #setting the random seed.
#splitting the data using the sample.split function:
split=sample.split(loans$not.fully.paid, SplitRatio = 0.7)
train = subset(loans, split == TRUE)
test = subset(loans, split == FALSE)

# Building the model
# Now we are going to build the model using the training set.

model = glm(not.fully.paid~., data = train, family=binomial)
summary(model)

# Adjusting the model
# Now that we have our model, we must take the irrelevant variables out looking at its p-values.

model = glm(not.fully.paid~.-dti, data = train, family=binomial)
model = glm(not.fully.paid~.-dti -int.rate, data = train, family=binomial)
model = glm(not.fully.paid~.-dti -int.rate -delinq.2yrs, data = train, family=binomial)
model = glm(not.fully.paid~.-dti -int.rate -delinq.2yrs -days.with.cr.line, data = train, family=binomial)
summary(model)

# Making predictions
# Now we are realizing the predictions based on our model.

# predictions on the test set.
predicted.risk = predict(model, newdata=test, type='response')
# saving our predictions as a new column in the test set.
test$predicted.risk = predicted.risk

# Calculating the accuracy of the model
# We can calculate the accuracy of the model by comparing the percentage of right predictions that we made.

# creating a matrix where we can see how many observations we get right using a threshold of 0.5.
confmatrix = table(test$not.fully.paid, predicted.risk>0.5)
confmatrix

# Now that we have our matrix, we can see how much obs. we get right and dividing it by the total number of obs.

(2382+17)/nrow(test)

# We got an accuracy of 0.84, what is impressively good.

# Accuracy of AUC
# We can calculate the accuracy of the model using another metric, that is the AUC.

library(ROCR)
ROCRpred=prediction(test$predicted.risk,test$not.fully.paid)
as.numeric(performance(ROCRpred,'auc')@y.values)

# In this case, we got an accuracy of 0.66.