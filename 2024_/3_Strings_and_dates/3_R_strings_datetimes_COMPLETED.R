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
game_data <- read.csv('games_info.csv',stringsAsFactors=F)

# ---------- STRING BASICS -------------------------------------------------------------------------

# define some character vectors
x <- c("Hello world", "Goodbye word")
grads <- c('Jimmy Wang','Louis Velati','Roberto Garcia Martinez','Taku Mutsago')
game_names <- game_data[100:150,'Name']

# convert to upper/lower case
toupper(grads)
tolower(grads)

# concatenate strings
paste('Hello',grads[1])
paste('Hello',grads) #paste is a vectorised function - it gets applied to each element of the vector and returns a vector
paste0('Hello ',grads,', how are you?') 
paste(grads,collapse=', ')
paste('Hello',paste(grads,collapse=', '))

# get length of a string
nchar('Hello')
nchar(grads)

# ---------- SPLITTING STRINGS ---------------------------------------------------------------------

# split strings at a pre-defined delimiter
strsplit(grads,split=' ')

# count the number of words in each gradute's name
sapply(strsplit(grads,split=' '),length)

# count the number of letters in each gradute's names
sapply(strsplit(grads,split=' '),nchar)

# ---------- SEARCHING WITHIN STRINGS --------------------------------------------------------------

# use regular expressions (regex) for pattern matching
# visit https://www.regular-expressions.info/tutorial.html to help understand regex, and https://regex101.com/ for testing

# bring up documentation for clarity
?grepl #note that nearly all pattern-searching functions have their documentation together

# return logical vector of matches
grepl('rr','harriet')
grepl('C',grads)
grepl('c',grads)
grepl('C',grads,ignore.case=T) #ignore case using argument to grepl function
grepl('(?i)C',grads) #ignore case using regex
grepl('[aeiou]$',grads) #names that end in a vowel

# return numeric vector of matching indices
grep('C',grads)
grep('c',grads)
grep('(',game_names) #brackets are 'special characters' in regex
grep('(',game_names,fixed=T) #search for brackets explicitly, using fixed argument
grep('\\(',game_names) #search for brackets explicitly, by escaping the special character with \\
game_names[grep('\\(',game_names)]

# filter rows of game_data where Name column contains a number
game_data[grep('[0-9]',game_data$Name),'Name'] #provides a numeric vector for indexing
game_data[grepl('[0-9]',game_data$Name),'Name'] #provides a logical vector for indexing

# get details of when pattern matches occur within string
regexpr('r','harriet') #first match only
gregexpr('r','harriet') # all matches (g)
gregexpr('rr','harriet')
gregexpr('[aeiou]',grads)

# return the part that matches
library(stringr) #no simple base R function to do this for us; use string package (or write our own function: see Coding Challenges)
str_extract(grads,'[aeiou]') #extract the first occurrence of the pattern (per vector element)
str_extract_all(grads,'[aeiou]') #extract all occurrences of the pattern

# ---------- REPLACING WITHIN STRINGS --------------------------------------------------------------

# replace characters in strings
gsub('i','!',grads)
gsub('hello','goodbye',x,ignore.case=T)

# replace only the first occurrence (per vector element)
sub('i','!',grads)

# remove commas from game names 
gsub(",","",game_names)

# replace anything after the colon in game names
gsub('(.*): (.*)','\\1',game_names) #this is utilising groups in regex

# ---------- DATE & DATETIMES BASICS -------------------------------------------------------------------------

# current date
today <- Sys.Date()

# class is Date
class(today)

# under the hood, dates stored as integers (days since 1 Jan 1970)
as.numeric(today)

# some date properties available through base R functions
weekdays(today,abbreviate=F)
months(today,abbreviate=T)
quarters(today)

# extracting parts of date using % strings
# full list of options available in ?strptime documentation
format(today,'%Y')
format(today,'%y')
format(today,'%m')
format(today,'%B')
format(today,'%d')
format(today,'%a')
format(today,'%A %d %B %Y')
format(today,'%F')

# constructing date from string
as.Date('2023-04-24')
as.Date('2023/04/24',format='%Y/%m/%d')
as.Date('24 April 24',format='%d %B %y')

# constructing date from number
as.Date(12,origin=as.Date('2023-01-01')) #12 days since 1 Jan 2023
as.Date(19124,origin=as.Date('1970-01-01')) #12 days since 1 Jan 2023

# converting date to numeric
as.numeric(as.Date('2022-05-12')) #uses 1970-01-01 as default
julian(as.Date('2022-05-12'))
julian(as.Date('2022-05-12'),origin=as.Date('2022-01-01'))

# sequence of dates / date arithmetic
seq.Date(from=as.Date('2020-05-01'),to=as.Date('2020-05-31'),by='1 day')
seq.Date(from=as.Date('2020-05-01'),to=as.Date('2020-05-31'),by='7 day')
seq.Date(from=as.Date('2020-01-01'),to=as.Date('2020-12-31'),by='4 weeks')
as.Date('2021-10-02') + 0:10
as.Date('2023-12-31') + (-20):0

# date arithmetic
Sys.Date() + 1 #tomorrow
Sys.Date() - 7 #1 week ago
Sys.Date() + 31 #31 days from today (not one month if in a non-31-day month!)
seq.Date(from=today,to=today+31,by='1 month')[2]
Sys.Date() + 365 #365 days from today (not one year if next year is leap year!)
seq.Date(from=today,to=today+366,by='1 year')[2]
born <- as.Date('1926-04-21')
died <- as.Date('2022-09-08')
died - born
difftime(died,born)
difftime(died,born,units='years')
difftime(died,born,units='weeks')

