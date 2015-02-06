
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

plot(
  strptime(paste(dat$Date,dat$Time), "%d/%m/%Y %H:%M:%S"),
  as.numeric(as.vector(dat$GAP)),
  col="BLACK", 
  type="l",
  font=1,
  ylab="Global Active Power (Kilowatts)",
  xlab="")

png(file = "plot2.png")
dev.off()


