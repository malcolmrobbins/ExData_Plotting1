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

# Plot 4
png(filename = "plot4.png", width = 480, height = 480)
par(mfrow = c(2, 2))

# 1st graph is repeat of Plot 1 but with different ylab
with(dsub, plot(DateTime, Global_active_power, type = "l", 
                xlab = "", ylab = "Global Active Power"))

# 2nd graph is Voltage line graph
with(dsub, plot(DateTime, Voltage,type = "l", xlab="datetime", ylab="Voltage"))

# 3rd graph is repeat of Plot 3 but with no border on legend
with(dsub, plot(DateTime, Sub_metering_1, type = "n", xlab="", ylab="Energy sub metering"))
with(dsub, lines(DateTime, Sub_metering_1, col = "black"))
with(dsub, lines(DateTime, Sub_metering_2, col = "red"))
with(dsub, lines(DateTime, Sub_metering_3, col = "blue"))
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
       col = c("black", "red", "blue"), lty = c(1, 1), bty = "n")

# 4th graph is repeat of Global_reactive_power line graph
with(dsub, plot(DateTime, Global_reactive_power,type="l", xlab="datetime"))
dev.off()