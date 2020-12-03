library(ggplot2)
library(ProjectTemplate); load.project()
y3=read.csv("8631proj\\data\\cyber-security-3_video-stats.csv",header = TRUE)
y4=read.csv("8631proj\\data\\cyber-security-4_video-stats.csv",header = TRUE)
y5=read.csv("8631proj\\data\\cyber-security-5_video-stats.csv",header = TRUE)
y6=read.csv("8631proj\\data\\cyber-security-6_video-stats.csv",header = TRUE)
y7=read.csv("8631proj\\data\\cyber-security-7_video-stats.csv",header = TRUE)

#loop that calculates average percentage watched across the videos
source("C:\\Users\\Isaac\\OneDrive\\Documents\\CSC8631\\8631proj\\lib\\helpers.R")
#calculate the averages for all the percentages for each year
y3a=helper.avgview(y3)
y4a=helper.avgview(y4)
y5a=helper.avgview(y5)
y6a=helper.avgview(y6)
y7a=helper.avgview(y7)

#assign these to vectors so we can put them in a df
a5p = c(y3a[1],y4a[1],y5a[1],y6a[1],y7a[1])
a10p = c(y3a[2],y4a[2],y5a[2],y6a[2],y7a[2])
a25p = c(y3a[3],y4a[3],y5a[3],y6a[3],y7a[3])
a50p = c(y3a[4],y4a[4],y5a[4],y6a[4],y7a[4])
a75p = c(y3a[5],y4a[5],y5a[5],y6a[5],y7a[5])
a95p = c(y3a[6],y4a[6],y5a[6],y6a[6],y7a[6])
a100p = c(y3a[7],y4a[7],y5a[7],y6a[7],y7a[7])

labe = c("5%","10%","25%","50%","75%","95%","100%")
viddf = data.frame(year=3:7,"5%"=a5p,"10%"=a10p,"25%"=a25p,"50%"=a50p,"75%"=a75p,"95%"=a95p,"100%"=a100p)
viddf

#this is done to produce the stacked bar chart showing percentage watched of videos overall
year = c(rep("year 3",7),rep("year 4",7),rep("year 5",7),rep("year 6",7),rep("year 7",7))
perwatched = rep(c("5%","10%","25%","50%","75%","95%","100%"),5)
values = c(y3a,y4a,y5a,y6a,y7a)
datas = data.frame(year,perwatched,values)
datas$perwatched = factor(datas$perwatched, levels=c("5%","10%","25%","50%","75%","95%","100%"))

#scv
ggplot(datas, aes(fill=perwatched, y=values, x=year)) + 
  geom_bar(position="dodge", stat="identity") + labs(x="Year",y="Views") + labs(fill = "% watched")

#talk about comparisons to enrolements here, there is a definite drop from year 5 to 6

#if you want to just look at the percentages, use avgper
y3a=helper.avgper(y3)
y4a=helper.avgper(y4)
y5a=helper.avgper(y5)
y6a=helper.avgper(y6)
y7a=helper.avgper(y7)

year = c(rep("year 3",7),rep("year 4",7),rep("year 5",7),rep("year 6",7),rep("year 7",7))
perwatched = rep(c("5%","10%","25%","50%","75%","95%","100%"),5)
values = c(y3a,y4a,y5a,y6a,y7a)
datas = data.frame(year,perwatched,values)
datas$perwatched = factor(datas$perwatched, levels=c("5%","10%","25%","50%","75%","95%","100%"))

#scv
ggplot(datas, aes(fill=perwatched, y=values, x=year)) + 
  geom_bar(position="dodge", stat="identity") + labs(x="Year",y="% of views") + labs(fill = "% watched")

#next things to do
#compare devices
