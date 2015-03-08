# To use this script call plot4 with the string that specifies location of input
# file. E.g.: fileLocation="./household_power_consumption.txt" indictes that 
# the input file is located in the current directory.
plot4 <- function(fileLocation){
  powerData <- read.table(fileLocation, sep=";", na.strings='?', header=TRUE)
  powerData[1] <- as.Date(powerData$Date, '%e/%m/%Y')
  powerData$DateTime <- strptime(paste(powerData$Date, powerData$Time), format='%Y-%m-%d %H:%M:%S')
  subPowerData <- powerData[(powerData$Date == as.Date('2007-02-01') | powerData$Date == as.Date('2007-02-02')),]
  png(filename = './figure/plot4.png', width=480, height=480)
  par(mfrow = c(2,2))
  with(subPowerDataFS, {
    plot(subPowerData$DateTime, subPowerData$Global_active_power, 
         type='l', ylab='Global Active Power', xlab='')
    plot(subPowerData$DateTime, subPowerData$Voltage, type='l', 
         ylab='Voltage', xlab='datetime')
    plot(subPowerData$DateTime, subPowerData$Global_reactive_power, type='l', 
         ylab='Global_reactive_power', xlab='datetime')
  })
  dev.off()
  par(mfrow = c(2,2))
  with(subPowerDataFS, {
    plot(subPowerData$DateTime, subPowerData$Global_active_power, 
         type='l', ylab='Global Active Power', xlab='')
    plot(subPowerData$DateTime, subPowerData$Voltage, type='l', 
         ylab='Voltage', xlab='datetime')
    plot(subPowerData$DateTime, subPowerData$Global_reactive_power, type='l', 
         ylab='Global_reactive_power', xlab='datetime')
})
}
