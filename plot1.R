# loading the data 
full_data <- read.csv("household_power_consumption.txt", 
                      header= TRUE, sep=';', na.strings="?", 
                      nrows=2075259, check.names= FALSE, 
                      stringsAsFactors= FALSE, comment.char="", 
                      quote='\"')
data1 <- subset(full_data, Date %in% c("1/2/2007", "2/2/2007"))
#plot1
hist(data1$Global_active_power, main = "Global Active Power", 
     xlab = "Global Active Power (kilowatts)", ylab = "Frequency", 
     col = "red")
png("plot1.png", width = 480, height = 480)
dev.off()


