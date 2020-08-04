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

#Plot 1
hist(DATA_SS_DF$Global_active_power,col = "red", main = "Global Active Power"
     ,xlab = "Global Active Power (Kilowatts)")
dev.copy(png,file="plot1.png")
dev.off()


