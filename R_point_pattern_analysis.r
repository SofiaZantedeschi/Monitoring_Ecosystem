# Point pattern analysis

install.packages("spatstat")
library(spatstat)

setwd("~/Lab/")
covid <- read.table("covid_agg.csv",header=TRUE)  ## TRUE: to start data from the secondr raw. If it is false it starts from the beginning
covid

# Let's see the density of covid data
# Let's make a planar point pattern in spatstat

# We have to attach the dataset
attach(covid)

# Then we can plot with x,y,ranges
covid_planar <- ppp(lon, lat, c(-180,180), c(-90,90))

density_map <- density(covid_planar)

plot(density_map)
points(covid_planar)

# Excerice: change the colour of the map
plot(density_map, col = cl)
cl <- colorRampPalette(c('blue','yellow','orange','red','magenta'))(100)


cl <- colorRampPalette(c('yellow','orange','red'))(100) #
plot(density_map, col = cl)
