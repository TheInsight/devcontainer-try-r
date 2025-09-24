####################################################################################################
##########     Session 4: Plotting | Guided     ####################################################
####################################################################################################

# Welcome to our fourth R session!

# In this sessions you will learn how to plot data in R, including:
# - scatter plots in base R
# - histograms in base R
# - scatter plots in ggplot2
# - editing graph appearance in ggplot2
# - line charts in ggplot2
# - bar charts in ggplot2

# ----------  SETUP --------------------------------------------------------------------------------

# set working directory to location of this script
setwd(dirname(rstudioapi::getActiveDocumentContext()$path))

# load packages
library(data.table)
library(ggplot2)

# load game data
game_data <- fread('full_game_data.csv',na.strings=c('NA','N/A'))

# find the game with the most readings over time
game_data[,length(unique(Year)),Name][order(-V1)]

# create milk dataset
milk <- rbindlist(list(
  data.table('plant'='soy','brand'='sojade',kcal=37,protein=3.8,fat=2.1),
  data.table('plant'='soy','brand'='plenish',kcal=32,protein=3.2,fat=1.6),
  data.table('plant'='soy','brand'='rude health',kcal=42,protein=3,fat=1.4),
  data.table('plant'='soy','brand'='alpro organic',kcal=32,protein=3.3,fat=1.9),
  data.table('plant'='soy','brand'='bonsoy',kcal=61,protein=4.1,fat=2.2),
  data.table('plant'='almond','brand'='rude health',kcal=38,protein=1.5,fat=3.2),
  data.table('plant'='almond','brand'='plenish',kcal=29,protein=1,fat=2.5),
  data.table('plant'='almond','brand'='almond breeze',kcal=13,protein=0.5,fat=1.1),
  data.table('plant'='hemp','brand'='sojade',kcal=22,protein=0.5,fat=2.2),
  data.table('plant'='cashew','brand'='rude health',kcal=30,protein=0.9,fat=2.2),
  data.table('plant'='cashew','brand'='plenish',kcal=32,protein=0.9,fat=2.5),
  data.table('plant'='oat','brand'='oatly',kcal=48,protein=1.1,fat=1.5),
  data.table('plant'='oat','brand'='minor figures',kcal=48,protein=0.2,fat=2.1),
  data.table('plant'='pea','brand'='sproud barista',kcal=40,protein=2.1,fat=2.7),
  data.table('plant'='pea','brand'='mighty m.lk',kcal=25,protein=2,fat=1.9),
  data.table('plant'='cow','brand'='waitrose whole',kcal=66,protein=3.5,fat=3.7),
  data.table('plant'='cow','brand'='waitrose semi-skimmed',kcal=50,protein=3.6,fat=1.8),
  data.table('plant'='brown rice','brand'='rude health',kcal=60,protein=0.1,fat=1.3),
  data.table('plant'='coconut','brand'='rude health',kcal=58,protein=0.5,fat=1.4),
  data.table('plant'='hazelnut','brand'='rude health',kcal=71,protein=0.5,fat=1.7)
))

# join with plant type lookup table
plant_type <- data.table('plant'=c("soy","almond","hemp","cashew","oat","pea","cow","brown rice","coconut","hazelnut"),
                         'plant_type'=c('bean','nut','seed','nut','grain','bean','dairy','grain','nut','nut'))


# define colours (http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf)
# or run colors()
tfl_blue <- rgb(red=0,green=15,blue=159,max=255) 
tfl_blue <- "#000F9F" #or define via hex code directly
elizabeth_line_purple <- rgb(147,100,204,max=255)

# ----------  BASE R -------------------------------------------------------------------------------

# basic scatter plot


# change scatter point shape (http://www.sthda.com/english/wiki/r-plot-pch-symbols-the-different-point-shapes-available-in-r)


# line graph


# change line width


# change line type


# change axis titles


# specify title and caption


# basic histogram of global sales


# change the number of breaks/bins


# ----------  ggplot2 ------------------------------------------------------------------------------

# ---------- scatter plots -------------------------------------------------------------------------

# basic scatter plot
ggplot(data=milk,mapping=aes(x=kcal,y=protein)) +
  geom_point()

# change size of points
ggplot(milk) +
  geom_point(aes(x=kcal,y=protein),size=3)

# change transparency (alpha) of points
ggplot(milk) +
  geom_point(aes(x=kcal,y=protein),size=3,alpha=0.3)

