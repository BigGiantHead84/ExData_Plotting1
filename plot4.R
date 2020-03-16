plot_4 <- function(){
    #load data from 1st of Feb to 2nd Feb 2007 into system
    hhpc_data <<- read.table("household_power_consumption.txt", header = TRUE, sep = ";",skip=66636,nrows = 2880, na.strings = "?", col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric") )
    
    #Turn date and time columns as POSIXct class by combining these two columns and formatting with as.POSIX.ct function
    hhpc_data <<- within(hhpc_data, datetime <- as.POSIXct(paste(Date,Time),format="%d/%m/%Y %H:%M:%S"))
    
    #Open png fil
    png("plot4.png", width = 480,height = 480)
    #set the canvas to draw four plots, row-wise
    par(mfrow=c(2,2))
    #set the bottom and left margings to 4, top to 2 and right margin to 2
    par(mar=c(4,4,2,2))
    #draw the first plot to top left corner
    plot(hhpc_data$datetime,hhpc_data$Global_active_power,type = "l",ylab = "Global Active Power",xlab = "")
    #draw the second plot to top right corner
    plot(hhpc_data$datetime,hhpc_data$Voltage,type = "l",ylab = "Voltage",xlab = "datetime")
    #draw the third plot to bottom left corner. 
    plot(hhpc_data$datetime,hhpc_data$Sub_metering_1,type = "l",col="grey",ylab = "Energy sub metering",xlab = "")
    lines(hhpc_data$datetime,hhpc_data$Sub_metering_2,type="l",col="red")
    lines(hhpc_data$datetime,hhpc_data$Sub_metering_3,type="l",col="blue")
    #Adjust the legend from previous plot task to remove the box around the legend and reduce font size to 0.5
    legend("topright",legend = c("Sub_metering_1","Sub_metering_2","Sub_metering_3"),col = c("grey","red","blue"),lty = 1, bty = "n",cex = 0.5)
    #draw the fourth plot to bottom right corner
    plot(hhpc_data$datetime,hhpc_data$Global_reactive_power,type = "l",ylab = "Global_reactive_power",xlab = "datetime")
    #close the file
    dev.off()
}