# read the data & plot of GLOBAL_ACTIVE_POWER against TIME

# read data
powcons = read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, nrows = 2100000)

# shape the data
pc = powcons[(powcons$Date == "1/2/2007") | (powcons$Date == "2/2/2007"), ]
tm = strptime (paste (pc$Date, " ", pc$Time), format = "%d/%m/%Y %H:%M:%S")
gap = as.numeric (pc$Global_active_power)

# plot the data
png("plot2.png", width=480, height=480)
plot(tm, gap, type="l", xlab = "", ylab="Global Active Power (kilowatts)")
dev.off()
