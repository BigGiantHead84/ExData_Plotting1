plot_2 <- function(){
    #load data from 1st of Feb to 2nd Feb 2007 into system
    hhpc_data <<- read.table("household_power_consumption.txt", header = TRUE, sep = ";",skip=66636,nrows = 2880, na.strings = "?", col.names = c("Date","Time","Global_active_power","Global_reactive_power","Voltage","Global_intensity","Sub_metering_1","Sub_metering_2","Sub_metering_3"),colClasses = c("character","character","numeric","numeric","numeric","numeric","numeric","numeric","numeric") )
    
    #Turn date and time columns as POSIXct class by combining these two columns and formatting with as.POSIX.ct function
    hhpc_data <<- within(hhpc_data, datetime <- as.POSIXct(paste(Date,Time),format="%d/%m/%Y %H:%M:%S"))
    
    #Open png fil
    png("plot2.png", width = 480,height = 480)
    #initialise the base plotting function over datetime (x-axis) and Global Active Power (y-axis)
    plot(hhpc_data$datetime,hhpc_data$Global_active_power,type = "l",ylab = "Global Active Power (kilowatts)",xlab = "")
    #close the file
    dev.off()
}