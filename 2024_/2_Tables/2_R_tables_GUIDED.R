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

# or look at the filepath at the top of the console

# set working directory

# or use Session > Set Working Directory

# load datasets from csv files

# specifying stringsAsFactors=F tells R not to automatically convert character columns to factors
# factors are less flexible versions of characters: they only allow a specific set of values

# ---------- DATA EXPLORATION ----------------------------------------------------------------------

# view data

# or click on the object in the Environment pane
# or Ctrl+click on the object name anywhere in the Editor

# notice that there are 'N/A' values in the Year column: these are being read in as the string 'N/A' and not true NA values
# re-read the data in, specifying that this value ('N/A') should be taken to mean NA


# let's have a quick look at game_sales_only


# properties of a data frame


# object types


# ---------- INDEXING  -----------------------------------------------------------------------------

# we can access rows of the data using square brackets [row_selection,]


# we can access columns of the data using $ or square brackets [,column_selection] by providing a numeric, logical or named vector


# row and column indexing simultaneously


# filter rows based on conditions (eg games with European sales greater than a certain threshold)


# ---------- COLUMN MANIPULATION -------------------------------------------------------------------

# ----- creating new columns

# create new column, constant value


# create new column, bespoke values


# create new column from existing columns


# in all cases, columns are created by providing a vector of the length of the data.frame (or shorter vectors are recycled)

# create new column, recycling values


# create new column, conditional on values in other columns


# ----- removing columns

# one at a time


# a few at once


# re-naming columns


# ---------- JOINING -------------------------------------------------------------------------------

# inner join game_data with game_sales_only using the 'ID' column
# call it something meaningful! calling it 'df', 'table', t etc is bad practice!

# the type of join (inner/left/right/full) is determined by the all.x and all.y values

# check for missing values


# replace missing values


# ---------- INTRO TO THE data.table PACKAGE -------------------------------------------------------

# install the package (from the internet, onto your OneLondon profile)
# note you only need to do this once, until it needs updating, so this wouldn't normally be part of an .R script


# load the package (into this R session)


# read data

# note no need to specify stringsAsFactors=F, this is the default value

# view data


# object types


# we access rows of the data using square brackets [row_selection] (no need for comma)


# as well as all the ways of accessing a data.frame's columns (above), data.table allows simpler syntax


# filter rows based on conditions (eg games with European sales greater than a certain threshold)


# create new column, constant value

# the := operator means we are editing the data.table IN PLACE
# ie we don't need to use <- to re-assign this to itself as we normally do
# this is very fast computing and is where data.table excels

# create new column from existing columns


# create new column, conditional on values in other columns
#   using indexing

#   using fifelse()


# remove columns


# join our two data.tables together



# ---------- ORDERING ------------------------------------------------------------------------------

# order rows of game data data.frame by 'Global_Sales' (provide ordering vector)


# re-order the columns


# ----- using data.table

# re-order rows, by providing ordering vector


# re-order rows, by setting order in place


# re-order columns, by listing them out (note that you can also re-name them in this way)


# re-order columns, by setting order in place



# ---------- GROUPING ------------------------------------------------------------------------------

# grouping is so much easier in data.table than in base R that for grouping we will focus on data.table only

# the fundamental syntax for a data.table is data.table[rows,columns,grouping]

# get unique values in a column


# get unique combinations of column values


# how many games get published to each Publisher//Platform combination?


# find the average global sales per year 


# find the max EU sales for each platform in 2000 

# ..and which game was that for?

# spotcheck


# rank games per year based on global sales


# ---------- RESHAPING -----------------------------------------------------------------------------

# re-shape from wide to long format
# ie make the different sales values be in different rows, rather than in different columns


# re-shape from long to wide format
# ie put it back the way it was


# --------------------------------------------------------------------------------------------------
# ---------- CODING CHALLENGES ---------------------------------------------------------------------
# --------------------------------------------------------------------------------------------------

# ----- Challenge 1
# Count the number of unique platforms in the DataFrame.

# ----- Challenge 2
# Using the game_sales_only data, which has a column NA_Sales, filter out all games that had NA_Sales less than 0.3.

# ----- Challenge 3
# In the game_sales_only data, there's a column named JPN_Sales. Write a code to rename this column to Sales_in_Japan.

# ----- Challenge 4
# Compute the average global sales for each platform.
# Which average is best to use?

# ----- Challenge 5
# For each year and each platform, find the game that had the highest global sales. 

# ----- Challenge 6
# A stakeholder is interested in understanding the gaming landscape in Japan (JPN) from 2001 to 2020. Specifically, they want to know:
# 1. Which platform had the highest total sales in JPN each year from 2001 to 2020?
# 2. What was the average sale (in JPN) of the top-selling platform for each year within that time frame?
# 3. For the platform that sold the most across these years combined, determine the year in which it had its best performance. 
#    What was the max sale for that year? Can you also highlight if the sales for this top-performing year were above the median for that year?

