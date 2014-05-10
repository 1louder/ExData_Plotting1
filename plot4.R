## read electric power dataset into R
data <- read.table("household_power_consumption.txt", sep=";", as.is=TRUE, header=TRUE)

## focus on data from February 1-2, 2007
subDates <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

## create 2x2 plot space
par(mfrow = c(2,2))

## top left plot
plot1 <- as.numeric(subDates$Global_active_power)
days <- strptime(paste(subDates$Date, subDates$Time), format="%d/%m/%Y %H:%M:%S")
plot(days, plot1, xlab="", ylab="Global Active Power", type="l")

## top right plot
plot2 <- as.numeric(subDates$Voltage)
days <- strptime(paste(subDates$Date, subDates$Time), format="%d/%m/%Y %H:%M:%S")
plot(days, plot2, xlab="datetime", ylab="Voltage", type="l")

## lower left plot
plot3a <- as.numeric(subDates$Sub_metering_1)
plot3b <- as.numeric(subDates$Sub_metering_2)
plot3c <- as.numeric(subDates$Sub_metering_3)
days <- strptime(paste(subDates$Date, subDates$Time), format="%d/%m/%Y %H:%M:%S")
plot(days, plot3a, type="n", xlab="", ylab="Energy sub metering")
points(days, plot3a, type="l", col="black")
points(days, plot3b, type="l", col="red")
points(days, plot3c, type="l", col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## lower right plot
plot4 <- as.numeric(subDates$Global_reactive_power)
days <- strptime(paste(subDates$Date, subDates$Time), format="%d/%m/%Y %H:%M:%S")
plot(days, plot4, xlab="datetime", ylab="Global_reactive_power", type="l")
