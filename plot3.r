# Plot 3 - Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, 
# which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? 
# Which have seen increases in emissions from 1999-2008? 
# Use the ggplot2 plotting system to make a plot answer this question.

NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

DataBaltimore <- NEI[NEI$fips=="24510",]

library(ggplot2)

aggEmByYearType <- aggregate(Emissions ~ year + type, DataBaltimore, sum)

png('plot3.png')
g <- ggplot(aggEmByYearType, aes(year,Emissions, color=type))
g <- g + geom_line() + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions in Baltimore City Maryland')
print(g)
dev.off()
