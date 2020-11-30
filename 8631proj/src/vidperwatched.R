library(ggplot2)
library(ProjectTemplate); load.project()
y3=read.csv("C:\\Users\\Isaac\\OneDrive\\Documents\\CSC8631\\8631proj\\data\\cyber-security-3_video-stats.csv",header = TRUE)
y4=read.csv("C:\\Users\\Isaac\\OneDrive\\Documents\\CSC8631\\8631proj\\data\\cyber-security-4_video-stats.csv",header = TRUE)
y5=read.csv("C:\\Users\\Isaac\\OneDrive\\Documents\\CSC8631\\8631proj\\data\\cyber-security-5_video-stats.csv",header = TRUE)
y6=read.csv("C:\\Users\\Isaac\\OneDrive\\Documents\\CSC8631\\8631proj\\data\\cyber-security-6_video-stats.csv",header = TRUE)
y7=read.csv("C:\\Users\\Isaac\\OneDrive\\Documents\\CSC8631\\8631proj\\data\\cyber-security-7_video-stats.csv",header = TRUE)

#compare the videos across the years

vid = data.frame("5%"=integer(),"10%"=integer(),"25%"=integer(),"50%"=integer(),"75%"=integer(),"95%"=integer(),"100%"=integer())
temp = rep(NULL,7)
val = c()
for (i in 1:13)
{
  for (p in 1:7)
  {
    temp[p] = y3[i,p+8]*(y3[i,4]/100)
  }
  val = append(val,temp)
}

video = c(rep("1.1",7),rep("1.14",7),rep("1.17",7),rep("1.19",7),rep("1.5",7),rep("2.1",7),rep("2.11",7),rep("2.17",7),rep("2.4",7),rep("3.1",7),rep("3.14",7),rep("3.15",7),rep("3.2",7))
perwatched = rep(c("5%","10%","25%","50%","75%","95%","100%"),13)
values = val
datas = data.frame(video,perwatched,values)
datas$perwatched = factor(datas$perwatched, levels=c("5%","10%","25%","50%","75%","95%","100%"))

ggplot(datas, aes(fill=perwatched, y=values, x=video)) + 
  geom_bar(position="dodge", stat="identity") + labs(x="Video",y="Views") + labs(fill = "% watched")