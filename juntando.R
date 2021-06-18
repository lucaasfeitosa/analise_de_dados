install.packages("fuzzyjoin")
library(fuzzyjoin)
library(dplyr)
library(tidyr)
# criando base 1

nome <- c("Ter Stegen", "Dest", "Piqué", "Garcia", "Alba", "Busquets", "Pedri", "Messi", "Dembelé", "Griezmann", "Aguero")
nacionalidade <- c("Alemanha", "Estados Unidos", "Espanha", "Espanha", "Espanha", "Espanha", "Espanha", "Argentina", "França", "França", "Argentina")

barcelona1 <- data.frame(nome, nacionalidade)

# criando base 2

nome <- c("ter stegen", "dest", "piqué", "garcia", "alba", "busquets", "pedri", "messi", "dembelé", "griezmann", "aguero")
posicao <- c("goleiro", "ld", "zagueiro", "zagueiro", "le", "volante", "meia", "meia", "pd", "pe", "ca")

barcelona2 <- data.frame(nome, posicao)          

# juntando base 1 e 2

barcelona <- stringdist_join(barcelona1, barcelona2, mode = 'left')

###

paises_europa <- c("Alemanha", "Espanha", "França")

barcelona3 <- barcelona %>% mutate(tag_nacionalidade = ifelse(grepl(paste(países_europa, collapse="|"), nacionalidade), 'europeu', 'não_europeu'))
