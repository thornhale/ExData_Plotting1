plot2 <- function(fileLocation){
  powerData <- read.table(fileLocation, sep=";", na.strings='?', header=TRUE)
  powerData[1] <- as.Date(powerData$Date, '%e/%m/%Y')
  powerData$DateTime <- strptime(paste(powerData$Date, powerData$Time), format='%Y-%m-%d %H:%M:%S')
  subPowerData <- powerData[(powerData$Date == as.Date('2007-02-01') | powerData$Date == as.Date('2007-02-02')),]
  png(filename = './figure/plot2.png', width=480, height=480)
  plot(subPowerData$DateTime, subPowerData$Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatts)')
  dev.off()
  plot(subPowerData$DateTime, subPowerData$Global_active_power, type='l', xlab='', ylab='Global Active Power (kilowatts)')
}