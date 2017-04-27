NEI <- readRDS("c:/Users/Abel/Desktop/ProgrammingAssignment2/summarySCC_PM25.rds")
SCC <- readRDS("c:/Users/Abel/Desktop/ProgrammingAssignment2/Source_Classification_Code.rds")

#Across the United States, how have emissions from coal combustion-related sources changed from 1999-2008?

library(dplyr)
library(ggplot2)


SCC_coal <- SCC_coal[grepl("Coal", SCC$Short.Name) , ]
Emission_coal <- merge(NEI, SCC_coal, by = "SCC")

chart <- Emission_coal %>% group_by(year) %>% summarize(Emissions = sum(Emissions))

png("plot4.png", width=640, height=480)
g <- ggplot(chart, aes(factor(year), Emissions)) + geom_bar(stat = "identity") + xlab("year") + ylab("Total Emissions")

print(g  + ggtitle("Total Emissions from coal sources"))
dev.off()

#coal combustion-related sources decreased.