# R code for multivariate analysis

#setwd("~/lab/") # "C:/lab/" ....
setwd("C:/Users/Leonardo/Desktop/Università/UNIBO/PRIMO ANNO/MONITORING ECOSYSTEMS CHANGES AND FUNCTIONING/lab")

# install.packages("vegan")
library(vegan)

load("biomes_multivar.RData")     #has all the data of the sampling of species done 20 times in different biomes

ls()

head(biomes)

# DEtrended CORrespondence ANAlysis
multivar <- decorana(biomes)       #we're gonna see the relations between the species in the dataset. The furthest the species the more different the place where they live
multivar     #we're gonna see how much variance is explained by the 4 axis of the analisys

plot(multivar) # do not close it after it has been shown!!!

# biomes types
head(biomes_types)     #we're gonna use it to build ellipse that encloses all the plots in the DCA refferring to the same biome

attach(biomes_types)

ordiellipse(multivar, type, col=c("black","red","green","blue"), kind = "ehull", lwd=3)    #we're gonna put an ellipse in the ordination (another name for multivariate analisys)
####        multivar: object on which we associate ellipses
####                  type: this argument states the column of the file "biomes_types" we will use
####                        col: we choose the colours of the ellipses
####                                                             kind: just states what kind of ellipse we want. \ehull\ means the ellipse shoudl enclose all of the plots

#now we want to include the biomes names in the graphic otherwise we can't know which ellipse refere to each biome
ordispider(multivar, type, col=c("black","red","green","blue"), label = T)        #creates a network connecting all the plots of the DCA refferring to the same biome
####                                                            label=T means that it will show the biomes type

#to export as a pdf
pdf("multivar.pdf")
plot(multivar)
ordiellipse(multivar, type, col=c("black","red","green","blue"), kind = "ehull", lwd=3)
ordispider(multivar, type, col=c("black","red","green","blue"), label = T)  
dev.off()
