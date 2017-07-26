setwd("C:/Users/S.Sagara/Documents/Data Science/coursera/R specialization/Explatory Analysis")

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset Baltimore
balt <- subset(NEI, fips == 24510)

#calculate total emission by year
TE <- with(balt,tapply(Emissions, year, sum))
#get year for xlab
yr <- as.numeric(names(TE))
#plot mean emission by year
plot(yr,TE)
#add linear regression to show the trend
abline(lm(TE~yr),col="red")

dev.copy(png, "plot2.png")
dev.off()



