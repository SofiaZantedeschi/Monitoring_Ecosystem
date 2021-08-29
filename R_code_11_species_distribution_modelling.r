# Species Distribution Modelling

# install.packages("sdm")
# install.packages("rgdal", dependencies=T)

library(sdm)
library(raster) # predictors
library(rgdal) # species  - geo data analysis library

# import species data (with species distribution and the PREDICTORS which are environmental variables that explain the distribution)
file <- system.file("external/species.shp", package="sdm")    # \system.file()\ function catch files inside certain libraries (it's better tham \data()\ function when dealing with .shp files)
species <- shapefile(file)

# looking at the set
species

#class       : SpatialPointsDataFrame 
#features    : 200            number of data
#extent      : 110112, 606053, 4013700, 4275600  (xmin, xmax, ymin, ymax)
#crs         : +proj=utm +zone=30 +datum=WGS84 +units=m +no_defs        description of reference system and position
                          # utm 30 is the utm with Spain
#variables   : 1    number of variables in the dataset
#names       : Occurrence     name of the only variable
#min values  :          0       values of the variable: 0= absence; 1= presence
#max values  :          1 

# plot
plot(species)
plot(species, pch=17)   #transform point into triangles

# looking at all the occurrences data inside the dataset
species$Occurrence      

# copy and then write:
plot(species[species$Occurrence == 1,],col='blue',pch=16)     #we're building a subset of just values 1 of occurence which means "present"
points(species[species$Occurrence == 0,],col='red',pch=16)      #we add points with absences to previous graph

# let's now look at predictors: look at the path
path <- system.file("external", package="sdm") # "external" is the path of the folder in the sdm package

# list the predictors
lst <- list.files(path=path,pattern='asc$',full.names = T) 
                            # we select all files with asc so we will have a list of the data with this extension
lst         #shows us the predictors that are: elevation, precipitations, temperature and vegetation

# stack
preds <- stack(lst)         #rather that keeping the predictors separated we can build a stack with all of them

# plot preds
cl <- colorRampPalette(c('blue','orange','red','yellow')) (100)
plot(preds, col=cl)                         # the maps should be North of Spain

# plot predictors and occurrences
plot(preds$elevation, col=cl)
points(species[species$Occurrence == 1,], pch=16)

plot(preds$temperature, col=cl)
points(species[species$Occurrence == 1,], pch=16)

plot(preds$precipitation, col=cl)
points(species[species$Occurrence == 1,], pch=16)

plot(preds$vegetation, col=cl)
points(species[species$Occurrence == 1,], pch=16)

# model  

# set the data for the sdm
d <- sdmData(train=species, predictors=preds)
            # these are the data of the species and then we need to state what are the predictors

# model (it's a linear model)
m1 <- sdm(Occurrence ~ elevation + precipitation + temperature + vegetation, data=d, methods = "glm")

# make the raster output layer
p1 <- predict(m1, newdata=preds) 

# plot the output
plot(p1, col=cl)          # low values mean low probability to find the species and higher values high probability
points(species[species$Occurrence == 1,], pch=16)         # we can check that points fall mostly in the red part

# add to the stack to obtain the final probability map
s1 <- stack(preds,p1)
plot(s1, col=cl)
