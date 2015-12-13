householdPower <- read.csv(file="household_power_consumption.txt", header=TRUE, sep=";", colClasses = "character")

hdPower <- householdPower[(householdPower$Date == '1/2/2007' | householdPower$Date == '2/2/2007'), ]

hdPower <- transform(hdPower, Global_active_power=as.numeric(Global_active_power), Date = as.Date(Date, "%d/%m/%Y"))

hist(hdPower$Global_active_power, xlab = "Global Active Power (kilowatts)", main = "Global Active Power", col="red")

dev.copy(png, "plot1.png")

dev.off()