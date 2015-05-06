# Dowload the file into my local computer F:/Rprog, unzip the rename the file as
# power.txt. Copied the power.tat to F:/Rprog
# setwd F:/Rprog
# Load the file to the memory
rawData <- read.csv("power.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
# subset only two days as needed
twoDays <- subset(rawData, Date == "2/2/2007" | Date == "1/2/2007")
twoDays <- transform(twoDays, Date = weekdays(as.Date(Date, "%d/%m/%Y"), abbreviate = TRUE))
sub_1 <- as.ts(twoDays$Sub_metering_1)
sub_2 <- as.ts(twoDays$Sub_metering_2)
sub_3 <- as.ts(twoDays$Sub_metering_3)
png("plot3.png")
plot(sub_1, type = "s", xaxt ="n", ylab = "Energy sub metering", xlab = "")
lines(sub_2, col = "red")
lines(sub_3, col = "blue")
axis (1, at = c(0,1440,2880) , labels = c("Thu", "Fri", "Sat"))
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty = c(1, 1,1), col=c ("black", "red", "blue"))
dev.off()
