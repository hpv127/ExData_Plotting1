# Set the directory
setwd("C:/Users/I039307/Documents/Hashin/01_Official/40_Data_Scientist/Exploratory Data Analysis/")
# Read the data
filepath<- "./household_power_consumption.txt"
data <- read.table(filepath,header = TRUE, sep = ';', stringsAsFactors = FALSE, dec = '.')

# Filter the data based on data
finaldata <- data[data$Date %in% c("1/2/2007","2/2/2007"),]

# Converting to numeric
finaldata$Global_active_power <- as.numeric(finaldata$Global_active_power)

# Graphic devices
png("./ExData_Plotting1/plot1.png", width = 480, height = 480)

# Plotting the graph
hist(finaldata$Global_active_power, col="red", main="Global Active Power", xlab="Global Active Power (kilowatts)")
dev.off()