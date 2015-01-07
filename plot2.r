plot2 <-function() {
  
  ## Read data and filter dates
  data<-read.table("household_power_consumption.txt",sep=";",na.strings=("?"),header=TRUE,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
  data2 <- data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]
  data2 <- cbind(data2,DateTime=strptime(paste(data2$Date,data2$Time),format="%d/%m/%Y %H:%M:%S"))
  
  ## Write Histogram to png file
  png(file="plot2.png")
  plot(data2$DateTime,data2$Global_active_power,type="l",xlab="",ylab="Global Active Power (kilowatts)")
  dev.off()
  
}