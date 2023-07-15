#Question 1:


install.packages("ggplot2")

library(ggplot2)
library(datasets)

data(iris)

ggplot(iris, aes(x = Sepal.Length, y = Petal.Length, color = Species)) +
  geom_point() +
  labs(x = "Sepal Length", y = "Petal Length", title = "Scatterplot of Sepal.Length vs. Petal.Length") +
  theme_minimal()

#Conclusion
#setosa has minimum sepal length and petal length
#Versicolor has mean sepal length and petal length
#Virgininca has highest sepal and petal length



#Question 2:


install.packages("ggplot2")
library(ggplot2)

data(txhousing)

missing_values <- sum(!complete.cases(txhousing))
cat("Number of missing values:", missing_values, "\n")

txhousing_complete <- txhousing[complete.cases(txhousing), ]

str(txhousing_complete)

summary(txhousing_complete)

ggplot(txhousing_complete, aes(x = date, y = median)) +
  geom_line() +
  labs(x = "Date", y = "Median Price", title = "Median Housing Price Over Time (Complete Cases)") +
  theme_minimal()

ggplot(txhousing_complete, aes(x = volume, y = median)) +
  geom_point() +
  labs(x = "Volume", y = "Median Price", title = "Median Housing Price vs. Volume (Complete Cases)") +
  theme_minimal()

ggplot(txhousing_complete, aes(x = year)) +
  geom_bar() +
  labs(x = "Year", y = "Number of Houses Sold", title = "Number of Houses Sold by Year (Complete Cases)") +
  theme_minimal()




#Question 3:



install.packages("readr")
install.packages("dplyr")

library(ggplot2)
library(readr)
library(dplyr)

titanic <- read_csv("C:/Users/arpit/Downloads/titanic.csv")

filtered_data <- titanic %>%
  select(PassengerId, Survived, Pclass, Sex, Age, SibSp, Parch, Fare, Embarked)

print(filtered_data)
View(filtered_data)

filtered_data$Survived <- factor(filtered_data$Survived, levels = c(0, 1), labels = c("Died", "Survived"))

finalP <- ggplot(data = filtered_data, aes(x = Fare, y = Survived, fill = Sex)) +
  geom_boxplot(position = "dodge") +
  labs(x = "Fare", y = "Survival") +
  scale_fill_manual(values = c("male" = "cyan", "female" = "orange")) +
  theme_minimal()

finalP