#Exploratory data : Project 1: Plot 2

# Read the data from File
data <- read.table("household_power_consumption.txt", header = T, sep = ";", na.strings = "?")

# convert the date aatribute to Date datatype
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

# Subset the data
sub_powerData <- subset(data, subset = (Date >= "2007-02-01" & Date <= "2007-02-02"))

# Convert dates and times
sub_powerData$datetime <- strptime(paste(sub_powerData$Date, sub_powerData$Time), "%Y-%m-%d %H:%M:%S")

Convert DateTime variable
sub_powerData$datetime <- as.POSIXct(sub_powerData$datetime)

#create the plot2
plot(sub_powerData$Global_active_power ~ sub_powerData$datetime, type = "l", ylab = "Global Active Power (kilowatts)", xlab = "")

#Copy to graphic device
dev.copy(png, file = "plot2.png", height = 480, width = 480)

#Close the device
dev.off()