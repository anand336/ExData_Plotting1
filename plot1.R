## Load Full Data Set into R:
data<- read.csv("./Data/household_power_consumption.txt", sep=";",
	nrows= 2075260, header=TRUE, quote= "", strip.white=TRUE, 
	stringsAsFactors = FALSE, na.strings= "?")

## Subset the Data: 
sub<- subset(data, (data$Date == "1/2/2007" | data$Date== "2/2/2007")) 

## Set Date Format: 
sub$Date <- as.Date(sub$Date, format = "%d/%m/%Y")

## Create Plot:
png("plot1.png", width = 480, height = 480)
	hist(sub$Global_active_power, type="l", main="Global Active Power",
	col='red',ylab= "Frequency", xlab="Global Active Power(kilowatts)")
dev.off()