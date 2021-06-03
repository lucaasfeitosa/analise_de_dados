#criando variável binomial simulada

(variavelbinomial <- rbinom(500, 1, 0.7))
recode <- c(sim = 1, não = 0)
(variavelbinomial <- factor(variavelbinomial, levels = recode, labels = names(recode)))
