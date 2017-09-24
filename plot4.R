source('loadData.R')

data <- loadData()
png('plot4.png', width = 480, height = 480)

par(
    mfrow=c(2,2),
    cex.lab = 0.75,
    cex.axis=0.75
)

with(
    data, 
    plot(
        DateTime, 
        Global_active_power, 
        type = 'l', 
        xlab=NA, 
        ylab="Global Active Power"
    )
)

with(
    data,
    plot(
        DateTime,
        Voltage,
        type = 'l',
        xlab = 'datetime'
    )
)

plot(
    data$DateTime,
    data$Sub_metering_1,
    type = 'l',
    xlab = NA,
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
    lty = 1,
    cex = 0.5,
    bty = "n"
)

with(
    data,
    plot(
        DateTime,
        Global_reactive_power,
        type = 'l',
        xlab = 'datetime'
    )
)

dev.off()