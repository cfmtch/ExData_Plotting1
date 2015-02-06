
#proj2

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
head(dat)







# make the plot and save the file
windows()


par(mfcol=c(2,2))
#mar=c(5,5,5,2)
plot(
  strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S"),
  as.numeric(as.vector(dat$GAP)),
  col="BLACK", 
  type="l",
  font=1,
  ylab="Global Active Power (Kilowatts)",
  xlab="")


plot(strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S"),
     as.numeric(as.vector(dat$SubMtr1)),
     col="BLACK", type="l",
     ylab="Energy sub metering", xlab="")
#par(new=TRUE)
lines(strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S"),
      as.numeric(as.vector(dat$SubMtr2)),
      col="RED", type="l",
      ylab="", xlab="")
#par(new=TRUE)
lines(strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S"),
      as.numeric(as.vector(dat$SubMtr3)),
      col="BLUE", type="l",
      ylab="", xlab="")
legend("topright", 
       col=c("BLACK","RED","BLUE"), lwd=1, cex=0.75,
       legend=c("Sub_metering_1", "Sub_metering_2","Sub_metering_3"))


plot(
  strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S"),
  as.numeric(as.vector(dat$Vltg)),
  col="BLACK", 
  type="l",
  font=1,
  ylab="Voltage",
  xlab="")

plot(
  strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S"),
  as.numeric(as.vector(dat$GRP)),
  col="BLACK", 
  type="l",
  font=1,
  ylab="Global Reactive Power",
  xlab="")



png(file = "plot4.png")
dev.off()


