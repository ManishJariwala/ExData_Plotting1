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

#Plot the same, add multiple data points as lines, add legend

plot(HPCt$DateTime,HPCt$Sub_metering_1,xlab="",ylab= "Energy Sub Meetering",type="l")
lines(HPCt$DateTime,HPCt$Sub_metering_2,xlab="",ylab= "Energy Sub Meetering",type="l",col="red")
lines(HPCt$DateTime,HPCt$Sub_metering_3,xlab="",ylab= "Energy Sub Meetering",type="l",col="blue")
legend("topright",legend=c("sub_meeting_1","sub_meeting_2","sub_meeting_3"),lty = c(1), col=c("black","red","blue") )

#copy plot from screen to a file.

dev.copy(png, file = "plot3.png",width = 480, height = 480 )
dev.off()



