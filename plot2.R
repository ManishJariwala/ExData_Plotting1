
# Read Source file
HPCt<-read.csv("household_power_consumption.txt", header=TRUE, sep=c(";"), colClass=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), strip.white=TRUE, na.strings =c("?", ""))

#Subset dates that are required
HPCt <- subset(HPCt, dmy(Date) > "2007-01-31" & dmy(Date) <= "2007-02-02")

#transform the date
HPCt <- transform(HPCt, Date = dmy(Date))

#Create a new variable with Date and time combine
xxx <- as.POSIXct(paste(HPCt$Date, HPCt$Time), format="%Y-%m-%d %H:%M:%S")

# add new combine date and time into the data set
HPCt <- cbind(HPCt, DateTime = xxx)

# plot the same
plot(HPCt$DateTime,HPCt$Global_active_power,xlab="",ylab= "Global Active Power (kilowatts)",type="l")


#copy plot from screen to a file.

dev.copy(png, file = "plot2.png",width = 480, height = 480 )
dev.off()
