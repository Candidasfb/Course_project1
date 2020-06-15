###Course Project week1 - Plot3####


#Set the directory with the data files#

path = "C:\\Users\\candi\\Desktop\\Doutoradoneuro090220\\Doutorado_Neurociencia_UFABC_28_11_2019\\Disciplinas\\Especializacao_Data_Science_coursera\\Exploratory_data_analysis\\Course_project1"

setwd(path)

#reading the file#

filename =  "household_power_consumption.txt"   

HPC = read.table(filename, header= TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#selecting days "1/2/2007" and "2/2/2007"

HPC2 = HPC[which(HPC[,1]=="1/2/2007" | HPC[,1]=="2/2/2007"),]


#choosing the Sub_metering_1, 2 and 3#####

y1 = as.numeric(HPC2$Sub_metering_1)

y2 = as.numeric(HPC2$Sub_metering_2)

y3 = as.numeric(HPC2$Sub_metering_3)

##plotting the graph

HPC2$datetime <- strptime(paste(HPC2$Date, HPC2$Time), format = "%d/%m/%Y %H:%M:%S")

x = as.POSIXct(HPC2$datetime)

png (filename = "./plot3.png", width = 480, height = 480, units = "px", bg = "white")

plot(x,y1, type = 'l', ylab = "Energy sub metering", xlab = "")

lines(x,y2,type = 'l', col="red")

lines(x,y3,type = 'l', col="blue")

legend("topright",lty = 1, col = c("black", "red", "blue"), legend = c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))

#saving the graph in a PNG file

dev.off