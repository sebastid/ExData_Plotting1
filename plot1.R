#########################################################################################
# Author: sebastid
# Date: 10-09-2015
# Description: Creates the plot1.png image
#########################################################################################
library(dplyr)
library(lubridate)

rm(list=ls(environment()))
setwd("~/Documents/Coursera/exploratory-032")

#file.url <- "https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip"
#download.file(file.url,dest="elec_power_consumption.zip",method="curl")
#unzip("elec_power_consumption.zip")

#--- Load the Data
data <- read.table(file="household_power_consumption.txt",header=T, sep=";", stringsAsFactors = F, na.strings = "?")
data$Date <- dmy(data$Date)
data$Time <- hms(data$Time)
data_tbl <- as.tbl(data)

#--- Subset the Data with dplyr
global.active.power <- data_tbl %>% filter(Date>="2007-02-01" & Date<="2007-02-02")  %>% select(Global_active_power)

#--- Create the histogram
par(mfrow=c(1,1),cex=0.75)
hist(as.numeric(unlist(global.active.power)),col='red', main="Global Active Power", xlab="Global Active Power (kilowatts)")

#--- Save the plot to the png file device
dev.copy(png,"plot1.png",width=480,height=480)
dev.off()
