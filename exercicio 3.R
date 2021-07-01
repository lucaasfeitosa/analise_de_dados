library(data.table)
library(Hmisc)
library(dplyr)
library(zoo)

# 1. Extraia a base geral de covid em Pernambuco disponível neste endereço:

dados <- fread("bases_originais/basegeral.csv")
dados[dados == ""] <- NA

# 2. Corrija os NAs da coluna sintomas através de imputação randômica 

(dados$sintomas <- impute(dados$sintomas, "random"))
is.imputed(dados$sintomas)                               

# 3. Calcule, para cada município do Estado, o total de casos confirmados e negativos
count(dados, classe)

dados_confirmados <- dados %>% group_by(municipio) %>% summarise(sum(classe == "CONFIRMADO"))
dados_negativos <- dados %>% group_by(municipio) %>% summarise(sum(classe == "NEGATIVO"))

# 4. Crie uma variável binária se o sintoma inclui tosse ou não e calcule quantos casos confirmados e negativos tiveram tosse como sintoma

dados <- dados %>% mutate(tosse = ifelse(grepl(paste("TOSSE", collapse="|"), sintomas), '1', '0'))
dados_tosse_confirmados <- dados %>% group_by(tosse) %>% summarise(sum(classe == "CONFIRMADO"))
dados_tosse_negativos <- dados %>% group_by(tosse) %>% summarise(sum(classe == "NEGATIVO"))

# 5. Agrupe os dados para o Estado, estime a média móvel de 7 dias de confirmados e negativos

dados <- dados %>% mutate(CONFIRMADO = ifelse(classe == "CONFIRMADO", 1, 0), NEGATIVO = ifelse (classe == "NEGATIVO", 1, 0))
dados <- dados %>% mutate(confirmadoMM7 = round(rollmean(x = CONFIRMADO, 7, align = "right", fill = NA), 2), negativoMM7 = round(rollmean(x = NEGATIVO, 7, align = "right", fill = NA), 2))

