library(dplyr)


#criando variável normal simulada a
variavel_normal_a <- rnorm(500)

#criando variavel normal simulada b
variavel_normal_b <- rnorm(500)


#criando variável de contagem com disperção (binomial negativa)
binomialnegativa <- rnbinom(500, mu = 10, size = 30)

#criando variável de contagem (poisson)
poissonsimulacao <- rpois(500, 6)

#criando variável binomial simulada
variavelbinomial <- rbinom(500, 1, 0.7)

#criando variavel qualitativa
variavelqualitativa <- factor(variavelbinomial, labels = c("sim", "não"), levels = c(1, 0))

#criando variável de index
variavelindex <- seq(1, length(variavel_normal_a))

#conclusão do data.frame
dados <- data.frame(variavel_normal_a, variavel_normal_b, poissonsimulacao, binomialnegativa, variavelbinomial, variavelqualitativa, variavelindex)

# sumário
summarise(dados, avg = mean(variavel_normal_a))

# sumários com agrupamentos

dados %>% group_by(variavelqualitativa) %>% summarise(avg = mean(variavel_normal_a))

#manipulação de casos

dados %>%  filter(variavelqualitativa != "sim") %>% summarise(avg = mean(poissonsimulacao))

#manipulação de colunas
dados %>% select(variavel_normal_a, variavel_normal_b, poissonsimulacao) %>% arrange(variavel_normal_a)
