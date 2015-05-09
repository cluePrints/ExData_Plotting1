csv <- read.csv("../household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, na.strings="?")
relevant_data <- csv[csv$Date == "1/2/2007" | csv$Date =="2/2/2007",]
relevant_data$DateTime <- strptime(paste(relevant_data$Date, relevant_data$Time), format="%d/%m/%Y %H:%M:%S")

png(filename="plot3.png")
plot(relevant_data$DateTime, relevant_data$Sub_metering_1, col="black", type="l", ylab="Energy sub metering", xlab="")
lines(relevant_data$DateTime, relevant_data$Sub_metering_2, col="red")
lines(relevant_data$DateTime, relevant_data$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch = "_")
dev.off()