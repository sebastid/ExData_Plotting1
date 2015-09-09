#########################################################################################
# Author: sebastid
# Date: 10-09-2015
# Description: Creates the plot3.png image
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
plot.data1 <- data_tbl %>% filter(Date>="2007-02-01" & Date<="2007-02-02")  %>% select(datetime,Sub_metering_1)
plot.data2 <- data_tbl %>% filter(Date>="2007-02-01" & Date<="2007-02-02")  %>% select(datetime,Sub_metering_2)
plot.data3 <- data_tbl %>% filter(Date>="2007-02-01" & Date<="2007-02-02")  %>% select(datetime,Sub_metering_3)

#--- Prepare the plot
par(mfrow=c(1,1), cex=0.75)

#--- Draw the plot
plot(plot.data1, type='l', col='black', main="", xlab="", ylab="Energy sub metering")
lines(plot.data2, type='l', col='red')
lines(plot.data3, type='l', col='blue')
legend("topright",c("Sub_metering_1","Sub_metering_2","Sub_metering_3"), inset=c(0,0), lty = c(1, 1, 1), col=c("black","red","blue"))

#--- Save the plot to the png file device
dev.copy(png,"plot3.png",width=480,height=480)
dev.off()
