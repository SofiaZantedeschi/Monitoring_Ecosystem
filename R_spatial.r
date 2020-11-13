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

