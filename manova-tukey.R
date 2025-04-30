install.packages("dplyr")
install.packages("car")

library(dplyr)
library(car)


data <- read.csv("stat467_dataset.csv")


data$Contract <- as.factor(data$Contract)
data$Internet.Type <- as.factor(data$Internet.Type)
data$Churn <- as.factor(data$Churn)

data_subset <- data %>% select(Age, Tenure.in.Months, Monthly.Charge, CLTV)

manova_result <- manova(cbind(Age, Tenure.in.Months, Monthly.Charge, CLTV) ~ Contract, data = data)
summary(manova_result)


aov_tenure <- aov(Tenure.in.Months ~ Contract, data = data)
TukeyHSD(aov_tenure)


aov_cltv <- aov(CLTV ~ Contract, data = data)
TukeyHSD(aov_cltv)
