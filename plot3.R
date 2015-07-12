# plot3.R


infile <- "./data/household_power_consumption.txt"
outfile <- "plot3.png"

# First, read the file "household_power_comsumption.txt"
dt <- read.csv(infile, header=TRUE, sep=";", na.strings="?")

# Next, filter data where Date="1/2/2007" or "2/2/2007"
dtfilter <- subset(dt, (Date=="1/2/2007" | Date =="2/2/2007"))

# Combine the 'Date' & 'Time' columns into one 'DateTime' column of Date Type
dtfilter$DateTime <- strptime(paste(dtfilter$Date, dtfilter$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

# Plot graph to outfile
png(file=outfile, width=480, height=480, units="px")


plot(dtfilter$DateTime, dtfilter$Sub_metering_1, type="l", col="black", xlab="", ylab="Energy sub metering",main="")
lines(dtfilter$DateTime, dtfilter$Sub_metering_2, col="red")
lines(dtfilter$DateTime, dtfilter$Sub_metering_3, col="blue")

legend("topright", lty=1, col=c("black","red","blue"), legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))

dev.off()