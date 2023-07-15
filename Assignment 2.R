
#Question 1:

data(iris)
install.packages("ggplot2")
library(ggplot2)

ggplot(iris, aes(x=Species,y=Sepal.Length, fill=Species))+
  geom_boxplot() +
  labs(x="Species",y="Sepal Length")+
  ggtitle("Boxplot of Sepal Length by Species")

ggplot(iris, aes(x=Species,y=Sepal.Width, fill=Species))+
  geom_boxplot() +
  labs(x="Species",y="Sepal Width")+
  ggtitle("Boxplot of Sepal Width by Species")

ggplot(iris, aes(x=Species,y=Petal.Length, fill=Species))+
  geom_boxplot() +
  labs(x="Species",y="Petal Length")+
  ggtitle("Boxplot of Petal Length by Species")

ggplot(iris, aes(x=Species,y=Petal.Width, fill=Species))+
  geom_boxplot() +
  labs(x="Species",y="Petal Width")+
  ggtitle("Boxplot of Petal Width by Species")

ggplot(iris, aes(x = Sepal.Length, y = Petal.Length, color = Species)) +
  geom_point() +
  labs(x="Sepal Length",y="Petal Length") +
  ggtitle("Scatterplot of Sepal Length vs Petal Length (colored by Species)")




#Question 2:

install.packages("imager")
library(imager)

flip <- function(image){
  flipped_image <- image[nrow(image):1, , , drop = FALSE]
  return(flipped)
}

image <- load.image()
flipped_image<- flip(image)

par(mfrow = c(1, 2))
plot(image, main = "Original Image")
plot(flipped_image, main = "Flipped Image")



#Question 3:

install.packages("MASS")
library(MASS)
data(ships)
accidents <- table(ships$type)

barplot(table(ships$type), main="Number of Accidents by Ship Type", xlab="Ship Type", ylab="Number of Accidents",
        col="orange", ylim=c(0, max(table(ships$type)) + 2), legend = FALSE)
        
        
        
      
#Question 4:

install.packages("rvest")     
library(rvest)
url <- "https://stats.stackexchange.com/questions?tab=Votes"       
webpage <- read_html(url)
titles <- webpage %>% html_nodes(".question-hyperlink") %>% html_text() 
views <- webpage %>% html_nodes(".views") %>% html_text() %>% gsub("views", "", .)
answers <- webpage %>% html_nodes(".status strong") %>% html_text() 
votes <- webpage %>% html_nodes(".vote-count-post") %>% html_text()

data <- data.frame(Title = titles, Views = views, Answers = answers, Votes = votes)
print(data)
view(data)




#Question 5:

set.seed(123)  

simulate_pulls <- function() {
  count <- 0  
  has_half_tablet <- FALSE  
  
  while (!has_half_tablet) {
    count <- count + 1  
    if (count == 1) {
      bottle <- rep(c("whole"), 100)  
    }
    pull <- sample(bottle, 1)  
    
    if (pull == "half") {
      has_half_tablet <- TRUE  
    } else {
      bottle <- c(bottle, "half") 
    }
  }
  
  return(count)
}

num_simulations <- 1000  
pull_counts <- replicate(num_simulations, simulate_pulls())  

average_days <- mean(pull_counts)  

average_days











