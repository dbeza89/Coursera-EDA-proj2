# Plot 4 - Across the United States, how have emissions from 
# coal combustion-related sources changed from 1999-2008?
NEI <- readRDS("summarySCC_PM25.rds")
SCC <- readRDS("Source_Classification_Code.rds")

# Merge NEI and SCC data sets
data <- merge(NEI,SCC,by="SCC")

# Use grepl to find coal combustion-related sources
coalName <- grepl("coal", data$Short.Name, ignore.case=TRUE)
coalData <- data[coalName,]

aggEm <- aggregate(Emissions ~ year, coalData, sum)

library(ggplot2)

png('plot4.png')
g <- ggplot(aggEm, aes(factor(year), Emissions))
g <- g + geom_bar(stat="identity") + xlab("year") + ylab(expression('Total PM'[2.5]*" Emissions")) +
  ggtitle('Total Emissions from Coal Sources')
print(g)
dev.off()
