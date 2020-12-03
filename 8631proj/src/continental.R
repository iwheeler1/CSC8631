library(ggplot2)
library(ProjectTemplate); load.project()
y3=read.csv("8631proj\\data\\cyber-security-3_video-stats.csv",header = TRUE)
y4=read.csv("8631proj\\data\\cyber-security-4_video-stats.csv",header = TRUE)
y5=read.csv("8631proj\\data\\cyber-security-5_video-stats.csv",header = TRUE)
y6=read.csv("8631proj\\data\\cyber-security-6_video-stats.csv",header = TRUE)
y7=read.csv("8631proj\\data\\cyber-security-7_video-stats.csv",header = TRUE)

#continental simple
europe = (y3[[22]]/100)*y3[[4]] + (y4[[22]]/100)*y4[[4]] + (y5[[22]]/100)*y5[[4]] + (y6[[22]]/100)*y6[[4]] + (y7[[22]]/100)*y7[[4]]
oce = (y3[[23]]/100)*y3[[4]] + (y4[[23]]/100)*y4[[4]] + (y5[[23]]/100)*y5[[4]] + (y6[[23]]/100)*y6[[4]] + (y7[[23]]/100)*y7[[4]]
asia = (y3[[24]]/100)*y3[[4]] + (y4[[24]]/100)*y4[[4]] + (y5[[24]]/100)*y5[[4]] + (y6[[24]]/100)*y6[[4]] + (y7[[24]]/100)*y7[[4]]
NorthAm = (y3[[25]]/100)*y3[[4]] + (y4[[25]]/100)*y4[[4]] + (y5[[25]]/100)*y5[[4]] + (y6[[25]]/100)*y6[[4]] + (y7[[25]]/100)*y7[[4]]
SouthAm = (y3[[26]]/100)*y3[[4]] + (y4[[26]]/100)*y4[[4]] + (y5[[26]]/100)*y5[[4]] + (y6[[26]]/100)*y6[[4]] + (y7[[26]]/100)*y7[[4]]
africa = (y3[[27]]/100)*y3[[4]] + (y4[[27]]/100)*y4[[4]] + (y5[[27]]/100)*y5[[4]] + (y6[[27]]/100)*y6[[4]] + (y7[[27]]/100)*y7[[4]]

#this is done to produce the stacked bar chart showing percentage watched of videos overall
values = c(sum(europe),sum(oce),sum(asia),sum(NorthAm),sum(SouthAm),sum(africa))
continents = c("Europe", "Oceania", "Asia", "North America", "South America", "Africa")
cont = data.frame(continent = continents, views = values)
ggplot(data=cont, aes(x=continent, y=views)) + geom_bar(stat="identity", fill="steelblue") + labs(x="Continent",y="Views")


#difference between Europeans and non Europeans in terms of using the different videos?
noneurope = oce+asia+NorthAm+SouthAm+africa
values = c(europe, noneurope)
video = c(rep("1.1",2),rep("1.14",2),rep("1.17",2),rep("1.19",2),rep("1.5",2),rep("2.1",2),rep("2.11",2),rep("2.17",2),rep("2.4",2),rep("3.1",2),rep("3.14",2),rep("3.15",2),rep("3.2",2))
european = rep(c("Europe","Non-European"),13)
dat = data.frame(video,european,values)
ggplot(dat, aes(fill=video, y=values, x=european)) + 
  geom_bar(position="dodge", stat="identity") + labs(x="Continent",y="Views") + labs(fill = "Video")


#stacked bar
ggplot(dat, aes(fill=european, y=values, x=video)) + 
  geom_bar(position="stack", stat="identity") + labs(x="Video",y="Views") + labs(fill = "Continent")
