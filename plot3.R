# Read the unzipped file into a data.frame
fileName <- "household_power_consumption.txt"
all_data <- read.table(fileName, header = TRUE, sep=";", quote="", na.strings="?",
                       colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                       comment.char="")

# Combine Date and Time fields after conversion
data <- within(all_data, datetime <- strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

# Subset the data for the target dates
data <- subset(data, datetime >= "2007-02-01" & datetime < "2007-02-03")

# Create plot3.png
png(filename="plot3.png")
with(data, plot(datetime, Sub_metering_1, type="n", xlab="", ylab="Energy sub metering"))
with(data, lines(datetime, Sub_metering_1))
with(data, lines(datetime, Sub_metering_2, col="red"))
with(data, lines(datetime, Sub_metering_3, col="blue"))
legend("topright", lty=c(1,1), col=c("black","red","blue"),
       legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"))
dev.off()