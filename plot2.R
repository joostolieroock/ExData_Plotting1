
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

#plot to png
filetowrite <- "C:\\Users\\klm45692\\Desktop\\course\\Exploring data\\week 1\\plot2.png"
png(filename=filetowrite)

#****actual creation of the graph******

x <- paste(filtered_hpc$Date, filtered_hpc$Time)
filtered_hpc$DateTime <- strptime(x, format="%Y-%m-%d %H:%M:%S")

plot(filtered_hpc$DateTime,filtered_hpc$Global_active_power,xlab="",ylab="Global Active Power (kilowatts)",type="l")

dev.off()
