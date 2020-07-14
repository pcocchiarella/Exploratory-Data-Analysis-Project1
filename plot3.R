# loading the data
full_data <- read.csv("household_power_consumption.txt", header= TRUE, 
                      sep=';', na.strings="?", 
                      nrows=2075259, check.names=FALSE, 
                      stringsAsFactors= FALSE, comment.char="", 
                      quote='\"')
data1 <- subset(full_data, Date %in% c("1/2/2007", "2/2/2007"))
data1$Date <- as.Date(data1$Date, format = "%d/%m/%Y")
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)
#plot3
with(data1, {
  plot(Sub_metering_1 ~ Datetime, type = "l",
       xlab = "",
       ylab = "Energy sub metering")
  lines(Sub_metering_2 ~ Datetime, col = "red")
  lines(Sub_metering_3 ~ Datetime, col = "blue")
})
legend("topright", col=c("black", "red", "blue"), lty=1, lwd=2, 
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
