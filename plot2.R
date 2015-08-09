## Load Full Data Set into R:
data<- read.csv("./Data/household_power_consumption.txt", sep=";",
	nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, 
	stringsAsFactors = FALSE, na.strings= "?")

## Subset the Data: 
sub<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

## Set Date/Time Format: 
sub$DateTime <- as.POSIXct(paste(as.Date(sub$Date, format = "%d/%m/%Y"), 
	sub$Time))

## Create Plot:
png("plot2.png", width = 480, height = 480)
	plot(sub$DateTime, sub$Global_active_power, type="l", 
	ylab= "Global Active Power(kilowatts)", xlab="")
dev.off()