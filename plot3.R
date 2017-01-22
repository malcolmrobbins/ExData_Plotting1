#setwd("~/svn/coursera/johnHopkins/courses/04_ExploratoryAnalysis/ExData_Plotting1")
d <- read.csv("household_power_consumption.txt", sep = ";", stringsAsFactors = FALSE)
#
# Combine Date and Time into a DateTime and transform other factors into appropriate types
d$DateTime <- as.POSIXct(strptime(paste(d$Date, " ", d$Time), "%d/%m/%Y %H:%M:%S"))
d$Date <- as.Date(d$Date,"%d/%m/%Y")
d$Global_active_power <- as.numeric(d$Global_active_power)
#
# Subset for the two days of interest
dsub <- subset(d, d$Date >= as.Date("2007-02-01") & d$Date <= as.Date("2007-02-02"))

# Plot 3
png(filename = "plot3.png", width = 480, height = 480)
with(dsub, plot(DateTime, Sub_metering_1, type = "n", xlab="", ylab="Energy sub metering"))
with(dsub,lines(DateTime, Sub_metering_1, col = "black"))
with(dsub,lines(DateTime, Sub_metering_2, col = "red"))
with(dsub,lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = c(1, 1))
dev.off()