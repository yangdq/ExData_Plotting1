householdPower <- read.csv(file="household_power_consumption.txt", header=TRUE, sep=";", colClasses = "character")

hdPower <- householdPower[(householdPower$Date == '1/2/2007' | householdPower$Date == '2/2/2007'), ]

hdPower <- transform(hdPower, Global_active_power=as.numeric(Global_active_power), Date =strptime(paste(Date, " ", Time), "%d/%m/%Y %H:%M:%S"  ))
png(file="plot3.png")

with(hdPower, plot(Date, Sub_metering_1, type = "n", xlab="", ylab = "Energy sub metering"))
with(hdPower, points(Date, Sub_metering_1, col = "black", type="l"))
with(hdPower, points(Date, Sub_metering_2, col = "red", type="l"))
with(hdPower, points(Date, Sub_metering_3, col = "blue", type="l"))
legend("topright", pch = '-', col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

dev.off()