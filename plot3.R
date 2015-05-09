# download data from: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

raw <- read.table("household_power_consumption.txt", 
					header = TRUE, sep = ";", na.strings = "?", 
					stringsAsFactors=FALSE, colClasses="character")

# select data from the dates 2007-02-01 and 2007-02-02
data <- raw[which(raw$Date=="1/2/2007" | raw$Date=="2/2/2007"),]

# convert Global_active_power to as.numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

# combine Date and Time
data$DateTime <- paste(data$Date, data$Time, sep=" ")

# convert DateTime to as.Date
data$DateTime <- strptime(data$DateTime, format="%e/%m/%Y %H:%M:%S")

# plot and save as png
png("plot3.png")
plot(data$DateTime, data$Sub_metering_1, type="n", xlab="", ylab="Energy sub metering")
lines(data$DateTime, data$Sub_metering_1, col="black")
lines(data$DateTime, data$Sub_metering_2, col="red")
lines(data$DateTime, data$Sub_metering_3, col="blue")
legend("topright", lty=c(1,1,1), lwd=c(2,2,2), col=c("black", "red", "blue"), legend=names(data[7:9]))
dev.off()
