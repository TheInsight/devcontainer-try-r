####################################################################################################
##########     Session 1: R Fundamentals | Completed     ###########################################
####################################################################################################

# Welcome to our first session on R!
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
6
9.0
1 + 5
10 - 5
5 * 9
72 / 8
(1-0.2)/2  #brackets
2^5 #exponent
2**4 #exponent
sqrt(9) #square root
11 %% 5 #modulo
sin(0) #trigonometry
exp(1) #e

# ---------- DATA TYPES ----------------------------------------------------------------------------

# ----- R has a variety of built-in data types

# numeric
4
4.0
class(4)
class(4.0)

# integer
4L
class(4L)

# character
'TfL'
"TfL"
class('TfL')

# logical
TRUE
T #T is short-hand for TRUE
FALSE
F #F is short-hand for FALSE
class(TRUE)

# Date
Sys.Date() #Sys.Date() is a built-in function that always returns the current date as a Date object
class(Sys.Date()) 

# datetime (POSIX)
Sys.time() #Sys.time() is a built-in function that always returns the current date and time as a datetime (POSIX) object
class(Sys.time())

# there are a few more data types, but these are the most common ones
# dates and datetimes will be covered in more detail in session 3

# ---------- missing and invalid date types

# NA is R's value for missing/unknown data (Not Available)
NA
as.numeric('TfL') #NA is often returned when R doesn't know what to do with your input

# NULL is R's value for non-existing data
NULL

# NaN is R's value for Not A Number
NaN
0/0

# Inf is R's value for infinity
Inf
50/0

# NA values can actually be of different data types
NA_character_ #returns NA, but it is specifically a character-class NA 
class(NA_character_)
NA_integer_
class(NA_integer_)

# ----- Type testing

# R has built-in functions to test whether objects are specific data types
is.integer(4L)
is.numeric(5)
is.numeric(5L) #so integer type must belong to numeric type
is.character('TfL')
is.logical(T)
is.na(NA)
is.na(NULL)
is.null(NULL)
is.null(NA)
is.nan(NaN)
is.nan(NA)
is.finite(6)
is.finite(NA)
is.finite(NULL)
is.finite(NaN)

# ----- Type conversion

# R has built-in functions for data type conversion

# convert to character type
as.character(300) #the quote marks (") around the output show that it's a string, as 
as.character(TRUE)
as.character(T) #uses long-form version of logical before conversion to text
as.character(Sys.Date()) 
as.character(Sys.time())

# convert to numeric type
as.numeric(4L) #from integer: trivial conversion
as.numeric('TfL') #from string: can't intperpret this text as number, so returns NA
as.numeric('300') #from string: can interpret this text as a number, so returns the interpreted number
as.numeric(TRUE) #from logical: TRUE is 1
as.numeric(F) #from logical: FALSE is 0
as.numeric(Sys.Date()) #from Date: converts to number of days since 1970-01-01
as.numeric(Sys.time()) #from datetime: converts to number of seconds since 1970-01-01 00:00:00
   
# convert to integer type
as.integer(4.7) #from numeric: truncates to whole number
as.integer('TfL') #from string: can't intperpret this text as an integer, so returns NA
as.integer('300') #from string: can interpret this text as an integer, so returns the interpreted integer
as.integer('300.6') #from string: first converts to numeric, then to integer via truncation
as.integer(TRUE) #from logical: TRUE is 1
as.integer(F) #from logical: FALSE is 0
as.integer(Sys.Date()) #from Date: converts to number of days since 1970-01-01
as.integer(Sys.time()) #from datetime: converts to number of seconds since 1970-01-01 00:00:00

# convert to logical type
as.logical(1L) #from integer: 1 is TRUE
as.logical(0L) #from integer: 0 is FALSE
as.logical(1) #from numeric: 1 is TRUE
as.logical(0) #from numeric: 0 is FALSE
as.logical(-1L) #actually all numeric non-zero values are TRUE..
as.logical(-2)
as.logical(3.4)

# conversions to and from dates and datetimes will be covered in session 3

 
# ---------- OBJECT ASSIGNMENT ---------------------------------------------------------------------

# In R, we use either the <- operator or (less commonly) = operator for to assign objects to their names

# !NB! Object names are SUPER important. They:
#   - should be meaningful
#   - should not also be the name of an in-built function, variable, data type etc
#   - can't start with a number
#   - can't contain symbols other than _ and .
        
# creating variables
y1 <- 50
y2 <- 60
year_on_year <- (y2-y1)/y1
year_on_year

# over-write an existing variable
y1 = 45
y2 <- y2+15
year_on_year #this value doesn't update unless it is explicitly re-defined, as below
year_on_year <- (y2-y1)/y1
year_on_year

