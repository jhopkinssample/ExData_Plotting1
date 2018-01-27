## Peer Assignment 1

setwd("C:/Users/User/Documents/John Hopkins Data Science Course Series/Exploratory Data Analysis/Week 1")

mydata <- read.delim("household_power_consumption.txt",sep=";", header=TRUE, stringsAsFactors=FALSE)
head(mydata)
mydata[is.na(mydata)] <- '?'

###### Plot 1
# Convert Date to proper date format
mydata$Date <- as.Date(mydata$Date,format='%d/%m/%Y')
head(mydata$Date)

mydata$Datetime <- paste(mydata$Date, mydata$Time)
head(mydata$Datetime)

mydata$Day <- strptime(mydata$Datetime, format = "%Y-%m-%d %H:%M:%S")
head(mydata$Day)

# Subset data to first two days of Feb 2007
feb <- subset(mydata,Date == "2007-2-1" | Date == "2007-2-2")
head(feb)

# Convert GAP to a numeric variable
feb$Global_active_power <- as.numeric(feb$Global_active_power)
class(feb$Global_active_power)

# Save plot as png
png(file = "plot1.png",width = 480, height = 480)
# Create plot 1, histogram
hist(feb$Global_active_power, col = "red", main="Global Active Power",xlab="Global Active Power (kilowatts)")
dev.off()