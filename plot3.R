# Set the directory
setwd("C:/Users/I039307/Documents/Hashin/01_Official/40_Data_Scientist/Exploratory Data Analysis/")
# Read the data
filepath<- "./household_power_consumption.txt"
data <- read.table(filepath,header = TRUE, sep = ';', stringsAsFactors = FALSE, dec = '.')

# Filter the data based on data
finaldata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

# Converting to numeric
finaldata$Sub_metering_1 <- as.numeric(finaldata$Sub_metering_1)
finaldata$Sub_metering_2 <- as.numeric(finaldata$Sub_metering_2)
finaldata$Sub_metering_3 <- as.numeric(finaldata$Sub_metering_3)

# Joining date and time
datetime <- strptime(paste(finaldata$Date, finaldata$Time, sep=" "), "%d/%m/%Y %H:%M:%S") 

# Graphic devices
png("./ExData_Plotting1/plot3.png", width = 480, height = 480)

# Plotting the graph
plot(datetime, finaldata$Sub_metering_1, type="l", ylab="Energy Submetering", xlab="")
lines(datetime, finaldata$Sub_metering_2, type="l", col="red")
lines(datetime, finaldata$Sub_metering_3, type="l", col="blue")
legend("topright", c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), lty=1, lwd=2.5, col=c("black", "red", "blue"))
dev.off()
