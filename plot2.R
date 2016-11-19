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
png("plot2.png")
with(powerdata, plot(datetime,Global_active_power,type="l",xlab="",
                     ylab="Global Active Power (kilowatts)"))
dev.off()