# change color of points (http://www.stat.columbia.edu/~tzheng/files/Rcolor.pdf)
ggplot(milk) +
  geom_point(aes(x=kcal,y=protein),size=3,color='blue')
ggplot(milk) +
  geom_point(aes(x=kcal,y=protein),size=3,color=tfl_blue)

# change shape of points
ggplot(milk) +
  geom_point(aes(x=kcal,y=protein),size=3,color='blue',shape=5)

# use size as aesthetic (protein against calories, with fat represented by point size)
ggplot(milk) +
  geom_point(aes(x=kcal,y=protein,size=fat),size=3,color=tfl_blue) #won't work if you've also specified size as a constant value
ggplot(milk) +
  geom_point(aes(x=kcal,y=protein,size=fat),color=tfl_blue)

# use transparency (alpha) as aesthetic
ggplot(milk) +
  geom_point(aes(x=kcal,y=protein,alpha=fat),color=tfl_blue)

# use colour as aesthetic (better for categorial variables)
ggplot(milk) +
  geom_point(aes(x=kcal,y=protein,color=plant_type),size=3)

# add single annotation
ggplot(milk) +
  geom_point(aes(x=kcal,y=protein,color=plant_type),size=3) +
  #annotate(geom="text",x=37,y=3.8,label="Sojade ",hjust=1,size=3) +
  annotate(geom="text",x=milk[brand=='sojade'&plant=='soy',kcal],y=milk[brand=='sojade'&plant=='soy',protein],label="Sojade",hjust=1,size=3)

# add annotations
ggplot() +
  geom_point(data=milk,aes(x=kcal,y=protein,color=plant_type),size=3) +
  geom_text(data=milk[brand=='sojade'&plant=='soy'],
            aes(x=kcal,y=protein,label=brand),
            hjust=1,size=3)
ggplot(data=milk) +
  geom_point(aes(x=kcal,y=protein,color=plant_type),size=3) +
  geom_text(aes(x=kcal,y=protein,label=plant),hjust=1,size=3)

# add graph title, caption, label, and legend titles/labels
ggplot(milk) +
  geom_point(aes(x=kcal,y=protein,color=plant_type),size=3) +
  labs(title="Nutritional info of different milks",
       caption=paste("Values are per 100ml, data from ocado.co.uk on ",Sys.Date()),
       x='Calories (kcal)',
       y='Protein (g)',
       color='Plant type')

# specify colours 
ggplot(milk) +
  geom_point(aes(x=kcal,y=protein,color=plant_type),size=3) +
  scale_color_manual(values=c("bean"='#9ACD32', "nut"='tan4', "seed"='navajowhite3', "grain"='grey', "dairy"='snow4')) +
  labs(title="Nutritional info of different milks",
       caption=paste("Values are per 100ml, data from ocado.co.uk on ",Sys.Date()),
       x='Calories (kcal)',
       y='Protein (g)',
       color='Plant type')

# specify values to display on x-axis
ggplot(milk) +
  geom_point(aes(x=kcal,y=protein,color=plant_type),size=3) +
  scale_color_manual(values=c("bean"='#9ACD32', "nut"='tan4', "seed"='navajowhite3', "grain"='grey', "dairy"='snow4')) +
  scale_x_continuous(breaks=seq(0,max(milk$kcal),by=10)) +
  labs(title="Nutritional info of different milks",
       caption=paste("Values are per 100ml, data from ocado.co.uk on ",Sys.Date()),
       x='Calories (kcal)',
       y='Protein (g)',
       color='Plant type')

# specify x-axis to start from 0 and end at 80 (and leave the x-axis end points to be default)
ggplot(milk) +
  geom_point(aes(x=kcal,y=protein,color=plant_type),size=3) +
  scale_color_manual(values=c("bean"='#9ACD32', "nut"='tan4', "seed"='navajowhite3', "grain"='grey', "dairy"='snow4')) +
  scale_x_continuous(limits=c(0,80)) + 
  scale_y_continuous(limits=c(NA,NA)) + 
  labs(title="Nutritional info of different milks",
       caption=paste("Values are per 100ml, data from ocado.co.uk on ",Sys.Date()),
       x='Calories (kcal)',
       y='Protein (g)',
       color='Plant type')

