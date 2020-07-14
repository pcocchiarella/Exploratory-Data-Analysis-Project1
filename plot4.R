# loading the data
full_data <- read.csv("household_power_consumption.txt", header=TRUE, 
                      sep=';', na.strings="?", 
                      nrows=2075259, check.names=FALSE, 
                      stringsAsFactors=FALSE, comment.char="", quote='\"')
data1 <- subset(full_data, Date %in% c("1/2/2007","2/2/2007"))
data1$Date <- as.Date(data1$Date, format="%d/%m/%Y")
datetime <- paste(as.Date(data1$Date), data1$Time)
data1$Datetime <- as.POSIXct(datetime)
#plot4
par(mfrow = c(2,2), mar = c(4,4,2,1), oma = c(0,0,2,0))
with(data1, {
  plot(Global_active_power ~ Datetime, type = "l",
       xlab = "",
       ylab = "Global Active Power")
  plot(Voltage ~ Datetime, type = "l",
       xlab = "",
       ylab = "Voltage")
  plot(Sub_metering_1 ~ Datetime, type = "l", 
       xlab = "",
       ylab = "Global Active Power")
  lines(Sub_metering_2 ~ Datetime, col = "red")
  lines(Sub_metering_3 ~ Datetime, col = "blue")
  legend("topright", col = c("black", "red", "blue"), lty = 1, lwd = 2, 
         bty = "n", 
         legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
  plot(Global_reactive_power ~ Datetime, type = "l",
       xlab = "",
       ylab = "Global Reactive Power")
})


