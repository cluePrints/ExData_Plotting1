csv <- read.csv("../household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, na.strings="?")
relevant_data <- csv[csv$Date == "1/2/2007" | csv$Date =="2/2/2007",]
relevant_data$DateTime <- strptime(paste(relevant_data$Date, relevant_data$Time), format="%d/%m/%Y %H:%M:%S")
png(filename="plot2.png")
plot(relevant_data$DateTime, relevant_data$Global_active_power, type="l", ylab="Global Active Power (killowatts)", xlab="")
dev.off()