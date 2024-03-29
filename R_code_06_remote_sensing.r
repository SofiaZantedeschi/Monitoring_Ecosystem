# R code for remote sensing data analysis to monitor ecosystem changes in space and time

# Satellite pics: composed by pixel, each quadrant is a color, every color is a number based on refelctance (how much light is reflected)
  # 1= light green, 9= very darkgreen.
# Spectral signaling: when vegetation is dying you can see a shift in the absorprtion. Non-healhty vegeation is not doing photosysnthesis so, it is absorbing less. 
  # Helahty reflect green and absorb blue and red. Stressed does not reflect much green and does not much blue and red.
  # If you have helahty plant: very high reflectance in infrared and low in red (used for photosinthesis).-->  This is VI (vegetation index)
    # DVI= difference = NIR (reflectance in infrared) - R (reflecatiance in red)
      # If it's healthy 100-0=100; unhealthy= 70 - 30= 40.
        # NDVI index: lower values in stressed plants.

## Satellitle images as matrices of numbers.
## Healthy Vegetation: is highly reflecting the infrared, which have larger wave after the red. The healthier the tissue the higher the reflection, with maximum green and infrared. 
## Red and blue are absorbed becasue of photsynthesis, so once the leavesa re stressed they are all reflected in the same way.

## Indices 


# install.packages(c("raster", "RStollbox"))
install.packages(c("raster", "RStoolbox"))         #"raster" manages raster data (with pixels, data based on images) while the other deals with Remote Sensing tools

library(raster)
library(RStoolbox)
                 
setwd("~/Lab/")
# setwd("C:/lab/")  
# windows
# setwd("/Users/name/lab/")

p224r63_2011 <- brick("p224r63_2011_masked.grd")     #\brick("object to upload in work. dir.")\ is a function that upload in R all of the layers of a raster image

p224r63_2011   #we can see properties of the image and also the georeferenciation and resolution (class: rasterbrick)
plot(p224r63_2011)        #default legend is from white to green 

#These are the bands inside the image. we can check the bandwiths here:https://www.usgs.gov/faqs/what-are-band-designations-landsat-satellites?qt-news_science_products=0#qt-news_science_products

# B1: blue
# B2: green
# B3: red
# B4: NIR
# B5: middle IR
# B6: thermal IR
# B7: middle IR
                 
# we can change the colours using ramp palette and 
cl <- colorRampPalette(c('black','grey','light grey'))(100) # 
plot(p224r63_2011, col=cl)

# what if we just want to plot the first 4 images? and also plotting them in a single picture with 2x2? using \par\
par(mfrow=c(2,2))      #when use this command nothing happens but R is ready to build our table with images

# now we start creating the images:
clb <- colorRampPalette(c('dark blue','blue','light blue'))(100) # 
plot(p224r63_2011$B1_sre, col=clb)      #the $ is selecting the element/bandwith that we want and then we select the clb colours that we created
# the higher the refectance in the blue band, the higher is the brightness of the colour.

# doing the same with green
clg <- colorRampPalette(c('dark green','green','light green'))(100) # 
plot(p224r63_2011$B2_sre, col=clg)

# red
clr <- colorRampPalette(c('dark red','red','pink'))(100) # 
plot(p224r63_2011$B3_sre, col=clr)

# orange
cln <- colorRampPalette(c('red','orange','yellow'))(100) # 
plot(p224r63_2011$B4_sre, col=cln)


dev.off()       #in order to close the \par\ command
                 
# RGB : we can build the image as the human eye sees it in RGB (same as televisions) using \plotRGB()\ function

plotRGB(p224r63_2011, r=3, g=2, b=1, stretch="Lin")  #we need to state which layer is each band. Red is B3, green is B2 and blue is B1
                                     #stretch means we stretch colours in the linear method in order to see better the image
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")   #now we try to use the NIR band and we switch everything by one and see what happens
#doing this we can see the world in NIR, something the human eye cannot see. NIR is highly reflected by leaves so all vegetations will become red
# using NIR in the red component is also called "FALSE COLOURS" it is widely used

# Exercise: mount NIR ontop the G of RGB

plotRGB(p224r63_2011, r=3, g=4, b=2, stretch="Lin")   #changing the scheme and putting B4 in the green component the vegetation will turn green and the rest violet
plotRGB(p224r63_2011, r=3, g=2, b=4, stretch="Lin")  # if we put NIR in the blue component so vegetation will turn blue (because it reflects NIR) and the rest will turn yellow

# doing this we can enhance what the human eye struggles to see. 

# 1988 image
# p224r63_1988_masked

p224r63_1988 <- brick("p224r63_1988_masked.grd")

#we can compare the images between two different years
                 
par(mfrow=c(2,1))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")

par(mfrow=c(2,1))
plotRGB(p224r63_1988, r=4, g=3, b=2, stretch="hist")
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="hist")

# DVI for the two years: compare with a difference in time
# NIR - RED
# NDVI = (NIR - RED) / (NIR - RED)

dvi1988 <- p224r63_1988$B4_sre - p224r63_1988$B3_sre
dvi2011 <- p224r63_2011$B4_sre - p224r63_2011$B3_sre

par(mfrow=c(2,1))
plot(dvi1988)
plot(dvi2011)


par(mfrow=c(2,1))
cldvi <- colorRampPalette(c('red','orange','yellow'))(100) # 
plot(dvi1988, col=cldvi)
plot(dvi2011, col=cldvi)


# difference in time
difdvi <- dvi2011 - dvi1988
cldif <- colorRampPalette(c('blue','white','red'))(100) #
plot(difdvi, col=cldif)



# install.packages("RStoolbox")
library(RStoolbox)

# PCA
p224r63_2011res <- aggregate(p224r63_2011, fact=10)

par(mfrow=c(2,1))
plotRGB(p224r63_2011, r=4, g=3, b=2, stretch="Lin")
plotRGB(p224r63_2011res, r=4, g=3, b=2, stretch="Lin")

p224r63_2011_pca <- rasterPCA(p224r63_2011res)

summary(p224r63_2011_pca$model) 
plotRGB(p224r63_2011_pca$map, r=4, g=3, b=2, stretch="Lin")

plot(p224r63_2011_pca$map)

# land cover
p224r63_2011c <- unsuperClass(p224r63_2011, nClasses=5)
clclass <- colorRampPalette(c('red', 'green', 'yellow', 'blue', 'black'))(100) 
plot(p224r63_2011c$map, col=clclass)
