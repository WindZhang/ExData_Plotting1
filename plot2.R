# Dowload the file into my local computer F:/Rprog, unzip the rename the file as
# power.txt. Copied the power.tat to F:/Rprog
# setwd F:/Rprog
# Load the file to the memory
rawData <- read.csv("power.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
# subset only two days as needed
twoDays <- subset(rawData, Date == "2/2/2007" | Date == "1/2/2007")
twoDays <- transform(twoDays, Date = weekdays(as.Date(Date, "%d/%m/%Y"), abbreviate = TRUE))
pts <- as.ts(twoDays$Global_active_power)
png("plot2.png", width = 480 , height = 480)
#plot the data
plot(pts, type = "s", xaxt ="n", ylab = "Global Active Power(Killowatts)", xlab = "")

#Replace the axis with "Thu", "Fri" and "Sat")

axis (1, at = c(0,1440,2880) , labels = c("Thu", "Fri", "Sat"))

dev.off()