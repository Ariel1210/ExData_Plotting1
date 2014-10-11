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

#Making and saving the graph. Dev.copy() was cutting off the legend.

#Note: If you run the code, you wo't see the plot in your screen, because the 
#graphic device was changed to PNG. But the file will be generated.

png("plot3.png")

plot(data$Date_Time, data$Sub_metering_1, type = "l", xlab= " " , ylab="Energy sub metering")
points(data$Date_Time, data$Sub_metering_2, type = "l", xlab= " " , ylab="Energy sub metering", col = "red")
points(data$Date_Time, data$Sub_metering_3, type = "l", xlab= " " , ylab="Energy sub metering", col = "blue")
legend("topright", pch='___'  , col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3" ))

dev.off()




