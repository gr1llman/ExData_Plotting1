plot3 <- function() {
        # This function has been written to satisfy one of the requirements for the first
        # week class project for the Johns Hopkins course "Exploratory Data Analysis" offered
        # through coursera.org.
        # 
        # This function begins by reading electric power consumption data from the UC Irvine Machine
        # Learning Repository.
        #  
        # The data is avaliable at the following url: https://d396qusza40orc.cloudfront.net/exdata%2Fdata%2Fhousehold_power_consumption.zip
        # 
        # Per the course instructions, this function generates a duplicate of a sample plot
        # provided using a subset of the data from 2007-02-01 and 2007-02-02.
        #
        # Prior to running this function:
        #  1. Ensure that the data is unzipped and in the working directory for your R session.
        #  2. Ensure this function has been loaded into your R session. e.g. source("rplot3")
        #
        # When you have sourced the function you can execute it with no parameters e.g. rplot3()
        # to generate the .png file
        
        # Read the data - instructions indicated that ? was used for NA.  Inspected a few rows to
        # determine that the sep character is semi-colon and that the file contains headers.
        
        hhpc <- read.table("household_power_consumption.txt",header=TRUE, sep=";", na.strings="?")
        
        # Convert the "Date" (column 1) into a standard date format
        
        hhpc[,1] <- as.Date(hhpc[ ,1], "%d/%m/%Y")
        
        # Subset the data to only select 2007-02-01 and 2007-02-02 data
        
        hhpc <- subset(hhpc, Date == "2007-02-01" | Date == "2007-02-02")
        
        # Create a vector for the date and time
        
        x <- strptime(paste(hhpc$Date, hhpc$Time), "%Y-%m-%d %H:%M:%S")
        

        # Open the png() device.
        #
        # Note: The instructions stated that the file image created should 480 pixels X 480 pixels.
        # That is the default image size for this device so no parameters are needed other than the
        # file name.
        
        png("plot3.png")
        
        # Open device and place first plot
        
        plot(x, hhpc$Sub_metering_1, type = "l", xlab = "", ylab = "Energy sub metering")
        
        # Layer second plot
        
        lines(x, hhpc$Sub_metering_2, type = "l", col = "red")
        
        # Layer third plot
        
        lines(x, hhpc$Sub_metering_3, type = "l", col = "blue")
        
        # Create legend
        
        legend("topright",
               legend = c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"),
               lty = c(1,1),
               col = c("black", "red", "blue"))
        
        # Close the device
        
        dev.off()
        
}