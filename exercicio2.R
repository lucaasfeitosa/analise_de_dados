library(ff)
install.packages('ffbase')
library(ffbase)

# extraindo bases de 2011 a 2020

extracao2020 <- read.csv2.ffdf(file='bases_originais/situacaofinalalunos2020.csv')
extracao2019 <- read.csv2.ffdf(file='bases_originais/situacaofinalalunos2019.csv')
extracao2018 <- read.csv2.ffdf(file='bases_originais/situacaofinalalunos2018.csv')
extracao2017 <- read.csv2.ffdf(file='bases_originais/situacaofinalalunos2017.csv')
extracao2016 <- read.csv2.ffdf(file='bases_originais/situacaofinalalunos2016.csv')
extracao2015 <- read.csv2.ffdf(file='bases_originais/situacaofinalalunos2015.csv')
extracao2014 <- read.csv2.ffdf(file='bases_originais/situacaofinalalunos2014.csv')
extracao2013 <- read.csv2.ffdf(file='bases_originais/situacaofinalalunos2013.csv')
extracao2012 <- read.csv2.ffdf(file='bases_originais/situacaofinalalunos2012.csv')
extracao2011 <- read.csv2.ffdf(file='bases_originais/situacaofinalalunos2011.csv')

# juntando todas as bases

base2011_2020 <- ffdfrbind.fill(extracao2011, extracao2012, extracao2013, extracao2014, 
extracao2015, extracao2016, extracao2017, extracao2018, extracao2019, extracao2020)

#limpando staging area

ls()

rm(list = c("extracao2011","extracao2012","extracao2013","extracao2014","extracao2015","extracao2016","extracao2017","extracao2018","extracao2019","extracao2020"))

# salvando em formato nativo do r

saveRDS(base2011_2020, "bases_tratadas/base2011_2020.rds")
