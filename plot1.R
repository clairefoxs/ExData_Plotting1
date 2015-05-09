# download data from: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip

raw <- read.table("household_power_consumption.txt", 
                  header = TRUE, sep = ";", na.strings = "?", 
                  stringsAsFactors=FALSE, colClasses="character")

# select data from the dates 2007-02-01 and 2007-02-02
data <- raw[which(raw$Date=="1/2/2007" | raw$Date=="2/2/2007"),]

# convert Global_active_power to as.numeric
data$Global_active_power <- as.numeric(data$Global_active_power)

# convert DateTime to as.Date
data$Date <- as.Date(data$Date, format="%e/%m/%Y")

# plot and save .png
png("plot1.png")
hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)",
     ylab="Frequency", main="Global Active Power")
dev.off()
