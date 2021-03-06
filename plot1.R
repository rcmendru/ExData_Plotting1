# Read the unzipped file into a data.frame
fileName <- "household_power_consumption.txt"
all_data <- read.table(fileName, header = TRUE, sep=";", quote="", na.strings="?",
                       colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"),
                       comment.char="")

# Combine Date and Time fields after conversion
data <- within(all_data, datetime <- strptime(paste(Date, Time), format="%d/%m/%Y %H:%M:%S"))

# Subset the data for the target dates
data <- subset(data, datetime >= "2007-02-01" & datetime < "2007-02-03")

# Create plot1.png
png(filename="plot1.png")
hist(data$Global_active_power, col="red", xlab="Global Active Power (kilowatts)",
     main="Global Active Power")
dev.off()