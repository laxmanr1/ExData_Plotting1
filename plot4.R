# read the data & plot GLOBAL_ACTIVE_POWER & VOLTAGE as two separate plots against TIME

# read data
powcons = read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, nrows = 2100000)

# shape the data
pc = powcons[(powcons$Date == "1/2/2007") | (powcons$Date == "2/2/2007"), ]
tm = strptime (paste (pc$Date, " ", pc$Time), format = "%d/%m/%Y %H:%M:%S")
gap = as.numeric (pc$Global_active_power)
volt = as.numeric (pc$Voltage)

# plot the data
png("plot4.png", width=480, height=480)
par (mfrow = c(1, 2), mar = c(4, 4, 2, 2))    # panel
plot(tm, gap, type="l", xlab = "", ylab="Global Active Power")
plot(tm, volt, type="l", xlab = "datetime", ylab="Voltage")
dev.off()
