#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
#which of these four sources have seen decreases in emissions from 1999–2008 for Baltimore City? 
#Which have seen increases in emissions from 1999–2008? Use the ggplot2 plotting system to make 
#a plot answer this question.

setwd("C:/Users/S.Sagara/Documents/Data Science/coursera/R specialization/Explatory Analysis")

library(ggplot2)
library(dplyr)

## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

#subset Baltimore
balt <- subset(NEI, fips == 24510)

balt_g <- balt %>% 
        group_by(year,type) %>% 
        summarise(em = sum(Emissions))

ggplot(data=balt_g, aes(x=year, y=em, colour=type)) + 
        geom_line() + 
        geom_point() +
        labs(x = "Year", y = "Total Emissions")

dev.copy(png, "plot3.png")
dev.off()



