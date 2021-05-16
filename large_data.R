install.packages('ff')
library(ff)

enderecoBase <- 'bases_originais/largeData.csv'

# criando o arquivo ff
system.time(extracaoLD <- read.csv.ffdf(file=enderecoBase))

class(extracaoLD) # veja a classe do objeto

object.size(extracaoLD)

#realizando operações estatísticas
mean(extracaoLD[,1])
median(extracaoLD[,5])

#criando amostra
extracaoLDAmostra <- extracaoLD[sample(nrow(extracaoLD), 150000) , ]

#estatística inferencial

lm(c ~ ., extracaoLDAmostra)
