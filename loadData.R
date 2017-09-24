library(data.table)
library(lubridate)
Sys.setenv(TZ='UTC')

DEFAULT_URL <- paste0(
    'https://d396qusza40orc.cloudfront.net/',
    'exdata%2Fdata%2Fhousehold_power_consumption.zip'
)
ZIPFILENAME <- "household_power_consumption.zip"
DATAFILENAME <- "household_power_consumption.txt"

loadData <- function(url = DEFAULT_URL) {
    download.file(url, ZIPFILENAME)
    unzip(ZIPFILENAME, files=c(DATAFILENAME))
    data <- fread(DATAFILENAME, na.strings="?")
    data[, DateTime := dmy_hms(paste(Date, Time))]
    data[, c("Date", "Time") := NULL]
    data <- data[
        DateTime %between% c('2007-02-01 00:00:00', '2007-02-02 23:59:59')
    ]
    setorder(data, DateTime)
    return(data)
}