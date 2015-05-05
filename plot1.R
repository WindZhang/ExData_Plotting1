# Dowload the file into my local computer F:/Rprog, unzip the rename the file as
# power.txt. Copied the power.tat to F:/Rprog
# setwd F:/Rprog
# Load the file to the memory
rawData <- read.csv("power.txt", header = TRUE, sep = ";", stringsAsFactors = FALSE)
# subset only two days as needed
twoDays <- subset(rawData, Date == "2/2/2007" | Date == "1/2/2007")

# plot the historam 

png("plot1.png", width = 480, height = 480)

hist(as.numeric(twoDays$Global_active_power), main="Global Active Power", xlab = "Global active power(Kilowatts)", col = "Red")

dev.off()