# variable names that start with a . don't display in the Environment
.secret <- "password123"

# ---------- VECTORS -------------------------------------------------------------------------------

# Vectors are one-dimensional collections of data 
# The data each vector contains must be of the same data type
# They are a fundamental building block of the R language

# ----- Creating vectors

# explicitly, using c()
c(12,54,600) #the [1] in the output signifies that we've printed a vector
c('TfL','ULEZ','Overground','EZ')
c(TRUE,TRUE,T,FALSE,T,F)
c(1,2,3,4,T) #type conversion! c() forces all elements to be of the same data type - here all to numeric
c(3,4,5,'TfL') #type conversion! c() forces all elements to be of the same data type - here all to character
c(T,'character',45,41.1,Sys.Date()) #type conversion! c() forces all elements to be of the same data type - here all to character, with some intermediate conversion

# using purpose-built functions
1:10
seq(from=1,to=100,by=2)
rep('a',times=10)
rep(c('a','b','c'),times=2)
rep(c('a','b','c'),each=2)

# random 
sample(x=1:100,size=3,replace=F) #sample from vector of values
sample(x=c('A','B','C','D','E','F'),size=3,replace=T)
runif(5,min=30,max=40) #sample from uniform distribution
rnorm(5) #same from normal distribution
set.seed(100) #set seed to get consistent results from a random generator function

# 'blank' vectors of specific data types
integer(10)
numeric(5)
character(8)
logical(4)

# built-in vectors
letters
LETTERS
month.name
month.abb
pi

# ----- Vector properties

length(LETTERS)
class(1:10) #note that class returns the class of the vector elements, so if class() returns eg 'Character', the object is a vector
names(1:10) #this is an un-named vector: see below for named vectors
        
# ----- Indexing vectors

# extract elements from vectors by indexing them, using square brackets
# !NB! indexing in R starts from 1
       
# create a vector to use for this section
lines = c('Central', 'Victoria', 'Jubilee', 'Elizabeth','Bakerloo','Northern','Piccadilly')

# extract the first element - starts from 1 not 0 :)
lines[1]

# extract the first two elements
lines[1:2]

# extract a custom collection of elements
lines[c(1,6,7)]

# extract all elements except the fourth element
lines[-4]

# extract the last element
lines[length(lines)]
        
# ----- Appending & extending vectors

# vectors can be added to using c()
c(lines,'Circle')
c(lines,'Circle','District')
c(lines,c('Circle','District')) #vectors are one-dimensional, so can't be nested

# many R functions are 'vectorised', ie if they're given a vector as input, they act on each element of the vector
# note that is different behaviour to Python, where list comprehensions are needed to act on each element of a list
sqrt(1:10)
paste(lines,'line')
1:10 + 3
toupper(c('tfl','gla','ulez'))
nchar(c('tfl','gla','ulez'))

# some R functions take a vector as input and return a single element
sum(1:10)
mean(1:20)
min(letters)
max(lines)
paste(lines,collapse='; ') #manipulating strings will be covered in more detail in Session 3

# ----- Named vectors

# supply element names during vector creation
c('name'='Waterloo & City', 'colour'='turquoise', 'length'=2)
        
# supply names to an existing vector
setNames(c("Waterloo & City","turquoise","2"),nm=c('name','colour','length'))
setNames(lines,LETTERS[1:7])
setNames(lines,LETTERS[1:length(lines)])

# extract elements from a named vector using element names
lines <- setNames(lines,LETTERS[1:length(lines)])
lines['C']

# ----- sort and order vectors

sort(lines) #returns the vector, but in order
order(lines) #tells us the sorted order of the elements

# ---------- LISTS ---------------------------------------------------------------------------------

# Lists are a lot more flexible, but less concise, than vectors
# Each list element can be a different data type
# A list element can be a vector, or even another list

# ----- create lists
list(1,3,4)
list(1,'a',TRUE)
list(1,2,c(1,6,7,8))
list(1,1:10,letters)
list(1,1:10,list('a',LETTERS))

# ----- Indexing lists

# create list to index
tfl_list <- list('Rail'=c('London Underground','London Overground','DLR','Elizabeth line'),
                 'Roads'=c('Buses','Trams','Dial-a-Ride','Victoria Coach Station','Traffic signals','TLRN'),
                 'Founded'=2000)

# List elements can be directly accessed using [[double square brackets]]
tfl_list[[1]] #returns the first element, which is a vector
tfl_list[['Rail']] #returns the element named 'Rail', which is a vector

# List elements can be accessed as lists using [square brackets]
tfl_list[1] #returns the first 'part' of the list, as a list
tfl_list['Rail'] #returns the 'part' of the list named 'Rail', as a list

