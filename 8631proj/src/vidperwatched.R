library(ggplot2)
library(ProjectTemplate); load.project()
y3=read.csv("C:\\Users\\Isaac\\OneDrive\\Documents\\CSC8631\\8631proj\\data\\cyber-security-3_video-stats.csv",header = TRUE)
y4=read.csv("C:\\Users\\Isaac\\OneDrive\\Documents\\CSC8631\\8631proj\\data\\cyber-security-4_video-stats.csv",header = TRUE)
y5=read.csv("C:\\Users\\Isaac\\OneDrive\\Documents\\CSC8631\\8631proj\\data\\cyber-security-5_video-stats.csv",header = TRUE)
y6=read.csv("C:\\Users\\Isaac\\OneDrive\\Documents\\CSC8631\\8631proj\\data\\cyber-security-6_video-stats.csv",header = TRUE)
y7=read.csv("C:\\Users\\Isaac\\OneDrive\\Documents\\CSC8631\\8631proj\\data\\cyber-security-7_video-stats.csv",header = TRUE)

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

#loop through each video and each year, pulling out the values and transferring to years
temp = rep(NULL,7)
val = c()
for (i in 1:13)
{
  for (p in 1:7)
  {
    temp[p] = (y3[i,p+8]/100)*y3[i,4] + (y4[i,p+8]/100)*y4[i,4] + (y5[i,p+8]/100)*y5[i,4] + (y6[i,p+8]/100)*y6[i,4] + (y7[i,p+8]/100)*y7[i,4]
  }
  val = append(val,temp)
}

#THIS IS THE GOOD PLOT
videos = c(rep("1.1",7),rep("1.14",7),rep("1.17",7),rep("1.19",7),rep("1.5",7),rep("2.1",7),rep("2.11",7),rep("2.17",7),rep("2.4",7),rep("3.1",7),rep("3.14",7),rep("3.15",7),rep("3.2",7))
perwatched = rep(c("5%","10%","25%","50%","75%","95%","100%"),13)
values = val
datas = data.frame(videos,perwatched,values)
datas$perwatched = factor(datas$perwatched, levels=c("5%","10%","25%","50%","75%","95%","100%"))

ggplot(datas, aes(fill=perwatched, y=values, x=videos)) + 
  geom_bar(position="dodge", stat="identity") + labs(x="Video",y="Views") + labs(fill = "% watched")



#same plot but this time just use percentages rather than views
temp = rep(NULL,7)
val = c()
for (i in 1:13)
{
  for (p in 1:7)
  {
    temp[p] = (y3[i,p+8] + y4[i,p+8] + y5[i,p+8] + y6[i,p+8] + y7[i,p+8])/5
  }
  val = append(val,temp)
}

videos = c(rep("1.1",7),rep("1.14",7),rep("1.17",7),rep("1.19",7),rep("1.5",7),rep("2.1",7),rep("2.11",7),rep("2.17",7),rep("2.4",7),rep("3.1",7),rep("3.14",7),rep("3.15",7),rep("3.2",7))
perwatched = rep(c("5%","10%","25%","50%","75%","95%","100%"),13)
values = val
datas = data.frame(videos,perwatched,values)
datas$perwatched = factor(datas$perwatched, levels=c("5%","10%","25%","50%","75%","95%","100%"))

ggplot(datas, aes(fill=perwatched, y=values, x=videos)) + 
  geom_bar(position="dodge", stat="identity") + labs(x="Video",y="% of views") + labs(fill = "% watched")