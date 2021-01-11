# https://land.copernicus.vgt.vito.be/PDF/portal/Application.html

#nc data: we need library
# http://cran.r-project.org/

install.packages("ncdf4")

library(ncdf4)

setwd("~/Lab/")

library(raster)

# Importing images
tjan <- raster("c_gls_LST10-DC_202101010000_GLOBE_GEO_V1.2.1.nc")

plot(tjan)

## Ecercise: change the coloramppalet

cltjan <- colorRampPalette(c('black','grey','light grey'))(100) #
cltjan <- colorRampPalette(c('yellow','orange','red'))(100)
plot(tjan, col=cltjan)

cltjan <- colorRampPalette(c('blue','yellow','red'))(100) #
plot(tjan, col=cltjan)


## Making October plot
toct <- raster("c_gls_LST10-DC_202010010000_GLOBE_GEO_V1.2.1.nc")
plot(toct, col=cltjan)

# To see the differences we are plotting p1 - p2
# The higher the differences the higher the reddish part of the map
# The smaller the differences the bluish the image
dift <- tjan - toct
cldif <- colorRampPalette(c('blue','white','red'))(100) #
plot(dift, col=cldif)





