# Point pattern analysis

install.packages("spatstat")
library(spatstat)

setwd("~/Lab/")
covid <- read.table("covid_agg.csv",header=TRUE)  ## TRUE: to start data from the secondr raw. If it is false it starts from the beginning
covid

# Let's see the density of covid data
# Let's make a planar point pattern in spatstat

# We have to attach the dataset
attach(covid)

# Then we can plot
ppp(
