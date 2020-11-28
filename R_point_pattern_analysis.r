# Point pattern analysis

install.packages("spatstat")
library(spatstat)

# Setting the working directory
covid <- read.table("covid_agg.csv",header=TRUE)  ## TRUE: to start data from the secondr raw. If it is false it starts from the beginning
covid

# Let's see the desetwd("~/Lab/")
nsity of covid data
# Let's make a planar point pattern in spatstat

# We have to attach the dataset
attach(covid)

# Then we can plot with x,y,ranges. we explain they are spatial data and we have coordiantes for that.
covid_planar <- ppp(lon, lat, c(-180,180), c(-90,90))

# Density of points we have on the planets
density_map <- density(covid_planar)

plot(density_map)
points(covid_planar)

# Excerice: change the colour of the map
plot(density_map, col = cl)
cl <- colorRampPalette(c('blue','yellow','orange','red','magenta'))(100)

plot(density_map, col = cl)

# Putting the countries ontop of the map

# For linux users:   
sudo apt-get update
sudo apt-get install libgdal-dev libproj-dev

install.packages("rgdal")

# shp: shape file: every point has a value in a table 
# shx: linking each point to the correct raw
# 3 ways to represent geo data:
  # vector files: using x,y. Using vectors (sets of coordinates). you have points, lines and poligons.
  # Raster files: image (like the density map). 

# Recall the library
library (rgdal)

# readOGR: read vector maps into spatial objects. It is going to read the lines and put them into R software. (OGR is a type of vector structure)
    # We have to put the data under a name
coastlines <- readOGR("ne_10m_coastline.shp") 

cl <- colorRampPalette(c('pink','green','orange','red','magenta'))(100) # 
plot(density_map, col = cl)
points(covid_planar, pch=19)
plot(coastlines, add = TRUE)


png("figure1.png")
cl <- colorRampPalette(c('pink','green','orange','red','magenta'))(100) # 
plot(density_map, col = cl)
points(covid_planar, pch=19)
plot(coastlines, add = TRUE)
dev.off()

pdf("figure1.pdf")
cl <- colorRampPalette(c('pink','green','orange','red','magenta'))(100) # 
plot(density_map, col = cl)
points(covid_planar, pch = 19, cex = 0.5)
plot(coastlines, add = TRUE)
dev.off()

# ggsave
# https://www.rdocumentation.org/packages/grDevices/versions/3.4.1/topics/png#:~:text=Plots%20in%20PNG%20and%20JPEG,for%20image%20plots%2C%20for%20example.



# Data interpolation
# Explain tom R where to find the cases
# We are mapping the amount of cases and not the density.
marks(covid_planar) <- cases
cases_map <- Smooth(covid_planar)

plot(cases_map, col = cl)
plot(coastlines, add = T)
points(covid_planar)


######## Plotting points with different size related to covid data together with the interpolation

# Setting the working directory

setwd("~/Lab")
library(spatstat)
library(rgdal)

covid <- read.table("covid_agg.csv",header=TRUE)  ## TRUE: to start data from the secondr raw. If it is false it starts from the beginning
head(covid)

attach (covid) # if you do not you have to declare every time the veraible like this: covid$lon
covid_planar <- ppp(lon, lat, c(-180,180), c(-90,90))

marks (covid_planar) <- cases
cases_map <- Smooth(covid_planar)

cl <- colorRampPalette(c('brown2','brown4','aquamarine2','aquamarine4','blue') (100)
                       
plot(cases_map)

                       
#########
install.packages("sf")
library(sf)

Spoints <- st_as_sf(covid, coords = c("lon", "lat"))
plot(Spoints, cex=Spoints$cases, col = 'purple3', lwd = 3, add=T)
