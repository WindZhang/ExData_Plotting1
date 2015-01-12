png("plot4.png")
par (mfrow = c(2, 2))

#Plot Global active power
plot(1:length(power$Global_active_power), power$Global_active_power, type = "s", xaxt ="n", ylab = "Global Active Power", xlab = "")
axis (1, at = c(0,1440,2880) , labels = c("Thu", "Fri", "Sat"))

#Plot Voltage
plot(1:length(power$Voltage), power$Voltage, type = "s", xaxt ="n", ylab = "Voltage", xlab = "datetime")
axis (1, at = c(0,1440,2880) , labels = c("Thu", "Fri", "Sat"))

#Plot Sub_metering

plot(1:length(power$Sub_metering_1), power$Sub_metering_1, type = "s", xaxt ="n", ylab = "Energy sub metering", xlab = "")
lines(1:length(power$Sub_metering_2), power$Sub_metering_2, col = "red")
lines(1:length(power$Sub_metering_3), power$Sub_metering_3, col = "blue")

axis (1, at = c(0,1440,2880) , labels = c("Thu", "Fri", "Sat"))
legend( "topright",c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1,1), col=c ("black", "red", "blue"), cex =1, bty = "n")

#Plot Global_reacive_power
plot(1:length(power$Global_reactive_power), power$Global_reactive_power, type = "s", xaxt ="n", ylab = "Global_reactive_power", xlab = "datetime")
axis (1, at = c(0,1440,2880) , labels = c("Thu", "Fri", "Sat"))

dev.off()