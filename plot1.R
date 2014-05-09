## read electric power dataset into R

data <- read.table("household_power_consumption.txt", sep=";", as.is=TRUE, header=TRUE)

## focus on data from February 1-2, 2007

subDates <- subset(data, data$Date == "1/2/2007" | data$Date == "2/2/2007")

## create a histogram of Global Active Power with red bars

plot1 <- as.numeric(subDates$Global_active_power)
hist(plot1, main="Global Active Power", col="red", xlab="Global Active Power (kilowatts)", ylab = "Frequency")

## create a .png file of the histogram

dev.copy(png, file = "plot1.png", width = 480, height = 480, units = "px")
dev.off()
