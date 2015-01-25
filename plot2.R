NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")
BaltimoreNEI <- NEI[NEI$fips =="24510", ]
EmissionByYear <- aggregate(.~year, data=BaltimoreNEI[, c(4,6)], sum)
year <- EmissionByYear$year
Emissions <- EmissionByYear$Emissions
png(file="plot2.png")
plot(year, Emissions, main="Total Baltimore's PM2.5 Emissions",pch=20, type="b",ylab="Emissions/Ton")
dev.off()