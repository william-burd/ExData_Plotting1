library(plyr)

x <- read.table("household_power_consumption.txt", sep =";", stringsAsFactors = FALSE)

x <- mutate(x, tm = strptime(paste(V1, V2, sep =";"),  "%d/%m/%Y;%H:%M:%S"))

z <- subset(x, tm >= strptime("01/02/2007;00:00:00",  "%d/%m/%Y;%H:%M:%S") & tm < strptime("03/02/2007;00:00:00",  "%d/%m/%Y;%H:%M:%S"))

z3 <- data.frame(as.numeric(z$V3), as.numeric(z$V4), as.numeric(z$V5),as.numeric(z$V6), as.numeric(z$V7), as.numeric(z$V8), as.numeric(z$V9), z$tm)

colnames(z3) <- c("v3", "v4", "v5", "v6", "v7", "v8", "v9", "tm")

rm(x)
rm(z)


png(filename = "plot1.png", width = 480, height = 480, units = "px", pointsize = 12, bg = "white")
hist(z3$v3, col="red", main = "Global Active Power", xlab = "Global Active Power (kilowatts)")
dev.off()

