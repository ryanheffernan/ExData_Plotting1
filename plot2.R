source('loadData.R')

data <- loadData()
png('plot2.png', width = 480, height = 480)
with(
    data, 
    plot(
        DateTime, 
        Global_active_power, 
        type = 'l', 
        xlab=NA, 
        ylab="Global Active Power (kilowatts)"
    )
)
dev.off()