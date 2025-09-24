####################################################################################################
##########     Session 1: R Fundamentals | Guided     ##############################################
####################################################################################################

# Welcome to our first session on Python!
# In this sessions you will learn R fundamentals, including:
# - RStudio IDE
# - Basic operations
# - Data types
# - Variables
# - Vectors
# - Lists
# - Functions
# - Conditional statements
# - Loops
# - Coding challenges

# Lesson on best practice: ALWAYS comment your code

# ---------- RStudio IDE ---------------------------------------------------------------------------

# code is executed in the console (below)
# code can be sent from the Editor to the console via Ctrl+Enter (line-by-line, or selected text)
# environment (collection of named objects) viewable on the top right
# environment can be cleared via broomstick buttom
# working directory listed at top of the console
# file explorer available bottom right
# plots (static or dynamic) we create appear bottom right
# package management available bottom right
# help/documentation viewable bottom right
# settings can be changed via Tools > Global options..

# ---------- BASIC OPERATIONS ----------------------------------------------------------------------

# ----- R is like a very fancy calculator

# Basic operations


# ---------- DATA TYPES ----------------------------------------------------------------------------

# ----- R has a variety of built-in data types

# numeric


# integer


# character


# logical

# Date

# datetime (POSIX)

# there are a few more data types, but these are the most common ones
# dates and datetimes will be covered in more detail in Session 3

# ----- Type testing

# R has built-in functions to test whether objects are specific data types

# ----- Type conversion

# R has built-in functions for data type conversion

# convert to character type

# convert to numeric type
   
# convert to integer type

# convert to logical type

# conversions to and from dates and datetimes will be covered in session 3

 
# ---------- OBJECT ASSIGNMENT ---------------------------------------------------------------------

# In R, we use either the <- operator or (less commonly) = operator for to assign objects to their names

# !NB! Object names are SUPER important. They:
#   - should be meaningful
#   - should not also be the name of an in-built function, variable, data type etc
#   - can't start with a number
#   - can't contain symbols other than _ and .
        
# creating variables

# over-write an existing variable

# variable names that start with a . don't display in the Environment


# ---------- VECTORS -------------------------------------------------------------------------------

# Vectors are one-dimensional collections of data 
# The data each vector contains must be of the same data type
# They are a fundamental building block of the R language

# ----- Creating vectors

# explicitly, using c()

# using purpose-built functions

# random 

# built-in vectors

# ----- Vector properties

        
# ----- Indexing vectors

# extract elements from vectors by indexing them, using square brackets
# !NB! indexing in R starts from 1
       
# create a vector to use for this section

# extract the first element

# extract the first two elements

# extract a custom collection of elements

# extract all elements except the fourth element

# extract the last element
        
# ----- Appending & extending vectors

# vectors can be added to using c()

# many R functions are 'vectorised', ie if they're given a vector as input, they act on each element of the vector
# note that is different behaviour to Python, where list comprehensions are needed to act on each element of a list

# some R functions take a vector as input and return a single element

# ----- Named vectors

# supply element names during vector creation
        
# supply names to an existing vector

# extract elements from a named vector using element names

# ----- sort and order vectors


# ---------- LISTS ---------------------------------------------------------------------------------

# Lists are a lot more flexible, but less concise, than vectors
# Each list element can be a different data type
# A list element can be a vector, or even another list

# ----- create lists

# ----- Indexing lists

# create list to index

# List elements can be directly accessed using [[double square brackets]]

# List elements can be accessed as lists using [square brackets]

# ---------- FUNCTIONS -----------------------------------------------------------------------------

# ----- Built-in functions

# we've already come across many built-in functions in R, such as sin(), exp(), sqrt(), class(), is.integer(), 
# as.character(), seq(), rep(), setNames(), sort(), order()

# bring up documentation for built-in functions by searching in Help viewer, selecting a function + F1, or using ?

# named function arguments can be provided in any order

# if you don't provide argument names, the order will be determined by the way the function was written

# many function arguments have default values pre-defined

# some functions don't have default value pre-defined, and they need explicitly defining

# ----- Custom functions

# You can define your own functions in R using function() 

# define function that cubes a number (raises it to the power of 3)

# define function that calculates a percentage change between two numbers

# define function that checks if the input is even, and supply default value

# ---------- CONDITIONAL STATEMENTS ----------------------------------------------------------------

# use == != < > <= >= != to test statements for truth

# IF statements: execute main code only if the statement in (brackets) returns TRUE

# add else clause

# more helpful example with better structure:

# add else if clause(s)
  
# ---------- LOOPS ---------------------------------------------------------------------------------

# R provides for and while loops for iteration
        
# ----- For loops 

# For loops iterate through sequences

# print out first 10 square numbers

# print out first 10 cube numbers, with index info

# print each element of the line vector

# ----- While loops

# while loops execute the body of the code while some condition remains satisfied

# a while loop to count down from 5 

# ----- lapply family

# the lapply family of functions act similarly to Python's list comprehensions
# ie they are a concise way to apply functions to a vector or list

# get the square root of numbers 1:4 (use built-in function)

# cube the numbers 1:4 (use custom function)

# get the fourth power of the numbers 1:4 (define a function on-the-fly)

# --------------------------------------------------------------------------------------------------
# ---------- CODING CHALLENGES ---------------------------------------------------------------------
# --------------------------------------------------------------------------------------------------

# --- Challenge 1
# Create a function that reverses the order of the elements in a vector.


# --- Challenge 2
# Create a mini-game where the user enters names of their friends. 
# Shuffle the list and then return a pair of friends who are designated as "Secret Santa" for each other.


# --- Challenge 3
# In a magical world, candies are sorted not by their flavor but by the number of letters in their name.
# Create a function that sorts a list of candies based on their name length.


# --- Challenge 4
# Fizz-buzz challenge
# Print the numbers from 1-100, but replace factors of 3 with the word 'fizz', factors of 5 with the word 'buzz', and factors of both with 'fizzbuzz'


# --- Challenge 5
# A Fibonacci sequence is a series of numbers (starting with 1,2) where each number is the sum of the two numbers before it
# Write a function that returns the first N elements of the Fibonacci sequence


# --- Challenge 6 
# Create a list of recipes, where each element is a named list:
# The name is the name of the recipe, and the vale is a list consisting of a vector of ingredients, a vector of their quantities, and a vector of their units


# --- Challenge 7
# Bananagrams is a game where you need at least 2 players, because you respond to other player's actions
# You have no friends, so write some code that mimics the random actions of the other players:
#    On repeat, until the game ends, make R play a sound at random, every 2-30 seconds
#    The sound can represent the PEEL action of the other player, or (using a different sound) the GAME END
#    The PEEL action should be 50x more frequent than the GAME END action
# HINT: Look up the documentation for the Sys.sleep() function
# HINT: Install the package beepr and look at the help for the function beep()

