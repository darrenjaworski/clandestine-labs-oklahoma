library(tidyr)
library(dplyr)

filename <- 'clan-lab-ok.txt'
filenameEdit <- 'clan-lab-ok-edit.txt'
headers <- c('COUNTY', 'CITY', 'ADDRESS', 'DATE')

delim <- read.delim( file = filename,
                    header = FALSE,
                    sep = "  ")

table <- read.table(file = filenameEdit,
               sep = "",
               fill = FALSE,
               strip.white = FALSE)

fwf <- read.fwf(file = filename,
                widths = c(11, 14, 32, 20),
                col.names = headers,
                fill = FALSE)



