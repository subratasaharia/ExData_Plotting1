# Course Project 1: Exploratory data analysis

unzip("./Coursera 4/Week 1/exdata%2Fdata%2Fhousehold_power_consumption.zip",
      exdir="./Coursera 4/Week 1/Course Project")
PrjData<-read.table("./Coursera 4/Week 1/Course Project/household_power_consumption.txt",
                    header= TRUE, sep=";", stringsAsFactors = FALSE)
Extract<-PrjData[(as.Date(PrjData$Date,"%d/%m/%Y")==as.Date("2007-02-01")|
                    as.Date(PrjData$Date,"%d/%m/%Y")==as.Date("2007-02-02")),]
Extracted<-cbind(as.data.frame.Date(as.Date(Extract$Date,"%d/%m/%Y")),
                 as.POSIXlt(strptime(Extract$Time,"%H:%M:%S")),Extract[,3:9])
png(file="Plot1.png")
hist(as.numeric(Extracted$Global_active_power)/1000,col = "Red", 
     xlab="Global Active Power(kilowatts)", 
     main="Global Active Power")

dev.off()

