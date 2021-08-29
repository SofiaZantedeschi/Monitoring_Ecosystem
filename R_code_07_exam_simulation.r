### R code for the exam (SIMULATION)

# Download data from https://land.copernicus.vgt.vito.be/PDF/portal/Application.html#Home
# Save them into working directory

# Find a package to open the format of the data. In this case the images are \.nc\ files

# install the package
install.packages("ncdf4")         #this is the name of the package we need

# recall the library
library(ncdf4)

# set the wd
setwd("~/Lab/")

#   now we can upload the data
#   we will also need the \raster\ package that should be already install in which there is the \raster\ function that we use to upload

library(raster)

# raster function: to enter the file

tjan <- raster("c_gls_LST10-DC_202101010000_GLOBE_GEO_V1.2.1.nc")

#     before going on we change the colour ramp palette

coltjan <- colorRampPalette(c('tan1','brown1','brown4'))(100) #

plot(tjan, col=coltjan)

toct <- raster("c_gls_LST10-DC_202010010000_GLOBE_GEO_V1.2.1.nc")

coltoct <- colorRampPalette(c('tan1','brown1','brown3'))(100) #

plot(toct, col=coltoct)

par(mfrow=c(1,2))
plot(tjan, col=coltjan)
plot(toct, col=coltoct)

dev.off()       #before going one with other plots

# what if we want to see the differences between the two raster picture? just do this:

dift <- tjan - toct # the higher the different the reddish

coldift <- colorRampPalette(c('lightcyan','grey','sienna1'))(100) #
plot(dift, col=coldift)
