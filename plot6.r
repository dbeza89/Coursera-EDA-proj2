# Plot 6 - Compare emissions from motor vehicle sources in Baltimore City 
# with emissions from motor vehicle sources in Los Angeles County, California.
# Which city has seen greater changes over time in motor vehicle emissions?

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

library(ggplot2)

dataBCLA <- NEI[(NEI$fips=="24510"|NEI$fips=="06037") & NEI$type=="ON-ROAD",]

aggEm <- aggregate(Emissions ~ year + fips, dataBCLA, sum)

png('plot6.png', width=1000, height=400)
g <- ggplot(aggEm, aes(factor(year), Emissions))
g <- g + facet_grid(. ~ fips)
g <- g +geom_bar(stat="identity") + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle("Total Emissions from Motor Vehicles in Los Angeles, CA (06037) vs. Baltimore City, MD (24510)")
print(g)
dev.off()
