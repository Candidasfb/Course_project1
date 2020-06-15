###Course Project week1 - Plot1####


#Set the directory with the data files#

path = "C:\\Users\\candi\\Desktop\\Doutoradoneuro090220\\Doutorado_Neurociencia_UFABC_28_11_2019\\Disciplinas\\Especializacao_Data_Science_coursera\\Exploratory_data_analysis\\Course_project1"

setwd(path)

#reading the file#

filename =  "household_power_consumption.txt"   

HPC = read.table(filename, header= TRUE, sep=";", stringsAsFactors=FALSE, dec=".")

#selecting days "1/2/2007" and "2/2/2007"

HPC2 = HPC[which(HPC[,1]=="1/2/2007" | HPC[,1]=="2/2/2007"),]

#Plotting the histogram of Global Active Power

GAP = as.numeric(HPC2$Global_active_power)

hist(GAP, xlab = "Global Active Power (killowatts)", main = "Global Active Power", col = "red")

#saving the graph in a PNG file

dev.copy(png, filename = "./plot1.png", width = 480, height = 480, units = "px", bg = "white")

dev.off