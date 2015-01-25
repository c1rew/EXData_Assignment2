NEI <- readRDS("exdata-data-NEI_data/summarySCC_PM25.rds")
SCC <- readRDS("exdata-data-NEI_data/Source_Classification_Code.rds")
EmissionByYear <- aggregate(.~year, data=NEI[, c(4,6)], sum)
year <- EmissionByYear$year
Emissions <- EmissionByYear$Emissions
png(file="plot1.png")
plot(year, Emissions, main="Total PM2.5 Emissions",pch=20, type="b",ylab="Emissions/Ton")
dev.off()