# ---------- FUNCTIONS -----------------------------------------------------------------------------

# ----- Built-in functions

# we've already come across many built-in functions in R, such as sin(), exp(), sqrt(), class(), is.integer(), 
# as.character(), seq(), rep(), setNames(), sort(), order()

# to find out if there is a built-in R function that does something, use Google (or guess!)

# bring up documentation for built-in functions by searching in Help viewer, selecting a function + F1, or using ?
?seq

# named function arguments can be provided in any order
seq(from=0,to=20,by=2)
seq(to=20,from=0,by=2)

# if you don't provide argument names, the order will be determined by the way the function was written
seq(0,20,2)

# many function arguments have default values pre-defined
seq(from=0,to=20) #by default by=1

# some functions don't have default value pre-defined, and they need explicitly defining
setNames(LETTERS)
setNames(LETTERS,1:26)

# ----- Custom functions

# You can define your own functions in R using function() 

# define function that cubes a number (raises it to the power of 3)
cube <- function(n) n^3
cube(4)

# define function that calculates a percentage change between two numbers
perc_change <- function(x,y){ #use curly brackets to define function across multiple lines (normally the case)
  diff <- y-x
  p_change <- diff/x
  return(p_change) #it's good practice to be explicit about what the function should return
}
perc_change(30,45)

# define function that checks if the input is even, and supply default value
is_even <- function(n=9){
  if(n%%2==0){
    return(TRUE)
  } else {
    return(FALSE)
  }
}
is_even(3)
is_even(30)
is_even() #n defaults to 9, so returns FALSE (9 is not even)

# ---------- CONDITIONAL STATEMENTS ----------------------------------------------------------------

# use == != < > <= >= != ! & | %in% to test statements for truth
2==2
2==3
9>6
9>=9
3<2
3<=8
2!=4
2!=2
!T #use ! to negate any logical
T&F #are both statements TRUE?
T|F #are either of these statements TRUE?
(T|F)|(F&T) # brackets are very helpful when combining these!
4 %in% c(3,4,5,6)
'Jan' %in% month.abb
'January' %in% month.abb

# test for truthness/falseness in entire vector
all(c(T,T,T,T))
all(c(T,F,T,F,F))
any(c(T,T,T,T))
any(c(F,F,F,F,F,F,F,F,T))

# test which elements of a vector are True
which(c(F,F,F,F,F,F,F,F,T))
which(1:10==7) #inside the bracket is a logical vector, testing each element
which.min(c(100,78,34,2,100)) 
which.min(LETTERS) #note that which.min() and which.max() don't operate as expected on character vectors
which.max(c(100,78,34,2,100)) #note that it returns the FIRST maximum
which(c(100,78,34,2,100)==max(c(100,78,34,2,100))) #to get BOTH maximums

# IF statements: execute main code only if the statement in (brackets) returns TRUE
if(T) print('yes')
if(1==1) print('yes')
if(3==4) print('yes')

# add else clause
if(T) print('yes') else print('no')
if(F) print('yes') else print('no')

# more helpful example with better structure:
a <- -7
if(a>0){
  print('positive')
} else {
  print('not positive')
}

# add else if clause(s)
a <- 8
if(a>0){
  print('a is positive')
} else if(a<0) {
  print('a is negative')
} else {
  print('a is zero')
}
  
# ---------- LOOPS ---------------------------------------------------------------------------------

# R provides FOR and WHILE loops for iteration
        
# ----- FOR loops 

# FOR loops iterate through sequences

# print out first 10 square numbers
for(i in 1:10){
  print(i^2)
}

# print out first 10 cube numbers, with index info
for(i in 1:10){
  print(i)
  print(i^3)
}

# print each element of the line vector
for(i in lines){
  print(i)
}

# ----- WHILE loops

# WHILE loops execute the body of the code while some condition remains satisfied

# a while loop to count down from 5 
n <- 5 #while loops need to act on some 'externally' defined indexing variable
while(n>0){
  print(n)
  n <- n-1 #while loops need to contain a step to edit the indexing variable, or they will run forever
}

# ----- lapply family

# the lapply family of functions act similarly to Python's list comprehensions
# ie they are a concise way to apply functions to a vector or list

# get the square root of numbers 1:4 (use built-in function)
#lapply(1:4,sqrt) #lapply always returns a list

# cube the numbers 1:4 (use custom function)
#sapply(1:4,cube) #sapply simplifies the list output into a vector, if possible

# get the fourth power of the numbers 1:4 (define a function on-the-fly)
#sapply(1:4,function(x)x^4)

# --------------------------------------------------------------------------------------------------
# ---------- CODING CHALLENGES ---------------------------------------------------------------------
# --------------------------------------------------------------------------------------------------

