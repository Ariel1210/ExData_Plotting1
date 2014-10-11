#Read the data from the file, but just the rows we are interested in (saving RAM memory)
data <- read.table("household_power_consumption.txt", header=T, sep=";",na.string="?",
                   skip=66636, nrow=2880, col.names=c("Date","Time","Global_active_power",
                                                      "Global_reactive_power","Voltage","Global_intensity",
                                                      "Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#Merging Date and Time in a new column
data$Date_Time <- paste(data$Date, data$Time, sep= " ")

#Formatting the new column as Date class
data$Date_Time <- strptime(data$Date_Time, format = "%d/%m/%Y %H:%M:%S")

#This is an optional line useful or displaying the days in the x label in English,
Sys.setlocale("LC_TIME", "English")

#Selecting PNG file as my graphic device. Same reason as explained in plot 3.
png("plot4.png")

#Preparing the plotting area as 2x2 
par(mfrow = c(2,2))

#Adding the first graph in position (1,1):
plot(data$Date_Time, data$Global_active_power, type = "l", xlab= " " , ylab="Global Active power")

#Adding the second graph in position (1,2):
plot(data$Date_Time, data$Voltage, type = "l", xlab= "datetime" , ylab="Voltage")

#Adding the third graph in position (2,1):
plot(data$Date_Time, data$Sub_metering_1, type = "l", xlab= " " , ylab="Energy sub metering")
points(data$Date_Time, data$Sub_metering_2, type = "l", xlab= " " , ylab="Energy sub metering", col = "red")
points(data$Date_Time, data$Sub_metering_3, type = "l", xlab= " " , ylab="Energy sub metering", col = "blue")
legend("topright", pch='___'  , col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ), bty = "n")

#Adding the fourth graph in position (2,2):
plot(data$Date_Time, data$Global_reactive_power, type = "l", xlab= "datetime" , ylab="Global_reactive_power")

#Closing the connection
dev.off()

#Restoring par() to its default value
par(mfrow = c(1,1))


