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
fdata$Global_active_power <- as.numeric(fdata$Global_active_power)
fdata$Global_reactive_power <- as.numeric(fdata$Global_reactive_power)
fdata$voltage <- as.numeric(fdata$Voltage)
fdata$Sub_metering_1 <- as.numeric(fdata$Sub_metering_1)
fdata$Sub_metering_2 <- as.numeric(fdata$Sub_metering_2)
fdata$Sub_metering_3 <- as.numeric(fdata$Sub_metering_3)

# creating Plot4 & copy the file
par(mfrow = c(2, 2)) 
plot(fdata$Global_active_power~fdata$datetime, type = "l",xlab="" ,ylab= "Global Active Power (kilowatts)")
plot(fdata$voltage, type="l", xlab="datetime", ylab="Voltage")
plot(fdata$Sub_metering_1~fdata$datetime, type="n", ylab="Energy sub metering", xlab="")
lines(fdata$Sub_metering_1~fdata$datetime,col='Black')
lines(fdata$Sub_metering_2~fdata$datetime,col='Red')
lines(fdata$Sub_metering_3~fdata$datetime,col='Blue')
plot(fdata$datetime,fdata$Global_reactive_power, type="l", xlab="datetime", ylab="Global_reactive_power")
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()