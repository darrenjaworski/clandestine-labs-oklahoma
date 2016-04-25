setwd("~/Sites/R/clandestine-lab")

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

data = read.csv('clan-lab-ok.csv')

library(ggmap)

myLocation <- c(lon = -97.5164, lat = 35.4676)

oklahomaMap <- get_map(location=myLocation,
                 source='google', maptype='terrain', crop=FALSE, zoom = 10)

ggmap(oklahomaMap) +
  geom_point(aes(x = data$long , y = data$lat), data = data,
             alpha = .5, color="steelblue", size = 1)

