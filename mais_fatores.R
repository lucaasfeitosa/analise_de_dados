install.packages("ade4")
library(ade4)
install.packages("arules")
library(arules)
install.packages("forcats")
library(forcats)
library(data.table)

(variavelbinomial <- rbinom(100, 1, 0.7))
recode <- c(sim = 1, não = 0)
(variavelbinomial <- factor(variavelbinomial, levels = recode, labels = names(recode)))


casos = 100

banco_de_dados <- data.table(a = variavelbinomial, b = sample(c("fogo", "agua", "terra", "ar"), casos, replace = TRUE))

# One Hot Encoding

banco_de_dados <- acm.disjonctif(banco_de_dados)

#forcat

elementos = data.table(elementos = sample(c("fogo", "agua", "terra", "ar"), casos, replace=TRUE))

fct_count(elementos$elementos)

fct_lump(elementos$elementos, n = 2)
