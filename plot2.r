#Have total emissions from PM2.5 decreased in the Baltimore City, Maryland (fips == "24510") from 1999 to 2008? Use the base plotting system to make a plot answering this question.

NEI <- readRDS("c:/Users/Abel/Desktop/ProgrammingAssignment2/summarySCC_PM25.rds")
SCC <- readRDS("c:/Users/Abel/Desktop/ProgrammingAssignment2/Source_Classification_Code.rds")


Balt <- subset(NEI, fips == "24510")

em1 <- sum(subset( Balt, year == 1999)$Emissions)
em2 <-sum(subset( Balt, year == 2002)$Emissions)
em3 <-sum(subset( Balt, year == 2005)$Emissions)
em4 <-sum(subset( Balt, year == 2008)$Emissions)

totalemission_balt <- c(em1, em2, em3, em4)

years <- c(1999, 2002, 2005, 2008)

png('plot2.png')
barplot(totalemission_balt, names.arg = years, xlab="years", ylab=" total PM 2.5 emission", main= "Total PM2.5 Emissions in Baltimore city")
dev.off()

#Total emissions from PM2.5 decreased in Baltimore City.