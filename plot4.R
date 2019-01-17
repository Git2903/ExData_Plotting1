data<-read.table("./household_power_consumption.txt", header=TRUE,sep=";",stringsAsFactors=FALSE,dec=".")
subdata<-data[data$Date %in% c("1/2/2007","2/2/2007"),]


datetime<-strptime(paste(subdata$Date,subdata$Time,sep = " "),"%d/%m/%Y %H:%M:%S")
globalActivePower<-as.numeric(subdata$Global_active_power)
globalReactivePower<-as.numeric(subdata$Global_reactive_power)
voltage<-as.numeric(subdata$Voltage)
subMeter1<-as.numeric(subdata$Sub_metering_1)
subMeter2<-as.numeric(subdata$Sub_metering_2)
subMeter3<-as.numeric(subdata$Sub_metering_3)

png("plot4.png", width = 480,height = 480)
par(mfrow=c(2,2))

plot(datetime, globalActivePower, type = "l",xlab = "",ylab = "Global Active Power")

plot(datetime, voltage, type = "l",xlab = "datetime",ylab = "Voltage")

plot(datetime, subMeter1, type = "l",xlab = "",ylab = "Energy sub metering")
lines(datetime,subMeter2,type = "l",col="red")
lines(datetime,subMeter3,type = "l",col="blue")
legend("topright",c("sub_metering_1","sub_metering_2","sub_metering_3"),lty = 1,lwd = 2.5,col = c("black","red","blue"))

plot(datetime, globalReactivePower, type = "l",xlab = "datetime",ylab = "Global_reactive_power")

dev.off()