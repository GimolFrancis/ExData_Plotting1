## Create the replica of the plot 1
# as per the data numeric attributes are defined
attrType <- c( Global_active_power="numeric",Global_intensity="numeric",Voltage="numeric", Sub_metering_1="numeric",Sub_metering_2="numeric",Sub_metering_3="numeric",Global_active_power="numeric",Global_reactive_power="numeric")
 
#read the data from the file
data <- read.table("household_power_consumption.txt", header=TRUE, sep=";", colClasses=attrType, dec=".", strip.white=TRUE , stringsAsFactors=FALSE, na.strings = "?")

#check the data
head(data)

#find datatypes of the columns
sapply(data, typeof)

#Convert Date format to date
data$Date <- as.Date(data$Date, format = "%d/%m/%Y")

#Subset of data between 1st Feb 2007 and 2nd Feb 2007 
sub_powerData <- data[data$Date %in% c("1/2/2007","2/2/2007") ,]

# no:of rows available in subset
nrow(sub_powerData)
  
#plot data
hist(sub_powerData$Global_active_power, col="red",xlab="Global Active Power (kilowatts)",ylab="Frequency",main="Global Active Power")

#copy to graphic device
dev.copy(png, file = "plot1.png", height = 480, width = 480)

#close the graphic device 
dev.off()