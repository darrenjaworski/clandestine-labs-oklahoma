setwd("~/Sites/R/clandestine-lab")

# will need rewrite this. Cleaning and csv produced in python.
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

# read csv, summarize
library(plyr)

data = read.csv('clan-lab-ok.csv')

cityCount <- ddply(data, c('city'), summarise,
               number = length(city))

countyCount <- ddply(data, c('county'), summarise,
                     number = length(county))

# map the geocoded points on the map
library(ggmap)

#coordinates
OKC <- c(lon = -97.5164, lat = 35.4676)
Tulsa <- c(lon = -95.9928, lat = 36.1540)
zoomedOutCenter <- c(lon = -98.5164, lat = 35.4676)

myLocation <- zoomedOutCenter

oklahomaMap <- get_map(location=myLocation,
                 source='stamen', maptype='toner', crop=FALSE, zoom = 7)

ggmap(oklahomaMap) +
  geom_point(aes(x = data$long , y = data$lat), data = data,
             alpha = .5, color="steelblue", size = 1)
