
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
  
