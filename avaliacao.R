library(data.table)
library(dplyr)
library(readxl)
library(lubridate)
library(tidyverse)

# 1. Extraia a base geral de covid em Pernambuco

dados <- fread("bases_originais/basegeral.csv")
str(dados)

# 2. Calcule, para cada município do Estado, o total de casos confirmados e o total de óbitos por semana epidemiológica

dados <- dados %>% mutate(semana_epidemiologica = epiweek(dados$dt_notificacao))

count(dados, classe)

count(dados, evolucao)

dados_confirmados <- dados %>% filter(classe=="CONFIRMADO")

dados_obitos <- dados %>% filter(evolucao=="OBITO")                                                             

dados_confirmados <- dados_confirmados %>% group_by(municipio) %>% count(semana_epidemiologica)

dados_obitos <- dados_obitos %>% group_by(municipio) %>% count(semana_epidemiologica)

# 3. Enriqueça a base criada no passo 2 com a população de cada município

dados2 <- read_excel("bases_originais/tabela6579.xlsx")

dados2 <- dados2 %>% rename(municipio = `Tabela 6579 - População residente estimada`)

dados2 <- dados2 %>% rename(populacao = ...2)

dados2 <- dados2 %>%  mutate(municipio = str_remove_all(municipio, "(PE)")) %>% mutate(municipio = gsub("[:space:][()]", "", municipio)) %>% mutate(municipio = str_trim(municipio))

dados2 <- dados2 %>% select(municipio, populacao) %>% mutate(municipio = str_to_upper(municipio))

dados3 <- left_join(dados, dados2, by = "municipio")

# 4. Calcule a incidência (casos por 100.000 habitantes) e letalidade (Óbitos por 100.000 habitantes) por município a cada semana epidemiológica.

dados4 <- dados_confirmados %>% group_by(municipio) %>% count(semana_epidemiologica) %>% mutate(incidencia = n/100000)

dados5 <- dados_obitos %>% group_by(municipio) %>% count(semana_epidemiologica) %>% mutate(incidencia = n/100000)
