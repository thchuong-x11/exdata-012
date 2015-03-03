# read treated data
data <- read.csv("data.txt",na.strings="?",sep=";")

# parse date string to Date type in R
data[,1] <- as.Date(data[,1],format="%d/%m/%Y")

# save plot to png
filename <- "plot1.png"
png(filename=filename, width=480, height=480, units="px")

# plot
x <- data[,3]
main <- 'Global Active Power'
xlab <- 'Global Active Power (kilowatts)'
ylab <- 'Frequency'
hist(x,main=main,xlab=xlab,col = 2,ylim = c(0,1200))

dev.off()
