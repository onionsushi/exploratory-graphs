#How have emissions from motor vehicle sources changed from 1999-2008 in Baltimore City?

library(ggplot2)
library(dplyr)

Balt <- subset(NEI, fips == "24510")
Balt_motor <- Balt[(grepl(pattern = "ON-ROAD", x = Balt$type)),]
Balt_motor_year <-  group_by(Balt_motor, year) 
Balt_motor_summarized <- summarize(Balt_motor_year, Emissions = sum(Emissions))

png("plot5.png")
g <- ggplot(Balt_motor_summarized, aes(factor(year), Emissions)) + geom_bar(stat = "identity")
print(g  + ggtitle("Emission from motor vehicles in Baltimore"))
dev.off()

#The emission in 2008 was reduced to almost one fifth of emssion in 1999