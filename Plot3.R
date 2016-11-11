# Course Project 1: Exploratory data analysis

unzip("./Coursera 4/Week 1/exdata%2Fdata%2Fhousehold_power_consumption.zip",
      exdir="./Coursera 4/Week 1/Course Project")
PrjData<-read.table("./Coursera 4/Week 1/Course Project/household_power_consumption.txt",
                    header= TRUE, sep=";", stringsAsFactors = FALSE)
Extract<-PrjData[(as.Date(PrjData$Date,"%d/%m/%Y")==as.Date("2007-02-01")|
                    as.Date(PrjData$Date,"%d/%m/%Y")==as.Date("2007-02-02")),]
Extracted<-cbind(as.data.frame.Date(as.Date(Extract$Date,"%d/%m/%Y")),
                 as.POSIXlt(strptime(Extract$Time,"%H:%M:%S")),Extract[,3:9])

png(file="Plot3.png")

plot(timeline,as.numeric(Extracted$Sub_metering_1),
     pch=".",
     xaxt='n',
     ylab="Energy sub metering",
     xlab=""
)
lines(timeline,as.numeric(Extracted$Sub_metering_1))
lines(timeline,as.numeric(Extracted$Sub_metering_2), col="Red")
lines(timeline,as.numeric(Extracted$Sub_metering_3), col="Blue")
axis(side=1,at=1, labels="Thu")
axis(side=1,at=1441, labels="Fri")
axis(side=1,at=2880, labels="Sat")
legend("topright", c("Sub Metering_1", "Sub Metering_2","Sub Metering_3"),
       lty=c(1,1,1),col=c("Black","Red","Blue"), cex=0.5)

dev.off()