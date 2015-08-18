
setwd("C:/Users/Sri/Documents/GitHub/RWD/EMCDSA-E20-007/Review-of-Basic-Data-Analytic-Methods-Using-R/Introduction-to-R")
########Introduction to R##############
#import a CSV file of the totatl annaual sales for each customer
sales <- read.csv("yearly_sales.csv") 
#examin the imported data set
head(sales) 
summary(sales)
str(sales)
#plot number of orders vs sales
plot(sales$num_of_orders,sales$sales_total,main = "Number of Orders vs Sales")
#perform statistical analysis (fit a linear regression model)
results <- lm(sales$sales_total ~ sales$num_of_orders)
results
summary(results)
attributes(results)
#perform some diagnostics on the fittered model
#plot histogram of the residuals
hist(results$residuals,breaks = 800)
#########R Graphical User Interfaces##############
?lm #for help on the function
help(lm) #for help on the function
# x <- 563
# edit(name = x) # editor open up; we can change a copy of that value or edit with assign into another object called y just like change 563 to y=563645, then if you return y same value displayed
# x
# fix(x) #fix function directly change the value of x on the editor itself if we made modifications
# x
# #y  # we can un comment after if using y in the above editor as copy variable
# x
# save.image()
######Data Import and Export###############
sales <- read.csv("yearly_sales.csv")
#View(sales)
#read.table and read.delim are intended to import other common file types such as .TXT, these also can use to import .CSV files as follow
sales_table <- read.table("yearly_sales.csv",header = TRUE,sep = ",")
#View(sales_table)
sales_delim <- read.delim("yearly_sales.csv",sep = ",")
#View(sales_delim)
#read.table and read.delim are intended to import other common file types such as .TXT
sales_table_txt <- read.table("yearly_sales.txt",header = TRUE,sep = ",")
#View(sales_table_txt)
sales_delim_txt <- read.delim("yearly_sales.txt",sep = ",")
#View(sales_delim_txt)
#The main difference between these import functions is the default values
# read.delim() expects the column separator to be a ("\t") 
#in the event that the numberic data in a data file uses a comma for the decimal
#Below are the default arguements for the functions
# Function	          Header 	   Separator	   Decimal Point
# read.table()	      FALSE	     ""	           "."
# read.csv()	        TRUE	     ","	         "."
# read.csv2()	        TRUE	     ";"	         ","
# read.delim()	      TRUE	     "\t"	         "."
# read.delim2()	      TRUE	     "\t"	         ","
# sales_delim2_txt <- read.delim2("yearly_sales_tab_delimited.txt",sep = ",")
# View(sales_delim2_txt)
# 
# sales_delim3_txt <- read.delim2("yearly_sales.txt",sep = ",")
# View(sales_delim3_txt)

##########data exporting using write.table(), write.csv(), write.csv2()############
#add a column for the average sales per order
sales$per_order <- sales$sales_total/sales$num_of_orders
#export data as tab delimited with out the row names
write.table(sales,"sales_modified.txt",sep = "\t",row.names = FALSE)
# write.table(sales,"yearly_sales.csv",sep = "\t",row.names = TRUE)
yearly_sales_exported_data <- read.csv("yearly_sales.csv")
#to write modified values into same table as last column
write.csv(sales,"yearly_sales.csv")
########read data from #DBMS (MySQL, Oracle, SQL server, PostgreSQL), 
#usefull packages are DBI and RODBC  
#install.packages("RODBC")
#library(RODBC) #loads the package inot the R workspace
#conn <- odbcConnect("training2",uid = "user",pwd = "password")
#the connector needs to be present to submit a SQL query to an ODBC database
#by using a sqlQuery() function from RODBC package
#following is to retreives specific columns from housing table , for household 
#income (hinc) is greater than  $1,000,000
#housing_data <- sqlQuery(conn, "select seriano, state, persons, rooms from housing where hinc>1000000")
#head(housing_data)
#######more information on export and import found on below link and how to import datasets from
#statistical software packages including Minitab, SAS,SPSS########
#https://cran.r-project.org/doc/manuals/r-release/R-data.html
########plots can also be saved using R code ###########
# save file as jpg
jpeg(filename = "sales_hist.jpeg")
hist(sales$num_of_orders)
dev.off()
# save file as png
png(filename="sales_hist.png") 
hist(sales$num_of_orders, breaks=50)
dev.off()
# save file as PDF
pdf(file = "sales_hist.pdf") # here filename argument doesn't exist in pdf function
hist(sales$num_of_orders, breaks=25)
dev.off()

###########Attribute and Data Types##########
#Numeric, character and Logical data types
i <- 1                #creates a numeric variable
sport <- "football"   #creates a character variable 
flag <- TRUE          #creates a logical variable 

