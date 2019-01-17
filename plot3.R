data<-read.table("./household_power_consumption.txt", header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")
subdata<-data[data$Date %in% c("1/2/2007","2/2/2007"),]


datetime<-strptime(paste(subdata$Date,subdata$Time,sep = " "),"%d/%m/%Y %H:%M:%S")
globalActivePower<-as.numeric(subdata$Global_active_power)
subMeter1<-as.numeric(subdata$Sub_metering_1)
subMeter2<-as.numeric(subdata$Sub_metering_2)
subMeter3<-as.numeric(subdata$Sub_metering_3)

png("plot3.png", width = 480,height = 480)
plot(datetime, subMeter1, type = "l",xlab = "",ylab = "Energy sub metering")
lines(datetime,subMeter2,type = "l",col="red")
lines(datetime,subMeter3,type = "l",col="blue")
legend("topright",c("sub_metering_1","sub_metering_2","sub_metering_3"),lty = 1,lwd = 2.5,col = c("black","red","blue"))
dev.off()