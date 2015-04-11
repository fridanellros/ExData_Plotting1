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
png( file = "plot3.png",
     width = 480, 
     height = 480)
plot( x = datetimes,
      y = data$Sub_metering_1[ dates ],
      type = "l",
      main = "",
      xlab = "",
      ylab = "Energy sub metering")
lines( x = datetimes,
       y = data$Sub_metering_2[ dates ], 
       col = "red" )
lines( x = datetimes,
       y = data$Sub_metering_3[ dates ], 
       col = "blue" )
legend("topright",
       legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       lty=c(1,1,1), 
       lwd=c(1,1,1),
       col=c("black","blue","red")) 
dev.off()