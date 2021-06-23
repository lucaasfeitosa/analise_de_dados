url = 'https://raw.githubusercontent.com/wcota/covid19br/master/cases-brazil-states.csv'
covidBR = read.csv2(url, encoding='latin1', sep = ',')

covidCE <- subset(covidBR, state == 'CE') # filtrar para Ceará

str(covidCE) # observar as classes dos dados

covidCE$date <- as.Date(covidCE$date, format = "%Y-%m-%d")

covidCE$dia <- seq(1:length(covidCE$date))

predDia = data.frame(dia = covidCE$dia)
predSeq = data.frame(dia = seq(max(covidCE$dia)+1, max(covidCE$dia)+180))

predDia <- rbind(predDia, predSeq)

install.packages("drc")
library(drc)

fitLL <- drm(newDeaths ~ dia, fct = LL2.5(),
             data = covidCE, robust = 'mean')

plot(fitLL, log="", main = "Log logistic")

predLL <- data.frame(predicao = ceiling(predict(fitLL, predDia)))
predLL$data <- seq.Date(as.Date('2020-03-16'), by = 'day', length.out = length(predDia$dia))

predLL <- merge(predLL, covidCE, by.x ='data', by.y = 'date', all.x = T)

library(plotly)

plot_ly(predLL) %>% add_trace(x = ~data, y = ~predicao, type = 'scatter', mode = 'lines', name = "Mortes - Predição") %>% add_trace(x = ~data, y = ~newDeaths, name = "Mortes - Observadas", mode = 'lines') %>% layout(
  title = 'Predição de Mortes de COVID 19 no Ceará', 
  xaxis = list(title = 'Data', showgrid = FALSE), 
  yaxis = list(title = 'Novas Mortes por Dia', showgrid = FALSE),
  hovermode = "compare") 

library(zoo)

covidCE <- covidCE %>% mutate(newDeathsMM7 = round(rollmean(x = newDeaths, 7, align = "right", fill = NA), 2))

covidCE <- covidCE %>% mutate(newDeathsL7 = dplyr::lag(newDeaths, 7))

plot_ly(covidCE) %>% add_trace(x = ~date, y = ~newDeaths, type = 'scatter', mode = 'lines', name = "Novas Mortes") %>% add_trace(x = ~date, y = ~newDeathsMM7, name = "Novas Mortes MM7", mode = 'lines') %>% layout(
  title = 'Novas Mortes de COVID19 no Ceará', 
  xaxis = list(title = 'Data', showgrid = FALSE), 
  yaxis = list(title = 'Novas Mortes por Dia', showgrid = FALSE),
  hovermode = "compare")

install.packages("xts")
library(xts)

(covidCETS <- xts(covidCE$newDeaths, covidCE$date))

autoplot(covidCETS)
acf(covidCETS)
