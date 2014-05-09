## read electric power dataset into R
data <- read.table("household_power_consumption.txt", sep=";", as.is=TRUE, header=TRUE)

## focus on data from February 1-2, 2007
subDates <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

## create a plot of Global Active Power 
plot2 <- as.numeric(subDates$Global_active_power)
days <- strptime(paste(subDates$Date, subDates$Time), format="%d/%m/%Y %H:%M:%S")
plot(days, plot2, xlab="", ylab="Global Active Power (kilowatts)", type="l")

## create a .png file of the plot
dev.copy(png, file = "plot2.png", width = 480, height = 480, units = "px")
dev.off()