
library(ggplot2)
library(dplyr)

#Of the four types of sources indicated by the type (point, nonpoint, onroad, nonroad) variable, which of these four sources have seen decreases in emissions from 1999-2008 for Baltimore City? Which have seen increases in emissions from 1999-2008? Use the ggplot2 plotting system to make a plot answer this question.

Balt <- subset(NEI, fips == "24510")
Balt_arranged <-  group_by(Balt, type, year) 
Balt_summarized <- summarize(Balt_arranged, Emissions = sum(Emissions))

png("plot3.png")
g <- ggplot(Balt_summarized, aes(year, Emissions, color = type)) + geom_line() + xlab("year") + ylab("Total emission")
print(g  + ggtitle("Total Emissions in Baltimore City"))
dev.off()

#While POINT emission inscreased slightly, all other emissions decreased.