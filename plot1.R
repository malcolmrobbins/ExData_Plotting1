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

# Generate Plot 1
png(filename = "plot1.png", width = 480, height = 480)
with(dsub, hist(Global_active_power, main = "Global Active Power", col = "Red", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency"))
dev.off()