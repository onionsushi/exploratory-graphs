## This first line will likely take a few seconds. Be patient!
NEI <- readRDS("c:/Users/Abel/Desktop/ProgrammingAssignment2/summarySCC_PM25.rds")
SCC <- readRDS("c:/Users/Abel/Desktop/ProgrammingAssignment2/Source_Classification_Code.rds")

#Have total emissions from PM2.5 decreased in the United States from 1999 to 2008? Using the base plotting system, make a plot showing the total PM2.5 emission from all sources for each of the years 1999, 2002, 2005, and 2008.

em1 <- sum(subset( NEI, year == 1999)$Emissions)
em2 <-sum(subset( NEI, year == 2002)$Emissions)
em3 <-sum(subset( NEI, year == 2005)$Emissions)
em4 <-sum(subset( NEI, year == 2008)$Emissions)


totalemission <- c(em1, em2, em3, em4)

years <- c(1999, 2002, 2005, 2008)
png('plot1.png')
barplot(totalemission, names.arg = years, xlab="years", ylab=" total PM 2.5 emission", main= "Total PM2.5 Emissions")
dev.off()

#Total emissions from 1999 to 2008 decreased.