setwd("C:/Users/Ashish/DSCourse/exploratoryda/W1")
library(lubridate)

# Read Data
hpcData <- read.table("./hpcdata/household_power_consumption.txt", header = TRUE, sep = ";", na = "?")
subsetData <- hpcData[hpcData$Date %in% c("1/2/2007", "2/2/2007"), ]
subsetData$datetime <- dmy_hms(paste(subsetData$Date, subsetData$Time))

# Plot Graphs
hist(subsetData$Global_active_power, col = "red", main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)")
dev.copy(png, file ="plot1.png")
dev.off()
