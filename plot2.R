#########################################################################################
# Author: sebastid
# Date: 10-09-2015
# Description: Creates the plot2.png image
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
plot.data <- data_tbl %>% filter(Date>="2007-02-01" & Date<="2007-02-02")  %>% select(datetime,Global_active_power)

#--- Create the plot
par(mfrow=c(1,1),cex=0.75)
plot(plot.data, type='l', col='black', main="", xlab="", ylab="Global Active Power (kilowatts)")

#--- Save the plot to the png file device
dev.copy(png,"plot2.png",width=480,height=480)
dev.off()