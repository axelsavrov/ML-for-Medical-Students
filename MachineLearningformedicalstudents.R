# Install the libraries
install.packages("mlbench")
install.packages("rpart")
install.packages("caret")

# Load the libraries
library(mlbench)   # This library is used to load the dataset
library(rpart)     # For building the decision tree model
library(caret)     # For evaluating the model

# Load the PimaIndiansDiabetes dataset
data(PimaIndiansDiabetes)
show(PimaIndiansDiabetes)

# View the first few rows of the dataset
head(PimaIndiansDiabetes)

# Set seed for reproducibility
set.seed(123)

# Split the data: 70% for training and 30% for testing
indice <- createDataPartition(PimaIndiansDiabetes$diabetes, p = 0.7, list = FALSE)
training <- PimaIndiansDiabetes[indice, ]
testing <- PimaIndiansDiabetes[-indice, ]

# Train a decision tree using rpart
model <- rpart(diabetes ~ ., data = training, method = "class")

# View the trained model
print(model)

# Predict classes on the test data
predictions <- predict(model, newdata = testing, type = "class")

# View the first few predictions
head(predictions)

# Create a confusion matrix
conf_matrix <- confusionMatrix(predictions, testing$diabetes)
print(conf_matrix)




