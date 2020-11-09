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

########################################################################

# Lecture 2

# Excercise:
    Recall the package sp, recall the dataset meuse

library(sp)
data(meuse)
pairs(meuse)

head(meuse)

# cadmium, copper, lead, zinc
# pairs with soil variables
#from colimn 3 to column 6
pairs(meuse [2:5])

# How not to count? Use the names of the columns:
pairs(~ cadmium+copper+lead+zinc, data=meuse)

# Let's prettify the graph
# Exercise: change the colour
pairs(~ cadmium+copper+lead+zinc, data=meuse, col='red')

# For the future change colours of single panle by the par() function

# Exercise 2: change the symbol to filled triangles
pairs(~ cadmium+copper+lead+zinc, data=meuse, col='red', pch=17)

# Exercise 3: increase the size of the triangles
pairs(~ cadmium+copper+lead+zinc, data=meuse, col='red', pch=17, cex=5)










