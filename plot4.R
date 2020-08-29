# Setup working directory
setwd("C:/Users/E5-471G/Desktop/Test for R/Coursera4-Week1-Project1")

# Read household power consumption dataset
powerdata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# Assign selected data for required period
data04 <- subset(powerdata, Date %in% c("1/2/2007","2/2/2007"))

# Date and time
data04$Date <- as.Date(data04$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data04$Date), data04$Time)
data04$Datetime <- as.POSIXct(datetime)

# Create plot4
par(mfrow=c(2,2), mar=c(4,4,2,1), oma=c(0,0,2,0))
with(data04, {
  plot(Global_active_power~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  plot(Voltage~Datetime, type="l", 
       ylab="Voltage (volt)", xlab="")
  plot(Sub_metering_1~Datetime, type="l", 
       ylab="Global Active Power (kilowatts)", xlab="")
  lines(Sub_metering_2~Datetime,col='Red')
  lines(Sub_metering_3~Datetime,col='Blue')
  legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, bty="n",
         legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power~Datetime, type="l", 
       ylab="Global Rective Power (kilowatts)",xlab="")
})

## Save plot4.png file
dev.copy(png, file="plot4.png", height=480, width=480)
dev.off()
