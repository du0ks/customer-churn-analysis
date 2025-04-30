dataset <- read.csv("stat467_dataset.csv")

numeric_data <- dataset[sapply(dataset, is.numeric)]

kmo_result <- psych::KMO(numeric_data)
print("KMO Test Results:")
print(kmo_result)

bartlett_test <- psych::cortest.bartlett(cor(numeric_data), n = nrow(numeric_data))
print("Bartlett's Test Results:")
print(bartlett_test)

fa_result <- psych::fa(numeric_data, nfactors = 2, rotate = "varimax") 
print("Factor Analysis Results:")
print(fa_result)

print("Scree Plot for Factor Determination:")
psych::fa.parallel(numeric_data)

print("Factor Loadings:")
print(fa_result$loadings)

dataset$Factor1 <- fa_result$scores[, 1]
dataset$Factor2 <- fa_result$scores[, 2]

print("Dataset with Factor Scores:")
head(dataset)

write.csv(dataset, "dataset_with_factors.csv", row.names = FALSE)


