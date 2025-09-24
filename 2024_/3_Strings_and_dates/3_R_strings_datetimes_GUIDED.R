####################################################################################################
##########     Session 3: Strings & Datetimes | Completed     ######################################
####################################################################################################

# Welcome to our third R session!

# In this sessions you will learn how to work with strings, dates and datetimes in R, including:
# - string basics
# - splitting strings
# - searching within strings
# - replacing within strings
# - dates basics
# - datetimes basics
# - coding challenges

# ----------  SETUP --------------------------------------------------------------------------------

# set working directory to location of this script
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# load data we'll work with later

# ---------- STRING BASICS -------------------------------------------------------------------------

# define some character vectors


# convert to upper/lower case


# concatenate strings


# get length of a string


# ---------- SPLITTING STRINGS ---------------------------------------------------------------------

# split strings at a pre-defined delimiter


# count the number of words in each gradute's name


# count the number of letters in each gradute's names


# ---------- SEARCHING WITHIN STRINGS --------------------------------------------------------------

# use regular expressions (regex) for pattern matching
# visit https://www.regular-expressions.info/tutorial.html to help understand regex, and https://regex101.com/ for testing

# bring up documentation for clarity


# return logical vector of matches


# return numeric vector of matching indices


# filter rows of game_data where Name column contains a number


# get details of when pattern matches occur within string


# return the part that matches


# ---------- REPLACING WITHIN STRINGS --------------------------------------------------------------

# replace characters in strings


# replace only the first occurrence (per vector element)


# remove commas from game names 


# replace anything after the colon in game names


# ---------- DATE & DATETIMES BASICS -------------------------------------------------------------------------

# current date


# class is Date


# under the hood, dates stored as integers (days since 1 Jan 1970)


# some date properties available through base R functions


# extracting parts of date using % strings
# full list of options available in ?strptime documentation


# constructing date from string


# constructing date from number



# converting date to numeric


# sequence of dates / date arithmetic


# date arithmetic


# POSIXlt class dates


# extracting parts of date using POSIXlt attributes ($)



# ---------- DATETIMES -----------------------------------------------------------------------------

# Current datetime


# class is POSIXct POSIXt


# under the hood, datetimes stored as integers (seconds since 1 Jan 1970 00:00:00)


# get day of week


# extracting parts of datetimes using % strings
# full list of options available in ?strptime documentation


# constructing datetime from string


# constructing datetime from number


# converting datetime to numeric


# sequence of dates / date arithmetic


# datetime arithmetic


# POSIXlt class dates


# extracting parts of date using POSIXlt attributes ($)




# --------------------------------------------------------------------------------------------------
# ---------- CODING CHALLENGES ---------------------------------------------------------------------
# --------------------------------------------------------------------------------------------------

# Challenge 1
# Create a filtered dataset that has all the games containing 'Crash Bandicoot'


# Challenge 2
# Write a regex pattern that matches any 4-digit year sequence in the 'Name' column. 
# For instance, it should be able to find "2003" in "Backyard NBA Basketball 2003".


# Challenge 3
# Write a regex pattern that matches abbreviations for platforms such as "PS2", "SAT", "PS", etc. 
# The pattern should be general enough to capture any two-to-four letter uppercase abbreviations.


# Challenge 4
# Write a regex pattern that matches genres that end with "ing", like "Fighting", "Racing", and "Shooting".


# Challenge 5
# Write a regex pattern that captures game titles with a sequel number at the end, e.g., "San Goku Shi V". 
# It should capture both the game name and the sequel number separately.


# Challenge 6
# Convert the date column into datetime in the format yyyy-mm-dd
         
                                 
# Challange 7
# write a function that takes a vector of strings, and produces a single string made up of the elements listed out, 
# separated by commas, except the last item which is separated by 'and'


# Challenge 8
# write a function (using only base R functions) that returns the part of the text that has been pattern matched
                                          
                                          
                                          
                                          
                                          