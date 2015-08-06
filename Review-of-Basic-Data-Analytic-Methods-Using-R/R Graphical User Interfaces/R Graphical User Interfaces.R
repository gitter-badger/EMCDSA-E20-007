setwd("C:/Users/Sri/Documents/GitHub/RWD/EMCDSA-E20-007/Review-of-Basic-Data-Analytic-Methods-Using-R/R Graphical User Interfaces")
?lm #for help on the function
help(lm) #for help on the function
x <- 563
edit(name = x) # editor open up; we can change a copy of that value or edit with assign into another object called y just like change 563 to y=563645, then if you return y same value displayed
x
fix(x) #fix function directly change the value of x on the editor itself if we made modifications
x
y
x
save.image()
# load.image() will not work bcz, still .Rdata not stored as in working directory, after we closing first time it will ask to save the .Rdata then next onwards we can load that image
#rm(list = ls())
#load.image("C:/Users/Sri/Documents/GitHub/RWD/EMCDSA-E20-007/Review-of-Basic-Data-Analytic-Methods-Using-R/R Graphical User Interfaces/.RData")
x <- 1:10
y <- runif(5)
f <- function(x){ x^2 }
save.image("C:/Users/Sri/Documents/GitHub/RWD/EMCDSA-E20-007/Review-of-Basic-Data-Analytic-Methods-Using-R/R Graphical User Interfaces/file_name.RData")
load.image("C:/Users/Sri/Documents/GitHub/RWD/EMCDSA-E20-007/Review-of-Basic-Data-Analytic-Methods-Using-R/R Graphical User Interfaces/file_name.RData")
load("C:/Users/Sri/Documents/GitHub/RWD/EMCDSA-E20-007/Review-of-Basic-Data-Analytic-Methods-Using-R/R Graphical User Interfaces/file_name.RData")
