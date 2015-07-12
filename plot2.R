# plot2.R


infile <- "./data/household_power_consumption.txt"
outfile <- "plot2.png"

# First, read the file "household_power_comsumption.txt"
dt <- read.csv(infile, header=TRUE, sep=";", na.strings="?")

# Next, filter data where Date="1/2/2007" or "2/2/2007"
dtfilter <- subset(dt, (Date=="1/2/2007" | Date =="2/2/2007"))

# Combine the 'Date' & 'Time' columns into one 'DateTime' column of Date Type
dtfilter$DateTime <- strptime(paste(dtfilter$Date, dtfilter$Time, sep=" "), format="%d/%m/%Y %H:%M:%S")

# Plot graph to outfile
png(file=outfile, width=480, height=480, units="px")

plot(dtfilter$DateTime, dtfilter$Global_active_power, type="l", xlab="", ylab="Global Active Power (kilowatts)", main="")

dev.off()