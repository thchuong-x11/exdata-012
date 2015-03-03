library("ggplot2")
# read treated data
data <- read.csv("data.txt",na.strings="?",sep=";")

# parse date + time string to DateTime type in R
x <- paste(data[,1], data[,2])
strptime(x, "%d/%m/%Y %H:%M:%S")
data[,1] <- x

# save plot to png
filename <- "plot2.png"
png(filename=filename, width=480, height=480, units="px")

# plot
ae <- aes(x=Date, y=Global_active_power,group=Date)
ggplot(data=data,ae) + geom_point(linetype="solid")
dev.off()
