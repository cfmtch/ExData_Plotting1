
#proj1

# reads the entire file
DT<- read.table("household_power_consumption.txt", sep=";")
#head(DT)
#nrow(DT)
#ncol(DT)

# selects the two days we want: Feb.1, 2007 and Feb.2, 2007
dat<- rbind(DT[DT$V1=="1/2/2007",],DT[DT$V1=="2/2/2007",])
#head(dat)
#tail(dat)

# making convenient column names
colnames(dat)<- c("Date","Time","GAP","GRP","Vltg","Gi","SubMtr1","SubMtr2","SubMtr3")
#head(dat)

# THIS ONE IS IT
#hist(as.numeric(as.vector(gap2)), col="RED", main=paste("Global Active Power"), xlab="Global Active Power (kilowatts)", ylab="Frequency")

# make the plot and save the file
windows()
hist(as.numeric(as.vector(dat$GAP)), col="RED", main=paste("Global Active Power"), xlab="Global Active Power (kilowatts)", ylab="Frequency")
png(file = "plot1.png")
dev.off()


