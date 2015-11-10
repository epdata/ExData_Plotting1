##Course Exploratory Data Analysis 
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
#data <- read.table(datfile, header=T, sep=";", stringsAsFactors=FALSE, dec=".")
fdata<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007"))
fdata$Global_active_power <- as.numeric(fdata$Global_active_power)

# creating Plot1
png("plot1.png", width=480, height= 480)
hist(globalactivepower, col= "red", xlab= "Global Active Power (kilowatts)", main= "Global Active Power")
dev.off()




