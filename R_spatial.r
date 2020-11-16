# R spatial

# Recall sp package
library(sp)
data(meuse)
head(meuse)

# Stating the coordinates
# the ~ groups stuff together

coordinates(meuse) = ~ x+y 

# We have explained the coordinates so we can see the plot in space
plot(meuse)

# How zinc is spread in space --> spplot function, the column is in ""
spplot(meuse, "zinc")

# All of the west part has higher values, while the east part has lower value. 
# Let's make the plot of zinc
spplot(meuse, "zinc", main="Zinc concentration")

# Exercise: plot the spatial amount of copper
spplot(meuse, "copper", main="Copper concentration")
# Also for copper the West values are higher

# Exercise: see copper and zinc
# array = set of objects (like we did for primates)

spplot(meuse, c("copper", "zinc"))

??? Could I make a list, so then I can just use that and it's fixed there ???

# Rather than colours, let's use bubbles
bubble(meuse, "zinc")

# Bubble for lead
bubble(meuse, "lead")

# Changing the colour
bubble(meuse, "lead", col='blue')

----------------------------------------------------------------------------------------------

##### Installing ggplot2
install.packages("ggplot2")

library(ggplot2)

# Let's build a new dataframe
# Biofuel: the amount of energy (J) that ca be produced
biofuels <- c(120, 200, 350, 570, 750) # array of values: c

# The higher the biofuels the higher the oxydative power of the reaction (amount of bacteria in a certain sample)
oxydative <- c(1200, 1300, 21000, 34000, 50000)

# Dataframe
d <- data.frame(biofuels, oxydative)
d

# Points
ggplot(d, aes(x=biofuels, y=oxydative)) + geom_point(col='red', size=2)

# Lines
ggplot(d, aes(x=biofuels, y=oxydative)) + geom_line()

# Points + Lines
ggplot(d, aes(x=biofuels, y=oxydative)) +  geom_point(col='red', size=2) + geom_line()

# Polygons
ggplot(d, aes(x=biofuels, y=oxydative)) + geom_polygon()


#### Import data from an external source

setwd("~/Lab/")
covid <- read.table("covid_agg.csv",header=TRUE)
covid




