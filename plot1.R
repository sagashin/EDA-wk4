setwd("/Users/sagashin/Desktop/Coursera_R_DS/exdata-data-NEI_data")

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

me <- tapply(NEI$Emission, NEI$year, mean)

yr <- as.numeric(names(me))
plot(yr,me)
abline(lm(me~yr),col="red")
