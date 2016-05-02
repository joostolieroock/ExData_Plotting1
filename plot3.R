
if (exists("hpc")){
  cat("delete hpc set \n")
  rm(hpc)  
}
if (exists("filtered_hpc")){
  cat("delete filtred hpc set \n")
  rm(filtered_hpc)  
}

cat("reading hpc file \n")
hpc <- read.csv("C:/Users/klm45692/Desktop/course/Exploring data/week 1/household_power_consumption.txt", sep=";", na.strings="?")

hpc$Date <- as.Date(hpc$Date,format = "%m/%d/%Y")
startDate <- as.Date("2007-02-01")
endDate <- as.Date("2007-02-02")


cat("create filtered hpc set \n")
filtered_hpc <-subset(hpc,Date >= startDate & Date <= endDate) 

filtered_hpc$Sub_metering_1 <- as.numeric(filtered_hpc$Sub_metering_1)

filtered_hpc$Sub_metering_2 <- as.numeric(filtered_hpc$Sub_metering_2)

filtered_hpc$Sub_metering_3 <- as.numeric(filtered_hpc$Sub_metering_3)

#plot to png
filetowrite <- "C:\\Users\\klm45692\\Desktop\\course\\Exploring data\\week 1\\plot3.png"
png(filename=filetowrite)

#****actual creation of the graph******

x <- paste(filtered_hpc$Date, filtered_hpc$Time)
filtered_hpc$DateTime <- strptime(x, format="%Y-%m-%d %H:%M:%S")

yrange<-range(c(filtered_hpc$Sub_metering_1,filtered_hpc$Sub_metering_2,filtered_hpc$Sub_metering_3))
plot(filtered_hpc$DateTime,filtered_hpc$Sub_metering_1,xlab="",ylim=yrange,ylab="Global Active Power (kilowatts)",type="l",col=c("black"))

lines(filtered_hpc$DateTime,filtered_hpc$Sub_metering_2,type="l",col=c("blue"))
lines(filtered_hpc$DateTime,filtered_hpc$Sub_metering_3,type="l",col=c("red"))

legend("topright", legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col = c("black", "blue", "red"), lty = c(1, 1, 1))

dev.off()
