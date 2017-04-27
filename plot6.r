#Compare emissions from motor vehicle sources in Baltimore City with emissions from motor vehicle sources in Los Angeles County, California (fips == "06037"). Which city has seen greater changes over time in motor vehicle emissions?


library(ggplot2)
library(dplyr)

Balt <- subset(NEI, fips == "24510")
Balt_motor <- Balt[Balt$type == "ON-ROAD",]
Balt_motor_year <-  group_by(Balt_motor, year) 
Balt_motor_summarized <- summarize(Balt_motor_year, Emissions = sum(Emissions))
Balt_motor_summarized$Location <- "Baltimore"

Cal <- subset(NEI, fips == "06037")
Cal_motor <- Cal[Cal$type =="ON-ROAD",]
Cal_motor_year <-  group_by(Cal_motor, year) 
Cal_motor_summarized <- summarize(Cal_motor_year, Emissions = sum(Emissions))
Cal_motor_summarized$Location <- "California"

motor_summarized <- rbind(Cal_motor_summarized, Balt_motor_summarized)

png("plot6.png")
g <- ggplot(motor_summarized, aes(x = year, y= Emissions, color = Location)) + geom_line()
print(g + ggtitle("Total Emissions in Baltimore City"))
dev.off()

#California's emission increased slightly, while Baltimore's emission was decreased significantly.