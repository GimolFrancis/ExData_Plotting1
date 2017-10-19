#Exploratory data : Project 1: Plot 2

# Read the data from File
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

# convert the date aatribute to Date datatype
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset the data
sub_powerData <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# create Dae time
sub_powerData$datetime <- strptime(paste(sub_powerData$Date, sub_powerData$Time), "%Y-%m-%d %H:%M:%S")

Convert DateTime variable
sub_powerData$datetime <- as.POSIXct(sub_powerData$datetime)

#create the plot2 with sub_metering1
plot(sub_powerData$Sub_metering_1 ~ sub_powerData$datetime, type = "l", xlab = "", ylab = "Energy sub metering")

#add values for sub_metering2
lines(sub_powerData$Sub_metering_2 ~ sub_powerData$datetime, col = "Red")

#add values for sub_metering3
lines(sub_powerData$Sub_metering_3 ~ sub_powerData$datetime, col = "Blue")

#show the legends
legend("topright", lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))

#Copy to graphic device
dev.copy(png, file = "plot3.png", height = 480, width = 480)

#Close the device
dev.off()