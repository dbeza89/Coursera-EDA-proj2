# Plot 1 - Make a plot showing the total PM2.5 emission from 
# all sources for each of the years 1999, 2002, 2005, and 2008.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

aggEm <- aggregate(Emissions ~ year, NEI, sum)

png('plot1.png')
barplot((aggEm$Emissions/10^6), xlab="Year",ylab="Emission Total (Per Million)", 
        names.arg=aggEm$year, main="Total PM2.5 Emission")
dev.off()
