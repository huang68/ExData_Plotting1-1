#setup directory & read in data
setwd("C:/Users/Samantha/Desktop")
data<-read.table("household_power_consumption.txt", sep=";", header=TRUE, stringsAsFactors=F)

#get only data between 2007-02-02 to 2007-02-02
newdata<-data[which (data$Date=='1/2/2007'| data$Date=='2/2/2007'),]

#recode NA
newdata[newdata=='?'] <- NA

#convert data types
newdata <- within(newdata, { 
  Global_active_power <- as.numeric(Global_active_power) 
  Global_reactive_power <- as.numeric(Global_reactive_power) 
  Voltage<-as.numeric(Voltage)
  Global_intensity<-as.numeric(Global_intensity)  
  Sub_metering_1<-as.numeric(Sub_metering_1)
  Sub_metering_2<-as.numeric(Sub_metering_2)       
  Sub_metering_3<-as.numeric(Sub_metering_3)       
  Date<-as.Date(Date, format="%d/%m/%Y")
}) 

#convert date and time to time format
newD<-as.character(newdata$Date)
DTime<-paste(newD, newdata$Time)
DTime <- strptime(DTime, format="%Y-%m-%d %H:%M:%S")

#remove NA data 
newdata[!complete.cases(newdata),]

#plot the figure in png format
png(file="plot1.png",width=480,height=480)
hist(newdata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency")
dev.off()

#save data for future usage
save(newdata,file="C:/Users/Samantha/Desktop/newdata.Rda")

