#arquivos html

library(rvest)
library(dplyr)

#tabelas da wikipedia

url <- "https://pt.wikipedia.org/wiki/Lionel_Messi"

urlTables <- url %>% read_html %>% html_nodes("table")
urlLinks <- url %>% read_html %>% html_nodes("link")

#Criando Data Frame Barcelona

numerospelobarcelona <- as.data.frame(html_table(urlTables[19]))

#Excluindo colunas

numerospelobarcelona <- numerospelobarcelona[,-c(1, 3:20)]

#Criando Variável Index

numerospelobarcelona$v_i <- c(1:19)

#Criando Data Frame Argentina

numerospelaargentina <- as.data.frame(html_table(urlTables[24]))

#Criando Variável Index

numerospelaargentina$v_i <- c(1:18)

#Juntando as bases

numerosnacarreira <- left_join(numerospelaargentina, numerospelobarcelona, by = c("v_i" = "v_i"))
                               
                               
