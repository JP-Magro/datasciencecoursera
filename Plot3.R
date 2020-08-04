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

#Plot 3
plot(DATA_SS_DF$FD, DATA_SS_DF$Sub_metering_1, type="l", main = "Sub-metering of Power - Time and day variation", ylab="Energy sub metering", xlab="")
lines(DATA_SS_DF$FD, DATA_SS_DF$Sub_metering_2, col="red")
lines(DATA_SS_DF$FD, DATA_SS_DF$Sub_metering_3, col="blue")
legend("topright", col=c("black", "red", "blue"), lty=2, lwd=3, legend=c("Sub metering 1", "Sub metering 2", "Sub metering 3"))
dev.copy(png,file="plot3.png")
dev.off()



