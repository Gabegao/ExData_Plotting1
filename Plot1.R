library(data.table)
## read data from file
data<-fread("household_power_consumption.txt", sep=";", header=TRUE, na.strings=c("NA","?"))

## convert from character to "Date" class
data$Date<- as.Date(data$Date, "%d/%m/%Y")

## pull out the subset data between 2007-02-01 and 2007-02-02
data<-subset(data, {Date >= "2007-02-01" & Date <= "2007-02-02"})

## create plot to screen device first and then save to PNG file.
png(filename = "Plot1.png")
with(data, hist(Global_active_power, xlab="Global Active Power (kilowatts)", ylab="Frequency", col="red", main="Global Active Power"))
dev.off()