library(data.table)
## read data from file
data<-fread("household_power_consumption.txt", sep=";", header=TRUE, na.strings=c("NA","?"))

## convert from character to "Date" class
data$Date<- as.Date(data$Date, "%d/%m/%Y")

## pull out the subset data between 2007-02-01 and 2007-02-02
data<-subset(data, {Date >= "2007-02-01" & Date <= "2007-02-02"})

## create a temp variable to store the combined Date and Time information
temp<- strptime(paste(data$Date, data$Time), "%Y-%m-%d %H:%M:%S")

## initialize the file to save the plots
png(filename = "Plot4.png")

par(mfrow=c(2,2))

## the first plot in the top left corner
plot(temp, data$Global_active_power, pch=NA_integer_, col="black", xlab="", ylab="Global active power")
lines(temp, data$Global_active_power)

## the second plot in the top right corner
plot(temp, data$Voltage, pch=NA_integer_, col="black", xlab="datetime", ylab="Voltage")
lines(temp, data$Voltage)

## the thrid plot in the bottom left corner
plot(temp, data$Sub_metering_1, pch=NA_integer_, col="black", xlab="", ylab="Energy sub metering")
lines(temp, data$Sub_metering_1, col="black")
lines(temp, data$Sub_metering_2, col="red")
lines(temp, data$Sub_metering_3, col="blue")
legend("topright", lty=c(1,1,1), col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

## the fourth plot in the bottom right corner
plot(temp, data$Global_reactive_power, pch=NA_integer_, col="black", xlab="datetime", ylab="Global reactive power")
lines(temp, data$Global_reactive_power)

dev.off()
