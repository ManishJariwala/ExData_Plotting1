
# read source file
HPCt<-read.csv("household_power_consumption.txt", header=TRUE, sep=c(";"), colClass=c("character", "character", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric", "numeric"), strip.white=TRUE, na.strings =c("?", ""))

# subset only two dates
HPCt1 <- subset(HPCt, dmy(Date) > "2007-01-31" & dmy(Date) <= "2007-02-02")
# transform the Date column into date format
HPCt2 <- transform(HPCt1, Date = dmy(Date))

# plot histogram
hist(HPCt2$Global_active_power, col = "red", xlab = "Global Active Power (kilowatts)",main ="Global Active Power")

#copy plot from screen to a file.

dev.copy(png, file = "plot1.png",width = 480, height = 480 )
dev.off()
