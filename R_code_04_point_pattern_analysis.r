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
                       
                       
                       
#############################################################################
## Leo's data:
setwd("~/Lab")                       
leo <- read.table("dati_zabotti.csv", header=T, sep=",")
head(leo)                                
                       
attach(leo)
library(spatstat)
                       
                       
leo_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))
plot(leo_ppp)
                       
density_map <- density(leo_ppp)
plot(density_map)
points(leo_ppp)    
                       




###---INTERPOLATION FROM STUDENT'S DATA

#  IMPORTANT:REFERENCE SYSTEMS. Earth is a geoid (surface perpendicular to the gravity force - equipotential surfaces and the geoid surface is the sea level) so we use a different surface and not the topographic surface 
#                               ED50 (called international ellipsoid) is the ellipsoid used for Europe but it's not good for North America that actually uses NAD27 (called Clarke ellipsoid) as the reference ellipsoid but there are
#                               plenty of different ellipsoids. So every time we use coordinates like longitude and latitude we need to state the reference system. Nowadays they're promoting the World Geodetic System trying to use
#                               the same system worldwide. Also the GPS (Global Position System) use the same coordinates. UTM is the Universal Transverse Mercator that project Earth'surface in a flat plane (every piece is called zone
#                              or "fuso" in italian). This allow us to measure the distance from the Meridian. Greenwich meridian is given a number different to zero in order not to have negative numbers of the left side of the planet.
#                              In UTM every zone is 6 degrees and there are 60 zones. Italy is divided into two zones: from 6 to 12 degrees and from 12 to 18 degrees. 
#                              In the data we're using coordinates are calculated in meters (Gauss Boaga system) from the Greenwich Meridian (x) and from the Equator (y).

#let's import the data. REMEMBER TO SET THE WD BEFORE THAT

setwd("C:/Users/Leonardo/Desktop/Università/UNIBO/PRIMO ANNO/MONITORING ECOSYSTEMS CHANGES AND FUNCTIONING/lab")

leo <- read.table("dati_zabotti.csv", head=T, sep=",")  
head(leo)

##    We want to make the PPP in order to build the density map

attach(leo)

library(spatstat)
leo_ppp <- ppp(x, y, c(2300000,2325000), c(5005000,5045000))       # \summary(leo)\ will show the minimum and maximum x and y in order to build the range (usually bigger than the values)

dens_leo <- density(leo_ppp)      #to build the density object and then plot it
plot(dens_leo)
points(leo_ppp)

###---HOW TO SAVE WORKSPACE? Go to file menu so next time you open we don't have to import data again

###-- HOW TO LOAD RDATA FILES: \load("point_pattern_analysis.RData")\ after putting the file in the WD and setting the WD

##   We now want to interpolate missing data

marks(leo_ppp) <- chlh        #we're interpolating the values of chlorophyll explaining to R what is the variable we want to use. Remember \libray(spatstat)\ and \attach(leo)\
chlh_map <- Smooth(leo_ppp)
plot(chlh_map)

# Let'a change the color ramp palette
cl <- colorRampPalette(c('yellow','orange','red','green'))(100) 
plot(chlh_map, col=cl)
points(leo_ppp)

marks(leo_ppp) <- t
t_map <- Smooth(leo_ppp)
plot(t_map)
points(leo_ppp)

# Exercise: do the same for chlorophyll in the sediment (chls)

marks(leo_ppp) <- chls
chls_map <- Smooth(leo_ppp)
plot(chls_map)
points(leo_ppp)

 ###---CREATING PANELS WITH MORE MAPS

par(mfrow=c(1,3))       # Function that set some graphical parameters. In this case we build a MULTIFRAME with \mf\ and then we state how many maps in a row or column- \mfrow=c(1.3)\ mans we want 1 row and 3 columns
plot(dens_leo)
points(leo_ppp)
plot(chlh_map)
points(leo_ppp)
plot(chls_map)
points(leo_ppp)
# we can of course change the colours by creating a ramppalette and stating \col=cl\

#----------Exercise: build a panel with 3 rows and  column

cl <- colorRampPalette(c('yellow','orange','red','green'))(100) 

par(mfrow=c(3,1))

plot(dens_leo, col=cl)
points(leo_ppp)

plot(chlh_map, col=cl)
points(leo_ppp)

plot(chls_map, col=cl)
points(leo_ppp)
#-------------------------------------------------

