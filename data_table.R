library(data.table)
library(dplyr)

mtcarsDT <- mtcars %>% setDT()
class(mtcarsDT)

mtcarsDT[ , lm(formula = cyl ~ mpg + disp + hp + drat + wt + qsec + vs + am + gear + carb)]

