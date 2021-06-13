library(data.table)
library(Hmisc)

#carregando base
dados <- read.csv("bases_originais/dados.csv", sep = ",", encoding = "UTF-8", na.strings = "..")

#imputação numérica
dados$X2011..YR2011. <- impute(dados$X2011..YR2011., fun = mean) #média

is.imputed(dados$X2011..YR2011.) # teste se o valor foi imputado
table(is.imputed(dados$X2011..YR2011.)) # tabela de imputação por sim / não

#hot deck

(dados$X2012..YR2012. <- impute(dados$X2012..YR2012., "random"))
is.imputed(dados$X2012..YR2012.)
table(is.imputed(dados$X2012..YR2012.))
