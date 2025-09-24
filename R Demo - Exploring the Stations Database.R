<<<<<<< HEAD
##### R Training : 1 Hour Taster,  #####

# 1. Empty Global Environment
rm(list=ls())

# 2. Set Working Directory
setwd("/workspaces/devcontainer-try-r")
###setwd("Q:/R_Analytics/101 R Training (1 Hour Taster)/R Workspace")

# 3. Upload Data
Data <- read.csv("Stations Database.csv", header = TRUE)
CoOrdinates <- read.csv("StationXY.csv", header = TRUE)

# 4. Obtain relevant packages from library and add to session (install.packages("") if not already on your device)
library(ggplot2)
library(dplyr)
library(ggthemes)

# 5. Get To Know Your Data
nrow(Data)
ncol(Data)
dim(Data)
names(Data)

summary(Data)
glimpse(Data)

unique(Data$Type)

sum(Data$LFT)
mean(Data$ESC)
sd(Data$TRV)

sum(Data$TH > 1)

mean(Data$TH)
max(Data$EntryCounts)
sum(Data$ESC)
sum(Data$Type == "Outer Suburb")
sum(Data$StepFree == "Yes")
which(Data$TRV == 2)
Data$Station[which(Data$TRV == 2)]

Data <- Data %>% arrange(ESC)
Data <- Data %>% arrange(-LFT)
Data <- Data %>% arrange(Station)


# 6. Subsetting Dataset
Data <- Data[,c("Station", "Type", "ESC", "LFT", "EntryCounts")]
Data <- Data[Data$ESC > 0 | Data$LFT > 0 ,]

#  | = OR
#  & = AND

# 7. Introducing new data onto the scene - What About Greenford???!!!
Data <- Data[,]

Data <- Data[Data$Station != "Greenford",]

AE <- Data[Data$Station == "Aldgate East",]

NewData <- data.frame(Station = character(),
                      Type = character(),
                      ESC = integer(),
                      LFT = integer(),
                      EntryCounts = integer(),
                      stringsAsFactors = FALSE)

NewData[1,1] <- "Greenford"
NewData[1,2] <- "Inner Suburb"
NewData[1,3] <- 0
NewData[1,4] <- 1
NewData[1,5] <- 7548
Data <- bind_rows(Data, NewData)

# 8. Merging 2 datasets together (JOINING)
Data <- left_join(Data,CoOrdinates, by = "Station")

# 9. Get Plotting!

ggplot(Data) + geom_bar(aes(x = Type))
ggplot(Data) + geom_density(aes(x = EntryCounts))
ggplot(Data) + geom_boxplot(aes(x = Type, y = ESC, fill = Type))
ggplot(Data) + geom_boxplot(aes(x = Type, y = ESC, fill = Type)) + theme_wsj()
ggplot(Data) + geom_boxplot(aes(x = Type, y = ESC, fill = Type)) + theme_solarized()
ggplot(Data) + geom_boxplot(aes(x = Type, y = ESC, fill = Type)) + theme_economist()
ggplot(Data) + geom_boxplot(aes(x = Type, y = ESC, fill = Type)) + theme_excel()

ggplot(Data) + geom_point(aes(x = EntryCounts, y = ESC))
ggplot(Data) + geom_point(aes(x = EntryCounts, y = ESC), color = "red", size = 7, alpha = 0.33)
ggplot(Data) + geom_point(aes(x = EntryCounts, y = ESC), color = "red", size = 7, alpha = 0.33) + 
  geom_smooth(aes(x = EntryCounts, y = ESC))

ggplot(Data) + geom_jitter(aes(x=x, y=-y, size = ESC))                               
ggplot(Data) + geom_point(aes(x=x, y=-y, size = ESC, colour = ESC)) + scale_size(range = c(1, 15))
ggplot(Data) + geom_point(aes(x=x, y=-y, size = ESC, colour = Type)) + scale_size(range = c(1, 15))
ggplot(Data) + geom_point(aes(x=x, y=-y, size = LFT, colour = Type)) + scale_size(range = c(1, 15)) +
ggtitle("My first graph") + geom_text(aes(x=x, y=-y, label = Station))

# Extension - Adding a Background Image
###install.packages("grid")
library(png)
library(grid)
bgroundimage <- readPNG("BGImageOfTubeMap.png")
bimg <- rasterGrob(bgroundimage, interpolate=TRUE)
bimg$width <- unit(1, "npc")
bimg$height <- unit(1, "npc")

ggplot(Data[Data$LFT>0,]) + annotation_custom(bimg, xmin=44, xmax=1105, ymin=-21, ymax=-739) + 
  geom_point(aes(x=x, y=-y, size = LFT, colour = Type), alpha = 0.5) + scale_size(range = c(5, 25)) +
  ggtitle("My first graph - What Do You Think?") + geom_text(aes(x=x, y=-y, label = Station), size = 3) + theme_bw()
=======
##### R Training : 1 Hour Taster,  #####

# 1. Empty Global Environment
rm(list=ls())

# 2. Set Working Directory
setwd("//onelondon.tfl.local/shared/Service_Performance/R_Analytics/101 R Training (1 Hour Taster)/R Workspace")
setwd("Q:/R_Analytics/101 R Training (1 Hour Taster)/R Workspace")

