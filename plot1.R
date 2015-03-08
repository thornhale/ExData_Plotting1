# To use this script call plot1 with the string that specifies location of input
# file. E.g.: fileLocation="./household_power_consumption.txt" indictes that 
# the input file is located in the current directory.
plot1 <- function(fileLocation){
  powerData <- read.table(fileLocation, sep=";", na.strings='?', header=TRUE)
  powerData[1] <- as.Date(powerData$Date, '%e/%m/%Y')
  powerData$DateTime <- strptime(paste(powerData$Date, powerData$Time), format='%Y-%m-%d %H:%M:%S')
  subPowerData <- powerData[(powerData$Date == as.Date('2007-02-01') | powerData$Date == as.Date('2007-02-02')),]
  png(filename = './figure/plot1.png', width=480, height=480)
  hist(subPowerData$Global_active_power, xlab='Global Active Power (kilowatts)', col="red",main='Global Active Power')
  dev.off()
  hist(subPowerData$Global_active_power, xlab='Global Active Power (kilowatts)', col="red", main='Global Active Power')
}