#load the data into a data frame

data<-read.table("./data/household_power_consumption.txt",sep=";",
                      header=TRUE,stringsAsFactors=FALSE,na.strings="?")

#create a new column that combines the date and time columns
data$datetime <-paste(data$Date," ",data$Time)

#convert this character string column to a date class
data$datetime <- strptime(data$datetime, "%d/%m/%Y %H:%M:%S")

#also convert the Date column from character to date class
data$Date<-as.Date(data$Date,"%d/%m/%Y")

#subset the data for the desired date range
powerdata<-subset(data, Date == "2007-02-01" | Date == "2007-02-02")

#create the line plot 
png("plot3.png")
with(powerdata, plot(datetime,Sub_metering_1,type="n",xlab="",
                     ylab="Energy sub metering"))
points(powerdata$datetime,powerdata$Sub_metering_1,type="l")
points(powerdata$datetime,powerdata$Sub_metering_2,type="l",col="red")
points(powerdata$datetime,powerdata$Sub_metering_3,type="l",col="blue")
legend("topright",legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),
       col=c("black","red","blue"),lty=c(1,1,1))
dev.off()