setwd("C:/Users/Ashish/DSCourse/exploratoryda/W1")
library(lubridate)

# Read Data
hpcData <- read.table("./hpcdata/household_power_consumption.txt", header = TRUE, sep = ";", na = "?")
subsetData <- hpcData[hpcData$Date %in% c("1/2/2007", "2/2/2007"), ]
subsetData$datetime <- dmy_hms(paste(subsetData$Date, subsetData$Time))

# Plot Graphs
png("plot3.png")
plot(subsetData$datetime, subsetData$Sub_metering_1, type = "l", xlab = "", 
     ylab = "Energy sub metering") 
lines(subsetData$datetime, subsetData$Sub_metering_2, type = "l", col = "red")
lines(subsetData$datetime, subsetData$Sub_metering_3, type = "l", xlab = "", 
      ylab = "", col = "blue")
legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
      col = c("black", "red", "blue"), lty = 1)
dev.off()
