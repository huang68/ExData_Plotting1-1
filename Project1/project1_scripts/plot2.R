#setup directory & read in data 
setwd("C:/Users/Samantha/Desktop")
load("C:/Users/Samantha/Desktop/newdata.Rda")

#define X axis labels and positions  
time1 <- strptime("2007-02-01 00:00:00", format="%Y-%m-%d %H:%M:%S")
time2 <- strptime("2007-02-02 00:00:00", format="%Y-%m-%d %H:%M:%S")
time3 <- strptime("2007-02-03 00:00:00", format="%Y-%m-%d %H:%M:%S")
day1 <- weekdays(time1)
day2 <- weekdays(time1)
day3 <- weekdays(time1)
wd<-c(day1, day2, day3)
time1<-as.numeric(time1)
time2<-as.numeric(time2)
time3<-as.numeric(time3)
pos2<-(time2-time1)/60
pos3<-(time3-time1)/60
pos1<-1
pos=c(pos1, pos2, pos3)


#plot the figure
png(file="plot2.png",width=480,height=480)
plot(newdata$Global_active_power, newdata$DTime, type="l", axes=FALSE, ann=FALSE)
axis(1, at=pos, lab=wd)
axis(2, las=1, at=2*0:4)
box()
title(ylab="Global Active Power")
dev.off()
