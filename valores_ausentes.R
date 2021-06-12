library(data.table)
library(tidyverse)
install.packages("funmodeling")
library(funModeling)

dados <- read.csv("bases_originais/dados.csv", sep = ",", encoding = "UTF-8", na.strings = "..")

#shadow matrix
status(dados)
head(dados)

x <- as.data.frame(abs(is.na(dados)))
head(x)

y <- x[which(sapply(x, sd) > 0)]
cor(y)