# POSIXlt class dates
tomorrow <- as.POSIXlt(today+1)
class(tomorrow)

# extracting parts of date using POSIXlt attributes ($)
attributes(tomorrow)
tomorrow$wday
tomorrow$mday
tomorrow$yday
tomorrow$year #years since 1900
tomorrow$mon #months since Jan (so Jan=0)

# ---------- DATETIMES -----------------------------------------------------------------------------

# Current datetime
right_now <- Sys.time()

# class is POSIXct POSIXt
class(right_now)

# under the hood, datetimes stored as integers (seconds since 1 Jan 1970 00:00:00)
as.numeric(right_now)

# get day of week
weekdays(right_now)

# extracting parts of datetimes using % strings
# full list of options available in ?strptime documentation
format(right_now,'%Y')
format(right_now,'%m')
format(right_now,'%d')
format(right_now,'%H')
format(right_now,'%I%p')
format(right_now,'%M')
format(right_now,'%S')
format(right_now,'%T')
format(right_now,'%F at %T')
format(right_now,'%I%P on %a %d %b %Y')

# constructing datetime from string
as.POSIXct('2023-04-24 03:21:19')
as.POSIXct('03:21:19 on 24 April 2023',format='%H:%M:%S on %d %B %Y')

# constructing datetime from number
as.POSIXct(18000,origin=as.Date('2023-01-01')) #18000 seconds since 00:00:00 on 1 Jan 2023
as.POSIXct(5*60*60,origin=as.Date('2023-01-01')) #5 hours since 00:00:00 on 1 Jan 2023

# converting datetime to numeric
as.numeric(Sys.time()) #uses 00:00:00 1970-01-01 as default

# sequence of dates / date arithmetic
seq.POSIXt(from=Sys.time(),to=Sys.time()+7*24*60*60,by='1 day')
Sys.time() + 0:10

# datetime arithmetic
Sys.time() + 1 #1 second from now
Sys.time() - 5*60 #5 minutes ago
start <- as.POSIXct('2022-12-18 15:00:00')
end <- as.POSIXct('2022-12-18 17:05:12')
end-start
difftime(end,start)
difftime(end,start,units='mins')

# POSIXlt class dates
soon <- as.POSIXlt(Sys.time()+100000)
soon
class(soon)

# extracting parts of date using POSIXlt attributes ($)
attributes(soon)
soon$sec
soon$min
soon$hour
soon$year #years since 1900
soon$mon #months since Jan (so Jan=0)




# --------------------------------------------------------------------------------------------------
# ---------- CODING CHALLENGES ---------------------------------------------------------------------
# --------------------------------------------------------------------------------------------------

# Challenge 1
# Create a filtered dataset that has all the games containing 'Crash Bandicoot'
crash_bandicoot_games <- game_data[grepl("Crash Bandicoot",game_data$Name),]

# Challenge 2
# Write a regex pattern that matches any 4-digit year sequence in the 'Name' column. For instance, it should be able to find "2003" in "Backyard NBA Basketball 2003".
unique(game_data[grepl("\\b\\d{4}\\b",game_data$Name),'Name'])
unique(game_data[grepl("[0-9]{4}",game_data$Name),'Name'])

# Challenge 3
# Write a regex pattern that matches abbreviations for platforms such as "PS2", "SAT", "PS", etc. The pattern should be general enough to capture any two-to-four letter uppercase abbreviations.
unique(game_data[grepl("\\b[A-Z]{2,4}\\b",game_data$Platform),'Platform'])

# Challenge 4
# Write a regex pattern that matches genres that end with "ing", like "Fighting", "Racing", and "Shooting".
unique(game_data[grepl("(?i)ing$",game_data$Genre),'Genre'])

# Challenge 5
# Challenge: Write a regex pattern that captures game titles with a sequel number at the end, e.g., "San Goku Shi V". It should capture both the game name and the sequel number separately.
game_data_sequels <- game_data[grepl("(.+?)\\s([IVXLCDM]+)$",game_data$Name),c('Name'),drop=F] #use drop=F to force the output to be a 1-column data.frame rather than a vector
game_data_sequels$game_name <- gsub("(.+?)\\s([IVXLCDM]+)$","\\1",game_data_sequels$Name)
game_data_sequels$sequel_no <- gsub("(.+?)\\s([IVXLCDM]+)$","\\2",game_data_sequels$Name)

# Challenge 6
# Convert the date column into datetime in the format yyyy-mm-dd
game_data$Date <- as.Date(game_data$Date,format='%d/%m/%Y')

# Challange 7
# write a function that takes a vector of strings, and produces a single string made up of the elements listed out, 
# separated by commas, except the last item which is separated by 'and'
comma_separated_list <- function(string_vec){
  all_but_last <- string_vec[1:(length(string_vec)-1)]
  last_string <- string_vec[length(string_vec)]
  return(paste(paste(all_but_last,collapse=", "),"and",last_string))
}
comma_separated_list(month.name)

# Challenge 8
# write a function (using only base R functions) that returns the part of the text that has been pattern matched
pattern_extract <- function(text,pattern){
  position <- regexpr(pattern=pattern,text=text)
  match_length <- attr(position,"match.length")
  substr(x=text,start=position,stop=position+match_length-1)
}
pattern_extract(month.name,'ber')

                                          
                                                                             
  