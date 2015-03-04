data <- read.csv("data.txt",na.strings="?",sep=";")

# parse date + time string to DateTime type in R
x <- paste(data$Date, data$Time)
data$Date <- weekdays(as.Date(data$Date, format("%d/%m/%Y")))
data$Time <- strptime(x, format("%d/%m/%Y %H:%M:%S"))

# save plot to png
filename <- "plot3.png"
png(filename=filename, width=480, height=480, units="px")

# plot
plot(x=data$Time, y=data$Sub_metering_1,
     type="l",
     ylab="Energy sub metering",
     xlab="",
     col="black")
lines(x=data$Time,y=data$Sub_metering_2,type="l",col="red")
lines(x=data$Time,y=data$Sub_metering_3,type="l",col="blue")
legend("topright",
       legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=1,
       yjust=1,
       cex=0.75)

dev.off()

