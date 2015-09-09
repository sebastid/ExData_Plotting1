#########################################################################################
# Author: sebastid
# Date: 10-09-2015
# Description: Creates the plot4.png image
#########################################################################################
library(dplyr)
library(lubridate)

rm(list=ls(environment()))
setwd("~/Documents/Coursera/exploratory-032")

#--- Load the Data
data <- read.table(file="household_power_consumption.txt", header=T, sep=";", stringsAsFactors = F, na.strings = "?")
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)
data$datetime <- data$Date + data$Time

#--- Subset the Data with dplyr
data_tbl <- as.tbl(data)
plot1.data <- data_tbl %>% filter(Date>="2007-02-01" & Date<="2007-02-02")  %>% select(datetime,Global_active_power)
plot2.data <- data_tbl %>% filter(Date>="2007-02-01" & Date<="2007-02-02")  %>% select(datetime,Voltage)
plot3.data1 <- data_tbl %>% filter(Date>="2007-02-01" & Date<="2007-02-02")  %>% select(datetime,Sub_metering_1)
plot3.data2 <- data_tbl %>% filter(Date>="2007-02-01" & Date<="2007-02-02")  %>% select(datetime,Sub_metering_2)
plot3.data3 <- data_tbl %>% filter(Date>="2007-02-01" & Date<="2007-02-02")  %>% select(datetime,Sub_metering_3)
plot4.data <- data_tbl %>% filter(Date>="2007-02-01" & Date<="2007-02-02")  %>% select(datetime,Global_reactive_power)


#--- Prepare the plot
par(mfrow=c(2,2),cex=0.65)

#--- Create the plot 1
plot(plot1.data, type='l', col='black', main="", xlab="", ylab="Global Active Power")

#--- Create the plot 2
plot(plot2.data, type='l', col='black', ylab="Voltage")

#--- Create the plot 3
plot(plot3.data1, type='l', col='black', main="", xlab="", ylab="Energy sub metering")
lines(plot3.data2, type='l', col='red')
lines(plot3.data3, type='l', col='blue')
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),cex=0.95,seg.len=3, inset = c(0.12,0),bty="n",lty=c(1, 1, 1),col=c("black","red","blue"))

#--- Create the plot 4
plot(plot4.data, type='l', col='black')

#--- Save the plot to the png file device
dev.copy(png,"plot4.png",width=480,height=480)
dev.off()