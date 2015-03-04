library("ggplot2")
library("scales")

data <- read.csv("data.txt",na.strings="?",sep=";")
#read.table("household_power_consumption.txt",header=TRUE,na.strings="?",sep=";")
#data <- data[(data$Date=="1/2/2007" | data$Date=="2/2/2007" ),]

# parse date + time string to DateTime type in R
x <- paste(data$Date, data$Time)
data$Date <- weekdays(as.Date(data$Date, format("%d/%m/%Y")))
data$Time <- strptime(x, format("%d/%m/%Y %H:%M:%S"))

# save plot to png
filename <- "plot2.png"
png(filename=filename, width=480, height=480, units="px")

# plot
ggplot(data=data, aes(x=Time, y=Global_active_power)) +
        geom_path(aes(group=Date)) + 
        ylab("Global Active Power (kilowatts)") + 
        scale_x_datetime(breaks = date_breaks("1 day")) +
        xlab(NULL)
dev.off()

