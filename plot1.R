# read the data & plot frequency of GLOBAL_ACTIVE_POWER 

# read data
powcons = read.table("household_power_consumption.txt", header=TRUE, sep=";", stringsAsFactors=FALSE, nrows = 2100000)

# shape the data
pc = powcons[(powcons$Date == "1/2/2007") | (powcons$Date == "2/2/2007"), ]
gap = as.numeric (pc$Global_active_power)

# plot the data
png("plot1.png", width=480, height=480)
hist(gap, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()