# 3. Upload Data
Data <- read.csv("Stations Database.csv", header = TRUE)
CoOrdinates <- read.csv("StationXY.csv", header = TRUE)

# 4. Obtain relevant packages from library and add to session (install.packages("") if not already on your device)
library(ggplot2)
library(dplyr)
library(ggthemes)

# 5. Get To Know Your Data
nrow(Data)
ncol(Data)
dim(Data)
names(Data)

summary(Data)
glimpse(Data)

unique(Data$Type)

sum(Data$LFT)
mean(Data$ESC)
sd(Data$TRV)

sum(Data$TH > 1)

mean(Data$TH)
max(Data$EntryCounts)
sum(Data$ESC)
sum(Data$Type == "Outer Suburb")
sum(Data$StepFree == "Yes")
which(Data$TRV == 2)
Data$Station[which(Data$TRV == 2)]

Data <- Data %>% arrange(ESC)
Data <- Data %>% arrange(-LFT)
Data <- Data %>% arrange(Station)


# 6. Subsetting Dataset
Data <- Data[,c("Station", "Type", "ESC", "LFT", "EntryCounts")]
Data <- Data[Data$ESC > 0 | Data$LFT > 0 ,]

#  | = OR
#  & = AND

# 7. Introducing new data onto the scene - What About Greenford???!!!
Data <- Data[,]

Data <- Data[Data$Station != "Greenford",]
Data <- Data[Data$Station != "Aldgate East",]

Data <- Data[Data$Station == "Aldgate East",]

NewData <- data.frame(Station = character(),
                      Type = character(),
                      ESC = integer(),
                      LFT = integer(),
                      EntryCounts = integer(),
                      stringsAsFactors = FALSE)

NewData[1,1] <- "Greenford"
NewData[1,2] <- "Inner Suburb"
NewData[1,3] <- 0
NewData[1,4] <- 1
NewData[1,5] <- 7548
Data <- bind_rows(Data, NewData)

# 8. Merging 2 datasets together (JOINING)
Data <- left_join(Data,CoOrdinates, by = "Station")

# 9. Get Plotting!

ggplot(Data) + geom_bar(aes(x = Type))
ggplot(Data) + geom_freqpoly(aes(x = EntryCounts), binwidth = 2500)
ggplot(Data) + geom_area(aes(x = Type, y = ESC))
ggplot(Data) + geom_boxplot(aes(x = Type, y = ESC, fill = Type))
ggplot(Data) + geom_boxplot(aes(x = Type, y = ESC, fill = Type)) + theme_wsj()
ggplot(Data) + geom_boxplot(aes(x = Type, y = ESC, fill = Type)) + theme_solarized()
ggplot(Data) + geom_boxplot(aes(x = Type, y = ESC, fill = Type)) + theme_economist()
ggplot(Data) + geom_boxplot(aes(x = Type, y = ESC, fill = Type)) + theme_excel()

ggplot(Data) + geom_point(aes(x = EntryCounts, y = ESC))
ggplot(Data) + geom_quantile(aes(x = EntryCounts, y = ESC), pch = 5)
ggplot(Data) + geom_quantile(aes(x = EntryCounts, y = ESC), color = "red", size = 7)
ggplot(Data) + geom_point(aes(x = EntryCounts, y = ESC), color = "red", size = 7, alpha = 0.33)
ggplot(Data) + geom_point(aes(x = EntryCounts, y = ESC), color = "red", size = 7, alpha = 0.33) + 
  geom_smooth(aes(x = EntryCounts, y = ESC))

ggplot(Data) + geom_jitter(aes(x=x, y=-y, size = ESC))                               
ggplot(Data) + geom_point(aes(x=x, y=-y, size = ESC, colour = ESC)) + scale_size(range = c(1, 15))
ggplot(Data) + geom_point(aes(x=x, y=-y, size = ESC, colour = Type)) + scale_size(range = c(1, 15))
ggplot(Data) + geom_point(aes(x=x, y=-y, size = LFT, colour = Type)) + scale_size(range = c(1, 15)) +
ggtitle("My first graph") + geom_text(aes(x=x, y=-y, label = Station))
ggplot(Data) + geom_text(aes(x=x, y=-y, size = ESC, colour = Type)) + scale_size(range = c(1, 15))

ggplot(Data) + geom_bar(aes(x = Type, colour = esc))
# Extension - Adding a Background Image
install.packages("png")
install.packages("grid")
library(png)
library(grid)
bgroundimage <- readPNG("BGImageOfTubeMap.png")
bimg <- rasterGrob(bgroundimage, interpolate=TRUE)
bimg$width <- unit(1, "npc")
bimg$height <- unit(1, "npc")

ggplot(Data[Data$LFT>0,]) + annotation_custom(bimg, xmin=44, xmax=1105, ymin=-21, ymax=-739) + 
  geom_point(aes(x=x, y=-y, size = LFT, colour = Type), alpha = 0.5) + scale_size(range = c(5, 25)) +
  ggtitle("My first graph - What Do You Think?") + geom_text(aes(x=x, y=-y, label = Station), size = 3) + theme_bw()
>>>>>>> c89b49c829a79fceb94cdb8cdd509b2086eb5657
