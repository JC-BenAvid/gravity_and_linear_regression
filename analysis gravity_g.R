library(ggplot2)
library(tidyverse)



#loading data

path<-#"local path file location\\freefall_data_g.csv"
  

data_set<-read.csv(path)
class(data_set)
head(data_set)



plot(data_set$t,data_set$y)



y<-data_set$y
x<-(data_set$t)^2

plot(x,y)


linear_model <- lm(y ~ x, data = data_set)
summary(linear_model)



b<-linear_model$coefficients[1]
m<-linear_model$coefficients[2]
b<-0


data_set%>%ggplot(aes(t^2, y)) +
  geom_point(alpha = 0.5) +
  geom_abline(intercept = b, slope = m) +
  ggtitle("Linear Model") +
  xlab("Time squared t^2") +
  ylab("Fall distance y (m)")


