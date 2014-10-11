#Read the data from the file, but just the rows we are interested in (saving RAM memory)
data <- read.table("household_power_consumption.txt", header=T, sep=";",na.string="?",
                   skip=66636, nrow=2880, col.names=c("Date","Time","Global_active_power",
                                                      "Global_reactive_power","Voltage","Global_intensity",
                                                      "Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#Merging Date and Time in a new column
data$Date_Time <- paste(data$Date, data$Time, sep= " ")

#Formatting the new column as Date class
data$Date_Time <- strptime(data$Date_Time, format = "%d/%m/%Y %H:%M:%S")

#This is an optional line of code only needed if you're not in USA
Sys.setlocale("LC_TIME", "English")

#Making the graphic
plot(data$Date_Time, data$Global_active_power, type = "l", xlab= " " , ylab="Global Active power (kilowatts)")

#Saving the graphic
dev.copy(png, file = "plot2.png")
dev.off()