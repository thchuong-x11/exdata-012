data <- read.csv("data.txt",na.strings="?",sep=";")

# parse date + time string to DateTime type in R
x <- paste(data$Date, data$Time)
data$Date <- weekdays(as.Date(data$Date, format("%d/%m/%Y")))
data$Time <- strptime(x, format("%d/%m/%Y %H:%M:%S"))

# save plot to png
filename <- "plot2.png"
png(filename=filename, width=480, height=480, units="px")

# plot
plot(x=data$Time,
     y=data$Global_active_power,
     type="l",
     ylab="Global Active Power (kilowatts)",
     xlab="")

dev.off()

