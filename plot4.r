plot4 <-function() {
  
  ## Read data and filter dates
  data<-read.table("household_power_consumption.txt",sep=";",na.strings=("?"),header=TRUE,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
  data2 <- data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
  data2 <- cbind(data2,DateTime=strptime(paste(data2$Date,data2$Time),format="%d/%m/%Y %H:%M:%S"))
  
  ## Write Histogram to png file
  png(file="plot4.png")
  
  par(mfrow=(c(2,2)))
  
  ## top left plot
  plot(data2$DateTime,data2$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
       
  ## top right plot
  plot(data2$DateTime,data2$Voltage,type="l",xlab="datetime",ylab="Voltage")
  
  ## bottom left plot
  plot(data2$DateTime,data2$Sub_metering_1,type="n",xlab="",ylab="Energy Sub Metering")
  points(data2$DateTime,data2$Sub_metering_1,type="l",col="Black")
  points(data2$DateTime,data2$Sub_metering_2,type="l",col="Red")
  points(data2$DateTime,data2$Sub_metering_3,type="l",col="Blue")
  legend("topright",legend=names(data2)[7:9],col=c("Black","Red","Blue"),pch=NA,lty=1)
  
  ## bottom right plot
  plot(data2$DateTime,data2$Global_reactive_power,type="l",xlab="datetime",ylab="Global_reactive_power")
  
  dev.off()
  
}