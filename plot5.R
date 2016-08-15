# read the data & plot 2 separate plots - GLOBAL_REACTIVE_POWER vs TIME and the 3 SUB_METERING vs TIME

# read data
powcons = read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, nrows = 2100000)

# shape the data
pc = powcons[(powcons$Date == "1/2/2007") | (powcons$Date == "2/2/2007"), ]
tm = strptime (paste (pc$Date, " ", pc$Time), format = "%d/%m/%Y %H:%M:%S")
grp = as.numeric (pc$Global_reactive_power)
sm1 = as.numeric (pc$Sub_metering_1)
sm2 = as.numeric (pc$Sub_metering_2)
sm3 = as.numeric (pc$Sub_metering_3)

# plot the data
png("plot5.png", width=480, height=480)
par (mfrow = c(1, 2), mar = c(4, 4, 2, 1))    # panel
plot(tm, sm1, type="l", xlab = "", ylab="Energy sub metering")
lines(tm, sm2, type="l", col="red")
lines(tm, sm3, type="l", col="blue")
legend ("topright", lty= 1, lwd=2,col = c("black","red","blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))
plot(tm, grp, type="l", xlab = "datetime", ylab="Global_reactive_power")
dev.off()
