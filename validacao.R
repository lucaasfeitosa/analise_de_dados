install.packages("validate")
library(validate)

acidentes2021 <- read.csv('http://dados.recife.pe.gov.br/dataset/44087d2d-73b5-4ab3-9bd8-78da7436eed1/resource/2caa8f41-ccd9-4ea5-906d-f66017d6e107/download/acidentes_2021-jan.csv', sep = ';', encoding = 'UTF-8')

regras_acidentes2021 <- validator(vitimas >= 0)

validacao_acidentes2021 <- confront(acidentes2021, regras_acidentes2021)

summary(validacao_acidentes2021)

plot(validacao_acidentes2021)
