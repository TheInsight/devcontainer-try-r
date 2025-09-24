####################################################################################################
##########     Session 1: R Fundamentals | Completed     ###########################################
####################################################################################################

# Welcome to our second session on R!
# In this sessions you will learn the fundamentals of working with data tables in base R and data.table, including:
# - data setup
# - data exploration
# - indexing
# - column manipulation
# - joining
# - missing values
# - missing columns
# - ordering
# - grouping
# - re-shaping
# - coding challenges

# ---------- DATA SETUP ----------------------------------------------------------------------------

# check the location of the working directory
getwd()
# or look at the filepath at the top of the console

# set working directory
setwd(dirname(rstudioapi::getActiveDocumentContext()$path)) #to location of this script
setwd("~/Library/Mobile Documents/com~apple~CloudDocs/Code/ONETFL R TRAINING/2_Dataframes_Intro") #using explicit filepath 
# or use Session > Set Working Directory

# load datasets from csv files
game_data <- read.csv('games_info.csv',stringsAsFactors=F)
game_sales_only <- read.csv('games_sales.csv',stringsAsFactors=F)
# specifying stringsAsFactors=F tells R not to automatically convert character columns to factors
# factors are less flexible versions of characters: they only allow a specific set of values

# ---------- DATA EXPLORATION ----------------------------------------------------------------------

# view data
game_data #tries to print out all rows (stops after getOption('max.print'))
head(game_data)
View(game_data)
# or click on the object in the Environment pane
# or Ctrl+click on the object name anywhere in the Editor

# notice that there are 'N/A' values in the Year column: these are being read in as the string 'N/A' and not true NA values
# re-read the data in, specifying that this value ('N/A') should be taken to mean NA
game_data <- read.csv('games_info.csv',stringsAsFactors=F,na.strings='N/A')

# let's have a quick look at game_sales_only
head(game_sales_only,n=3)

# properties of a data frame
dim(game_data)
nrow(game_data)
ncol(game_data)
names(game_data)
summary(game_data)

# object types
class(game_data) #data.frame is the base R object type for data tables
typeof(game_data) #data.frames are actually lists, under the hood 
# (each list element is a column, with element names as column names, and element values as vectors containing the vector values)
class(game_data$Name) #each column is a vector, so this returns the type of data within each vector element

# ---------- INDEXING  -----------------------------------------------------------------------------

# we can access rows of the data using square brackets [row_selection,]
game_data[1,] #first row
game_data[1:20,] #first 20 rows
game_data[nrow(game_data),] #last row
game_data[c(17,300,1003),] #17th, 300th and 1003rd rows
game_data_sample <- game_data[sample(x=1:nrow(game_data),size=6,replace=F),] #random 6 rows

# we can access columns of the data using $ or square brackets [,column_selection] by providing a numeric, logical or named vector
game_data_sample$Name #extract the Name column
game_data_sample[,1] #extract the first column
game_data_sample[,'Name'] #extract the Name column
game_data_sample[['Name']] #extract the list (data.frame) element called 'Name'
game_data_sample[,c(3,4)] #third and fourth columns
game_data_sample[,c('Year','Genre')] #columns called 'Year' and 'Genre'
game_data_sample[,!c(F,T,F,F,F,F,F)] #???

# row and column indexing simultaneously
game_data_sample[1,2] #first row, second column
game_data_sample[4,'Name'] #fourth row, 'Name' column
game_data_sample$Name[4] #fourth value of the 'Name' column (vector)

# filter rows based on conditions (eg games with European sales greater than a certain threshold)
game_sales_only[game_sales_only$EU_Sales>9,] #this is indexing by providing a logical vector 

# ---------- COLUMN MANIPULATION -------------------------------------------------------------------

# ----- creating new columns

# create new column, constant value
game_data_sample$dummy_column <- 10 
game_data_sample

# create new column, bespoke values
game_data_sample$dummy_column2 <- c(134,543,453,43,2,2)
game_data_sample

# create new column from existing columns
game_sales_only$Global_Sales <- game_sales_only$NA_Sales + game_sales_only$EU_Sales + game_sales_only$JP_Sales + game_sales_only$Other_Sales
head(game_sales_only)

# in all cases, columns are created by providing a vector of the length of the data.frame (or shorter vectors are recycled)

# create new column, recycling values
game_data_sample$dummy_column3 <- c(0,1) #2 fits nicely into 6, so this works
game_data_sample
game_data_sample$dummy_column4 <- c(0,1,2,3) #4 doesn't fit nicely into 6, so this gives an error

# create new column, conditional on values in other columns
game_data[game_data$Platform %in% c('X360','XB','XOne'),'XBOX'] <- TRUE
game_data[!(game_data$Platform %in% c('X360','XB','XOne')),'XBOX'] <- FALSE

# ----- removing columns

# one at a time
game_data$XBOX <- NULL

# a few at once
game_data_sample <- game_data_sample[,-c(2,3)]
game_data_sample <- game_data_sample[,!(names(game_data_sample) %in% c('dummy_column','dummy_column2','dummy_column3'))]

