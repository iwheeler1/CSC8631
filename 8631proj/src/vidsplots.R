library(ggplot2)
library(ProjectTemplate); load.project()
y3=read.csv("8631proj\\data\\cyber-security-3_video-stats.csv",header = TRUE)
y4=read.csv("8631proj\\data\\cyber-security-4_video-stats.csv",header = TRUE)
y5=read.csv("8631proj\\data\\cyber-security-5_video-stats.csv",header = TRUE)
y6=read.csv("8631proj\\data\\cyber-security-6_video-stats.csv",header = TRUE)
y7=read.csv("8631proj\\data\\cyber-security-7_video-stats.csv",header = TRUE)

#compare the videos across the years
#simple plot of the how many views the videos got over the years
views = rep(NULL,13)
for (j in 1:13)
{
  views[j] = y3[j,4] + y4[j,4] + y5[j,4] + y6[j,4] + y7[j,4]
}
v = c("1.1","1.14","1.17","1.19","1.5","2.1","2.11","2.17","2.4","3.1","3.14","3.15","3.2")
viewdf = data.frame(video=v, views=views)
ggplot(data=viewdf, aes(x=video, y=views)) + geom_bar(stat="identity", fill="steelblue") + labs(x="Video",y="Views")

#add duration and create scatter plot to look at effect of duration
duration = rep(NULL,13)
for (q in 1:13)
{
  #duration of videos is the same across years3-7
  duration[q] = y3[q,3]
}
viewdf$duration = duration

ggplot(data=viewdf, aes(x=duration,y=views)) + geom_point(size=4,colour="steelblue") + geom_text(label=viewdf$video,nudge_y = 200)