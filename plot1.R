# Setup working directory
setwd ("C:/Users/E5-471G/Desktop/Test for R/Coursera4-Week1-Project1")

# Read household power consumption dataset
powerdata <- read.csv("household_power_consumption.txt", header=T, sep=';', na.strings="?", 
                      nrows=2075259, check.names=F, stringsAsFactors=F, comment.char="", quote='\"')

# Assign selected data for required period
data01 <- subset(powerdata, Date %in% c("1/2/2007","2/2/2007"))

## Date
data01$Date <- as.Date(data01$Date, format="%d/%m/%Y")

# Create histogram plot1
hist(data01$Global_active_power, main="Global Active Power", xlab="Global Active Power (kilowatts)", ylab="Frequency", col="Red")

# Save plot1.png file
dev.copy(png, file="plot1.png", height=480, width=480)
dev.off()
