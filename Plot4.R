###Course Project week1 - Plot4####


#Set the directory with the data files#

path = "C:\\Users\\candi\\Desktop\\Doutoradoneuro090220\\Doutorado_Neurociencia_UFABC_28_11_2019\\Disciplinas\\Especializacao_Data_Science_coursera\\Exploratory_data_analysis\\Course_project1"

setwd(path)

#reading the file#

filename =  "household_power_consumption.txt"   

HPC = read.table(filename, header= TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#selecting days "1/2/2007" and "2/2/2007"

HPC2 = HPC[which(HPC[,1]=="1/2/2007" | HPC[,1]=="2/2/2007"),]

HPC2$datetime <- strptime(paste(HPC2$Date, HPC2$Time), format = "%d/%m/%Y %H:%M:%S")

##Plotting Plot 4###

x = as.POSIXct(HPC2$datetime)

GAP = as.numeric(HPC2$Global_active_power)

y1 = as.numeric(HPC2$Sub_metering_1)

y2 = as.numeric(HPC2$Sub_metering_2)

y3 = as.numeric(HPC2$Sub_metering_3)

png (filename = "./plot4.png", width = 480, height = 480, units = "px", bg = "white")

par (mfrow = c(2,2))

plot(x, GAP, type = 'l', ylab = "Global Activity Power (kilowatts)", xlab = "")

plot (x, HPC2$Voltage, ylab = "Voltage", xlab = "datetime")

plot(x,y1, type = 'l', ylab = "Energy sub metering", xlab = "")

lines(x,y2,type = 'l', col="red")

lines(x,y3,type = 'l', col="blue")

legend("topright",lty = 1, col = c("black", "red", "blue"), bty = "n", legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

plot(x, HPC2$Global_reactive_power, xlab = "datetime", ylab = "Global_reactive_power")

dev.off
