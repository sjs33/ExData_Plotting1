plot1 <-function() {

## Read data and filter dates
data<-read.table("household_power_consumption.txt",sep=";",na.strings=("?"),header=TRUE,colClasses=c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric"))
data2 <- data[data$Date=="1/2/2007"|data$Date=="2/2/2007",]

## Write Histogram to png file
png(file="plot1.png")
hist(data2$Global_active_power,col="Red",main="Global Active Power",xlab="Global Active Power (kilowatts)",ylab="Frequency")
dev.off()

}