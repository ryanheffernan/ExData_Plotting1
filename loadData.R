library(data.table)
library(lubridate)
Sys.setenv(TZ='UTC')

loadData <- function(filename = 'household_power_consumption.txt') {
    data <- fread('household_power_consumption.txt', na.strings="?")
    data[, DateTime := dmy_hms(paste(Date, Time))]
    data[, c("Date", "Time") := NULL]
    data <- data[DateTime %between% c('2007-02-01 00:00:00', '2007-02-02 23:59:59')]
    setorder(data, DateTime)
    return(data)
}