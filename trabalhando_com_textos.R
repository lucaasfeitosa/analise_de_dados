install.packages("pdftools")
library(pdftools)
install.packages("textreadr")
library(textreadr)
library(dplyr)
install.packages("stringr")
library(stringr)

# ler pdf

documento <- read_pdf("bases_originais/documento.pdf", ocr = T)

(datas_mod <- str_replace_all(string = documento, pattern = "/", replacement = "-"))

(datas <- str_extract_all(datas_mod, "\\d{2}/\\d{2}"))

