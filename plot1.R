source('loadData.R')

data <- loadData()
png('plot1.png', width = 480, height = 480)
hist(
    data$Global_active_power, 
    main = "Global Active Power", 
    col = "red", 
    xlab = "Global Active Power (kilowatts)",
    yaxp = c(0, 1200, 6),
    ylim = c(0,1200)
)
dev.off()