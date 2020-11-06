# R code for plotting the relationship among ecological variables.

# every function in R searhc for the argument, in this case is the name of the package.
install.packages ("sp")

# library = require
library(sp)

# looking at data
data(meuse)

# look inside the set
meuse

# Better looking
View(meuse)

#see the first part of the table
head(meuse)
View(head(meuse))

# Mean of all the variable
summary(meuse)

# Excercis: plot zinc (y) against cadmium (x)
# error
plot (cadmium, zinc) --> object not found
plot (meuse$cadmium, meuse$zinc)

# Rather than using the dollar we can use the function: attach
attach(meuse)
plot(cadmium, zinc)

# How to impress your supervisor
# Want to see the correlation between all of the elements
# Trivial way: plot all the possible interaction
# Smart solution: pairs function: scatterplot matricies
pairs(meuse)

#Questions!
# Pairing only the elements part of the dataset
# Only with cadmium, copper, lead, zinc






