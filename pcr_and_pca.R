library(ggplot2)
library(tidyverse)
library(corrplot)
library(scatterPlotMatrix)
library(factoextra)

dataset<-read_csv("/home/onat/Downloads/stat467_dataset.csv")
dataset <- dataset %>%
  select(-1)
colnames(dataset)<-c("age","citizen","married","tenure","charge","contract","satisfaction","tv","movies","music"
                     ,"internet","under30","cltv","churn")

numeric_dataset<-dataset[,-c(2,3,6,8,9,10,11,12,14)] #selected the numeric data
numeric_dataset<-scale(numeric_dataset) #scaled our dataset
head(numeric_dataset) 

cov(numeric_dataset)

pca1<-prcomp(numeric_dataset)
summary(pca1)
names(pca1)
pca1$rotation
fviz_eig(pca1,addlabels=TRUE) #represent the proportion values
pca<-pca1$x
head(pca)
res1 <- cor(pca, method="pearson")
corrplot::corrplot(res1, method= "color", order = "hclust")

biplot(pca1, col = c("gray", "red"))
fviz_pca_var(pca1, col.var = "contrib")
fviz_pca_ind(pca1, col.ind = "#00AFBB")
fviz_contrib(pca1, choice = "ind", axes = 1:2) + coord_flip()
#PCR
ols.data <- data.frame(churn=dataset[,14],pca_data)
summary(ols.data)
lmodel <- lm(churn ~ ., data = ols.data)
summary(lmodel)
mean((ols.data$churn - predict(lmodel))^2) #mse
sqrt(mean((ols.data$churn - predict(lmodel))^2)) 
pca_data <- pca[, -5]  # Remove PC1 (first principal component)
 