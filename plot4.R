householdPower <- read.csv(file="household_power_consumption.txt", header=TRUE, sep=";", colClasses = "character")

hdPower <- householdPower[(householdPower$Date == '1/2/2007' | householdPower$Date == '2/2/2007'), ]

hdPower <- transform(hdPower, Global_active_power=as.numeric(Global_active_power), Date =strptime(paste(Date, " ", Time), "%d/%m/%Y %H:%M:%S"  ))

png(file="plot4.png")
par(mfrow = c(2, 2), mar = c(5, 4, 2, 1))

with(hdPower, plot(Date, Global_active_power, type="l", xlab="", ylab = "Global Active Power (kilowatts)"))
with(hdPower, plot(Date, Voltage, type = "l", xlab="datetime", ylab = "Voltage"))

with(hdPower, plot(Date, Sub_metering_1, type = "n", xlab="", ylab = "Energy sub metering"))
with(hdPower, points(Date, Sub_metering_1, col = "black", type="l"))
with(hdPower, points(Date, Sub_metering_2, col = "red", type="l"))
with(hdPower, points(Date, Sub_metering_3, col = "blue", type="l"))

legend("topright", pch = '-', col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

with(hdPower, plot(Date, Global_reactive_power, col = "black", type="l",  xlab="datetime"))

dev.off()