# re-naming columns
names(game_data_sample)
names(game_data_sample)[names(game_data_sample)=='Date'] <- 'DATE'
names(game_data_sample)
names(game_data_sample)[names(game_data_sample)%in%c('Date','Publisher')] <- c('DATE','PUBLISHER')
names(game_data_sample)
names(game_data_sample) <- toupper(names(game_data_sample))

# ---------- JOINING -------------------------------------------------------------------------------

# inner join game_data with game_sales_only using the 'ID' column
# call it something meaningful! calling it 'df', 'table', t etc is bad practice!
game_data_all <- merge(game_data,game_sales_only,by='ID',all.x=F,all.y=F)
head(game_data_all)
# the type of join (inner/left/right/full) is determined by the all.x and all.y values

# check for missing values
is.na(game_data_all) #tests every single element for NA
sum(is.na(game_data_all)) #returns the number of NA values in the data.frame

# replace missing values
game_data_all[is.na(game_data_all)] <- 0 #for the whole data.frame
game_data_all$EU_Sales[is.na(game_data_all$EU_Sales)] <- 0 #for a single column
head(game_data_all)

# ---------- INTRO TO THE data.table PACKAGE -------------------------------------------------------
 
# install the package (from the internet, onto your OneLondon profile)
# note you only need to do this once, until it needs updating, so this wouldn't normally be part of an .R script
install.packages('data.table')

# load the package (into this R session)
library(data.table)

# read data
game_data_dt <- fread('games_info.csv')
game_sales_only_dt <- fread('games_sales.csv')
# note no need to specify stringsAsFactors=F, this is the default value

# view data
game_data_dt #prints first 5 and last 5 rows by default 

# object types
class(game_data_dt) #the object is a data.table AND a data.frame
typeof(game_data_dt) #data.tables are also actually lists, under the hood 

# we access rows of the data using square brackets [row_selection] (no need for comma)
game_data_dt[1] #first row
game_data_dt[1:20] #first 20 rows
game_data_dt[nrow(game_data_dt)] #last row
game_data_dt[c(17,300,1003)] #17th, 300th and 1003rd rows

# as well as all the ways of accessing a data.frame's columns (above), data.table allows simpler syntax
game_data_dt[,Name] #note this returns a vector
game_data_dt[,list(Name,Platform,Year)]
game_data_dt[,.(Name,Platform,Year)] #this is shorthand for the above (list)
game_data_dt[,c('Name','Platform','Year')] 
game_data_dt[,2]
game_data_dt[,c(2,3)]

# filter rows based on conditions (eg games with European sales greater than a certain threshold)
game_sales_only_dt[EU_Sales>9] #much more concise!

# create new column, constant value
game_data_dt[,dummy_column:=10] 
game_data_dt
# the := operator means we are editing the data.table IN PLACE
# ie we don't need to use <- to re-assign this to itself as we normally do
# this is very fast computing and is where data.table excels

# create new column from existing columns
game_sales_only_dt[,Global_Sales := NA_Sales + EU_Sales + JP_Sales + Other_Sales] #SO much more concise!
head(game_sales_only_dt)

# create new column, conditional on values in other columns
#   using indexing
game_data_dt[Platform %in% c('X360','XB','XOne'),XBOX:= TRUE]
game_data_dt[!(Platform %in% c('X360','XB','XOne')),XBOX:= FALSE]
#   using fifelse()
game_data_dt[,XBOX2:=fifelse(Platform%in%c('X360','XB','XOne'),TRUE,FALSE)]

# remove columns
game_data_dt[,c('dummy_column','XBOX','XBOX2'):=NULL]

# join our two data.tables together
game_data_all_dt <- merge(game_data_dt,game_sales_only_dt,by='ID',all.x=F,all.y=F) #base R syntax
game_data_dt[game_sales_only_dt,on='ID'] #data.table syntax


# ---------- ORDERING ------------------------------------------------------------------------------

# order rows of game data data.frame by 'Global_Sales' (provide ordering vector)
game_data_all = game_data_all[order(game_data_all$Global_Sales),]
head(game_data_all,10)
game_data_all = game_data_all[-order(game_data_all$Global_Sales),]
head(game_data_all,10)
game_data_all = game_data_all[order(game_data_all$Global_Sales,game_data_all$Name),]
head(game_data_all,20)

# re-order the columns
game_data_all <- game_data_all[,c("Platform","Name","ID","Year","Genre","Publisher","Date","XBOX","NA_Sales","EU_Sales","JP_Sales","Other_Sales","Global_Sales")]

# ----- using data.table

# re-order rows, by providing ordering vector
game_data_all_dt <- game_data_all_dt[order(Global_Sales)]
game_data_all_dt <- game_data_all_dt[order(Global_Sales,Name)]

# re-order rows, by setting order in place
setorder(game_data_all_dt,Global_Sales,Name)
setorder(game_data_all_dt,Global_Sales_Name)

# re-order columns, by listing them out (note that you can also re-name them in this way)
game_data_all_dt <- game_data_all_dt[,.(Console=Platform,Name,ID,Year,Genre,Publisher,Date,NA_Sales,EU_Sales,JP_Sales,Other_Sales,Global_Sales)]

