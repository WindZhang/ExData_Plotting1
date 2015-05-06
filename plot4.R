# Dowload the file into my local computer F:/Rprog, unzip the rename the file as
# power.txt. Copied the power.tat to F:/Rprog
# setwd F:/Rprog
# Load the file to the memory
rawData <- read.csv("power.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
# subset only two days as needed
twoDays <- subset(rawData, Date == "2/2/2007" | Date == "1/2/2007")
twoDays <- transform(twoDays, Date = weekdays(as.Date(Date, "%d/%m/%Y"), abbreviate = TRUE))
active <- as.ts(twoDays$Global_active_power)
voltage <- as.ts(twoDays$Voltage)
sub_1 <- as.ts(twoDays$Sub_metering_1)
sub_2 <- as.ts(twoDays$Sub_metering_2)
sub_3 <- as.ts(twoDays$Sub_metering_3)
reactive <- as.ts(twoDays$Global_reactive_power)

png("plot4.png", width = 480, height = 480)
par (mfrow = c(2, 2))

#Plot Global active power
plot(active, type = "s", xaxt ="n", ylab = "Global Active Power", xlab = "")
axis (1, at = c(0,1440,2880) , labels = c("Thu", "Fri", "Sat"))

#Plot Voltage
plot(voltage, type = "s", xaxt ="n", ylab = "Voltage", xlab = "datetime")
axis (1, at = c(0,1440,2880) , labels = c("Thu", "Fri", "Sat"))

#Plot Sub_metering

plot(sub_1, type = "s", xaxt ="n", ylab = "Energy sub metering", xlab = "")
lines(sub_2, col = "red")
lines(sub_3, col = "blue")

axis (1, at = c(0,1440,2880) , labels = c("Thu", "Fri", "Sat"))
legend( "topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1,1), col=c ("black", "red", "blue"), cex =1, bty = "n")

#Plot Global_reacive_power
plot(reactive, type = "s", xaxt ="n", ylab = "Global_reactive_power", xlab = "datetime")
axis (1, at = c(0,1440,2880) , labels = c("Thu", "Fri", "Sat"))

dev.off()