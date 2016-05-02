
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
filtered_hpc$Global_active_power <- as.numeric(filtered_hpc$Global_active_power)

#plot to png
filetowrite <- "C:\\Users\\klm45692\\Desktop\\course\\Exploring data\\week 1\\plot1.png"
png(filename=filetowrite)

#actual creation of the graph
hist(filtered_hpc$Global_active_power,col="red", xlab="Global Active Power (kiloWatts)", main="Global Active Power")

dev.off()