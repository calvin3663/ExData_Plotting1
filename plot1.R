# plot1.R


infile <- "./data/household_power_consumption.txt"
outfile <- "plot1.png"

# First, read the file "household_power_comsumption.txt"
dt <- read.csv(infile, header=TRUE, sep=";", na.strings="?")

# Next, filter data where Date="1/2/2007" or "2/2/2007"
dtfilter <- subset(dt, (Date=="1/2/2007" | Date =="2/2/2007"))

# Plot graph to outfile
png(file=outfile, width=480, height=480, units="px")
hist(dtfilter$Global_active_power, xlab="Global Active Power (kilowatts)", main="Global Active Power", col="red")
dev.off()