# Load the file to the memory
xhousehold_power_consumption <- read.table("~/household_power_consumption.txt", header = TRUE, sep=";", quote="\"")
# subset only two days as needed
x <- subset (xhousehold_power_consumption, Date == "2/2/2007" | Date == "1/2/2007")
# convert the factor format to the csv
write.csv(x, "~/power_2007_Feb_1_and_2.csv")
# load the csv file into memory
power <- read.csv("~/power_2007_Feb_1_and_2.csv")

png("plot2.png")

#plot the data
plot(1:length(power$Global_active_power), power$Global_active_power, type = "s", xaxt ="n", ylab = "Global Active Power(Killowatts)", xlab = "")
#Replace the axis with "Thu", "Fri" and "Sat")

axis (1, at = c(0,1440,2880) , labels = c("Thu", "Fri", "Sat"))

dev.off()