## plot1.r
## Author: Matt Kane
## for Coursera MOOC 'Plotting Assignment 1 for Exploratory Data Analysis'

## This script will use data from the UC Irvine Machine Learning Repository that can be obtained at
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

## to set the working directory locally
## setwd("./ExData_Plotting1/")

## This script will complete the following requirements

## 1. Read all the data, format the columns, subset the data to Feb 1/2 2007
## 2. Create the plot and save it as a PNG

## Read all the data, format the columns, subset the data to Feb 1/2 2007

column_classes <- c("character", "character", "character", "character", "character", "character", "character", "character", "character")
temp <- tempfile()
download.file("https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip",temp)
full_power <- read.table(unz(temp, "household_power_consumption.txt"), header = TRUE, sep = ";", colClasses = column_classes)
unlink(temp)
full_power$Date <- as.Date(full_power$Date, "%d/%m/%Y")
## full_power$Time <- strptime(full_power$Time, "%H:%M:%S")

feb_power <- subset(full_power, Date >= as.Date("2007-02-01") & Date <= as.Date("2007-02-02"))
feb_power$Global_active_power <- as.numeric(feb_power$Global_active_power, digits=4)
feb_power$Global_reactive_power <- as.numeric(feb_power$Global_reactive_power, digits=4)
feb_power$Voltage <- as.numeric(feb_power$Voltage, digits=6)
feb_power$Global_intensity <- as.numeric(feb_power$Global_intensity, digits=4)
feb_power$Sub_metering_1 <- as.numeric(feb_power$Sub_metering_1, digits=4)
feb_power$Sub_metering_2 <- as.numeric(feb_power$Sub_metering_2, digits=4)
feb_power$Sub_metering_3 <- as.numeric(feb_power$Sub_metering_3, digits=4)
feb_power$DateTime <- as.POSIXct(paste(feb_power$Date, feb_power$Time), format="%Y-%m-%d %H:%M:%S")

## Create the plot and save it as a PNG
png("plot2.png", width=480, height=480, units="px")
with(feb_power, plot(Global_active_power ~ DateTime, type="l", xlab="", ylab="Global Active Power (kilowatts)"))
dev.off()


