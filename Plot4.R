##Reading the .txt file and transforming it in a data frame
RAW_data_DF=read.table(file = "./ExploratoryDataAnalysis/household_power_consumption.txt"
                       ,sep=";",header=T,colClasses = c("character","character","numeric"
                                                        ,"numeric","numeric","numeric","numeric","numeric","numeric")
                       ,na.strings="?")

##Subsetting the data to be explored
DATA_SS_DF<- RAW_data_DF [66637:69516,]

##Making the suggested changes on data
DATA_SS_DF$Date<-as.Date(DATA_SS_DF$Date, format = "%d/%m/%Y")
DATA_SS_DF$FD <- as.POSIXct(paste(DATA_SS_DF$Date,DATA_SS_DF$Time))

#Plot 4

par(mfrow=c(2,2), mar=c(4,4,2,1))
plot(DATA_SS_DF$Global_active_power~DATA_SS_DF$FD, type="l",
     ylab="Global Active Power (Kilowatts)", xlab="")
plot(DATA_SS_DF$Voltage~DATA_SS_DF$FD, type="l", ylab="Voltage", xlab="Date & Time")
plot(DATA_SS_DF$FD, DATA_SS_DF$Sub_metering_1, type="l", ylab="Energy sub metering", xlab="")
lines(DATA_SS_DF$FD, DATA_SS_DF$Sub_metering_2, col="red")
lines(DATA_SS_DF$FD, DATA_SS_DF$Sub_metering_3, col="blue")
legend("top", col=c("black", "red", "blue"), lty=1, lwd=1,legend=c("Sub metering 1",
                                      "Sub metering 2", "Sub metering 3"),bty = "n")
plot(DATA_SS_DF$Global_reactive_power~DATA_SS_DF$FD, type="l", ylab="Global reactive power",
     xlab="Date & Time")
dev.copy(png,file="plot4.png")
dev.off()

###P.S.
###I Had some trouble on setting the subtittle on the third plot, if you know
###how can i fix it please send it to me on feedback. Thanks!



