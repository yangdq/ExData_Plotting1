householdPower <- read.csv(file="household_power_consumption.txt", header=TRUE, sep=";", colClasses = "character")

hdPower <- householdPower[(householdPower$Date == '1/2/2007' | householdPower$Date == '2/2/2007'), ]

hdPower <- transform(hdPower, Global_active_power=as.numeric(Global_active_power), Date =strptime(paste(Date, " ", Time), "%d/%m/%Y %H:%M:%S"  ))

with(hdPower, plot(Date, Global_active_power, type="l", xlab="", ylab = "Global Active Power (kilowatts)"))

dev.copy(png, "plot2.png")

dev.off()