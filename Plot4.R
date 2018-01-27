###### Plot 4

setwd("C:/Users/User/Documents/John Hopkins Data Science Course Series/Exploratory Data Analysis/Week 1")

mydata <- read.delim("household_power_consumption.txt",sep=";", header=TRUE, stringsAsFactors=FALSE)
head(mydata)
mydata[is.na(mydata)] <- '?'

# Convert Date to proper date format
mydata$Date <- as.Date(mydata$Date,format='%d/%m/%Y')
head(mydata$Date)
class(mydata$Date)

mydata$Datetime <- paste(mydata$Date, mydata$Time)
head(mydata$Datetime)

mydata$Day <- strptime(mydata$Datetime, format = "%Y-%m-%d %H:%M:%S")
head(mydata$Day)

# Subset data to first two days of Feb 2007
feb <- subset(mydata,Date == "2007-2-1" | Date == "2007-2-2")
head(feb)

## Plot 4 graphs
png(file = "plot4.png",width = 480, height = 480)

par(mfrow=c(2,2))

plot(feb$Global_active_power, type='l',ylab="Global Active Power")

plot(feb$Day,feb$Voltage,type='l',ylab="Voltage",,xlab="datetime")

plot(feb$Day,feb$Sub_metering_1,type='l',ylab="Energy sub metering")
lines(feb$Day,feb$Sub_metering_2,type='l',col='red')
lines(feb$Day,feb$Sub_metering_3,type='l',col='blue')

plot(feb$Day,feb$Global_reactive_power,type='l',ylab="Global_reactive_power",xlab="datetime")

dev.off()
