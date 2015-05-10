coursedata = read.table("household_power_consumption.txt", header = TRUE, sep = ";", na.strings = "?", stringsAsFactors = FALSE)
coursedataToUse <- subset(coursedata, ((as.Date(Date, "%d/%m/%Y") >= "2007-2-1") & (as.Date(Date, "%d/%m/%Y") <= "2007-2-2")))

attach(mtcars)
par(mfrow=c(2,2))

timeseries <- ts(coursedataToUse$Global_active_power)
plot.ts(timeseries, yax.flip = TRUE, xlab = "", ylab = "Global Active Power (kilowatts)")

timeseriesVoltage <- ts(coursedataToUse$Voltage)
plot.ts(timeseriesVoltage, yax.flip = TRUE, xlab = "datetime", ylab = "Voltage")

timeseries <- ts(coursedataToUse$Sub_metering_1)
plot.ts(timeseries, yax.flip = TRUE, xlab = "", ylab = "Energy sub metering")
#axis(side = 1, at = as.Date(coursedataToUse$Date, '%b-%y'), labels = as.Date(coursedataToUse$Date, '%b-%y'))
timeseries2 <- ts(coursedataToUse$Sub_metering_2)
points(timeseries2, col='red', type='l')
timeseries3 <- ts(coursedataToUse$Sub_metering_3)
points(timeseries3, col='blue', type='l')
legend(1950, 40, c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red","blue"), lty=c(1, 1, 1))

timeseriesGlobalReactivePower <- ts(coursedataToUse$Global_reactive_power)
plot.ts(timeseriesGlobalReactivePower, yax.flip = TRUE, xlab = "datetime", ylab = "Global_reactive_power")

dev.copy(png,'plot4.png')
dev.off()