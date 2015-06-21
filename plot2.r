# Plot 2 - Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008?
# Use the base plotting system to make a plot answering this question.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

dataBaltimore <- NEI[NEI$fips=="24510",]
aggEm <- aggregate(Emissions ~ year, dataBaltimore, sum)

png('plot2.png')
barplot(aggEm$Emissions, names.arg=aggEm$year, xlab="Year"
        , ylab="PM2.5 emission", main="Total PM2.5 Emission for Baltimore City")
dev.off()
