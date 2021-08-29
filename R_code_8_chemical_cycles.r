library(raster)

# setwd("~/lab/")
setwd("C:/Users/Leonardo/Desktop/Università/UNIBO/PRIMO ANNO/MONITORING ECOSYSTEMS CHANGES AND FUNCTIONING/lab")


# use .red to export the data: prepare the set
EN01 <- raster("EN_0001.png")
EN02 <- raster("EN_0002.png")
EN03 <- raster("EN_0003.png")
EN04 <- raster("EN_0004.png")
EN05 <- raster("EN_0005.png")
EN06 <- raster("EN_0006.png")
EN07 <- raster("EN_0007.png")
EN08 <- raster("EN_0008.png")
EN09 <- raster("EN_0009.png")
EN10 <- raster("EN_0010.png")
EN11 <- raster("EN_0011.png")
EN12 <- raster("EN_0012.png")
EN13 <- raster("EN_0013.png")

# Otherwise:
# rlist <- list.files(pattern="EN")
# rlist 
# list_rast=lapply(rlist, raster)       # \lapply(list, functiom)\ is a function that let us apply the same function to all the elements of a list and create a stack
# ENstack <- stack(list_rast)

cl <- colorRampPalette(c('red','orange','yellow'))(100) # 

par(mfrow=c(1,2))
plot(EN01, col=cl)
plot(EN13, col=cl)

# close the window

difno2 <- EN01-EN13
cldif <- colorRampPalette(c('blue','black','yellow'))(100) # 
plot(difno2, col=cldif)         # this will show the differences

# if we want to build a video with the images check this:
#     https://www.r-bloggers.com/2018/10/the-av-package-production-quality-video-in-r/

cl <- colorRampPalette(c('red','orange','yellow'))(100) # 

# PLOT ALL THE DATA
# video like
plot(EN01, col=cl)
plot(EN02, col=cl)
plot(EN03, col=cl)
plot(EN04, col=cl)
plot(EN05, col=cl)
plot(EN06, col=cl)
plot(EN07, col=cl)
plot(EN08, col=cl)
plot(EN09, col=cl)
plot(EN10, col=cl)
plot(EN11, col=cl)
plot(EN12, col=cl)
plot(EN13, col=cl)

par(mfrow=c(4,4))
plot(EN01, col=cl)
plot(EN02, col=cl)
plot(EN03, col=cl)
plot(EN04, col=cl)
plot(EN05, col=cl)
plot(EN06, col=cl)
plot(EN07, col=cl)
plot(EN08, col=cl)
plot(EN09, col=cl)
plot(EN10, col=cl)
plot(EN11, col=cl)
plot(EN12, col=cl)
plot(EN13, col=cl)

# make a stack
EN <- stack(EN01,EN02,EN03,EN04,EN05,EN06,EN07,EN08,EN09,EN10,EN11,EN12,EN13)       #it puts all the images together

plot(EN,col=cl)         # same effects as using \par()\ and creating a list of plots 

# RGB
plotRGB(EN, red=EN13, green=EN13, blue=EN01, stretch="lin")
                      
dev.off()
boxplot(EN,horizontal=T,axes=T,outline=F)       # let's us see the value distribution, the mean and the max values
