## Load Full Data Set into R:
data<- read.csv("./Data/household_power_consumption.txt", sep=";",
	nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, 
	stringsAsFactors = FALSE, na.strings= "?")

## Subset the Data: 
sub<- subset(data, (data$Date == "1/2/2007" | data$Date == "2/2/2007")) 
 
## Set Date/Time Format: 
sub$DateTime <- as.POSIXct(paste(as.Date(sub$Date, format = "%d/%m/%Y"), 
	sub$Time))

## Create Plot:
png("plot4.png", width = 480, height = 480)

par(mfcol=c(2,2))

plot(sub$DateTime, sub$Global_active_power, type="l", ylab= "Global Active Power", 
	xlab="")

plot(sub$DateTime, sub$Sub_metering_1, type="l", ylab= "Energy sub metering", xlab="")
	lines(sub$DateTime, sub$Sub_metering_2, type="l", col="red")
	lines(sub$DateTime, sub$Sub_metering_3, type="l", col="blue")
	legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), 
	lty=1, col=c("black", "red", "blue"), bty = "n")

plot(sub$DateTime,sub$Voltage,type="l",ylab="Voltage",xlab="datetime")

plot(sub$DateTime,sub$Global_reactive_power,type='l',xlab="datetime",
	ylab="Global_reactive_power")
dev.off()