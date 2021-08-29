#### mutivar.r

# install vegan
install.packages("vegan")

## Collecting data in the field, creating a table specie per plot matrix. 
## the number of species are the coordinates.
## The species which are living together are clumped together in the plot.
## You can reduce the space and see the plot in 2D.
## Several plots 

# set working directory
setwd("~/Lab/")

# Recall the library
library(vegan)

# Permute (permutation)
# Lattice (matrix analysis)

load("biomes_multivar.RData")
ls() ## showing the files

head(biomes) ## see the first 6 plots


## first and second plot should be tmeperate forests (chestnut)
## we want to see how these species are linked together, using the number of species as coordinates.
## EX: the chestnut: 1 in the first axis, 3 in the second, 0, 0, 2, 2. 
## the higher the distance in the plot the smaller the relationship

## de... correspondence analysis
multivar <- decorana(biomes)

multivar

plot(multivar)


head(biomes_types)

## biomes names in the graph:
attach(biomes_types)
ordiellipse(multivar, type, col=c("black","red","green","blue"), kind = "ehull", lwd=3)
# or col=1:4 
## put an ellipse in the ordination (oridnaiton = multivariate analysis)
## ehull is the shape, we can use different shapes 

## 
ordispider(multivar, type, col=c("black","red","green","blue"), label = T) ## label true, it shows the main of the biomes types

## saving as pdf
pdf("multivar.pdf")
plot(multivar)
ordiellipse(multivar, type, col=c("black","red","green","blue"), kind = "ehull", lwd=3)
ordispider(multivar, type, col=c("black","red","green","blue"), label = T)
dev.off()
