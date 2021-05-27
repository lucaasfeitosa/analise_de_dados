install.packages('funModeling')
library(funModeling)
library(tidyverse)

# olhar os dados

glimpse(mtcars)

# estrutura dos dados

status(mtcars)

#frequência das variaveis fator

freq(mtcars) #None of the input variables are factor nor character

#exploração das variáveis numéricas

plot_num(mtcars)

#estatística das variáveis numéricas

profiling_num(mtcars)
