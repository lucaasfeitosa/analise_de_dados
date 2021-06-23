# criando objeto de data e hora

(str(data1 <- as.Date(c("1955-02-24 00:00", "1964-02-26 01:00", "1996-04-08 13:20"))))

# Conversão para POSIXct

(str(data2 <- as.POSIXct(c("1955-02-24 00:00", "1964-02-26 01:00", "1996-04-08 13:20"))))
unclass(data2)

# Conversão para POSIXlt
(str(data3 <- as.POSIXlt(c("1955-02-24 00:00", "1964-02-26 01:00", "1996-04-08 13:20"))))
unclass(data3)

### Extrações de Componentes

install.packages("lubridate")
library(lubridate)

year(data3)
month(data3)
month(data3, label = T)
