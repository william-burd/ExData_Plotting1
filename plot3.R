library(plyr)

x <- read.table("household_power_consumption.txt", sep =";", stringsAsFactors = FALSE)

x <- mutate(x, tm = strptime(paste(V1, V2, sep =";"),  "%d/%m/%Y;%H:%M:%S"))

z <- subset(x, tm >= strptime("01/02/2007;00:00:00",  "%d/%m/%Y;%H:%M:%S") & tm < strptime("03/02/2007;00:00:00",  "%d/%m/%Y;%H:%M:%S"))

z3 <- data.frame(as.numeric(z$V3), as.numeric(z$V4), as.numeric(z$V5),as.numeric(z$V6), as.numeric(z$V7), as.numeric(z$V8), as.numeric(z$V9), z$tm)

colnames(z3) <- c("v3", "v4", "v5", "v6", "v7", "v8", "v9", "tm")

rm(x)
rm(z)


png(filename = "plot3.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")

# 7, 8, 9
plot(z3$tm, z3$v7, type="l", xlab = "", ylab = "Energy sub metering")
lines(z3$tm, z3$v8, type="l", col="red")
lines(z3$tm, z3$v9, type="l", col="blue")

legend("topright", border="red", lty=1, legend=c("Sub_metering_1", "Sub_metering_2", "Sub_metering_3"), col=c("black", "red", "blue"))

dev.off()