# re-order columns, by setting order in place
setcolorder(game_data_all_dt,neworder=c('Name','ID','Year')) #note that the un-named columns don't get removed


# ---------- GROUPING ------------------------------------------------------------------------------

# grouping is so much easier in data.table than in base R that for grouping we will focus on data.table only

# the fundamental syntax for a data.table is data.table[rows,columns,grouping]

# get unique values in a column
game_data_all_dt[,unique(Console)]
unique(game_data_all_dt[,Console])

# get unique combinations of column values
publishers_and_platforms <- unique(game_data_all_dt[,.(Publisher,Console)])[order(Publisher,Console)]

# how many games get published to each Publisher//Console combination?
game_data_all_dt[,.N,.(Publisher,Console)]

# find the average global sales per year 
grouped_game_data_dt <- game_data_all_dt[,.(Avg_Global_Sales=mean(Global_Sales)),Year]
grouped_game_data_dt

# find the max EU sales for each platform in 2000 
game_data_all_dt[Year==2000,.(Max_EU_Sales=max(EU_Sales)),Console]

# ..and which game was that for?
game_data_all_dt[Year==2000,.(Max_EU_Sales=max(EU_Sales),GameWithMaxEUSales=Name[which.max(EU_Sales)]),Console]
# spotcheck
game_data_all_dt[Year==2000 & Console=='GB',.(EU_Sales,Name)]

# rank games per year based on global sales
game_data_all_dt[,Rank_Per_Year:=order(Global_Sales),.(Year)]
game_data_all_dt

# ---------- RESHAPING -----------------------------------------------------------------------------

# re-shape from wide to long format
# ie make the different sales values be in different rows, rather than in different columns
game_data_all_dt_long <- melt(game_data_all_dt,
                              measure.vars=c('NA_Sales','EU_Sales','JP_Sales','Other_Sales','Global_Sales'),
                              variable.name='Continent',
                              value.name='Sales')

# re-shape from long to wide format
# ie put it back the way it was
game_data_all_dt_wide <- dcast(game_data_all_dt_long,
                               Name+ID+Year+Console+Genre+Publisher+Date ~ Continent,
                               value.var='Sales')
  
# --------------------------------------------------------------------------------------------------
# ---------- CODING CHALLENGES ---------------------------------------------------------------------
# --------------------------------------------------------------------------------------------------

# ----- Challenge 1
# Count the number of unique consoles in the games data
length(unique(game_data_all_dt$Console))

# ----- Challenge 2
# Using the game_sales_only data, which has a column NA_Sales, filter out all games that had NA_Sales less than 0.3.

# using base R
game_sales_only_filtered <- game_sales_only[game_sales_only$NA_Sales>=0.3,]

# using data.table
game_sales_only_dt_filtered <- game_sales_only_dt[NA_Sales>=0.3]

# ----- Challenge 3
# In the game_sales_only data, there's a column named JP_Sales. Write a code to rename this column to Sales_in_Japan.

# using base R
names(game_sales_only)[names(game_sales_only)=='JP_Sales'] <- 'Sales_in_Japan'

# using data.table
setnames(game_sales_only_dt,old='JP_Sales',new='Sales_in_Japan')

# ----- Challenge 4
# Compute the average global sales for each console
# Which average is best to use?

# using data.table
game_data_all_dt[,.(avg_global_sales=mean(Global_Sales)),Console]
game_data_all_dt[,.(avg_global_sales=median(Global_Sales)),Console]

# ----- Challenge 5
# For each year and each console, find the game that had the highest global sales. 

# using data.table
game_data_all_dt[,.(game=Name[which.max(Global_Sales)],sales=max(Global_Sales)),.(Year,Console)]


# ----- Challenge 6
# A stakeholder is interested in understanding the gaming landscape in Japan (JPN) from 2001 to 2020. Specifically, they want to know:
# 1. Which platform had the highest total sales in JPN each year from 2001 to 2020?
# 2. What was the average sale (in JPN) of the top-selling platform for each year within that time frame?
# 3. For the platform that sold the most across these years combined, determine the year in which it had its best performance. 
#    What was the max sale for that year? Can you also highlight if the sales for this top-performing year were above the median for that year?

# using data.table

# 1
total_japan_sales <- game_data_all_dt[Year!='N/A',.(total_sales=sum(JP_Sales)),.(Console,Year)]
highest_total_sales <- total_japan_sales[Year>=2001&Year<=2020,.(Console=Console[which.max(total_sales)],max_sales=max(total_sales)),.(Year)][order(Year)]

# 2 
average_japan_sales <- game_data_all_dt[Year!='N/A',.(avg_sales=mean(JP_Sales)),.(Year,Console)]
merge(highest_total_sales,average_japan_sales,by=c('Year','Console'),all.x=T,all.y=F)

# 3
highest_selling_console <- total_japan_sales[,.(total_20yr_sales=sum(total_sales)),Console][which.max(total_20yr_sales)]
highest_selling_console <- total_japan_sales[highest_selling_console,on='Console']

