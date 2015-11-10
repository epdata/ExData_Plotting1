## Week 1 Project Basic Plott System
## Author: Enrique Ponte

# Clean up workspace
rm(list=ls())

##set my working directory
setwd("C:/Users/admin/Desktop/Coursera")

##Download the file manually because the fileurl is not accesible
#fileUrl <- "https://d396qusza40orc.cloudfront.net/exdata_data_household_power_consumption.zip"
#download.file(fileUrl,destfile="exdata_data_household_power_consumption.zip")

##Unzip the file
#unzip(zipfile="exdata_data_household_power_consumption.zip")
datfile="household_power_consumption.txt"

##Read data from the txt file and create a final dataset
data <- read.table(datfile, header=T, sep=";", stringsAsFactors=FALSE, dec=".")
fdata<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007"))
datetime <- paste(as.Date(fdata$Date, format = ("%d/%m/%Y")), fdata$Time)
fdata$datetime <- as.POSIXct(datetime)
fdata$Sub_metering_1 <- as.numeric(fdata$Sub_metering_1)
fdata$Sub_metering_2 <- as.numeric(fdata$Sub_metering_2)


# creating Plot3 & copy the file
plot(fdata$Sub_metering_1~fdata$datetime, type="n", ylab="Energy sub metering", xlab="")
lines(fdata$Sub_metering_1~fdata$datetime,col='Black')
lines(fdata$Sub_metering_2~fdata$datetime,col='Red')
lines(fdata$Sub_metering_3~fdata$datetime,col='Blue')
legend("topright", legend =c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),lty=1,lwd=2, col=c("black", "red", "blue"))
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()