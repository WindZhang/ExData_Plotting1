# Load the file to the memory
xhousehold_power_consumption <- read.table("~/household_power_consumption.txt", header = TRUE, sep=";", quote="\"")
# subset only two days as needed
x <- subset (xhousehold_power_consumption, Date == "2/2/2007" | Date == "1/2/2007")
# convert the factor format to the csv
write.csv(x, "~/power_2007_Feb_1_and_2.csv")
# load the csv file into memory
power_200702 <- read.csv("~/power_2007_Feb_1_and_2.csv")
attach(power_200702)
# plot the historam 
hist(power_200702$Global_active_power, main="Global Active Power", xlab = "Global active power(Kilowatts)", col = "Red")