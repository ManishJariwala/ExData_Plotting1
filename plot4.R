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


# Create a canvas of 2 rows and 2 columns
par(mfcol=c(2,2))

#Plot the first graph
plot(HPCt$DateTime,HPCt$Global_active_power,xlab="",ylab= "Global Active Power (kilowatts)",type="l")

#Plot the second graph

plot(HPCt$DateTime,HPCt$Sub_metering_1,xlab="",ylab= "Energy Sub Meetering",type="l")
lines(HPCt$DateTime,HPCt$Sub_metering_2,xlab="",ylab= "Energy Sub Meetering",type="l",col="red")
lines(HPCt$DateTime,HPCt$Sub_metering_3,xlab="",ylab= "Energy Sub Meetering",type="l",col="blue")
legend("topright",legend=c("sub_meeting_1","sub_meeting_2","sub_meeting_3"),lty = c(1), col=c("black","red","blue") )

#Plot the third graph
plot(x=HPCt$DateTime,y=HPCt$Voltage,xlab="datetime",ylab= "Voltage",xaxp=c(234,238,4),type = "l")
#plot the fourth graph

plot(x=HPCt$DateTime,y=HPCt$Global_reactive_power,xlab="datetime",ylab= "Global Reactive Power",xaxp=c(234,238,4),type = "l")

#copy plot from screen to a file.

dev.copy(png, file = "plot4.png",width = 480, height = 480 )
dev.off()

