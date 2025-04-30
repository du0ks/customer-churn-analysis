
library(CCA)

install.packages("CCA")

set1 <- dataset[c("age", "citizen", "married", "tenure")]
set2 <- dataset[c("charge", "satisfaction", "tv", "movies", 
               "music", "cltv")]

cca_result <- cc(set1, set2)

print("Canonical Correlations:")
print(cca_result$cor)

print("Canonical Loadings for Set 1:")
print(cca_result$xcoef)

print("Canonical Loadings for Set 2:")
print(cca_result$ycoef)

library(ggplot2)
set1_scores <- as.data.frame(as.matrix(set1) %*% cca_result$xcoef)
set2_scores <- as.data.frame(as.matrix(set2) %*% cca_result$ycoef)

ggplot() +
  geom_point(aes(x = set1_scores$V1, y = set2_scores$V1), color = "red") +
  labs(title = "Canonical Variables Scatter Plot",
       x = "Set 1 Canonical Variable 1",
       y = "Set 2 Canonical Variable 1")

