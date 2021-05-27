library(data.table)
library(dplyr)

acidentes_2021 <- read.csv2('bases_originais/acidentes.csv', sep = ',', encoding = 'UTF-8')

# criando matriz, agrupando por natureza do acidente, criando uma nova linha com index e selecionando apenas algumas variáveis

macidentes_2021 <- acidentes_2021 %>% group_by(natureza_acidente) %>% mutate(row = X.U.FEFF._id) %>% select(natureza_acidente, vitimas, row)

# pivota o data frame de long para wide

macidentes_2021nw <- macidentes_2021 %>% pivot_wider(names_from = row, values_from = vitimas)
