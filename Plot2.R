library(data.table)
## read data from file
data<-fread("household_power_consumption.txt", sep=";", header=TRUE, na.strings=c("NA","?"))

## convert from character to "Date" class
data$Date<- as.Date(data$Date, "%d/%m/%Y")

## pull out the subset data between 2007-02-01 and 2007-02-02
data<-subset(data, {Date >= "2007-02-01" & Date <= "2007-02-02"})

## create a temp variable to store the combined Date and Time information
temp<- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

## create plot to be saved in a PNG file.
png(filename = "Plot2.png")
plot(temp, data$Global_active_power, pch=NA_integer_, col="black", xlab="", ylab="Global Active Power (kilowatts)")
lines(temp, data$Global_active_power)
dev.off()