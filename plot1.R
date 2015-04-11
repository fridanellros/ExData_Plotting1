# LOAD
data <- read.table( "household_power_consumption.txt", 
                    sep = ";", 
                    header = TRUE,
                    colClasses = c(rep("character",2),rep("numeric",7)),
                    na.strings = "?")

# PROCESS
require(lubridate)
data$Date  <-  dmy( data$Date )

dates      <-  data$Date == ymd("20070201") |
               data$Date == ymd("20070202")

# PLOT 
png( file = "plot1.png",
     width = 480, 
     height = 480)
hist( data$Global_active_power[ dates ],
      breaks = 11,
      main = "Global Active Power",
      xlab = "Global Active Power (kilowatts)",
      ylab = "Frequency",
      col = "red",
      ylim = c(0,1200))
dev.off()