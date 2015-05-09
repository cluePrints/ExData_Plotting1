csv <- read.csv("../household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, na.strings="?")
relevant_data <- csv[csv$Date == "1/2/2007" | csv$Date =="2/2/2007",]
relevant_data$DateTime <- strptime(paste(relevant_data$Date, relevant_data$Time), format="%d/%m/%Y %H:%M:%S")
png(filename="plot4.png")
layout(matrix(1:4,2,2))
par(mar=c(4,4,4,4))

# 1
plot(relevant_data$DateTime, relevant_data$Global_active_power, type="l", ylab="Global Active Power (killowatts)", xlab="")

# 2
plot(relevant_data$DateTime, relevant_data$Sub_metering_1, col="black", type="l", ylab="Energy sub metering", xlab="")
lines(relevant_data$DateTime, relevant_data$Sub_metering_2, col="red")
lines(relevant_data$DateTime, relevant_data$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), pch = "_")

# 3
plot(relevant_data$DateTime, relevant_data$Voltage, type="l", ylab="Voltage", xlab="datetime")

#4
with(relevant_data, plot(DateTime, Global_reactive_power, type="l", xlab="datetime"))

dev.off()