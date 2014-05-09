## read electric power dataset into R
data <- read.table("household_power_consumption.txt", sep=";", as.is=TRUE, header=TRUE)

## focus on data from February 1-2, 2007
subDates <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

## create a plot of the energy sub metering 
plot3a <- as.numeric(subDates$Sub_metering_1)
plot3b <- as.numeric(subDates$Sub_metering_2)
plot3c <- as.numeric(subDates$Sub_metering_3)
days <- strptime(paste(subDates$Date, subDates$Time), format="%d/%m/%Y %H:%M:%S")

## create a .png file of the plot
png("plot3.png", width = 480, height = 480, units = "px")
plot(days, plot3a, type="n", xlab="", ylab="Energy sub metering")
points(days, plot3a, type="l", col="black")
points(days, plot3b, type="l", col="red")
points(days, plot3c, type="l", col="blue")
legend("topright", lty=1, col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()