# rotate the x-axis labels
ggplot(milk) +
  geom_point(aes(x=kcal,y=protein,color=plant_type),size=3) +
  scale_color_manual(values=c("bean"='#9ACD32', "nut"='tan4', "seed"='navajowhite3', "grain"='grey', "dairy"='snow4')) +
  scale_x_continuous(limits=c(0,80)) + 
  scale_y_continuous(limits=c(NA,NA)) + 
  labs(title="Nutritional info of different milks",
       caption=paste("Values are per 100ml, data from ocado.co.uk on ",Sys.Date()),
       x='Calories (kcal)',
       y='Protein (g)',
       color='Plant type') +
  theme(axis.text.x=element_text(angle=90,vjust=0.5))

# change the background colour
ggplot(milk) +
  geom_point(aes(x=kcal,y=protein,color=plant_type),size=3) +
  scale_color_manual(values=c("bean"='#9ACD32', "nut"='tan4', "seed"='navajowhite3', "grain"='grey', "dairy"='snow4')) +
  scale_x_continuous(limits=c(0,80)) + 
  scale_y_continuous(limits=c(NA,NA)) + 
  labs(title="Nutritional info of different milks",
       caption=paste("Values are per 100ml, data from ocado.co.uk on ",Sys.Date()),
       x='Calories (kcal)',
       y='Protein (g)',
       color='Plant type') +
  theme(axis.text.x=element_text(angle=90,vjust=0.5),
        panel.background=element_rect(fill="gold"))

# change the background grid line appearance
ggplot(milk) +
  geom_point(aes(x=kcal,y=protein,color=plant_type),size=3) +
  scale_color_manual(values=c("bean"='#9ACD32', "nut"='tan4', "seed"='navajowhite3', "grain"='grey', "dairy"='snow4')) +
  scale_x_continuous(limits=c(0,80)) + 
  scale_y_continuous(limits=c(NA,NA)) + 
  labs(title="Nutritional info of different milks",
       caption=paste("Values are per 100ml, data from ocado.co.uk on ",Sys.Date()),
       x='Calories (kcal)',
       y='Protein (g)',
       color='Plant type') +
  theme(axis.text.x=element_text(angle=90,vjust=0.5),
        panel.grid.minor=element_blank(),
        panel.grid.major.x=element_line(color='grey'),
        panel.grid.major.y=element_line(color='grey',linetype='dashed'))

# save the graph
ggsave('milks.png',units='mm',height=210,width=297)

# ---------- line graphs ---------------------------------------------------------------------------

# simple line graph
annual_global_sales <- game_data[!is.na(Year),.(sales=mean(Global_Sales,na.rm=T)),.(Year)]
ggplot(annual_global_sales) +
  geom_line(aes(x=Year,y=sales))

# add underlying point data
ggplot(annual_global_sales) +
  geom_line(aes(x=Year,y=sales)) +
  geom_point(aes(x=Year,y=sales))
ggplot(data=annual_global_sales,aes(x=Year,y=sales)) +
  geom_line() +
  geom_point()

# plot all the sales columns: BAD
annual_sales <- game_data[,.(NA_Sales=mean(NA_Sales),EU_Sales=mean(EU_Sales),JP_Sales=mean(JP_Sales),Other_Sales=mean(Other_Sales),Global_Sales=mean(Global_Sales)),Year]
ggplot(data=annual_sales) +
  geom_line(aes(x=Year,y=NA_Sales)) +
  geom_line(aes(x=Year,y=EU_Sales)) +
  geom_line(aes(x=Year,y=JP_Sales)) +
  geom_line(aes(x=Year,y=Other_Sales)) +
  geom_line(aes(x=Year,y=Global_Sales)) 

# plot all the sales columns: GOOD, using long data format
annual_sales_long <- melt(annual_sales,
                          measure.vars=c('NA_Sales','EU_Sales','JP_Sales','Other_Sales','Global_Sales'),
                          variable.name='Continent',
                          value.name='Sales')
ggplot(data=annual_sales_long) +
  geom_line(aes(x=Year,y=Sales,color=Continent))


# ---------- bar charts ----------------------------------------------------------------------------

# plot number of games per Genre
ggplot(game_data[,.N,Genre]) +
  geom_col(aes(x=Genre,y=N))

# stacked bar chart: break each Genre bar into Platform
ggplot(game_data[Platform%in%c('Wii','NES','PS4'),.N,.(Genre,Platform)]) +
  geom_col(aes(x=Genre,y=N,fill=Platform))

# clustered bar chart: break each Genre bar into Platform
ggplot(game_data[Platform%in%c('Wii','NES','PS4'),.N,.(Genre,Platform)]) +
  geom_col(aes(x=Genre,y=N,fill=Platform),position='dodge')
