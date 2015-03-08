# To use this script call plot4 with the string that specifies location of input
# file. E.g.: fileLocation="./household_power_consumption.txt" indictes that 
# the input file is located in the current directory.
plot4 <- function(fileLocation){
  powerData <- read.table(fileLocation, sep=";", na.strings='?', header=TRUE)
  powerData[1] <- as.Date(powerData$Date, '%e/%m/%Y')
  powerData$DateTime <- strptime(paste(powerData$Date, powerData$Time), format='%Y-%m-%d %H:%M:%S')
  subPowerData <- powerData[(powerData$Date == as.Date('2007-02-01') | powerData$Date == as.Date('2007-02-02')),]
  png(filename = './figure/plot4.png', width=480, height=480)
  par(mfrow=c(2,2))
  with(
    subPowerData,
    plot(subPowerData$DateTime, subPowerData$Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatts)'),
    plot(subPowerData$DateTime, subPowerData$Voltage, type='l', xlab='datetime', ylab='Voltage'),
    plot(subPowerData$DateTime, subPowerData$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering'),
    lines(subPowerData$DateTime, subPowerData$Sub_metering_2, type = "l", col='red'),
    lines(subPowerData$DateTime, subPowerData$Sub_metering_3, type = "l", col='blue'),
    legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c('black', 'red', 'blue')),
    plot(subPowerData$DateTime, subPowerData$Global_reactive_power, type='l', xlab='datetime', ylab='Global_reactive_power')
  )
  dev.off()
  with(
    subPowerData,
    plot(subPowerData$DateTime, subPowerData$Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatts)'),
    plot(subPowerData$DateTime, subPowerData$Voltage, type='l', xlab='datetime', ylab='Voltage'),
    plot(subPowerData$DateTime, subPowerData$Sub_metering_1, type='l', xlab='', ylab='Energy sub metering'),
    lines(subPowerData$DateTime, subPowerData$Sub_metering_2, type = "l", col='red'),
    lines(subPowerData$DateTime, subPowerData$Sub_metering_3, type = "l", col='blue'),
    legend("topright", c("Sub_metering_1","Sub_metering_2", "Sub_metering_3"), lty=c(1,1,1), col=c('black', 'red', 'blue')),
    plot(subPowerData$DateTime, subPowerData$Global_reactive_power, type='l', xlab='datetime', ylab='Global_reactive_power')
  )
}
