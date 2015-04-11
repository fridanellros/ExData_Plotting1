# LOAD
data <- read.table( "household_power_consumption.txt", 
                    sep = ";", 
                    header = TRUE,
                    colClasses = c(rep("character",2),rep("numeric",7)),
                    na.strings = "?")

# PROCESS
require(lubridate)
data$Date  <-  dmy( data$Date )
data$Time  <-  hms( data$Time )

dates      <-  data$Date == ymd("20070201") |
               data$Date == ymd("20070202")
datetimes  <-  data$Date[ dates ] + data$Time[ dates ]

# PLOT 
png( file = "plot2.png",
     width = 480, 
     height = 480)
plot( x = datetimes,
      y = data$Global_active_power[ dates ],
      type = "l",
      main = "",
      xlab = "",
      ylab = "Global Active Power (kilowatts)")
dev.off()