# --- Challenge 1
# Create a function that reverses the order of the elements in a vector.

# building a custom funcion
reverse <- function(vec){
  vec[length(vec):1] #extract each element of the vector, starting from the last and finishing with the first
}
reverse(letters)

# or, using a built-in R function
rev(1:10)

# --- Challenge 2
# Create a mini-game where the user enters names of their friends. 
# Shuffle the list and then return a pair of friends who are designated as "Secret Santa" for each other.

secret_santa <- function(friends){
  # shuffle the vector of friends
  friends_shuffled <- friends[sample(x=1:length(friends),size=length(friends),replace=F)]
  # return the first two elements of the shuffled list 
  return(friends_shuffled[1:2])
}

# --- Challenge 3
# In a magical world, candies are sorted not by their flavor but by the number of letters in their name.
# Create a function that sorts a list of candies based on their name length.

# step-by-step, each step documented
sort_by_name_length <- function(candies){
  # create a vector of the name length of each candy
  name_length <- nchar(candies)
  # calculate the order these name lengths appear in
  name_length_order <- order(name_length)
  # extract each element of the input candies vector, in this order
  candies_sorted <- candies[name_length_order]
  # return sorted vector
  return(candies_sorted)
}

# much more concise (but idential logic)
sort_by_name_length <- function(candies) candies[order(nchar(candies))]

# --- Challenge 4
# Fizz-buzz challenge
# Print the numbers from 1-100, but replace factors of 3 with the word 'fizz', factors of 5 with the word 'buzz', and factors of both with 'fizzbuzz'

# with FOR loop:
for(i in 1:100){
  if(i%%3==0 & i%%5==0){
    print('fizzbuzz')
  } else if (i%%3==0){
    print('fizz')
  } else if (i%%5==0){
    print('buzz')
  } else {
    print(i)
  }
}

# by manipulating vector indices
fizzbuzz <- 1:100
fizzbuzz[which(1:100%%3==0)] <- 'fizz' #note that this converts the whole vector to character type
fizzbuzz[which(1:100%%5==0)] <- 'buzz'
fizzbuzz[which(1:100%%3==0 & 1:100%%5==0)] <- 'fizzbuzz'
fizzbuzz

# --- Challenge 5
# A Fibonacci sequence is a series of numbers (starting with 1,2) where each number is the sum of the two numbers before it
# Write a function that returns the first N elements of the Fibonacci sequence

# print out each number in the Fibonacci sequence
fibonacci <- function(N){
  # start with first two values: 1 and 2
  a <- 1
  b <- 2
  print(a)
  print(b)
  # calculate the next values
  for(i in 3:N){
    c <- a+b
    print(c)
    # update a and b
    a <- b
    b <- c
  }
}
fibonacci(20)

# return the Fibonacci sequence as a vector
fibonacci <- function(N){
  # create an integer vector of length N
  sequence <- integer(N)
  # set the first elements to equal 1 and 2
  sequence[1] <- 1
  sequence[2] <- 2
  # calculate the remaining elements using WHILE loop
  i <- 3
  while(i<=N){
    sequence[i] <- sequence[i-2] + sequence[i-1]
    i <- i+1
  }
  # end the function with the return() statement
  return(sequence)
}

# --- Challenge 6 
# Create a list of recipes, where each element is a named list:
# The name is the name of the recipe, and the vale is a list consisting of a vector of ingredients, a vector of their quantities, and a vector of their units

recipes <- list(
  'small sourdough loaf' = list(c('salt','water','starter','flour'),c(7,230,70,325),c('g','ml','g','g')),
  'cinnamon rolls' = list(c('melted butter','milk','salt','starter','flour'),c(40,235,3,90,360),c('g','ml','g','g','g'))
)

# --- Challenge 7
# Bananagrams is a game where you need at least 2 players, because you respond to other player's actions
# You have no friends, so write some code that mimics the random actions of the other players:
#    On repeat, until the game ends, make R play a sound at random, every 2-30 seconds
#    The sound can represent the PEEL action of the other player, or (using a different sound) the GAME END
#    The PEEL action should be 50x more frequent than the GAME END action
# HINT: Look up the documentation for the Sys.sleep() function
# HINT: Install the package beepr and look at the help for the function beep()

library(beepr)
while (action!='GAME END'){
  Sys.sleep(runif(n=1,min=2,max=30)) 
  action <- sample(x=c(rep('PEEL',times=50), # weight PEEL sound with 50
                       rep('GAME END',times=1)), # weight GAME END sound with 1
                   size=1)
  print(action)
  if(action=='PEEL') beep(1)
  if(action=='GAME END') beep(8)
}
