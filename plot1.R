#Read the data from the file, but just the rows we are interested in (saving RAM memory)
data <- read.table("household_power_consumption.txt", header=T, sep=";",na.string="?",
                   skip=66636, nrow=2880, col.names=c("Date","Time","Global_active_power",
                                                      "Global_reactive_power","Voltage","Global_intensity",
                                                      "Sub_metering_1","Sub_metering_2","Sub_metering_3"))
#making the graphic
hist(data$Global_active_power, col = "red", main = "Global Active Power", xlab= "Global Active Power (kilowatts)")

#Saving the graphic
dev.copy(png, file = "plot1.png")
dev.off()