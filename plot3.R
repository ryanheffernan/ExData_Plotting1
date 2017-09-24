source('loadData.R')

data <- loadData()
png('plot3.png', width = 480, height = 480)
plot(
    data$DateTime,
    data$Sub_metering_1,
    type = 'l',
    ylab = "Energy sub metering"
)
lines(
    data$DateTime,
    data$Sub_metering_2,
    col="red"
)
lines(
    data$DateTime,
    data$Sub_metering_3,
    col="blue"
)
legend(
    "topright", 
    legend = grep('Sub_metering', names(data), value = TRUE),
    col=c("black", "red", "blue"), 
    lty = 1
)
dev.off()