#class() represents the abstract class of an object
# The class of a variable is a "high level" classification, and it captures psychologically 
#(or statistically) meaningful distinctions. For instance "2011-09-12" and "my birthday" are both text strings,
# but there's an important difference between the two: one of them is a date. So it would be nice
# if we could get R to recognise that "2011-09-12" is a date, and allow us to do things like add or
# subtract from it. The class of a variable is what R uses to keep track of things like that. Because
# the class of a variable is critical for determining what R can or can't do with it, the class() function
# is very handy

#typeof() determines the way an object is sotred in memory
#The type of a variable is a very low level classification.
#this is where you can see the distinction between integer data,
# double precision numeric, etc. 

#mode() refers to the format of the information that the variable stores
#It tells you whether R has stored text data or numeric data
#It can be useful to know about, but it's not the main thing we care about. 
i <- 12.36

class(i)
typeof(i)
mode(i)

class(sport)
typeof(sport)
mode(sport)

class(flag)
typeof(flag)
mode(flag)

is.integer(i)
j <- as.integer(i)
class(j)
typeof(j)
mode(j)

i <- 1+0i
class(i)

#test whether variable is an integer or not
is.integer(i)
#returns FALSE
#coerce i into a new integer variable j using as.integer()
j <- as.integer(i)
is.integer(j)
#returns TRUE

#length() function reveals that the created variables each have a lenghth 1
length(i) #returns 1
length(flag) #returns 1
a <- 1:10
length(a)
length(sport) #returns 1 (not 8 for "football") 

######## Vectors ###################

#vector can be tested by is.vector() function
is.vector(i)
is.vector(flag)
is.vector(sport)
#a vector can be created using c() function or the colon operator :
u <- c("red", "yellow", "blue")
u
u[1]
v <- 1:5
v
sum(v)
w <- v*2
w
w[3]
z <- v + w
z
# below code explains how z vector logical comparisons can be built to extract certain elements of a given vector  
z > 8 # returns FALSE FALSE  TRUE  TRUE  TRUE
z[z > 8] #returns 9 12 15
z[z > 8 | z <5 ]  #returns 3  9 12 15
#sometimes it is necessary to initialize a vector of a specific lenghth and then populate
#the content of the vector later. the vector() function, by default creates a logical
#vector 
a <- vector(length = 3) #creates a logical vector of length 3
a #returns FALSE FALSE FALSE
b <- vector(mode = "numeric", 3)
b #returns 0 0 0
typeof(b) #returns "double"
b[2] <- 3.1
b #returns 0.0 3.1 0.0
c <- vector(mode = "integer", 0) #create an integer vector of length 0
c #returns integer(0)
length(c)  #returns 0
# although vectors may appear to be analogous to arrays
#of one dimension, they are technically dimensionless, as
#seen in the following R code. the concept of arrays and matrces
#is adressed in the following discussion
length(b) #returns 3
dim(b) #returns NULL (an undefined value)

version # checkout for R version new version R i386 3.2.2 installed

# a small experiment how it works if we added number to logical vector
a <- vector(length = 3) #creates a logical vector of length 3
a #returns FALSE FALSE FALSE
a[2] <- 3.1
a # returns 0.0 3.1 0.0

############Arrays and Mattices ####################

# Array() function can be used to restructure a vector as an array.
#here 3 dimensional array to hold the quarterly sales for three regions over a two-year period
#and then assign the sales amount of $158,000 to the second region for the first quarter of the first year

quarterly_sales <- array(0,dim = c(3,4,2))
quarterly_sales[2,1,1] <- 158000
quarterly_sales
quarterly_sales[, , 1]
quarterly_sales[, , 2] 

#normal creation of array
a <- 1:20
dim(a) <- c(4,5) # assign dimentions as 4 rows and 5 columns
a
#using array function with series of values
a <- array(1:20,dim = c(4,5))
a
#using array function with single value repetition (recycle)
a <- array(0,dim = 4:5)
a
#give direct total values in a vector and dimension
i <- array(c(1,2,1,2),dim = c(2,2))
i
a[i]
a <- array(1:20,dim = c(4,5))
a
a[i]
########## array manipulations ###########
#let's say
a
b <- a
b
#multiplication
c<-a*b
#addition
a+b
#subtract
b-a
#transpose a matrix
a
b
b <- t(a)
b
a
#diagonal matrix of a
diag(a)
#eigenvalues of matrix
#eigen(a) #error: bcz its not a square matrix

#so for that we are making as square by taking dim as 4x4
a <- array(1:20, dim = c(4,4))
a
eigen(a)
