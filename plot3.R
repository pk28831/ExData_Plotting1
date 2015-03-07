##plot3.R
## This file creates a histogram, based on data downloaded from 
## https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
## downloaded on 4-March_2015.
## It is expected that the unzipped file "household_power_consumption.txt" resides in
## the working directory of R.
##
##
## read the textfile into a dataframe
x<-read.table("household_power_consumption.txt",sep=";",header=TRUE,na.strings="?")
y<-x[(x$Date=="1/2/2007" | x$Date=="2/2/2007"),]
y$DateTime<-strptime(paste(y$Date,y$Time),"%d/%m/%Y %H:%M:%S")
## clear x , release memory
x<-NULL 
## plot histogram
## x11()
png(filename="plot3.png", width=480, height=480, units="px",bg="white")
with(y,plot(DateTime,Sub_metering_1,main="", xlab="",ylab="", type="n"))
with(y,lines(DateTime,Sub_metering_1,main="", xlab="",ylab="", col="black"))
with(y,lines(DateTime,Sub_metering_2,main="", xlab="",ylab="", col="red"))
with(y,lines(DateTime,Sub_metering_3,main="", xlab="",ylab="", col="blue"))
legend("topright",lty=1, col=c("black","red","blue"),legend=c("Sub_metering_1","Sub_metering_2","Sub_metering_3"))
title(ylab="Energy sub metering")
dev.off()