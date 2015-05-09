csv <- read.csv("../household_power_consumption.txt", sep=";", stringsAsFactors=FALSE, na.strings="?")
relevant_data <- csv[csv$Date == "1/2/2007" | csv$Date =="2/2/2007",]
png(filename="plot1.png")
hist(relevant_data$Global_active_power, col="red",main = "Global Active Power", xlab = "Global Active Power (killowatts)")
dev.off()