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
png(filename = "Plot3.png")
plot(temp, data$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering")
lines(temp, data$Sub_metering_2, col="red")
lines(temp, data$Sub_metering_3, col="blue")
legend("topright", lty=c(1,1,1), col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
dev.off()