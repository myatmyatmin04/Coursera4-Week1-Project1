# Setup working directory
setwd("C:/Users/E5-471G/Desktop/Test for R/Coursera4-Week1-Project1")

# Read household power consumption dataset
powerdata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# Assign selected data for required period
data03 <- subset(powerdata, Date %in% c("1/2/2007","2/2/2007"))

# Date and time
data03$Date <- as.Date(data03$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data03$Date), data03$Time)
data03$Datetime <- as.POSIXct(datetime)

# Create plot3
with(data03, {
  plot(Sub_metering_1~Datetime, type="l",
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

## Save plot3.png file
dev.copy(png, file="plot3.png", height=480, width=480)
dev.off()
