# Plot 5 - How have emissions from motor vehicle sources 
# changed from 1999-2008 in Baltimore City?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

BCVehicleData <- NEI[NEI$fips=="24510" & NEI$type=="ON-ROAD",]

aggEm <- aggregate(Emissions ~ year, BCVehicleData, sum)

png('plot5.png')
g <- ggplot(aggEm, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from motor vehicle in Baltimore City, MD')
print(g)
dev.off()
