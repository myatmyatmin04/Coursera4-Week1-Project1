# Setup working directory
setwd("C:/Users/E5-471G/Desktop/Test for R/Coursera4-Week1-Project1")

# Read household power consumption dataset
powerdata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# Assign selected data for required period
data02 <- subset(powerdata, Date %in% c("1/2/2007","2/2/2007"))

# Date and time
data02$Date <- as.Date(data02$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data02$Date), data02$Time)
data02$Datetime <- as.POSIXct(datetime)

# Create plot2
with(data02, {
  plot(Global_active_power~Datetime, type="l", ylab="Global Active Power (kilowatts)", xlab="")
})

# Save plot2.png file
dev.copy(png, file="plot2.png", height=480, width=480)
dev.off()
