source('loadData.R')

data <- loadDataset()
png('plot1.png')
hist(
    data$Global_active_power, 
    main = "Global Active Power", 
    col = "red", 
    xlab = "Global Active Power (kilowatts)",
    yaxp = c(0, 1200, 6),
    ylim = c(0,1200)
)
dev.off()